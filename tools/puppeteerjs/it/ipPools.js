let Testcase = require('../src/testcase.js');

let cloudMap = {
    'IP Pools': "div.gwt-HTML:contains('IP Pools')",
    'Create New': "button:contains('Create New')",

    'Name': "input.gwt-TextBox:eq(0)",
    'Type': "", // todo: can't click
    'External IP Range Start': "input.gwt-TextBox:eq(1)",
    'External IP Range End': "input.gwt-TextBox:eq(2)",
    'ARP Reply': "input:checkbox",
    'Comments': "textarea.gwt-TextArea",

    'Save': "span:contains('Save')",
    'OK': "button:contains('OK')",

    'Delete IpPool One': "td.left:contains('ippool one')~td.right div[title='Delete']",
    'YES': "span:contains('YES')",
}

let gateMap = {
    'IP Pools': "a[href='page/p/firewall/object/ippool/']",

    'Name': "input#name",
    'Type Overload': "input#type-overload",
    'External IP Range Start': "input#startip-ipv4",
    'External IP Range End': "input#endip-ipv4",
    'ARP Reply': "input#arp-reply",
    'Comments': "textarea#comments",

    'ippool one': "tr[mkey='ippool one']",
    'Edit': "button:contains('Edit'):eq(0)",
}

new Testcase({
    name: 'ippool new',
    testcase() {
        this.click(cloudMap['IP Pools'])
        this.click(cloudMap['Create New'])
        this.set(cloudMap['Name'], "ippool one")
        this.click(cloudMap['Type'])
        this.set(cloudMap['External IP Range Start'], "1.1.1.1")
        this.set(cloudMap['External IP Range End'], "1.1.1.1")
        this.check(cloudMap['ARP Reply'])
        this.set(cloudMap['Comments'], "test comments")
        this.click(cloudMap['Save'])
        this.click(cloudMap['OK'])
    },
    verify() {
        this.isSet(gateMap['Name'], "ippool one")
        this.isCheck(gateMap['Type Overload'])
        this.isSet(gateMap['External IP Range Start'], "1.1.1.1")
        this.isSet(gateMap['External IP Range End'], "1.1.1.1")
        this.isCheck(gateMap['ARP Reply'])
        this.isSet(gateMap['Comments'], "test comments")
    }
})

new Testcase({
    name: 'ippool delete',
    testcase() {
        this.click(cloudMap['IP Pools'])
        this.click(cloudMap['Delete IpPool One'])
        this.click(cloudMap['YES'])
    },
    verify() {
        this.click('IP Pools')
        this.isDelete('ippool one')
    }
})