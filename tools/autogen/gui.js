'use strict'

// let url = 'https://beta.forticloud.com/com.fortinet.gwt.Main/Main.html'

// let params = 'locale=en_US'

// window.location.href = url + '?' + params

let is_valid = (selector) => {
    switch (typeof selector) {
        case 'string':
            return selector ? ($(selector)[0] !== undefined) : true;
        case 'object':
            return $(selector[1])[0] !== undefined;
        case 'undefined':
            return true;
        default:
            console.log('not support %s', typeof selector);
            return false;
    }
}

let getSetupSeq = (module) => {
    return [
        "div.img_link:contains('FGT60D4615007833')",
        "div.cat_link:contains('Management')",
        "div.gwt-HTML:contains('" + module + "')",
    ]
}

// [cli-attr, dom-selector, cli-value, {dom-value}]
let testSeq = {
    'Admin Settings': [
        ["admin-port", "input.gwt-TextBox:eq(0)", 100],
        ["admin-https-redirect", "span.gwt-CheckBox>label", "enable", true],
        ["admin-sport", "input.gwt-TextBox:eq(1)", 200],
        ["admin-telnet-port", "input.gwt-TextBox:eq(2)", 300],
        ["admin-ssh-port", "input.gwt-TextBox:eq(3)", 400],
        ["admintimeout", "input.gwt-TextBox:eq(4)", 480],
    ]
}

let getTestSeq = (module) => {
    return testSeq[module];
}

let teardown_seq = [
    "span:contains('Save')",
    "button[title='Deploy']",
    "span:contains('YES')",
    "button:contains('OK')",
    "span:contains('Close')",
    "div.logo:contains('FortiCloud')"
];

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function dom_oper(selector, value) {
    switch (typeof value) {
        case 'number':
            $(selector).val(value);
            break;
        case 'boolean':
            $(selector).click();
            break;
        default:
            console.log('not support %s, do nothing', typeof value);
    }
}

const timeout = 15;

async function seqrun(cmdseq, head, action) {
    console.log('%s starting ......', head);
    for (let i = 0; i < cmdseq.length; ++i) {
        let retry = 0;
        while (!is_valid(cmdseq[i]) && retry < timeout) {
            ++retry
            console.log('......')
            await sleep(1000);
        }
        if (retry == timeout) {
            console.log('%d times check failed -> exit', timeout);
            break;
        }

        switch (typeof cmdseq[i]) {
            case 'string':
                console.log('%s: %s', action, cmdseq[i]);
                break;
            case 'object':
                console.log('%s: %s', action, cmdseq[i][0]);
                break;
            default:
                console.log('not support type %s', typeof cmdseq[i]);
        }

        switch (action) {
            case 'click':
                $(cmdseq[i]).click();
                break;
            case 'set':
                let value = cmdseq[i][3] ? cmdseq[i][3] : cmdseq[i][2];
                dom_oper(cmdseq[i][1], value);
                break;
            default:
                console.log('not support %s', action);
        }
    }
    console.log('%s done ......', head);
}

async function setup(module) {
    await seqrun(getSetupSeq(module), 'setup', 'click')
}

async function test(module) {
    await seqrun(getTestSeq(module), module, 'set')
}

async function teardown() {
    await seqrun(teardown_seq, 'teardown', 'click')
}

function check(module) {
    let query = '';
    getTestSeq(module).forEach((item) => {
        query += (item[0] + '=' + item[2] + '&');
    });
    console.log(query);
    fetch('https://172.16.94.164:8443/Cli/AdminSettings?' + query, {
        mode: 'no-cors',
        header: {
            'Access-Control-Allow-Origin': '*',
        }
    })
}

async function testcase(module) {
    await setup(module);
    await test(module);
    await teardown();
    await check(module);
}

async function run() {
    await testcase("Admin Settings");
}

run();
