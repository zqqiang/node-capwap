'use strict';

var encoder = require('../capwap/encoder');
var serializer = require('packet').createSerializer();
var builder = require('../capwap/builder');
var tool = require('../capwap/tool');
var enumType = require('../capwap/enum');
var state = require('./state');
var context = require('./context');
var debug = require('debug')('node-capwap::server::session');

exports.discoveryRequestProcess = function(request) {
	var tlv = [
		builder.buildAcDescriptor(),
		builder.buildAcName(),
		builder.buildVspWtpAllow(request.messageElement.wtpBoardData.wtpSerialNumber.value),
	];
	var elementLength = tool.calMessageElementLength(tlv);
	var res = encoder.encode({
		preamble: builder.getPreamble(),
		header: builder.getHeader(),
		controlHeader: {
			messageType: 2,
			sequneceNumber: request.controlHeader.sequneceNumber,
			messageElementLength: elementLength,
			flags: 0
		},
		tlv: tlv
	});
	return res;
}

exports.joinRequestProcess = function(server, request) {
	var tlv = [
		builder.buildResultCode(0), // Success
	]
	var elementLength = tool.calMessageElementLength(tlv);
	var joinResponse = encoder.encode({
		preamble: builder.getPreamble(),
		header: builder.getHeader(),
		controlHeader: {
			messageType: enumType.messageType.JOIN_RESPONSE,
			sequneceNumber: request.controlHeader.sequneceNumber,
			messageElementLength: elementLength,
			flags: 0
		},
		tlv: tlv
	});
	server.send(joinResponse, 0, joinResponse.length, enumType.socket.CLIENT_PORT, enumType.socket.CLIENT_IP);
	debug('Send Join Response');
};

exports.configurationStatusRequestProcess = function(server, request) {
	var tlv = [
		builder.buildCapwapTimers(),
	]
	var elementLength = tool.calMessageElementLength(tlv);
	var configurationStatusResponse = encoder.encode({
		preamble: builder.getPreamble(),
		header: builder.getHeader(),
		controlHeader: {
			messageType: enumType.messageType.CONFIGURATION_STATUS_RESPONSE,
			sequneceNumber: request.controlHeader.sequneceNumber,
			messageElementLength: elementLength,
			flags: 0
		},
		tlv: tlv
	});
	server.send(configurationStatusResponse, 0, configurationStatusResponse.length, enumType.socket.CLIENT_PORT, enumType.socket.CLIENT_IP);
	debug('Send Configuration Status Response');
};

exports.changeStateRequestProcess = function(server, request) {
	var tlv = [
		builder.buildResultCode(0),
	]
	var elementLength = tool.calMessageElementLength(tlv);
	var changeStateResponse = encoder.encode({
		preamble: builder.getPreamble(),
		header: builder.getHeader(),
		controlHeader: {
			messageType: enumType.messageType.CHANGE_STATE_RESPONSE,
			sequneceNumber: request.controlHeader.sequneceNumber,
			messageElementLength: elementLength,
			flags: 0
		},
		tlv: tlv
	});
	server.send(changeStateResponse, 0, changeStateResponse.length, enumType.socket.CLIENT_PORT, enumType.socket.CLIENT_IP);
	debug('Send Change State Response');
};

exports.keepAliveProcess = function(data, request) {
	var tlv = [
		builder.buildSessionId(),
	]
	var elementLength = tool.calMessageElementLength(tlv);
	var keepAlive = encoder.encode({
		preamble: builder.getPreamble(),
		header: builder.getHeader(0x00008),
		keepAlive: {
			messageElementLength: elementLength,
			tlv: tlv
		}
	});
	data.send(keepAlive, 0, keepAlive.length, enumType.socket.CLIENT_DATA_PORT, enumType.socket.CLIENT_IP);
	debug('Send Keep Alive');
};

exports.dataChannelVerifiedProcess = function(server, request) {
	var tlv = [
		builder.buildWtpName(),
	]
	var elementLength = tool.calMessageElementLength(tlv);
	var configurationUpdateRequest = encoder.encode({
		preamble: builder.getPreamble(),
		header: builder.getHeader(),
		controlHeader: {
			messageType: enumType.messageType.CONFIGURATION_UPDATE_REQUEST,
			sequneceNumber: context.sequneceNumber++,
			messageElementLength: elementLength,
			flags: 0
		},
		tlv: tlv
	});
	server.send(configurationUpdateRequest, 0, configurationUpdateRequest.length, enumType.socket.CLIENT_PORT, enumType.socket.CLIENT_IP);
	debug("Send Configuration Update Request");
};