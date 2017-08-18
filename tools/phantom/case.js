'use strict';

let cases = require('./it/root.js');

require('./it/interfaces.js');
require('./it/dns.js');
require('./it/routing.js');
require('./it/adminSettings.js');
require('./it/fortiGuard.js');
require('./it/advanced.js');
require('./it/addresses.js');
require('./it/services.js');
require('./it/schedules.js');
require('./it/virtualIPs.js');
require('./it/ipPools.js');
require('./it/antiVirus.js');
require('./it/webFilter.js');
require('./it/dnsFilter.js');
require('./it/applicationControl.js');
require('./it/intrusionProtection.js');
require('./it/proxyOptions.js');
require('./it/sslInspection.js');
require('./it/webRatingOverrides.js');
require('./it/webProfileOverrides.js');
require('./it/usersGroups.js');
require('./it/customDevicesGroups.js');
require('./it/ldapServers.js');
require('./it/radiusServers.js');
require('./it/authenticationSettings.js');

// cases = require('./it/casi.js');


// filter some can't support testcases
// need reference interface
delete cases['interface hardswitch new'];
delete cases['interface softswitch new'];

// todo: temporary delete routing, GUI bug, can't get item after new
delete cases['routing new'];
delete cases['routing edit'];
delete cases['routing delete'];

// delete cases['service new']

// todo: extintf any problem
delete cases['virtual ip new'];
delete cases['virtual ip delete'];

// todo: temorary delete this case, category can't delete via GUI
delete cases['category new'];
delete cases['web profile overrides new user'];

delete cases['advanced time setting use fortiguard'];
delete cases['advanced time setting specify'];

module.exports = cases;