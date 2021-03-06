let Testcase = require("src/testcase.js");

let type = "IP/Netmask";
let fgtType = "ipmask";

/*
 * more elements can be tested: "fqdn", "ipRange", "wildcardFqdn"
 * more UI Objects can be tested: "country", "associatedInterface"
 */

let cloudMap = {
  Addresses: "div.gwt-HTML:contains('Addresses')",
  "Create New": "button:contains('Create New')",
  "Create Address": "div.filter_text:contains('Address'):eq(0)",
  Save: "span:contains('Save')",
  OK: "button:contains('OK')",

  "Delete for address new":
    "td.left:contains('address new')~td.right div[title='Delete']",
  "Delete for group new":
    "td.left:contains('group new')~td.right div[title='Delete']",
  "Next Page": "img.gwt-Image:eq(3)",
  YES: "span:contains('YES')",

  "Create Address Group": "div.filter_text:contains('Address'):eq(1)",
  Name: "input.gwt-TextBox",
  Members: "div.gwt-HTML:contains(' - ')",
  all: "div.gwt-HTML:contains('all'):eq(0)",
  "Popup Pannel": "div.gwt-DecoratedPopupPanel"
};

let gateMap = {
  Name: "input#name",
  Type: "#addr_type",
  "IP/Netmask": "input#ipmask",
  Visibility: "input#visibility",
  "Static Route": "input#allow-routing",
  Comments: "textarea#comment",

  "address table": "div.first-cell span",
  "address new": "//span[text()='address new']",
  "group new": "//span[text()='group new']",
  Edit: "button span:contains('Edit'):eq(0)",

  "Policy & Objects": "//span[text()='Policy & Objects']",
  Addresses: "a[href='firewall/address']",
  Edit: "//span[text()='Edit']"
};

/**
 * Editor: addressEditor
   Key/Id
    i : name,
    k : type,
    i : fqdn,
	i : subnet,
	i : ipRange,
	i : wildcardFqdn,
	k : country,
	k : associatedInterface,
	i : visibility,
	i : allowRouting,
	i : comment.
 */

new Testcase({
  name: "address new",
  testcase() {
    this.click(cloudMap["Addresses"]);
    this.wait(1000);
    this.click(cloudMap["Create New"]);
    this.click(cloudMap["Create Address"]);
    this.set("#fcld-addressEditor-name", "address new");
    this.evaluate(
      `FcldUiTest.setUiObjectValue("addressEditor-type", "${type}")`
    );
    this.set("#fcld-addressEditor-subnet", "192.168.102.0/255.255.255.0");
    this.check("#fcld-addressEditor-visibility > input");
    this.check("#fcld-addressEditor-allowRouting > input");
    this.set("#fcld-addressEditor-comment", "test comments");
    this.click(cloudMap["Save"]);
    this.wait(1000);
    this.click(cloudMap["OK"]);
  },
  verify() {
    this.click(gateMap["Policy & Objects"]);
    this.wait(1000);
    this.click(gateMap["Addresses"]);
    this.wait(3000);
    this.click(gateMap["address new"]);
    this.click(gateMap["Edit"]);
    this.wait(3000);
    this.isSet(gateMap["Name"], "address new");
    this.isSet(gateMap["Type"], fgtType);
    this.isSet(gateMap["IP/Netmask"], "192.168.102.0/255.255.255.0");
    this.isCheck(gateMap["Visibility"]);
    this.isCheck(gateMap["Static Route"]);
    this.isSet(gateMap["Comments"], "test comments");
    this.click(`button#submit_cancel`);
  }
});

new Testcase({
  name: "address delete",
  testcase() {
    this.click(cloudMap["Addresses"]);
    this.wait(1000);
    this.click(cloudMap["Delete for address new"]);
    this.click(cloudMap["YES"]);
  },
  verify() {
    this.click(gateMap["Policy & Objects"]);
    this.click(gateMap["Addresses"]);
    this.wait(3000);
    this.isDelete("address new");
  }
});

/**
 * Editor: addrgrpEditor
 * Key/Id
 *  i : name,
 *  k : members,
 *  k : visibility,
 *  k : allowRouting,
 *  i : allowRouting,
 *  i : comment.
 *
 */
new Testcase({
  name: "address group new",
  testcase() {
    this.click(cloudMap["Addresses"]);
    this.wait(1000);
    this.click(cloudMap["Create New"]);
    this.click(cloudMap["Create Address Group"]);
    this.wait(1000);
    this.set("#fcld-addrgrpEditor-name", "group new");
    this.evaluate(
      `FcldUiTest.setUiObjectValue("addrgrpEditor-members", ["all"])`
    );
    this.check("#fcld-addrgrpEditor-visibility > input");
    this.set("#fcld-addrgrpEditor-comment", "test comments");
    this.click(cloudMap["Save"]);
    this.wait(1000);
    this.click(cloudMap["OK"]);
  },
  verify() {
    this.click(gateMap["Policy & Objects"]);
    this.click(gateMap["Addresses"]);
    this.wait(3000);
    this.click(gateMap["group new"]);
    this.click(gateMap["Edit"]);
    this.wait(3000);
    this.isSet(gateMap["Name"], "group new");
    this.has("all");
    this.isCheck(gateMap["Visibility"]);
    this.isSet(gateMap["Comments"], "test comments");
    this.click(`button#submit_cancel`);
  }
});

new Testcase({
  name: "address group delete",
  testcase() {
    this.click(cloudMap["Addresses"]);
    this.click(cloudMap["Next Page"]);
    this.click(cloudMap["Delete for group new"]);
    this.click(cloudMap["YES"]);
  },
  verify() {
    this.click(gateMap["Policy & Objects"]);
    this.click(gateMap["Addresses"]);
    this.wait(3000);
    this.isDelete("group new");
  }
});
