'use strict';

exports.tlvType = {
	CAPWAP_TIMERS: 12,
	DISCOVERY_TYPE: 20,
	LOCATION_DATA: 28,
	RESULT_CODE: 33,
	SESSION_ID: 35,
	WTP_NAME: 45,
	IEEE_80211_ADD_WLAN: 1024,
};

exports.discoveryType = {
	STATIC_CONFIGURATION: 1
};

exports.timer = {
	MAX_RETRY: 3
};

exports.socket = {
	SERVER_CTRL_PORT: 15246, // should be 5246 => debug use only
	SERVER_DATA_PORT: 15247, // should be 5247 => debug use only
	SERVER_IP: 'localhost',
	CLIENT_PORT: 10002,
	CLIENT_DATA_PORT: 10003,
	CLIENT_IP: 'localhost',
};

exports.messageType = {
	DISCOVERY_REQUEST: 1,
	DISCOVERY_RESPONSE: 2,
	JOIN_REQUEST: 3,
	JOIN_RESPONSE: 4,
	CONFIGURATION_STATUS_REQUEST: 5,
	CONFIGURATION_STATUS_RESPONSE: 6,
	CONFIGURATION_UPDATE_REQUEST: 7,
	CONFIGURATION_UPDATE_RESPONSE: 8,
	CHANGE_STATE_REQUEST: 11,
	CHANGE_STATE_RESPONSE: 12,
	IEEE_80211_WLAN_CONFIGURATION_REQUEST: 3398913, 
	IEEE_80211_WLAN_CONFIGURATION_RESPONSE: 3398914
};