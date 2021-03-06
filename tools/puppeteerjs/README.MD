# Auto Test Framework
Auto test for FortiCloud managemenet, Analysis ForitView, Reports.  

## What is this repository for?
* simulate user click the cloud GUI and deploy to device  
* query the result from device GUI and compare the result  
* auto run all testcase if developer commit code and give them feedback  

## How do I get set up?
### Windows
* svn co https://scm-yvr-mirror.fortinet.com/svn/svnroot/FGSLog/100/trunk/Others/fgtMgrAutoTest  
* install [node.js v8.6.0+](https://nodejs.org/en/download/package-manager/)  
* npm install  
* change conf/config.js to your own environment url, account, password  
### Redhat 6.9+
* svn co https://scm-yvr-mirror.fortinet.com/svn/svnroot/FGSLog/100/trunk/Others/fgtMgrAutoTest  
* install [node.js v8.6.0+](https://nodejs.org/en/download/package-manager/)  
* npm install --unsafe-perm  
* change conf/config.js to your own environment url, account, password  
* install google-chrome for rhel/centos 6.x/7.x [more](https://intoli.com/blog/installing-google-chrome-on-centos/)  
```
curl https://intoli.com/install-google-chrome.sh | bash
```

## How to run freestyle testcase?
```bash
npm run debug -- --grep "which case you want to run"
```

## How to run management testcase? [will remove in the future]
1. show help menu:  
```
λ node index.js --help

  Usage: index [options]


  Options:

    -V, --version          output the version number
    -h, --headless         run headless mode
    -s, --skip <steps>     add the skip steps [testcase,deploy,verify]
    -c, --case <cases>     run single/multi testcases ['case one', 'case two']
    -r, --regexr <regexr>  run testcases match regular expression
    -h, --help             output usage information
```
2. run single/multi testcaes in debug mode:  
```
node index.js -c "address new"
node index.js -c "address new","address delete"
```
3. skip some steps in debug mode:  
```
node index.js -s testcase,deploy
node index.js -s deploy
node index.js -s verify
```
4. run in headless mode:  
```
node index.js -h
```

## How do I get result?
* stdout  
1. retry timeout, return failed: develop failed or develop timeout (eg: cfgServer core dump)  
2. if result match expect:
```
result: [192.168.100.0/255.255.255.0] expect: [192.168.100.0/255.255.255.0] => success
```
3. if not match:
```
result: [192.168.100.0/255.255.255.0] expect: [192.168.100.0/255.255.255.0] => failed
```

* out  
1. after each testcase run, it will capture final GUI image  
2. if encounter retry timeout, return failed, check the out/result.png for the specific reason  or use debug mode  

## Contribution guidelines


## Develop freestyle testcases
freestyle testcase under test folder  
fortiview, fcp, template, vpn should develop under freestyle mode  
in the furture most testcases should under this pattern  

### GUI freestyle testcase
* create a free style testcase source file in test folder and name it with menu label name  
```javascript
describe(`Free Style Module Demo`, function() {
    // disable timeouts
    this.timeout(0);
    let page;

    before(async function() {
        page = new Page();
        await page.setup({ headless: true });
    });

    after(async function() {
        await page.close();
    });

    beforeEach(async function() {

    });

    afterEach(async function() {
        
    });

    // .\node_modules\.bin\mocha.cmd --grep "free style testcase demo"
    it(`free style testcase demo`, async function () {
        // do everything you want
        assert.equal(true, true, `should be the same`)
    });
});
```
### MySql freestyle testcase
MySql node.js driver is async api so we need use util.promisify  
async/await js grammar sugar make sure mysql query return  
we choose this mode as the testcase design pattern.

```javascript
const mysql = require('mysql');
const util = require('util');

describe(`Free Style MySQL Demo Suite`, function () {
    this.timeout(0);

    let connection;

    before(function () {
        connection = mysql.createConnection({
            host: `172.16.94.163`,
            user: `forticrm`,
            password: `forticrm`,
            database: `apportal`
        });

        connection.connect();

        // promisify query api
        connection.query = util.promisify(connection.query);
    })

    after(function () {
        connection.end();
    })

    // npm run debug -- --grep "free style mysql testcase demo"
    it(`free style mysql testcase demo`, async function () {
        const result = await connection.query('SELECT sn,createTime FROM `ap_ap`');
        console.log(result);
    })
})
```

## Develop management testcases
design for management config testcase only  
testcase should be only config in cloud portal and query result from fos gui  

* create a testcase source file in it folder and name it with menu label name  
```javascript
let Testcase = require('../../src/testcase.js');

let cloudMap = {
    'Addresses': "div.gwt-HTML:contains('Addresses')",
    'Create New': "button:contains('Create New')",
    'Create Address': "div.filter_text:contains('Address'):eq(0)",
    'Name': "input.gwt-TextBox:eq(0)",
    'IP/Netmask': "input.gwt-TextBox:eq(1)",
    'Visibility': "input:checkbox:eq(0)",
    'Static Route': "input:checkbox:eq(1)",
    'Comments': "textarea.gwt-TextArea",
    'Save': "span:contains('Save')",
    'OK': "button:contains('OK')",

    'Delete for address new': "td.left:contains('address new')~td.right div[title='Delete']",
    'Delete for group new': "td.left:contains('group new')~td.right div[title='Delete']",
    'Next Page': "img.gwt-Image:eq(3)",
    'YES': "span:contains('YES')",

    'Create Address Group': "div.filter_text:contains('Address'):eq(1)",
    'Members': "div.gwt-HTML:contains(' - ')",
    'all': "div.gwt-HTML:contains('all'):eq(0)",
    'Popup Pannel': "div.gwt-DecoratedPopupPanel",
}

let gateMap = {
    'Name': "input#name",
    'IP/Netmask': "input#ipmask",
    'Visibility': "input#visibility",
    'Static Route': "input#allow-routing",
    'Comments': "textarea#comment",

    'address table': "div.first-cell span",
    'address new': "//span[text()='address new']",
    'group new': "tr[mkey='group new']",
    'Edit': "button span:contains('Edit'):eq(0)",

    'Policy & Objects': "//span[text()='Policy & Objects']",
    'Addresses': "a[href='firewall/address']",
    'Edit': "//span[text()='Edit']",
}

new Testcase({
    name: 'address new',
    testcase() {
        this.click(cloudMap['Addresses'])
        this.click(cloudMap['Create New'])
        this.click(cloudMap['Create Address'])
        this.set(cloudMap['Name'], "address new")
        this.set(cloudMap['IP/Netmask'], "192.168.100.100/255.255.255.0")
        this.check(cloudMap['Visibility'])
        this.check(cloudMap['Static Route'])
        this.set(cloudMap['Comments'], "test comments")
        this.click(cloudMap['Save'])
        this.wait(1000)
        this.click(cloudMap['OK'])
    },
    verify() {
        this.click(gateMap['Policy & Objects'])
        this.click(gateMap['Addresses'])
        this.wait(3000)
        this.click(gateMap['address new'])
        this.click(gateMap['Edit'])
        this.wait(3000)
        this.isSet(gateMap['Name'], "address new")
        this.isSet(gateMap['IP/Netmask'], "192.168.100.0/255.255.255.0")
        this.isChecked(gateMap['Visibility'])
        this.isChecked(gateMap['Static Route'])
        this.isSet(gateMap['Comments'], "test comments")
    }
})

new Testcase({
    name: 'address delete',
    testcase() {
        this.click(cloudMap['Addresses'])
        this.wait(1000)
        this.click(cloudMap['Delete for address new'])
        this.click(cloudMap['YES'])
    },
    verify() {
        this.click(gateMap['Policy & Objects'])
        this.click(gateMap['Addresses'])
        this.wait(3000)
        this.isDelete('address new')
    }
})
```
1. cloudMap indicate the forticloud GUI label and the [jquery/xpath/css selector](https://api.jquery.com/category/selectors/)  
2. gateMap indicate the fortigate GUI label and the [jquery/xpath/css selector](https://api.jquery.com/category/selectors/)  
3. new Testcase will create a testcase with input and verify actions  
4. testcase callback define cloud GUI actions exempt the develop action which will do in the framework  
5. verify callback define gate GUI verify actions  


### API documentation

#### testcase.click(selector)
- `selector` <[string]> A [selector] to search for element to click. If there are multiple elements satisfying the selector, the first will be clicked.

This method fetches an element with `selector`, scrolls it into view if needed, and then uses [page.mouse]() to click in the center of the element.
If there's no element matching `selector`, the method throws an error.

```javascript
this.click(`input#email`)
```
#### testcase.goto(url)
- `url` <[string]> URL to navigate page to. The url should include scheme, e.g. `https://`.

The `page.goto` will throw an error if:
- there's an SSL error (e.g. in case of self-signed certificates).
- target URL is invalid.
- 30 seconds`timeout` is exceeded during navigation.
- the main resource failed to load.

```javascript
this.goto(`https://alpha.forticloud.com`)
```
#### testcase.set(selector, text)
- `selector` <[string]> A [selector] of an element to type into. If there are multiple elements satisfying the selector, the first will be used.
- `text` <[string]> A text to set into a focused element.

Using jquery val() api to set element value.

```js
this.set('#mytextarea', 'Hello'); // Types instantly
```
#### testcase.type(selector, text)
- `selector` <[string]> A [selector] of an element to type into. If there are multiple elements satisfying the selector, the first will be used.
- `text` <[string]> A text to type into a focused element.

Sends a `keydown`, `keypress`/`input`, and `keyup` event for each character in the text.

```js
this.type('#mytextarea', 'Hello'); // Types instantly
```
#### testcase.check(selector)
- `selector` <[string]> A [selector] to search for element to check. If there are multiple elements satisfying the selector, the first will be checked.

If there's no element matching `selector`, the method throws an error.

```javascript
this.check(`input#checkbox`)
```
#### testcase.uncheck(selector)
- `selector` <[string]> A [selector] to search for element to check. If there are multiple elements satisfying the selector, the first will be checked.

If there's no element matching `selector`, the method throws an error.

```javascript
this.uncheck(`input#checkbox`)
```
#### testcase.wait(selectorOrTimeout)
- `selectorOrTimeout` <[string]|[number]> A [selector] or timeout to wait for

This method behaves differently with respect to the type of the first parameter:
- if `selectorOrTimeout` is a `string`, then the first argument is treated as a [selector] or [xpath], depending on whether or not it starts with '//', and the method is a shortcut for
- if `selectorOrTimeout` is a `number`, then the first argument is treated as a timeout in milliseconds and the method returns a promise which resolves after the timeout
- otherwise, an exception is thrown

```javascript
this.wait(`//button[text()="OK"]`)
this.wait(1000)
```
#### testcase.isSet(selector, text)
- `selector` <[string]> A [selector] of an element to type into. If there are multiple elements satisfying the selector, the first will be used.
- `text` <[string]> A text to verify.

```js
this.isSet('#mytextarea', 'Hello');
```
#### testcase.isCheck(selector)
- `selector` <[string]> A [selector] to search for element to check. If there are multiple elements satisfying the selector, the first will be checked.

If there's no element matching `selector`, the method throws an error.

```javascript
this.isCheck(`input#checkbox`)
```
#### testcase.isDelete(target)
- `target` <[string]> A [target] to search for element.

```javascript
this.isDelete(`address new`)
```
#### testcase.evaluate(pageFunction)
- `pageFunction` <[string]> Function to be evaluated in the page context

string can be passed in instead of a function:
```js
console.log(await page.evaluate(`$('input#editor').click()`));
```
#### testcase.capture(filename)
- `filename` <[string]> The file name to save the image to. The capture type will be inferred from file extension. If no path is provided, the image won't be saved to the disk.
#### testcase.has(target)
- `target` <[string]> A [target] to search for element.

```javascript
this.has(`126.Mail`)
```

## Best Practise
1. first create a new item, edit it and delete it finally so that no side-effect to next testcase.
2. complicated testcase need group related action in one testcase, such as create a datasource first and use it in other module, finally remove all  

## Continuous Integration
1. we use [Jenkins](http://172.16.94.162:8080/job/gui_auto_test) to integrate our framework  
2. [mochawesome report](http://172.16.94.162:8080/job/gui_auto_test/HTML_Report/)  
3. TODO: if you commit cfgServer Code or testcases will trigger next build (for now it manually build by root user)  


### Mocha.js Env
1. all testcases run under mocha mode on jenkins.  
   if you need test one/multi case please follow mocha command line.  
```
[root@localhost fgtMgrAutoTest]# npm run linuxtest -- --grep "address"

> puppeteerjs@1.0.0 linuxtest /var/lib/jenkins/workspace/gui_auto_test/fgtMgrAutoTest
> mocha "--grep" "address"

  load addresses.js
  load adminSettings.js
  load advanced.js
  load antiVirus.js
  load applicationControl.js
  load authenticationSettings.js
  load customDevicesGroups.js
  load dns.js
  load dnsFilter.js
  load fortiGuard.js
  load interfaces.js
  load intrusionProtection.js
  load ipPools.js
  load ldapServers.js
  load proxyOptions.js
  load radiusServers.js
  load routing.js
  load schedules.js
  load services.js
  load sslInspection.js
  load usersGroups.js
  load virtualIPs.js
  load webFilter.js
  load webProfileOverrides.js
  load webRatingOverrides.js


  All Testcases
    ✓ address new
    ✓ address delete
    ✓ address group new
    ✓ address group delete


  4 passing (2s)

```

## FAQ

#### Q: What kinds of Testcase we should avoid?

Network Static Route => NOT DELETE default route 0.0.0.0/0  
Network DNS => DNS Servers must change to Use FortiGuard Servers at last step  

REASON: change this kind of critical settings will break the autotest env  

#### Q: How to navigate left navbar menu?

Avoid using old click method below:
```javascript
this.click(gateMap['Policy & Objects'])
this.click(gateMap['Addresses'])
```
Because the menu is folder menu so it is only working when root menu node is closed.

Instead using modern api below:
```javascript
evaluate(`FcldUiTest.setUiObjectValue("MENU:(SUB_MENU_LABEL)", "click")`)
```

## Todo List