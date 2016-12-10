local capwap = Proto("FTNT-CAPWAP-Control", "Fortinet Control And Provisioning of Wireless Access Points - Control")

local ptypes = {
    [0] = "CAPWAP Header",
    [1] = "CAPWAP DTLS Header"
}

local booltypes = {
    [0] = "False",
    [1] = "True"
}

local btypes = {
    [1] = "IEEE 802.11"
}

local ntypes = {
    [0] = "Reserved"
}

local stypes = {
    [1] = "Discovery Request",
    [2] = "Discovery Response",
    [3] = "Join Request",
    [4] = "Join Response",
    [5] = "Configuration Status Request",
    [6] = "Configuration Status Response",
    [7] = "Configuration Update Request",
    [8] = "Configuration Update Response",
    [9] = "WTP Event Request",
    [10] = "WTP Event Response",
    [11] = "Change State Request",
    [12] = "Change State Response",
    [13] = "Echo Request",
    [14] = "Echo Response",
    [15] = "Image Data Request",
    [16] = "Image Data Response",
    [17] = "Reset Request",
    [18] = "Reset Response",
    [19] = "Primary Discovery Request",
    [20] = "Primary Discovery Response",
    [21] = "Data Transfer Request",
    [22] = "Data Transfer Response",
    [23] = "Clear Configuration Request",
    [24] = "Clear Configuration Response",
    [25] = "Station Configuration Request",
    [26] = "Station Configuration Response",

 -- /* RFC5416 : Section 3 : IEEE 802.11 Specific CAPWAP Control Messages */
    [3398913] = "IEEE 802.11 WLAN Configuration Request",
    [3398914] = "IEEE 802.11 WLAN Configuration Response"
}

-- /* ************************************************************************* */
-- /*                      Message Element Type                                 */
-- /* ************************************************************************* */
local TYPE_AC_DESCRIPTOR = 1
local TYPE_AC_IPV4_LIST = 2
local TYPE_AC_IPV6_LIST = 3
local TYPE_AC_NAME = 4
local TYPE_AC_NAME_W_PRIORITY = 5
local TYPE_AC_TIMESTAMP = 6
local TYPE_ADD_MAC_ACL_ENTRY = 7
local TYPE_ADD_STATION = 8
local TYPE_RESERVED_9 = 9
local TYPE_CAPWAP_CONTROL_IPV4_ADDRESS = 10
local TYPE_CAPWAP_CONTROL_IPV6_ADDRESS = 11
local TYPE_CAPWAP_TIMERS = 12
local TYPE_DATA_TRANSFER_DATA = 13
local TYPE_DATA_TRANSFER_MODE = 14
local TYPE_DESCRYPTION_ERROR_REPORT = 15
local TYPE_DECRYPTION_ERROR_REPORT_PERIOD = 16
local TYPE_DELETE_MAC_ENTRY = 17
local TYPE_DELETE_STATION = 18
local TYPE_RESERVED_19 = 19
local TYPE_DISCOVERY_TYPE = 20
local TYPE_DUPLICATE_IPV4_ADDRESS = 21
local TYPE_DUPLICATE_IPV6_ADDRESS = 22
local TYPE_IDLE_TIMEOUT = 23
local TYPE_IMAGE_DATA = 24
local TYPE_IMAGE_IDENTIFIER = 25
local TYPE_IMAGE_INFORMATION = 26
local TYPE_INITIATE_DOWNLOAD = 27
local TYPE_LOCATION_DATA = 28
local TYPE_MAXIMUM_MESSAGE_LENGTH = 29
local TYPE_CAPWAP_LOCAL_IPV4_ADDRESS = 30
local TYPE_RADIO_ADMINISTRATIVE_STATE = 31
local TYPE_RADIO_OPERATIONAL_STATE = 32
local TYPE_RESULT_CODE = 33
local TYPE_RETURNED_MESSAGE_ELEMENT = 34
local TYPE_SESSION_ID = 35
local TYPE_STATISTICS_TIMER = 36
local TYPE_VENDOR_SPECIFIC_PAYLOAD = 37
local TYPE_WTP_BOARD_DATA = 38
local TYPE_WTP_DESCRIPTOR = 39
local TYPE_WTP_FALLBACK = 40
local TYPE_WTP_FRAME_TUNNEL_MODE = 41
local TYPE_RESERVED_42 = 42
local TYPE_RESERVED_43 = 43
local TYPE_WTP_MAC_TYPE = 44
local TYPE_WTP_NAME = 45
local TYPE_RESERVED_46 = 46
local TYPE_WTP_RADIO_STATISTICS = 47
local TYPE_WTP_REBOOT_STATISTICS = 48
local TYPE_WTP_STATIC_IP_ADDRESS_INFORMATION = 49
local TYPE_CAPWAP_LOCAL_IPV6_ADDRESS = 50
local TYPE_CAPWAP_TRANSPORT_PROTOCOL = 51
local TYPE_MTU_DISCOVERY_PADDING = 52
local TYPE_ECN_SUPPORT = 53

local IEEE80211_ADD_WLAN = 1024
local IEEE80211_ANTENNA = 1025
local IEEE80211_ASSIGNED_WTP_BSSID = 1026
local IEEE80211_DELETE_WLAN = 1027
local IEEE80211_DIRECT_SEQUENCE_CONTROL = 1028
local IEEE80211_INFORMATION_ELEMENT = 1029
local IEEE80211_MAC_OPERATION = 1030
local IEEE80211_MIC_COUNTERMEASURES = 1031
local IEEE80211_MULTI_DOMAIN_CAPABILITY = 1032
local IEEE80211_OFDM_CONTROL = 1033
local IEEE80211_RATE_SET = 1034
local IEEE80211_RSNA_ERROR_REPORT_FROM_STATION = 1035
local IEEE80211_STATION = 1036
local IEEE80211_STATION_QOS_PROFILE = 1037
local IEEE80211_STATION_SESSION_KEY = 1038
local IEEE80211_STATISTICS = 1039
local IEEE80211_SUPPORTED_RATES = 1040
local IEEE80211_TX_POWER = 1041
local IEEE80211_TX_POWER_LEVEL = 1042
local IEEE80211_UPDATE_STATION_QOS = 1043
local IEEE80211_UPDATE_WLAN = 1044
local IEEE80211_WTP_QUALITY_OF_SERVICE = 1045
local IEEE80211_WTP_RADIO_CONFIGURATION = 1046
local IEEE80211_WTP_RADIO_FAIL_ALARM_INDICATION = 1047
local IEEE80211_WTP_RADIO_INFORMATION = 1048
local IEEE80211_SUPPORTED_MAC_PROFILES = 1060
local IEEE80211_MAC_PROFILE = 1061
-- /* ************************************************************************* */
-- /*                      Message Element Type Value                           */
-- /* ************************************************************************* */
local tlvTypes = {
    [TYPE_AC_DESCRIPTOR] = "AC Descriptor",
    [TYPE_AC_IPV4_LIST] = "AC IPv4 List",
    [TYPE_AC_IPV6_LIST] = "AC IPv6 List",
    [TYPE_AC_NAME] = "AC Name",
    [TYPE_AC_NAME_W_PRIORITY] = "AC Name With Priority",
    [TYPE_AC_TIMESTAMP] = "AC Timestamp",
    [TYPE_ADD_MAC_ACL_ENTRY] = "Add MAC ACL Entry",
    [TYPE_ADD_STATION] = "Add Station",
    [TYPE_RESERVED_9] = "Reserved",
    [TYPE_CAPWAP_CONTROL_IPV4_ADDRESS] = "CAPWAP Control IPv4 Address",
    [TYPE_CAPWAP_CONTROL_IPV6_ADDRESS] = "CAPWAP Control IPv6 Address",
    [TYPE_CAPWAP_TIMERS] = "CAPWAP Timers",
    [TYPE_DATA_TRANSFER_DATA] = "Data Transfer Data",
    [TYPE_DATA_TRANSFER_MODE] = "Data Transfer Mode",
    [TYPE_DESCRYPTION_ERROR_REPORT] = "Decryption Error Report",
    [TYPE_DECRYPTION_ERROR_REPORT_PERIOD] = "Decryption Error Report Period",
    [TYPE_DELETE_MAC_ENTRY] = "Delete MAC ACL Entry",
    [TYPE_DELETE_STATION] = "Delete Station",
    [TYPE_RESERVED_19] = "Reserved",
    [TYPE_DISCOVERY_TYPE] = "Discovery Type",
    [TYPE_DUPLICATE_IPV4_ADDRESS] = "Duplicate IPv4 Address",
    [TYPE_DUPLICATE_IPV6_ADDRESS] = "Duplicate IPv6 Address",
    [TYPE_IDLE_TIMEOUT] = "Idle Timeout",
    [TYPE_IMAGE_DATA] = "Image Data",
    [TYPE_IMAGE_IDENTIFIER] = "Image Identifier",
    [TYPE_IMAGE_INFORMATION] = "Image Information",
    [TYPE_INITIATE_DOWNLOAD] = "Initiate Download",
    [TYPE_LOCATION_DATA] = "Location Data",
    [TYPE_MAXIMUM_MESSAGE_LENGTH] = "Maximum Message Length",
    [TYPE_CAPWAP_LOCAL_IPV4_ADDRESS] = "CAPWAP Local IPv4 Address",
    [TYPE_RADIO_ADMINISTRATIVE_STATE] = "Radio Administrative State ",
    [TYPE_RADIO_OPERATIONAL_STATE] = "Radio Operational State",
    [TYPE_RESULT_CODE] = "Result Code",
    [TYPE_RETURNED_MESSAGE_ELEMENT] = "Returned Message Element",
    [TYPE_SESSION_ID] = "Session ID",
    [TYPE_STATISTICS_TIMER] = "Statistics Timer",
    [TYPE_VENDOR_SPECIFIC_PAYLOAD] = "Vendor Specific Payload",
    [TYPE_WTP_BOARD_DATA] = "WTP Board Data",
    [TYPE_WTP_DESCRIPTOR] = "WTP Descriptor",
    [TYPE_WTP_FALLBACK] = "WTP Fallback ",
    [TYPE_WTP_FRAME_TUNNEL_MODE] = "WTP Frame Tunnel Mode ",
    [TYPE_RESERVED_42] = "Reserved",
    [TYPE_RESERVED_43] = "Reserved",
    [TYPE_WTP_MAC_TYPE] = "WTP MAC Type",
    [TYPE_WTP_NAME] = "WTP Name",
    [TYPE_RESERVED_46] = "Unused/Reserved",
    [TYPE_WTP_RADIO_STATISTICS] = "WTP Radio Statistics",
    [TYPE_WTP_REBOOT_STATISTICS] = "WTP Reboot Statistics",
    [TYPE_WTP_STATIC_IP_ADDRESS_INFORMATION] = "WTP Static IP Address Information",
    [TYPE_CAPWAP_LOCAL_IPV6_ADDRESS] = "CAPWAP Local IPv6 Address",
    [TYPE_CAPWAP_TRANSPORT_PROTOCOL] = "CAPWAP Transport Protocol",
    [TYPE_MTU_DISCOVERY_PADDING] = "MTU Discovery Padding",
    [TYPE_ECN_SUPPORT] = "ECN Support",

    [IEEE80211_ADD_WLAN] = "IEEE 802.11 Add WLAN",
    [IEEE80211_ANTENNA] = "IEEE 802.11 Antenna",
    [IEEE80211_ASSIGNED_WTP_BSSID] = "IEEE 802.11 Assigned WTP BSSID",
    [IEEE80211_DELETE_WLAN] = "IEEE 802.11 Delete WLAN",
    [IEEE80211_DIRECT_SEQUENCE_CONTROL] = "IEEE 802.11 Direct Sequence Control",
    [IEEE80211_INFORMATION_ELEMENT] = "IEEE 802.11 Information Element",
    [IEEE80211_MAC_OPERATION] = "IEEE 802.11 MAC Operation",
    [IEEE80211_MIC_COUNTERMEASURES] = "IEEE 802.11 MIC Countermeasures",
    [IEEE80211_MULTI_DOMAIN_CAPABILITY] = "IEEE 802.11 Multi-Domain Capability",
    [IEEE80211_OFDM_CONTROL] = "IEEE 802.11 OFDM Control",
    [IEEE80211_RATE_SET] = "IEEE 802.11 Rate Set",
    [IEEE80211_RSNA_ERROR_REPORT_FROM_STATION] = "IEEE 802.11 RSNA Error Report From Station",
    [IEEE80211_STATION] = "IEEE 802.11 Station",
    [IEEE80211_STATION_QOS_PROFILE] = "IEEE 802.11 Station QoS Profile",
    [IEEE80211_STATION_SESSION_KEY] = "IEEE 802.11 Station Session Key",
    [IEEE80211_STATISTICS] = "IEEE 802.11 Statistics",
    [IEEE80211_SUPPORTED_RATES] = "IEEE 802.11 Supported Rates",
    [IEEE80211_TX_POWER] = "IEEE 802.11 Tx Power",
    [IEEE80211_TX_POWER_LEVEL] = "IEEE 802.11 Tx Power Level",
    [IEEE80211_UPDATE_STATION_QOS] = "IEEE 802.11 Update Station QoS",
    [IEEE80211_UPDATE_WLAN] = "IEEE 802.11 Update WLAN",
    [IEEE80211_WTP_QUALITY_OF_SERVICE] = "IEEE 802.11 WTP Quality of Service",
    [IEEE80211_WTP_RADIO_CONFIGURATION] = "IEEE 802.11 WTP Radio Configuration",
    [IEEE80211_WTP_RADIO_FAIL_ALARM_INDICATION] = "IEEE 802.11 WTP Radio Fail Alarm Indication",
    [IEEE80211_WTP_RADIO_INFORMATION] = "IEEE 802.11 WTP Radio Information",
    [IEEE80211_SUPPORTED_MAC_PROFILES] = "IEEE 802.11 Supported MAC Profiles",
    [IEEE80211_MAC_PROFILE] = "IEEE 802.11 MAC Profile",
    [0] = "Unknown"
}

-- /* ************************************************************************* */
-- /*                      Discovery Type                                       */
-- /* ************************************************************************* */
local discovery_type_vals = {
    [0] = "Unknown",
    [1] = "Static Configuration",
    [2] = "DHCP",
    [3] = "DNS",
    [4] = "AC Referral"
};

-- /* From FortiAP/WiFI 5.2.0 */
local VSP_FORTINET_AP_SCAN = 16
local VSP_FORTINET_AP_LIST = 17
local VSP_FORTINET_AP_SCAN_IDLE = 23
local VSP_FORTINET_PASSIVE = 24
local VSP_FORTINET_DAEMON_RST = 32
local VSP_FORTINET_MAC = 33
local VSP_FORTINET_WTP_ALLOW = 34
local VSP_FORTINET_WBH_STA = 36
local VSP_FORTINET_HTCAP = 49
local VSP_FORTINET_MGMT_VAP = 50
local VSP_FORTINET_MODE = 51
local VSP_FORTINET_COEXT = 52
local VSP_FORTINET_AMSDU = 53
local VSP_FORTINET_PS_OPT = 54
local VSP_FORTINET_PURE = 55
local VSP_FORTINET_EBP_TAG = 56
local VSP_FORTINET_AUTO_CHAN = 65
local VSP_FORTINET_TELNET_ENABLE = 81
local VSP_FORTINET_ADMIN_PASSWD = 82
local VSP_FORTINET_REGCODE = 83
local VSP_FORTINET_COUNTRYCODE = 84
local VSP_FORTINET_STA_SCAN = 99
local VSP_FORTINET_STA_CAP_LIST = 101
local VSP_FORTINET_FHO = 103
local VSP_FORTINET_APHO = 104
local VSP_FORTINET_STA_LOCATE = 106
local VSP_FORTINET_SPECTRUM_ANALYSIS = 108
local VSP_FORTINET_DARRP_CFG = 112
local VSP_FORTINET_DARRP_OPER_CHAN = 114
local VSP_FORTINET_AP_SUPPRESS_LIST = 128
local VSP_FORTINET_WDS = 145
local VSP_FORTINET_VAP_FLAGS = 146
local VSP_FORTINET_VAP_VLAN_TAG = 147
local VSP_FORTINET_VAP_BITMAP = 148
local VSP_FORTINET_MCAST_RATE = 149
local VSP_FORTINET_CFG = 150
local VSP_FORTINET_SPLIT_TUN_CFG = 151
local VSP_FORTINET_MGMT_VLAN_TAG = 161
local VSP_FORTINET_DISABLE_THRESH = 163
local VSP_FORTINET_VAP_PSK_PASSWD = 167
local VSP_FORTINET_IP_FRAG = 170
local VSP_FORTINET_MAX_DISTANCE = 171
local VSP_FORTINET_MESH_ETH_BRIDGE_ENABLE = 176
local VSP_FORTINET_MESH_ETH_BRIDGE_TYPE = 177
local VSP_FORTINET_WTP_CAP = 192
local VSP_FORTINET_TXPWR = 193
local VSP_FORTINET_AC_CAP = 194
local VSP_FORTINET_VAP_STATS = 196
local VSP_FORTINET_WTP_STATS = 197
local VSP_FORTINET_WTP_UPTIME = 198
local VSP_FORTINET_RADIO_STATS = 200
local VSP_FORTINET_STA_STATS_INTERVAL = 201
local VSP_FORTINET_STA_CAP_INTERVAL = 202
local VSP_FORTINET_TXPWR_DBM = 205
local VSP_FORTINET_WIDS_ENABLE = 209

local fortinet_element_id_vals = {
    [VSP_FORTINET_AP_SCAN] = "AP Scan",
    [VSP_FORTINET_AP_LIST] = "AP List",
    [VSP_FORTINET_DAEMON_RST] = "Daemon Reset",
    [VSP_FORTINET_MAC] = "MAC",
    [VSP_FORTINET_AP_SCAN_IDLE] = "AP Scan Idle",
    [VSP_FORTINET_PASSIVE] = "Passive",
    [VSP_FORTINET_WTP_ALLOW] = "WTP Allow",
    [VSP_FORTINET_WBH_STA] = "Mesh WBH STA",
    [VSP_FORTINET_HTCAP] = "HT Capabilities",
    [VSP_FORTINET_MGMT_VAP] = "Management VAP",
    [VSP_FORTINET_MODE] = "Mode",
    [VSP_FORTINET_COEXT] = "Coext",
    [VSP_FORTINET_AMSDU] = "AMSDU",
    [VSP_FORTINET_PS_OPT] = "PS OPT",
    [VSP_FORTINET_PURE] = "Pure",
    [VSP_FORTINET_EBP_TAG] = "EBP Tag",
    [VSP_FORTINET_AUTO_CHAN] = "Auto Channel",
    [VSP_FORTINET_TELNET_ENABLE] = "Telnet Enable",
    [VSP_FORTINET_ADMIN_PASSWD] = "Admin Password",
    [VSP_FORTINET_REGCODE] = "Reg Code",
    [VSP_FORTINET_COUNTRYCODE] = "Country Code",
    [VSP_FORTINET_STA_SCAN] = "STA Scan",
    [VSP_FORTINET_STA_CAP_LIST] = "STA Capability List",
    [VSP_FORTINET_FHO] = "FHO",
    [VSP_FORTINET_APHO] = "APHO",
    [VSP_FORTINET_STA_LOCATE] = "STA Locate",
    [VSP_FORTINET_SPECTRUM_ANALYSIS] = "Spectrum Analysis",
    [VSP_FORTINET_DARRP_CFG] = "DARRP Configuration",
    [VSP_FORTINET_DARRP_OPER_CHAN] = "DARRP Operation Channel",
    [VSP_FORTINET_AP_SUPPRESS_LIST] = "AP Suppress List",
    [VSP_FORTINET_VAP_FLAGS] = "VAP Flags",
    [VSP_FORTINET_WDS] = "WDS",
    [VSP_FORTINET_VAP_VLAN_TAG] = "VAP Vlan",
    [VSP_FORTINET_VAP_BITMAP] = "VAP Bitmap",
    [VSP_FORTINET_MCAST_RATE] = "Multicast Rate",
    [VSP_FORTINET_CFG] = "Configuration",
    [VSP_FORTINET_SPLIT_TUN_CFG] = "Split Tunnel Configuration",
    [VSP_FORTINET_MGMT_VLAN_TAG] = "Management Vlan",
    [VSP_FORTINET_DISABLE_THRESH] = "Disable Threshold",
    [VSP_FORTINET_VAP_PSK_PASSWD] = "VAP PSK Password",
    [VSP_FORTINET_IP_FRAG] = "IP Frag",
    [VSP_FORTINET_MAX_DISTANCE] = "Max Distance",
    [VSP_FORTINET_MESH_ETH_BRIDGE_ENABLE] = "Mesh Eth Bridge Enable",
    [VSP_FORTINET_MESH_ETH_BRIDGE_TYPE] = "Mesh Eth Bridge Type",
    [VSP_FORTINET_WTP_CAP] = "WTP Capabilities",
    [VSP_FORTINET_TXPWR] = "Tx Power",
    [VSP_FORTINET_AC_CAP] = "AC Capabilities",
    [VSP_FORTINET_VAP_STATS] = "VAP Statistics",
    [VSP_FORTINET_WTP_STATS] = "WTP Statistics",
    [VSP_FORTINET_WTP_UPTIME] = "WTP Uptime",
    [VSP_FORTINET_RADIO_STATS] = "Radio Statistics",
    [VSP_FORTINET_STA_STATS_INTERVAL] = "STA Statistics Interval",
    [VSP_FORTINET_STA_CAP_INTERVAL] = "STA Capabilities Interval",
    [VSP_FORTINET_TXPWR_DBM] = "TxPower dbm",
    [VSP_FORTINET_WIDS_ENABLE] = "WIDS Enable"
};

-- /* ************************************************************************* */
-- /*                      Board Data Type Value                                */
-- /* ************************************************************************* */
local BOARD_DATA_WTP_MODEL_NUMBER = 0
local BOARD_DATA_WTP_SERIAL_NUMBER = 1
local BOARD_DATA_BOARD_ID = 2
local BOARD_DATA_BOARD_REVISION = 3
local BOARD_DATA_BASE_MAC_ADDRESS = 4

local board_data_type_vals = {
    [BOARD_DATA_WTP_MODEL_NUMBER] = "WTP Model Number",
    [BOARD_DATA_WTP_SERIAL_NUMBER] = "WTP Serial Number",
    [BOARD_DATA_BOARD_ID] = "Board ID",
    [BOARD_DATA_BOARD_REVISION] = "Board Revision",
    [BOARD_DATA_BASE_MAC_ADDRESS] = "Base MAC Address",
};

-- /* ************************************************************************* */
-- /*                      Descriptor WTP Type Value                            */
-- /* ************************************************************************* */
local WTP_DESCRIPTOR_HARDWARE_VERSION = 0
local WTP_DESCRIPTOR_ACTIVE_SOFTWARE_VERSION = 1
local WTP_DESCRIPTOR_BOOT_VERSION = 2
local WTP_DESCRIPTOR_OTHER_SOFTWARE_VERSION = 3

local wtp_descriptor_type_vals = {
    [WTP_DESCRIPTOR_HARDWARE_VERSION] = "WTP Hardware Version",
    [WTP_DESCRIPTOR_ACTIVE_SOFTWARE_VERSION] = "WTP Active Software Version",
    [WTP_DESCRIPTOR_BOOT_VERSION] = "WTP Boot Version",
    [WTP_DESCRIPTOR_OTHER_SOFTWARE_VERSION] = "WTP Other Software Version",
};

-- WTP MAC Type
local wtp_mac_vals = {
    [0] = "Local MAC",
    [1] = "Split MAC",
    [2] = "Both (Local and Split MAC)",
};

-- AC Information Type Value
local AC_INFORMATION_HARDWARE_VERSION = 4
local AC_INFORMATION_SOFTWARE_VERSION = 5

local ac_information_type_vals = {
    [AC_INFORMATION_HARDWARE_VERSION] = "AC Hardware Version",
    [AC_INFORMATION_SOFTWARE_VERSION] = "AC Software Version",
};

local ecn_support_vals = {
    [0] = "Limited ECN Support",
    [1] = "Full and Limited ECN Support",
};

-- Result Code
local result_code_vals = {
    [0] = "Success",
    [1] = "Failure (AC List Message Element MUST Be Present)",
    [2] = "Success (NAT Detected)",
    [3] = "Join Failure (Unspecified)",
    [4] = "Join Failure (Resource Depletion)",
    [5] = "Join Failure (Unknown Source)",
    [6] = "Join Failure (Incorrect Data)",
    [7] = "Join Failure (Session ID Already in Use)",
    [8] = "Join Failure (WTP Hardware Not Supported)",
    [9] = "Join Failure (Binding Not Supported)",
    [10] = "Reset Failure (Unable to Reset)",
    [11] = "Reset Failure (Firmware Write Error)",
    [12] = "Configuration Failure (Unable to Apply Requested Configuration - Service Provided Anyhow)",
    [13] = "Configuration Failure (Unable to Apply Requested Configuration - Service Not Provided)",
    [14] = "Image Data Error (Invalid Checksum)",
    [15] = "Image Data Error (Invalid Data Length)",
    [16] = "Image Data Error (Other Error)",
    [17] = "Image Data Error (Image Already Present)",
    [18] = "Message Unexpected (Invalid in Current State)",
    [19] = "Message Unexpected (Unrecognized Request)",
    [20] = "Failure - Missing Mandatory Message Element",
    [21] = "Failure - Unrecognized Message Element",
    [22] = "Data Transfer Error (No Information to Transfer)",
};

-- /* ************************************************************************* */
-- /*                     Last Failure Type                                     */
-- /* ************************************************************************* */
local last_failure_type_vals = {
    [0] = "Not Supported",
    [1] = "AC Initiated",
    [2] = "Link Failure",
    [3] = "Software Failure",
    [4] = "Hardware Failure",
    [5] = "Other Failure",
    [2] =5, "Unknown (e.g., WTP doesn't keep track of info)",
};

-- /* ************************************************************************* */
-- /*                      Radio Administrative State                           */
-- /* ************************************************************************* */
local radio_admin_state_vals = {
    [1] = "Enabled",
    [2] = "Disabled",
};

-- /* ************************************************************************* */
-- /*                     IEE8011 Antenna                                       */
-- /* ************************************************************************* */
local ieee80211_antenna_diversity_vals = {
    [0] = "Disabled",
    [1] = "Enabled",
};

local ieee80211_antenna_combiner_vals = {
    [1] = "Sectorized (Left)",
    [2] = "Sectorized (Right)",
    [3] = "Omni",
    [4] = "Multiple Input/Multiple Output (MIMO)",
};

local ieee80211_antenna_selection_vals = {
    [1] = "Internal Antenna",
    [2] = "External Antenna",
};

-- /* ************************************************************************* */
-- /*                      WTP Fallback                                         */
-- /* ************************************************************************* */
local wtp_fallback_vals = {
    [0] =  "Reserved",
    [1] =  "Enabled",
    [2] =  "Disabled",
};

-- /* ************************************************************************* */
-- /*                      Radio Operational State                              */
-- /* ************************************************************************* */
local radio_op_state_vals = {
    [0] = "Reserved",
    [1] = "Enabled",
    [2] = "Disabled",
};

-- /* ************************************************************************* */
-- /*                      Radio Operational Cause                              */
-- /* ************************************************************************* */
local radio_op_cause_vals = {
    [0] = "Normal",
    [1] = "Radio Failure",
    [2] = "Software Failure",
    [3] = "Administratively Set",
};

local CAPWAP_HDR_LEN = 16

local pf = {}

pf.preamble_version = ProtoField.new("Version", "ftnt.capwap.preamble.version", ftypes.UINT8, nil, base.DEC, 0xf0)
pf.preamble_type = ProtoField.new("Type", "ftnt.capwap.preamble.type", ftypes.UINT8, ptypes, base.DEC, 0x0f)
pf.preamble_reserved = ProtoField.new("Reserved", "ftnt.capwap.preamble.reserved", ftypes.UINT24)

pf.header_length = ProtoField.new("Header Length", "ftnt.capwap.header.length", ftypes.UINT24, nil, base.DEC, 0xf80000)
pf.header_radio_id = ProtoField.new("Radio ID", "ftnt.capwap.header.radio.id", ftypes.UINT24, nil, base.DEC, 0x07c000)
pf.header_binding_id = ProtoField.new("Wireless Binding ID", "ftnt.capwap.header.binding.id", ftypes.UINT24, btypes, base.DEC, 0x003e00)
pf.header_flags = ProtoField.new("Header Flags", "ftnt.capwap.header.flags", ftypes.UINT24, nil, base.HEX, 0x0001ff)
pf.header_fragment_id = ProtoField.new("Fragment ID", "ftnt.capwap.header.fragment.id", ftypes.UINT16, nil, base.DEC)
pf.header_fragment_offset = ProtoField.new("Fragment Offset", "ftnt.capwap.header.fragment.offset", ftypes.UINT16, nil, base.DEC, 0xfff8)
pf.header_reserved = ProtoField.new("Reserved", "ftnt.capwap.header.reserved", ftypes.UINT16, nil, base.DEC, 0x0007)

pf.control_header_message_type = ProtoField.new("Message Type", "ftnt.capwap.control.header.message.type", ftypes.UINT32)
pf.control_header_message_type_enterprise_number = ProtoField.new("Message Type (Enterprise Number)", "ftnt.capwap.control.header.message.type.enterprise.number", ftypes.UINT24, ntypes)
pf.control_header_message_type_enterprise_specific = ProtoField.new("Message Type (Enterprise Specific)", "ftnt.capwap.control.header.message.type.enterprise.specific", ftypes.UINT8, stypes)
pf.control_header_sequence_number = ProtoField.new("Sequence Number", "ftnt.capwap.control.header.sequence.number", ftypes.UINT8)
pf.control_header_message_element_length = ProtoField.new("Message Element Length", "ftnt.capwap.control.header.message.element.length", ftypes.UINT16)
pf.control_header_message_flags = ProtoField.new("Flags", "ftnt.capwap.control.header.flags", ftypes.UINT8)

pf.tlv = ProtoField.new("Type", "ftnt.capwap.message.element.tlv", ftypes.NONE)
pf.tlv_type = ProtoField.new("Type", "ftnt.capwap.message.element.tlv.type", ftypes.UINT16, tlvTypes)
pf.tlv_length = ProtoField.new("Length", "ftnt.capwap.message.element.tlv.length", ftypes.UINT16)
pf.tlv_value = ProtoField.new("Value", "ftnt.capwap.message.element.tlv.value", ftypes.BYTES)

-- message elements protocol common fields
pf.radio_id = ProtoField.new("Radio ID", "ftnt.capwap.message.element.radio.id", ftypes.UINT8)
pf.reserved = ProtoField.new("Reserved", "ftnt.capwap.message.element.reserved", ftypes.UINT8)
pf.current_channel = ProtoField.new("Current Channel", "ftnt.capwap.message.element.current.channel", ftypes.UINT8)
pf.length = ProtoField.new("Length", "ftnt.capwap.message.element.length", ftypes.UINT8)
pf.sta_mac = ProtoField.new("STA MAC", "ftnt.capwap.message.element.sta.mac", ftypes.BYTES)
pf.bssid = ProtoField.new("BSSID", "ftnt.capwap.message.element.bssid", ftypes.BYTES)
pf.mhc = ProtoField.new("MHC", "ftnt.capwap.message.element.mhc", ftypes.UINT8)
pf.country_code = ProtoField.new("Country Code", "ftnt.capwap.message.element.country.code", ftypes.UINT16)
pf.country_code_string = ProtoField.new("Country Code", "ftnt.capwap.message.element.country.code.string", ftypes.STRING)

-- message elements protocol fields
pf.discovery_type = ProtoField.new("Discovery Type", "ftnt.capwap.message.element.discovery.type", ftypes.UINT8, discovery_type_vals)
pf.vendor_identifier = ProtoField.new("Vendor Identifier", "ftnt.capwap.message.element.vendor.identifier", ftypes.UINT32, {[12356] = "Fortinet, Inc."})
pf.vendor_element_id = ProtoField.new("Vendor Element ID", "ftnt.capwap.message.element.vendor.element.id", ftypes.UINT16)
pf.vendor_data = ProtoField.new("Vendor Data", "ftnt.capwap.message.element.vendor.data", ftypes.BYTES)
pf.fortinet_element_id = ProtoField.new("Fortinet Element ID", "ftnt.capwap.message.element.fortinet.element.id", ftypes.UINT16, fortinet_element_id_vals)
pf.fortinet_value = ProtoField.new("Fortinet Value", "ftnt.capwap.message.element.fortinet.value", ftypes.BYTES)

pf.wtp_board_data_vendor = ProtoField.new("WTP Board Data Vendor", "ftnt.capwap.message.element.wtp.board.data.vendor", ftypes.UINT32, {[12356] = "Fortinet, Inc."})
pf.wtp_board_data = ProtoField.new("WTP Board Data", "ftnt.capwap.message.element.wtp.board.data", ftypes.NONE)
pf.board_data_type = ProtoField.new("Board Data Type", "ftnt.capwap.message.element.wtp.board.data.type", ftypes.UINT16, board_data_type_vals)
pf.board_data_length = ProtoField.new("Board Data Length", "ftnt.capwap.message.element.wtp.board.data.length", ftypes.UINT16)
pf.board_data_value = ProtoField.new("Board Data Value", "ftnt.capwap.message.element.wtp.board.data.value", ftypes.BYTES)
pf.wtp_model_number = ProtoField.new("WTP Model Number", "ftnt.capwap.message.element.wtp.board.data.wtp.model.number", ftypes.STRING)
pf.wtp_serial_number = ProtoField.new("WTP Serial Number", "ftnt.capwap.message.element.wtp.board.data.wtp.serial.number", ftypes.STRING)
pf.wtp_board_id = ProtoField.new("WTP Board ID", "ftnt.capwap.message.element.wtp.board.data.wtp.board.id", ftypes.STRING)
pf.wtp_board_revision = ProtoField.new("WTP Board Revision", "ftnt.capwap.message.element.wtp.board.data.wtp.board.revision", ftypes.STRING)
pf.base_mac_address = ProtoField.new("Base Mac Address", "ftnt.capwap.message.element.wtp.board.data.base.mac.address", ftypes.STRING)

pf.wtp_descriptor_max_radios = ProtoField.new("Max Radios", "ftnt.capwap.message.element.wtp.descriptor.max.radios", ftypes.UINT8)
pf.wtp_descriptor_radio_in_use = ProtoField.new("Radio in use", "ftnt.capwap.message.element.wtp.descriptor.radio.in.use", ftypes.UINT8)
pf.wtp_descriptor_encryption_capabilities = ProtoField.new("Encryption Capabilities (Number)", "ftnt.capwap.message.element.wtp.descriptor.encryption.capabilities", ftypes.UINT8)
pf.wtp_descriptor_encryption_capabilities_encryption_capabilities = ProtoField.new("Encryption Capabilities", "ftnt.capwap.message.element.wtp.descriptor.encryption.capabilities", ftypes.UINT24)
pf.wtp_descriptor_encryption_capabilities_reserved = ProtoField.new("Reserved (Encrypt)", "ftnt.capwap.message.element.wtp.descriptor.encryption.capabilities.reserved", ftypes.UINT8, nil, base.DEC, 0xe0)
pf.wtp_descriptor_encryption_capabilities_wbid = ProtoField.new("Encrypt WBID", "ftnt.capwap.message.element.wtp.descriptor.encryption.capabilities.wbid", ftypes.UINT8, btypes, base.DEC, 0x1f)
pf.wtp_descriptor_encryption_capabilities_values = ProtoField.new("Encryption Capabilities", "ftnt.capwap.message.element.wtp.descriptor.encryption.capabilities.values", ftypes.UINT16)

pf.wtp_descriptor_vendor = ProtoField.new("WTP Descriptor Vendor", "ftnt.capwap.message.element.wtp.descriptor.vendor", ftypes.UINT32)
pf.wtp_descriptor_type = ProtoField.new("Descriptor Type", "ftnt.capwap.message.element.wtp.descriptor.type", ftypes.UINT16, wtp_descriptor_type_vals)
pf.wtp_descriptor_length = ProtoField.new("Descriptor Length", "ftnt.capwap.message.element.wtp.descriptor.length", ftypes.UINT16)
pf.wtp_descriptor_value = ProtoField.new("Descriptor Value", "ftnt.capwap.message.element.wtp.descriptor.value", ftypes.BYTES)
pf.wtp_descriptor_hardware_version = ProtoField.new("WTP Hardware Version", "ftnt.capwap.message.element.wtp.descriptor.hardware.version", ftypes.UINT8)
pf.wtp_descriptor_software_version = ProtoField.new("WTP Active Software Version", "ftnt.capwap.message.element.wtp.descriptor.active.software.version", ftypes.STRING)
pf.wtp_descriptor_boot_version = ProtoField.new("WTP Boot Version", "ftnt.capwap.message.element.wtp.descriptor.boot.version", ftypes.STRING)
pf.wtp_descriptor_other_software_version = ProtoField.new("WTP Other Software Version", "ftnt.capwap.message.element.wtp.descriptor.other.software.version", ftypes.STRING)

pf.wtp_frame_tunnel_mode = ProtoField.new("WTP Frame Tunnel Mode", "ftnt.capwap.message.element.wtp.frame.tunnel.mode", ftypes.UINT8)
pf.wtp_native_frame_tunnel_mode = ProtoField.new("Native Frame Tunnel Mode", "ftnt.capwap.message.element.wtp.native.frame.tunnel.mode", ftypes.UINT8, booltypes, base.DEC, 0x08)
pf.wtp_8023_frame_tunnel_mode = ProtoField.new("802.3 Frame Tunnel Mode", "ftnt.capwap.message.element.wtp.8023.frame.tunnel.mode", ftypes.UINT8, booltypes, base.DEC, 0x04)
pf.wtp_frame_tunnel_mode_local_bridging = ProtoField.new("Local Bridging", "ftnt.capwap.message.element.wtp.frame.tunnel.mode.local.bridging", ftypes.UINT8, booltypes, base.DEC, 0x02)

pf.wtp_frame_tunnel_mode_reserved = ProtoField.new("Reserved", "ftnt.capwap.message.element.wtp.native.frame.tunnel.mode.reserved", ftypes.UINT8, nil, base.DEC, 0xf1)
pf.wtp_mac_type = ProtoField.new("WTP MAC Type", "ftnt.capwap.message.element.wtp.mac.type", ftypes.UINT8, wtp_mac_vals)

-- pf.wtp_radio_information_radio_id = ProtoField.new("Radio ID", "ftnt.capwap.message.element.wtp.radio.information.radio.id", ftypes.UINT8)
pf.wtp_radio_information_radio_type_reserved = ProtoField.new("Radio Type Reserved", "ftnt.capwap.message.element.wtp.radio.information.radio.type.reserved", ftypes.BYTES)
pf.wtp_radio_information_radio_type_80211n = ProtoField.new("Radio Type 802.11n", "ftnt.capwap.message.element.wtp.radio.information.radio.type.80211n", ftypes.UINT8, booltypes, base.DEC, 0x08)
pf.wtp_radio_information_radio_type_80211g = ProtoField.new("Radio Type 802.11g", "ftnt.capwap.message.element.wtp.radio.information.radio.type.80211g", ftypes.UINT8, booltypes, base.DEC, 0x04)
pf.wtp_radio_information_radio_type_80211a = ProtoField.new("Radio Type 802.11a", "ftnt.capwap.message.element.wtp.radio.information.radio.type.80211a", ftypes.UINT8, booltypes, base.DEC, 0x02)
pf.wtp_radio_information_radio_type_80211b = ProtoField.new("Radio Type 802.11b", "ftnt.capwap.message.element.wtp.radio.information.radio.type.80211b", ftypes.UINT8, booltypes, base.DEC, 0x01)

pf.ac_descriptor_stations = ProtoField.new("Stations", "ftnt.capwap.message.element.ac.descriptor.stations", ftypes.UINT16)
pf.ac_descriptor_limit_stations = ProtoField.new("Limit Stations", "ftnt.capwap.message.element.ac.descriptor.limit.stations", ftypes.UINT16)
pf.ac_descriptor_active_wtps = ProtoField.new("Active WTPs", "ftnt.capwap.message.element.ac.descriptor.active.wtps", ftypes.UINT16)
pf.ac_descriptor_max_wtps = ProtoField.new("Max WTPs", "ftnt.capwap.message.element.ac.descriptor.max.wtps", ftypes.UINT16)
pf.ac_descriptor_security_flags = ProtoField.new("Security Flags", "ftnt.capwap.message.element.ac.descriptor.security.flags", ftypes.UINT8, nil, base.HEX)
pf.ac_descriptor_security_flags_reserved = ProtoField.new("Reserved", "ftnt.capwap.message.element.ac.descriptor.security.flags.reserved", ftypes.UINT8, nil, base.DEC, 0xf9)
pf.ac_descriptor_security_flags_ac_supports_pre_shared = ProtoField.new("AC supports the pre-shared", "ftnt.capwap.message.element.ac.descriptor.security.flags.ac.supports.pre.shared", ftypes.UINT8, booltypes, base.DEC, 0x04)
pf.ac_descriptor_security_flags_ac_supports_x509 = ProtoField.new("AC supports X.509 Certificate", "ftnt.capwap.message.element.ac.descriptor.security.flags.ac.supports.x509", ftypes.UINT8, booltypes, base.DEC, 0x02)
pf.ac_descriptor_rmac_field = ProtoField.new("R-MAC Field", "ftnt.capwap.message.element.ac.descriptor.rmac.field", ftypes.UINT8, {[0] = "Reserved"})
-- pf.ac_descriptor_reserved = ProtoField.new("Reserved", "ftnt.capwap.message.element.ac.descriptor.reserved", ftypes.UINT8)
pf.ac_descriptor_dtls_policy_flags = ProtoField.new("DTLS Policy Flags", "ftnt.capwap.message.element.ac.descriptor.dtls.policy.flags", ftypes.UINT8)
pf.ac_descriptor_ac_information = ProtoField.new("AC Information", "ftnt.capwap.message.element.ac.descriptor.ac.information", ftypes.BYTES)
pf.ac_descriptor_ac_information_vendor = ProtoField.new("AC Information Vendor", "ftnt.capwap.message.element.ac.descriptor.ac.information.vendor", ftypes.BYTES)
pf.ac_descriptor_ac_information_type = ProtoField.new("AC Information Type", "ftnt.capwap.message.element.ac.descriptor.ac.information.type", ftypes.BYTES)
pf.ac_descriptor_ac_information_length = ProtoField.new("AC Information Length", "ftnt.capwap.message.element.ac.descriptor.ac.information.length", ftypes.BYTES)
pf.ac_descriptor_ac_information_value = ProtoField.new("AC Information Value", "ftnt.capwap.message.element.ac.descriptor.ac.information.value", ftypes.BYTES)

pf.ac_name = ProtoField.new("AC Name", "ftnt.capwap.message.element.ac.name", ftypes.STRING)
pf.ac_timestamp = ProtoField.new("AC Timestamp", "ftnt.capwap.message.element.ac.timestamp", ftypes.STRING)
pf.location_data = ProtoField.new("Location Data", "ftnt.capwap.message.element.location.data", ftypes.STRING)
pf.wtp_name = ProtoField.new("WTP Name", "ftnt.capwap.message.element.wtp.name", ftypes.STRING)
pf.session_id = ProtoField.new("Session ID", "ftnt.capwap.message.element.session.id", ftypes.BYTES)
pf.ecn_support = ProtoField.new("ECN Support", "ftnt.capwap.message.element.ecn.support", ftypes.UINT8, ecn_support_vals)
pf.capwap_local_ipv4_address = ProtoField.new("CAPWAP Local IPv4 Address", "ftnt.capwap.message.element.capwap.local.ipv4.address", ftypes.IPv4)
pf.result_code = ProtoField.new("Result Code", "ftnt.capwap.message.element.result.code", ftypes.UINT32, result_code_vals)
pf.statistics_timer = ProtoField.new("Statistics Timer (Sec)", "ftnt.capwap.message.element.statistics.timer", ftypes.UINT16)

pf.wtp_reboot_statistics_reboot_count = ProtoField.new("Reboot Count", "ftnt.capwap.message.element.wtp.reboot.statistics.reboot.count", ftypes.UINT16)
pf.wtp_reboot_statistics_ac_initiated_count =  ProtoField.new("AC Initiated Count", "ftnt.capwap.message.element.wtp.reboot.statistics.ac.initiated.count", ftypes.UINT16)
pf.wtp_reboot_statistics_linked_failure_count = ProtoField.new("Link Failure Count", "ftnt.capwap.message.element.wtp.reboot.statistics.linked.failure.count", ftypes.UINT16)
pf.wtp_reboot_statistics_sw_failure_count = ProtoField.new("SW Failure Count", "ftnt.capwap.message.element.wtp.reboot.statistics.sw.failure.count", ftypes.UINT16)
pf.wtp_reboot_statistics_hw_failure_count = ProtoField.new("HW Failure Count", "ftnt.capwap.message.element.wtp.reboot.statistics.hw.failure.count", ftypes.UINT16)
pf.wtp_reboot_statistics_other_failure_count = ProtoField.new("Other Failure Count", "ftnt.capwap.message.element.wtp.reboot.statistics.other.failure.count", ftypes.UINT16)
pf.wtp_reboot_statistics_unknown_failure_count = ProtoField.new("Unknown Failure Count", "ftnt.capwap.message.element.wtp.reboot.statistics.unknown.failure.count", ftypes.UINT16)
pf.wtp_reboot_statistics_last_failure_type = ProtoField.new("Last Failure Type", "ftnt.capwap.message.element.wtp.reboot.statistics.last.failure.type", ftypes.UINT16, last_failure_type_vals)

pf.radio_administrative_id = ProtoField.new("Radio Administrative ID", "ftnt.capwap.message.element.radio.administrative.id", ftypes.UINT8)
pf.radio_administrative_state = ProtoField.new("Radio Administrative State", "ftnt.capwap.message.element.radio.administrative.state", ftypes.UINT8, radio_admin_state_vals)

-- pf.ieee_80211_antenna_radio_id = ProtoField.new("Radio ID", "ftnt.capwap.message.element.ieee.80211.antenna.radio.id", ftypes.UINT8)
pf.ieee_80211_antenna_diversity = ProtoField.new("Diversity", "ftnt.capwap.message.element.ieee.80211.antenna.diversity", ftypes.UINT8, ieee80211_antenna_diversity_vals)
pf.ieee_80211_antenna_combiner = ProtoField.new("Combiner", "ftnt.capwap.message.element.ieee.80211.antenna.combiner", ftypes.UINT8, ieee80211_antenna_combiner_vals)
pf.ieee_80211_antenna_count = ProtoField.new("Antenna Count", "ftnt.capwap.message.element.ieee.80211.antenna.count", ftypes.UINT8)
pf.ieee_80211_antenna_selection = ProtoField.new("Selection", "ftnt.capwap.message.element.ieee.80211.antenna.selection", ftypes.UINT8, ieee80211_antenna_selection_vals)

-- pf.ieee_80211_tx_power_radio_id = ProtoField.new("Radio ID", "ftnt.capwap.message.element.ieee.80211.tx.power.radio.id", ftypes.UINT8)
-- pf.ieee_80211_tx_power_reserved = ProtoField.new("Reserved", "ftnt.capwap.message.element.ieee.80211.tx.power.reserved", ftypes.UINT8)
pf.ieee_80211_tx_power_current_tx_power = ProtoField.new("Current Tx Power", "ftnt.capwap.message.element.ieee.80211.tx.power.current.tx.power", ftypes.UINT16)

-- pf.ieee_80211_tx_power_level_radio_id = ProtoField.new("Radio ID", "ftnt.capwap.message.element.ieee.80211.tx.power.level.radio.id", ftypes.UINT8)
pf.ieee_80211_tx_power_level_num_levels = ProtoField.new("Num Levels", "ftnt.capwap.message.element.ieee.80211.tx.power.level.num.levels", ftypes.UINT8)
pf.ieee_80211_tx_power_level_power_level = ProtoField.new("Power Level", "ftnt.capwap.message.element.ieee.80211.tx.power.level.power.level", ftypes.UINT16)

-- pf.ieee_80211_wtp_radio_configuration_radio_id = ProtoField.new("Radio ID", "ftnt.capwap.message.element.ieee.80211.wtp.radio.configuration.radio.id", ftypes.UINT8)
pf.ieee_80211_wtp_radio_configuration_short_preamble = ProtoField.new("Short Preamble", "ftnt.capwap.message.element.ieee.80211.wtp.radio.configuration.short.preamble", ftypes.UINT8)
pf.ieee_80211_wtp_radio_configuration_num_of_bssids = ProtoField.new("Num of BSSIDs", "ftnt.capwap.message.element.ieee.80211.wtp.radio.configuration.num.of.bssids", ftypes.UINT8)
pf.ieee_80211_wtp_radio_configuration_dtim_period = ProtoField.new("DTIM Period", "ftnt.capwap.message.element.ieee.80211.wtp.radio.configuration.dtim.period", ftypes.UINT8)
pf.ieee_80211_wtp_radio_configuration_bssid = ProtoField.new("BSSID", "ftnt.capwap.message.element.ieee.80211.wtp.radio.configuration.bssid", ftypes.BYTES)
pf.ieee_80211_wtp_radio_configuration_beacon_period = ProtoField.new("Beacon Period", "ftnt.capwap.message.element.ieee.80211.wtp.radio.configuration.beacon.period", ftypes.UINT16)
pf.ieee_80211_wtp_radio_configuration_country_string = ProtoField.new("Country String", "ftnt.capwap.message.element.ieee.80211.wtp.radio.configuration.country.string", ftypes.STRING)

-- pf.ieee_80211_mac_operation_radio_id = ProtoField.new("Radio ID", "ftnt.capwap.message.element.ieee.80211.mac.operation.radio.id", ftypes.UINT8)
-- pf.ieee_80211_mac_operation_reserved = ProtoField.new("Reserved", "ftnt.capwap.message.element.ieee.80211.mac.operation.reserved", ftypes.UINT8)
pf.ieee_80211_mac_operation_rts_threshold = ProtoField.new("RTS Threshold", "ftnt.capwap.message.element.ieee.80211.mac.operation.rts.threshold", ftypes.UINT16)
pf.ieee_80211_mac_operation_short_retry = ProtoField.new("Short Retry", "ftnt.capwap.message.element.ieee.80211.mac.operation.short.retry", ftypes.UINT8)
pf.ieee_80211_mac_operation_long_retry = ProtoField.new("Long Retry", "ftnt.capwap.message.element.ieee.80211.mac.operation.long.retry", ftypes.UINT8)
pf.ieee_80211_mac_operation_fragmentation_threshold = ProtoField.new("Fragmentation Threshold", "ftnt.capwap.message.element.ieee.80211.mac.operation.fragmentation.threshold", ftypes.UINT16)
pf.ieee_80211_mac_operation_tx_mdsu_lifetime = ProtoField.new("Tx MDSU Lifetime", "ftnt.capwap.message.element.ieee.80211.mac.operation.tx.mdsu.lifetime", ftypes.UINT24)
pf.ieee_80211_mac_operation_rx_mdsu_lifetime = ProtoField.new("Rx MDSU Lifetime", "ftnt.capwap.message.element.ieee.80211.mac.operation.rx.mdsu.lifetime", ftypes.UINT24)

pf.capwap_timers_discovery = ProtoField.new("CAPWAP Timers Discovery (Sec)", "ftnt.capwap.message.element.capwap.timers.discovery", ftypes.UINT8)
pf.capwap_timers_echo_request = ProtoField.new("CAPWAP Timers Echo Request (Sec)", "ftnt.capwap.message.element.capwap.timers.echo.request", ftypes.UINT8)

pf.decryption_error_report_period_radio_id = ProtoField.new("Decryption Error Report Period Radio ID", "ftnt.capwap.message.element.decryption.error.report.period.radio.id", ftypes.UINT8)
pf.decryption_error_report_report_interval = ProtoField.new("Decryption Error Report Report Interval (Sec)", "ftnt.capwap.message.element.decryption.error.report.report.interval", ftypes.UINT8)

pf.idle_timeout = ProtoField.new("Idle Timeout", "ftnt.capwap.message.element.idle.timeout", ftypes.UINT32)
pf.wtp_fallback = ProtoField.new("WTP Fallback", "ftnt.capwap.message.element.wtp.fallback", ftypes.UINT8, wtp_fallback_vals)

-- pf.ieee_80211_multi_domain_capability_radio_id = ProtoField.new("Radio ID", "ftnt.capwap.message.element.ieee.80211.multi.domain.capability.radio.id", ftypes.UINT8)
-- pf.ieee_80211_multi_domain_capability_reserved = ProtoField.new("Reserved", "ftnt.capwap.message.element.ieee.80211.multi.domain.capability.reserved", ftypes.UINT8)
pf.ieee_80211_multi_domain_capability_first_channel = ProtoField.new("First Channel", "ftnt.capwap.message.element.ieee.80211.multi.domain.capability.first.channel", ftypes.UINT16)
pf.ieee_80211_multi_domain_capability_number_of_channels = ProtoField.new("Number of Channels", "ftnt.capwap.message.element.ieee.80211.multi.domain.capability.number.of.channels", ftypes.UINT16)
pf.ieee_80211_multi_domain_capability_max_tx_power_level = ProtoField.new("Max Tx Power Level", "ftnt.capwap.message.element.ieee.80211.multi.domain.capability.max.tx.power.level", ftypes.UINT16)

pf.ieee_80211_direct_sequence_control_current_cca = ProtoField.new("Current CCA", "ftnt.capwap.message.element.ieee.80211.direct.sequence.control.current.cca", ftypes.UINT8)
pf.ieee_80211_direct_sequence_control_energy_detect_threshold = ProtoField.new("Energy Detect Threshold", "ftnt.capwap.message.element.ieee.80211.direct.sequence.control.energy.detect.threshold", ftypes.UINT32)

pf.ieee_80211_ofdm_control_band_support = ProtoField.new("Band Support", "ftnt.capwap.message.element.ieee.80211.ofdm.control.band.support", ftypes.UINT8)
pf.ieee_80211_ofdm_control_ti_threshold = ProtoField.new("TI Threshold", "ftnt.capwap.message.element.ieee.80211.ofdm.control.ti.threshold", ftypes.UINT32)

pf.radio_operational_id = ProtoField.new("Radio Operational ID", "ftnt.capwap.message.element.radio.operation.id", ftypes.UINT8)
pf.radio_operational_state = ProtoField.new("Radio Operational State", "ftnt.capwap.message.element.radio.operation.state", ftypes.UINT8, radio_op_state_vals)
pf.radio_operational_cause = ProtoField.new("Radio Operational Cause", "ftnt.capwap.message.element.radio.operation.cause", ftypes.UINT8, radio_op_cause_vals)

pf.vsp_ftnt_vlanid = ProtoField.new("Vlan ID", "ftnt.capwap.message.element.fortinet.vlan.id", ftypes.UINT16)
pf.vsp_ftnt_wtpcap = ProtoField.new("WTP CAP", "ftnt.capwap.message.element.fortinet.wtp.cap", ftypes.BYTES)
pf.serial_number = ProtoField.new("Serial Number", "ftnt.capwap.message.element.fortinet.serial.number", ftypes.STRING)
pf.allowed = ProtoField.new("Allowed", "ftnt.capwap.message.element.fortinet.allowed", ftypes.UINT8)
pf.ip_frag_enable = ProtoField.new("IP Frag Enable", "ftnt.capwap.message.element.fortinet.ip.frag.enable", ftypes.UINT8)
pf.tun_mtu_uplink = ProtoField.new("Tun Mtu Uplink", "ftnt.capwap.message.element.fortinet.tun.mtu.uplink", ftypes.UINT16)
pf.tun_mtu_downlink = ProtoField.new("Tun Mtu Downlink", "ftnt.capwap.message.element.fortinet.tun.mtu.downlink", ftypes.UINT16)
pf.regcode = ProtoField.new("Reg Code", "ftnt.capwap.message.element.fortinet.regcode", ftypes.STRING)
pf.version = ProtoField.new("Version", "ftnt.capwap.message.element.fortinet.version", ftypes.UINT8)
pf.ac_capbilities = ProtoField.new("AC Capabilities", "ftnt.capwap.message.element.fortinet.ac.capbilities", ftypes.BYTES)
pf.telnet_enable = ProtoField.new("Telnet Enable", "ftnt.capwap.message.element.fortinet.telnet.enable", ftypes.UINT32)
pf.sn_length= ProtoField.new("SN Length", "ftnt.capwap.message.element.fortinet.sn.length", ftypes.UINT16)
pf.sn = ProtoField.new("SN", "ftnt.capwap.message.element.fortinet.sn", ftypes.STRING)
pf.prev_r32 = ProtoField.new("Prev R32", "ftnt.capwap.message.element.fortinet.prev.r32", ftypes.UINT32)
pf.curr_r32 = ProtoField.new("Curr R32", "ftnt.capwap.message.element.fortinet.curr.r32", ftypes.UINT32)
pf.age = ProtoField.new("Age", "ftnt.capwap.message.element.fortinet.age", ftypes.UINT32)
pf.period = ProtoField.new("Period", "ftnt.capwap.message.element.fortinet.period", ftypes.UINT32)
pf.vfid = ProtoField.new("Vfid", "ftnt.capwap.message.element.fortinet.vfid", ftypes.UINT32)
pf.mesh_eth_bridge_type = ProtoField.new("Mesh Eth Bridge Type", "ftnt.capwap.message.element.fortinet.mesh.eth.bridge.type", ftypes.UINT16)
pf.sta_stats_interval = ProtoField.new("STA Statistics Report Interval", "ftnt.capwap.message.element.fortinet.sta.stats.interval", ftypes.UINT16)
pf.sta_cap_interval = ProtoField.new("STA Capabilities Report Interval", "ftnt.capwap.message.element.fortinet.sta.cap.interval", ftypes.UINT16)
pf.max_distance = ProtoField.new("Max Distance", "ftnt.capwap.message.element.fortinet.max.distance", ftypes.UINT32)
pf.txpower_dbm = ProtoField.new("TxPower dbm", "ftnt.capwap.message.element.fortinet.txpower.dbm", ftypes.UINT16)
pf.vap_stats = ProtoField.new("Vap Statistics", "ftnt.capwap.message.element.fortinet.vap.stats", ftypes.BYTES)
pf.cpu_load = ProtoField.new("CPU Load", "ftnt.capwap.message.element.fortinet.cpu.load", ftypes.UINT8)
pf.mem_total = ProtoField.new("Memory Total", "ftnt.capwap.message.element.fortinet.memory.total", ftypes.UINT32)
pf.mem_free = ProtoField.new("Memory Free", "ftnt.capwap.message.element.fortinet.memory.free", ftypes.UINT32)
pf.ap_list = ProtoField.new("AP List", "ftnt.capwap.message.element.fortinet.ap.list", ftypes.BYTES)
pf.ap_scan_idle = ProtoField.new("AP Scan Idle", "ftnt.capwap.message.element.fortinet.ap.scan.idle", ftypes.UINT16)
pf.auto_chan = ProtoField.new("Auto Channel", "ftnt.capwap.message.element.fortinet.auto.channel", ftypes.UINT16)
pf.wlan_id = ProtoField.new("Wlan ID", "ftnt.capwap.message.element.fortinet.wlan.id", ftypes.UINT8)
pf.disable_thresh = ProtoField.new("Auto Channel", "ftnt.capwap.message.element.fortinet.disable.thresh", ftypes.UINT16)
pf.vap_flags = ProtoField.new("VAP Flags", "ftnt.capwap.message.element.fortinet.vap.flags", ftypes.UINT32)
pf.wtp_up_time = ProtoField.new("WTP Up Time", "ftnt.capwap.message.element.fortinet.wtp.up.time", ftypes.UINT32)
pf.daemon_up_time = ProtoField.new("Daemon Up Time", "ftnt.capwap.message.element.fortinet.daemon.up.time", ftypes.UINT32)
pf.session_up_time = ProtoField.new("Session Up Time", "ftnt.capwap.message.element.fortinet.session.up.time", ftypes.UINT32)
pf.oper_chan = ProtoField.new("Operation Channel", "ftnt.capwap.message.element.fortinet.oper.chan", ftypes.UINT8)
pf.sta_cap_list = ProtoField.new("Station Capability List", "ftnt.capwap.message.element.fortinet.sta.cap.list", ftypes.BYTES)
pf.radio_stats = ProtoField.new("Radio Statistics", "ftnt.capwap.message.element.fortinet.radio.stats", ftypes.BYTES)
pf.mesh_eth_bridge_enable = ProtoField.new("Mesh Eth Bridge Enable", "ftnt.capwap.message.element.fortinet.mesh.eth.bridge.enable", ftypes.UINT8)
pf.ps_opt = ProtoField.new("PS OPT", "ftnt.capwap.message.element.fortinet.ps.opt", ftypes.UINT8)
pf.pure = ProtoField.new("Pure", "ftnt.capwap.message.element.fortinet.pure", ftypes.UINT8)
pf.mode = ProtoField.new("Mode", "ftnt.capwap.message.element.fortinet.mode", ftypes.UINT8)
pf.amsdu = ProtoField.new("AMSDU", "ftnt.capwap.message.element.fortinet.amsdu", ftypes.UINT8)
pf.coext = ProtoField.new("Coext", "ftnt.capwap.message.element.fortinet.coext", ftypes.UINT8)
pf.mcs = ProtoField.new("MCS", "ftnt.capwap.message.element.fortinet.mcs", ftypes.UINT8)
pf.ht_short_gi = ProtoField.new("HT Short GI", "ftnt.capwap.message.element.fortinet.ht.short.gi", ftypes.UINT8)
pf.bandwidth = ProtoField.new("Bandwidth", "ftnt.capwap.message.element.fortinet.bandwidth", ftypes.UINT8)

capwap.fields = pf

function mgmtVlanTagDecoder(tlv, tvbrange)
    tlv:add(pf.vsp_ftnt_vlanid, tvbrange)
end

function wtpCapDecoder(tlv, tvbrange)
    tlv:add(pf.vsp_ftnt_wtpcap, tvbrange)
end


function wtpAllowDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.serial_number, tvb:range(0, 16))
    tlv:add(pf.allowed, tvb:range(16, 1))
end

function ipFragDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.ip_frag_enable, tvb:range(0, 1))
    tlv:add(pf.tun_mtu_uplink, tvb:range(1, 2))
    tlv:add(pf.tun_mtu_downlink, tvb:range(3, 2))
end

function wbhStaDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.length, tvb:range(1, 1))
    tlv:add(pf.sta_mac, tvb:range(2, 6))
    tlv:add(pf.bssid, tvb:range(8, 6))
    tlv:add(pf.mhc, tvb:range(14, 1))
end

function regcodeDecoder(tlv, tvbrange)
    tlv:add(pf.regcode, tvbrange)
end

function telnetEnableDecoder(tlv, tvbrange)
    tlv:add(pf.telnet_enable, tvbrange)
end

function meshEthBridgeTypeDecoder(tlv, tvbrange)
    tlv:add(pf.mesh_eth_bridge_type, tvbrange)
end

function staStatsIntervalDecoder(tlv, tvbrange)
    tlv:add(pf.sta_stats_interval, tvbrange)
end

function staCapIntervalDecoder(tlv, tvbrange)
    tlv:add(pf.sta_cap_interval, tvbrange)
end

function meshEthBridgeEnableDecoder(tlv, tvbrange)
    tlv:add(pf.mesh_eth_bridge_enable, tvbrange)
end

function acCapDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.version, tvb:range(0, 1))
    tlv:add(pf.radio_id, tvb:range(1, 1))
    tlv:add(pf.ac_capbilities, tvb:range(2))
end

function vapStatsDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.version, tvb:range(0, 1))
    tlv:add(pf.radio_id, tvb:range(1, 1))
    tlv:add(pf.vap_stats, tvb:range(2))
end

function apListDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.version, tvb:range(0, 1))
    tlv:add(pf.radio_id, tvb:range(1, 1))
    tlv:add(pf.ap_list, tvb:range(2))
end

function staCapListDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.version, tvb:range(0, 1))
    tlv:add(pf.radio_id, tvb:range(1, 1))
    tlv:add(pf.sta_cap_list, tvb:range(2))
end

function radioStatsDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.version, tvb:range(0, 1))
    tlv:add(pf.radio_id, tvb:range(1, 1))
    tlv:add(pf.radio_stats, tvb:range(2))
end

function wtpStatsDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.cpu_load, tvb:range(0, 1))
    tlv:add(pf.mem_total, tvb:range(1, 4))
    tlv:add(pf.mem_free, tvb:range(5, 4))
end

function countryCodeDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.country_code, tvb:range(1, 2))
    tlv:add(pf.country_code_string, tvb:range(3, 3))
end

function maxDistanceDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.max_distance, tvb:range(1, 4))
end

function txPowerDbmDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.txpower_dbm, tvb:range(1, 2))
end

function apScanIdleDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.ap_scan_idle, tvb:range(1, 2))
end

function autoChanDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.auto_chan, tvb:range(1, 2))
end

function disableThreshDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.wlan_id, tvb:range(1, 1))
    tlv:add(pf.disable_thresh, tvb:range(2, 2))
end

function vapFlagsDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.wlan_id, tvb:range(1, 1))
    tlv:add(pf.vap_flags, tvb:range(2, 4))
end

function psOptDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.ps_opt, tvb:range(1, 1))
end

function modeDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.mode, tvb:range(1, 1))
end

function pureDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.pure, tvb:range(1, 1))
end

function amsduDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.amsdu, tvb:range(1, 1))
end

function coextDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.coext, tvb:range(1, 1))
end

function wtpUptimeDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.wtp_up_time, tvb:range(0, 4))
    tlv:add(pf.daemon_up_time, tvb:range(4, 4))
    tlv:add(pf.session_up_time, tvb:range(8, 4))
end

function darryOperChanDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.sn, tvb:range(0, 16))
    tlv:add(pf.radio_id, tvb:range(16, 1))
    tlv:add(pf.base_mac_address, tvb:range(17, 6))
    tlv:add(pf.oper_chan, tvb:range(23, 1))
end

function htcapDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.mcs, tvb:range(1, 1))
    tlv:add(pf.ht_short_gi, tvb:range(2, 1))
    tlv:add(pf.bandwidth, tvb:range(3, 1))
end

function mgmtVapDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.sn_length, tvb:range(0, 2))
    local sn_length = tvb:range(0,2):uint();
    tlv:add(pf.sn, tvb:range(2, sn_length))
    tlv:add(pf.prev_r32, tvb:range(2+sn_length, 4))
    tlv:add(pf.curr_r32, tvb:range(6+sn_length, 4))
    tlv:add(pf.age, tvb:range(10+sn_length, 4))
    tlv:add(pf.period, tvb:range(14+sn_length, 4))
    tlv:add(pf.vfid, tvb:range(18+sn_length, 4))
end

local ftntElementDecoder = {
    [VSP_FORTINET_AP_SCAN] = nil,
    [VSP_FORTINET_AP_LIST] = apListDecoder,
    [VSP_FORTINET_AP_SCAN_IDLE] = apScanIdleDecoder,
    [VSP_FORTINET_PASSIVE] = nil,
    [VSP_FORTINET_DAEMON_RST] = nil,
    [VSP_FORTINET_MAC] = nil,
    [VSP_FORTINET_WTP_ALLOW] = wtpAllowDecoder,
    [VSP_FORTINET_WBH_STA] = wbhStaDecoder,
    [VSP_FORTINET_HTCAP] = htcapDecoder,
    [VSP_FORTINET_MGMT_VAP] = mgmtVapDecoder,
    [VSP_FORTINET_MODE] = modeDecoder,
    [VSP_FORTINET_COEXT] = coextDecoder,
    [VSP_FORTINET_AMSDU] = amsduDecoder,
    [VSP_FORTINET_PS_OPT] = psOptDecoder,
    [VSP_FORTINET_PURE] = pureDecoder,
    [VSP_FORTINET_EBP_TAG] = nil,
    [VSP_FORTINET_AUTO_CHAN] = autoChanDecoder,
    [VSP_FORTINET_TELNET_ENABLE] = telnetEnableDecoder,
    [VSP_FORTINET_ADMIN_PASSWD] = nil,
    [VSP_FORTINET_REGCODE] = regcodeDecoder,
    [VSP_FORTINET_COUNTRYCODE] = countryCodeDecoder,
    [VSP_FORTINET_STA_SCAN] = nil,
    [VSP_FORTINET_STA_CAP_LIST] = staCapListDecoder,
    [VSP_FORTINET_FHO] = nil,
    [VSP_FORTINET_APHO] = nil,
    [VSP_FORTINET_STA_LOCATE] = nil,
    [VSP_FORTINET_SPECTRUM_ANALYSIS] = nil,
    [VSP_FORTINET_DARRP_CFG] = nil,
    [VSP_FORTINET_DARRP_OPER_CHAN] = darryOperChanDecoder,
    [VSP_FORTINET_AP_SUPPRESS_LIST] = nil,
    [VSP_FORTINET_VAP_FLAGS] = vapFlagsDecoder,
    [VSP_FORTINET_WDS] = nil,
    [VSP_FORTINET_VAP_VLAN_TAG] = nil,
    [VSP_FORTINET_VAP_BITMAP] = nil,
    [VSP_FORTINET_MCAST_RATE] = nil,
    [VSP_FORTINET_CFG] = nil,
    [VSP_FORTINET_SPLIT_TUN_CFG] = nil,
    [VSP_FORTINET_MGMT_VLAN_TAG] = mgmtVlanTagDecoder,
    [VSP_FORTINET_DISABLE_THRESH] = disableThreshDecoder,
    [VSP_FORTINET_VAP_PSK_PASSWD] = nil,
    [VSP_FORTINET_IP_FRAG] = ipFragDecoder,
    [VSP_FORTINET_MAX_DISTANCE] = maxDistanceDecoder,
    [VSP_FORTINET_MESH_ETH_BRIDGE_ENABLE] = meshEthBridgeEnableDecoder,
    [VSP_FORTINET_MESH_ETH_BRIDGE_TYPE] = meshEthBridgeTypeDecoder,
    [VSP_FORTINET_WTP_CAP] = wtpCapDecoder,
    [VSP_FORTINET_TXPWR] = nil,
    [VSP_FORTINET_AC_CAP] = acCapDecoder,
    [VSP_FORTINET_VAP_STATS] = vapStatsDecoder,
    [VSP_FORTINET_WTP_STATS] = wtpStatsDecoder,
    [VSP_FORTINET_WTP_UPTIME] = wtpUptimeDecoder,
    [VSP_FORTINET_RADIO_STATS] = radioStatsDecoder,
    [VSP_FORTINET_STA_STATS_INTERVAL] = staStatsIntervalDecoder,
    [VSP_FORTINET_STA_CAP_INTERVAL] = staCapIntervalDecoder,
    [VSP_FORTINET_TXPWR_DBM] = txPowerDbmDecoder,
    [VSP_FORTINET_WIDS_ENABLE] = nil,
}

function boardDataWtpModelNumberDecoder(tlv, tvbrange)
    tlv:add(pf.wtp_model_number, tvbrange)
end

function boardDataWtpSerialNumberDecoder(tlv, tvbrange)
    tlv:add(pf.wtp_serial_number, tvbrange)
end

function boardDataBoardIdDecoder(tlv, tvbrange)
    tlv:add(pf.wtp_board_id, tvbrange)
end

function boardDataBoardRevisionDecoder(tlv, tvbrange)
    tlv:add(pf.wtp_board_revision, tvbrange)
end

function boardDataBaseMacAddressDecoder(tlv, tvbrange)
    local base_mac_address = tlv:add(pf.base_mac_address, tvbrange)
    local tvb = tvbrange:tvb()
    local mac_string = string.format("%2x:%2x:%2x:%2x:%2x:%2x", -- todo: format 
        tvb:range(0, 1):uint(),tvb:range(1, 1):uint(),tvb:range(2, 1):uint(), 
        tvb:range(3, 1):uint(),tvb:range(4, 1):uint(),tvb:range(5, 1):uint())
    base_mac_address:set_text("Base Mac Address: "..mac_string.." ("..mac_string..")")
end

local boardDataValueDecoder = {
    [BOARD_DATA_WTP_MODEL_NUMBER] = boardDataWtpModelNumberDecoder,
    [BOARD_DATA_WTP_SERIAL_NUMBER] = boardDataWtpSerialNumberDecoder,
    [BOARD_DATA_BOARD_ID] = boardDataBoardIdDecoder,
    [BOARD_DATA_BOARD_REVISION] = boardDataBoardRevisionDecoder,
    [BOARD_DATA_BASE_MAC_ADDRESS] = boardDataBaseMacAddressDecoder,
}

function discoveryTypeDecoder(tlv, tvbrange)
    tlv:add(pf.discovery_type, tvbrange)
end

function vendorSpecificPayloadDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.vendor_identifier, tvb:range(0, 4))
    tlv:add(pf.vendor_element_id, tvb:range(4, 2))
    tlv:add(pf.vendor_data, tvb:range(6))
    tlv:add(pf.fortinet_element_id, tvb:range(4, 2))
    tlv:add(pf.fortinet_value, tvb:range(6))

    local id = tvb:range(4, 2):uint()
    if ftntElementDecoder[id] then
        ftntElementDecoder[id](tlv, tvb:range(6))
    else
        tlv:add_expert_info(PI_MALFORMED, PI_ERROR, "Unknown Element ID "..id)
    end
end

function wtpBoardDataDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    local pktlen = tvb:reported_length_remaining()

    tlv:add(pf.wtp_board_data_vendor, tvb:range(0, 4))
    
    local pos = 4
    local pktlen_remaining = pktlen - pos

    while pktlen_remaining > 0 do
        local type = tvb:range(pos, 2):uint()
        local length = tvb:range(pos + 2, 2):uint()

        local data = tlv:add(pf.wtp_board_data, tvb:range(pos, length + 4))
        data:set_text("WTP Board Data: (t="..type..",l="..length..") "..board_data_type_vals[type])
        data:add(pf.board_data_type, tvb:range(pos, 2))
        data:add(pf.board_data_length, tvb:range(pos+2, 2))
        data:add(pf.board_data_value, tvb:range(pos+4, length))
        
        if boardDataValueDecoder[type] then
            boardDataValueDecoder[type](data, tvb:range(pos+4, length))
        end

        pos = pos + (length + 4)
        pktlen_remaining = pktlen_remaining - (length + 4)
    end
end

function wtpDescriptorHardwareVersionDecoder(tlv, tvbrange)
    tlv:add(pf.wtp_descriptor_hardware_version, tvbrange)
end

function wtpDescriptorActiveSoftwareVersionDecoder(tlv, tvbrange)
    tlv:add(pf.wtp_descriptor_software_version, tvbrange)
end

function wtpDescriptorBootVersionDecoder(tlv, tvbrange)
    tlv:add(pf.wtp_descriptor_boot_version, tvbrange)
end

function wtpDescriptorOtherSoftwareVersionDecoder(tlv, tvbrange)
    tlv:add(pf.wtp_descriptor_other_software_version, tvbrange)
end

local descriptorValueDecoder = {
    [WTP_DESCRIPTOR_HARDWARE_VERSION] = wtpDescriptorHardwareVersionDecoder,
    [WTP_DESCRIPTOR_ACTIVE_SOFTWARE_VERSION] = wtpDescriptorActiveSoftwareVersionDecoder,
    [WTP_DESCRIPTOR_BOOT_VERSION] = wtpDescriptorBootVersionDecoder,
    [WTP_DESCRIPTOR_OTHER_SOFTWARE_VERSION] = wtpDescriptorOtherSoftwareVersionDecoder,
}

function wtpDescriptorDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    local pktlen = tvb:reported_length_remaining()

    tlv:add(pf.wtp_descriptor_max_radios, tvb:range(0, 1))
    tlv:add(pf.wtp_descriptor_radio_in_use, tvb:range(1, 1))

    local encryption_capabilities = tlv:add(pf.wtp_descriptor_encryption_capabilities, tvb:range(2, 1))
    local sub_encryption_capabilities = encryption_capabilities:add(pf.wtp_descriptor_encryption_capabilities_encryption_capabilities, tvb:range(3, 3))
    sub_encryption_capabilities:set_text("Encryption Capabilities: (WBID "..tvb:range(3,1):bitfield(3,5)..") "..tvb:range(4,2):uint())
    sub_encryption_capabilities:add(pf.wtp_descriptor_encryption_capabilities_reserved, tvb:range(3, 1))
    sub_encryption_capabilities:add(pf.wtp_descriptor_encryption_capabilities_wbid, tvb:range(3, 1))
    sub_encryption_capabilities:add(pf.wtp_descriptor_encryption_capabilities_values, tvb:range(4, 2))

    local pos = 6
    local pktlen_remaining = pktlen - pos

    while pktlen_remaining > 0 do
        local type = tvb:range(pos + 4, 2):uint()
        local length = tvb:range(pos + 6, 2):uint()

        local value = tlv:add(pf.wtp_descriptor_value, tvb:range(pos, length + 8))
        value:set_text("WTP Descriptor: (t="..type..",l="..length..") "..wtp_descriptor_type_vals[type])
        value:add(pf.wtp_descriptor_vendor, tvb:range(pos, 4))
        value:add(pf.wtp_descriptor_type, tvb:range(pos+4, 2))
        value:add(pf.wtp_descriptor_length, tvb:range(pos+6, 2))
        value:add(pf.wtp_descriptor_value, tvb:range(pos+8, length))

        if descriptorValueDecoder[type] then
            descriptorValueDecoder[type](value, tvb:range(pos+8, length))
        end

        pos = pos + (length + 8)
        pktlen_remaining = pktlen_remaining - (length + 8)
    end
end

function wtpFrameTunnelModeDecoder(tlv, tvbrange)
    local mode = tlv:add(pf.wtp_frame_tunnel_mode, tvbrange)
    mode:add(pf.wtp_native_frame_tunnel_mode, tvbrange)
    mode:add(pf.wtp_8023_frame_tunnel_mode, tvbrange)
    mode:add(pf.wtp_frame_tunnel_mode_local_bridging, tvbrange)
    mode:add(pf.wtp_frame_tunnel_mode_reserved, tvbrange)
end

function wtpMacTypeDecoder(tlv, tvbrange)
    tlv:add(pf.wtp_mac_type, tvbrange)
end

function wtpRadioInformationDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.wtp_radio_information_radio_type_reserved, tvb:range(1, 3))
    tlv:add(pf.wtp_radio_information_radio_type_80211n, tvb:range(4, 1))
    tlv:add(pf.wtp_radio_information_radio_type_80211g, tvb:range(4, 1))
    tlv:add(pf.wtp_radio_information_radio_type_80211a, tvb:range(4, 1))
    tlv:add(pf.wtp_radio_information_radio_type_80211b, tvb:range(4, 1))
end

function acDescriptorDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    local pktlen = tvb:reported_length_remaining()

    tlv:add(pf.ac_descriptor_stations, tvb:range(0, 2))
    tlv:add(pf.ac_descriptor_limit_stations, tvb:range(2, 2))
    tlv:add(pf.ac_descriptor_active_wtps, tvb:range(4, 2))
    tlv:add(pf.ac_descriptor_max_wtps, tvb:range(6, 2))
    
    local security_flags = tlv:add(pf.ac_descriptor_security_flags, tvb:range(8, 1))
    security_flags:add(pf.ac_descriptor_security_flags_reserved, tvb:range(8, 1))
    security_flags:add(pf.ac_descriptor_security_flags_ac_supports_pre_shared, tvb:range(8, 1))
    security_flags:add(pf.ac_descriptor_security_flags_ac_supports_x509, tvb:range(8, 1))

    tlv:add(pf.ac_descriptor_rmac_field, tvb:range(9, 1))
    tlv:add(pf.reserved, tvb:range(10, 1))
    tlv:add(pf.ac_descriptor_dtls_policy_flags, tvb:range(11, 1))

    local pos = 12
    local pktlen_remaining = pktlen - pos

    while pktlen_remaining > 0 do
        local type = tvb:range(pos + 4, 2):uint()
        local length = tvb:range(pos + 6, 2):uint()

        local tlv = tlv:add(pf.ac_descriptor_ac_information, tvb:range(pos, length + 8))
        tlv:set_text("AC Information: (t="..type..",l="..length..") "..ac_information_type_vals[type])
        tlv:add(pf.ac_descriptor_ac_information_vendor, tvb:range(pos, 4))
        tlv:add(pf.ac_descriptor_ac_information_type, tvb:range(pos+4, 2))
        tlv:add(pf.ac_descriptor_ac_information_length, tvb:range(pos+6, 2))
        tlv:add(pf.ac_descriptor_ac_information_value, tvb:range(pos+8, length))

        -- todo: add value decoder

        pos = pos + (length + 8)
        pktlen_remaining = pktlen_remaining - (length + 8)
    end
end

function acNameDecoder(tlv, tvbrange)
    tlv:add(pf.ac_name, tvbrange)
end

function acTimestampDecoder(tlv, tvbrange)
    tlv:add(pf.ac_timestamp, tvbrange)
end

function localDataDecoder(tlv, tvbrange)
    tlv:add(pf.location_data, tvbrange)
end

function wtpNameDecoder(tlv, tvbrange)
    tlv:add(pf.wtp_name, tvbrange)
end

function sessionIdDecoder(tlv, tvbrange)
    tlv:add(pf.session_id, tvbrange)
end

function ecnSupportDecoder(tlv, tvbrange)
    tlv:add(pf.ecn_support, tvbrange)
end

function capwapLocalIpv4AddressDecoder(tlv, tvbrange)
    tlv:add(pf.capwap_local_ipv4_address, tvbrange)
end

function resultCodeDecoder(tlv, tvbrange)
    tlv:add(pf.result_code, tvbrange)
end

function statisticsTimerDecoder(tlv, tvbrange)
    tlv:add(pf.statistics_timer, tvbrange)
end

function wtpRebootStatisticsDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.wtp_reboot_statistics_reboot_count, tvb:range(0, 2))
    tlv:add(pf.wtp_reboot_statistics_ac_initiated_count, tvb:range(2, 2))
    tlv:add(pf.wtp_reboot_statistics_linked_failure_count, tvb:range(4, 2))
    tlv:add(pf.wtp_reboot_statistics_sw_failure_count, tvb:range(6, 2))
    tlv:add(pf.wtp_reboot_statistics_hw_failure_count, tvb:range(8, 2))
    tlv:add(pf.wtp_reboot_statistics_other_failure_count, tvb:range(10, 2))
    tlv:add(pf.wtp_reboot_statistics_unknown_failure_count, tvb:range(12, 2))
    tlv:add(pf.wtp_reboot_statistics_last_failure_type, tvb:range(14, 1))
end

function radioAdministrativeStateDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_administrative_id, tvb:range(0, 1))
    tlv:add(pf.radio_administrative_state, tvb:range(1, 1))
end

function ieee80211AntennaDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.ieee_80211_antenna_diversity, tvb:range(1, 1))
    tlv:add(pf.ieee_80211_antenna_combiner, tvb:range(2, 1))
    tlv:add(pf.ieee_80211_antenna_count, tvb:range(3, 1))
    tlv:add(pf.ieee_80211_antenna_selection, tvb:range(4, 1))
    tlv:add(pf.ieee_80211_antenna_selection, tvb:range(5, 1))
end

function ieee80211TxPowerDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.reserved, tvb:range(1, 1))
    tlv:add(pf.ieee_80211_tx_power_current_tx_power, tvb:range(2, 2))
end

function ieee80211TxPowerLevelDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.ieee_80211_tx_power_level_num_levels, tvb:range(1, 1))
    tlv:add(pf.ieee_80211_tx_power_level_power_level, tvb:range(2, 2))
    tlv:add(pf.ieee_80211_tx_power_level_power_level, tvb:range(4, 2))
    tlv:add(pf.ieee_80211_tx_power_level_power_level, tvb:range(6, 2))
    tlv:add(pf.ieee_80211_tx_power_level_power_level, tvb:range(8, 2))
    tlv:add(pf.ieee_80211_tx_power_level_power_level, tvb:range(10, 2))
    tlv:add(pf.ieee_80211_tx_power_level_power_level, tvb:range(12, 2))
    tlv:add(pf.ieee_80211_tx_power_level_power_level, tvb:range(14, 2))
    tlv:add(pf.ieee_80211_tx_power_level_power_level, tvb:range(16, 2))
end

function ieee80211WtpRadioConfigurationDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.ieee_80211_wtp_radio_configuration_short_preamble, tvb:range(1, 1))
    tlv:add(pf.ieee_80211_wtp_radio_configuration_num_of_bssids, tvb:range(2, 1))
    tlv:add(pf.ieee_80211_wtp_radio_configuration_dtim_period, tvb:range(3, 1))
    tlv:add(pf.ieee_80211_wtp_radio_configuration_bssid, tvb:range(4, 6))
    tlv:add(pf.ieee_80211_wtp_radio_configuration_beacon_period, tvb:range(10, 2))
    tlv:add(pf.ieee_80211_wtp_radio_configuration_country_string, tvb:range(12, 4))
end

function ieee80211MacOperation(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.reserved, tvb:range(1, 1))
    tlv:add(pf.ieee_80211_mac_operation_rts_threshold, tvb:range(2, 2))
    tlv:add(pf.ieee_80211_mac_operation_short_retry, tvb:range(4, 1))
    tlv:add(pf.ieee_80211_mac_operation_long_retry, tvb:range(5, 1))
    tlv:add(pf.ieee_80211_mac_operation_fragmentation_threshold, tvb:range(6, 2))
    tlv:add(pf.ieee_80211_mac_operation_tx_mdsu_lifetime, tvb:range(8, 4))
    tlv:add(pf.ieee_80211_mac_operation_rx_mdsu_lifetime, tvb:range(12, 4))
end

function ieee80211MultiDomainCapabilityDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.reserved, tvb:range(1, 1))
    tlv:add(pf.ieee_80211_multi_domain_capability_first_channel, tvb:range(2, 2))
    tlv:add(pf.ieee_80211_multi_domain_capability_number_of_channels, tvb:range(4, 2))
    tlv:add(pf.ieee_80211_multi_domain_capability_max_tx_power_level, tvb:range(6, 2))
end

function capwapTimersDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.capwap_timers_discovery, tvb:range(0, 1))
    tlv:add(pf.capwap_timers_echo_request, tvb:range(1, 1))
end

function decrptionErrorReportPeriodDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.decryption_error_report_report_interval, tvb:range(1, 2))
end

function idleTimeoutDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.idle_timeout, tvb:range(0, 4))
end

function wtpFallbackDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.wtp_fallback, tvb:range(0, 1))
end

function AcIpv4ListDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
end

function AcIpv6ListDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
end

function AddMacAclEklDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
end

function AddStationDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
end

function Reserved9(tlv, tvbrange)
    local tvb = tvbrange:tvb()
end

function CapwapControlIpv4AddressDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
end

function CapwapControlIpv6AddressDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
end

function DataTransferDataDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
end

function DataTransferModeDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
end

function ieee80211DirectSequenceControlDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.reserved, tvb:range(1, 1))
    tlv:add(pf.current_channel, tvb:range(2, 1))
    tlv:add(pf.ieee_80211_direct_sequence_control_current_cca, tvb:range(3, 1))
    tlv:add(pf.ieee_80211_direct_sequence_control_energy_detect_threshold, tvb:range(4, 4))
end

function ieee80211OfdmControlDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_id, tvb:range(0, 1))
    tlv:add(pf.reserved, tvb:range(1, 1))
    tlv:add(pf.current_channel, tvb:range(2, 1))
    tlv:add(pf.ieee_80211_ofdm_control_band_support, tvb:range(3, 1))
    tlv:add(pf.ieee_80211_ofdm_control_ti_threshold, tvb:range(4, 4))
end

function radioOperationStateDecoder(tlv, tvbrange)
    local tvb = tvbrange:tvb()
    tlv:add(pf.radio_operational_id, tvb:range(0, 1))
    tlv:add(pf.radio_operational_state, tvb:range(1, 1))
    tlv:add(pf.radio_operational_cause, tvb:range(2, 1))
end

local messageElementDecoder = {
    [TYPE_AC_DESCRIPTOR] = acDescriptorDecoder,
    [TYPE_AC_IPV4_LIST] = AcIpv4ListDecoder,
    [TYPE_AC_IPV6_LIST] = AcIpv6ListDecoder,
    [TYPE_AC_NAME] = acNameDecoder,
    [TYPE_AC_NAME_W_PRIORITY] = AcNameWPriorityDecoder,
    [TYPE_AC_TIMESTAMP] = acTimestampDecoder,
    [TYPE_ADD_MAC_ACL_ENTRY] = AddMacAclEklDecoder,
    [TYPE_ADD_STATION] = AddStationDecoder,
    [TYPE_RESERVED_9] = Reserved9,
    [TYPE_CAPWAP_CONTROL_IPV4_ADDRESS] = CapwapControlIpv4AddressDecoder,
    [TYPE_CAPWAP_CONTROL_IPV6_ADDRESS] = CapwapControlIpv6AddressDecoder,
    [TYPE_CAPWAP_TIMERS] = capwapTimersDecoder,
    [TYPE_DATA_TRANSFER_DATA] = DataTransferDataDecoder,
    [TYPE_DATA_TRANSFER_MODE] = DataTransferModeDecoder,
    [TYPE_DESCRYPTION_ERROR_REPORT] = DescryptionErrorReportDecoder,
    [TYPE_DECRYPTION_ERROR_REPORT_PERIOD] = decrptionErrorReportPeriodDecoder,
    [TYPE_DELETE_MAC_ENTRY] = nil,
    [TYPE_DELETE_STATION] = nil,
    [TYPE_RESERVED_19] = nil,
    [TYPE_DISCOVERY_TYPE] = discoveryTypeDecoder,
    [TYPE_DUPLICATE_IPV4_ADDRESS] = nil,
    [TYPE_DUPLICATE_IPV6_ADDRESS] = nil,
    [TYPE_IDLE_TIMEOUT] = idleTimeoutDecoder,
    [TYPE_IMAGE_DATA] = nil,
    [TYPE_IMAGE_IDENTIFIER] = nil,
    [TYPE_IMAGE_INFORMATION] = nil,
    [TYPE_INITIATE_DOWNLOAD] = nil,
    [TYPE_LOCATION_DATA] = localDataDecoder,
    [TYPE_MAXIMUM_MESSAGE_LENGTH] = nil,
    [TYPE_CAPWAP_LOCAL_IPV4_ADDRESS] = capwapLocalIpv4AddressDecoder,
    [TYPE_RADIO_ADMINISTRATIVE_STATE] = radioAdministrativeStateDecoder,
    [TYPE_RADIO_OPERATIONAL_STATE] = radioOperationStateDecoder,
    [TYPE_RESULT_CODE] = resultCodeDecoder,
    [TYPE_RETURNED_MESSAGE_ELEMENT] = nil,
    [TYPE_SESSION_ID] = sessionIdDecoder,
    [TYPE_STATISTICS_TIMER] = statisticsTimerDecoder,
    [TYPE_VENDOR_SPECIFIC_PAYLOAD] = vendorSpecificPayloadDecoder,
    [TYPE_WTP_BOARD_DATA] = wtpBoardDataDecoder,
    [TYPE_WTP_DESCRIPTOR] = wtpDescriptorDecoder,
    [TYPE_WTP_FALLBACK] = wtpFallbackDecoder,
    [TYPE_WTP_FRAME_TUNNEL_MODE] = wtpFrameTunnelModeDecoder,
    [TYPE_RESERVED_42] = nil,
    [TYPE_RESERVED_43] = nil,
    [TYPE_WTP_MAC_TYPE] = wtpMacTypeDecoder,
    [TYPE_WTP_NAME] = wtpNameDecoder,
    [TYPE_RESERVED_46] = nil,
    [TYPE_WTP_RADIO_STATISTICS] = nil,
    [TYPE_WTP_REBOOT_STATISTICS] = wtpRebootStatisticsDecoder,
    [TYPE_WTP_STATIC_IP_ADDRESS_INFORMATION] = nil,
    [TYPE_CAPWAP_LOCAL_IPV6_ADDRESS] = nil,
    [TYPE_CAPWAP_TRANSPORT_PROTOCOL] = nil,
    [TYPE_MTU_DISCOVERY_PADDING] = nil,
    [TYPE_ECN_SUPPORT] = ecnSupportDecoder,

    [IEEE80211_ADD_WLAN] = nil,
    [IEEE80211_ANTENNA] = ieee80211AntennaDecoder,
    [IEEE80211_ASSIGNED_WTP_BSSID] = nil,
    [IEEE80211_DELETE_WLAN] = nil,
    [IEEE80211_DIRECT_SEQUENCE_CONTROL] = ieee80211DirectSequenceControlDecoder,
    [IEEE80211_INFORMATION_ELEMENT] = nil,
    [IEEE80211_MAC_OPERATION] = ieee80211MacOperation,
    [IEEE80211_MIC_COUNTERMEASURES] = nil,
    [IEEE80211_MULTI_DOMAIN_CAPABILITY] = ieee80211MultiDomainCapabilityDecoder,
    [IEEE80211_OFDM_CONTROL] = ieee80211OfdmControlDecoder,
    [IEEE80211_RATE_SET] = nil,
    [IEEE80211_RSNA_ERROR_REPORT_FROM_STATION] = nil,
    [IEEE80211_STATION] = nil,
    [IEEE80211_STATION_QOS_PROFILE] = nil,
    [IEEE80211_STATION_SESSION_KEY] = nil,
    [IEEE80211_STATISTICS] = nil,
    [IEEE80211_SUPPORTED_RATES] = nil,
    [IEEE80211_TX_POWER] = ieee80211TxPowerDecoder,
    [IEEE80211_TX_POWER_LEVEL] = ieee80211TxPowerLevelDecoder,
    [IEEE80211_UPDATE_STATION_QOS] = nil,
    [IEEE80211_UPDATE_WLAN] = nil,
    [IEEE80211_WTP_QUALITY_OF_SERVICE] = nil,
    [IEEE80211_WTP_RADIO_CONFIGURATION] = ieee80211WtpRadioConfigurationDecoder,
    [IEEE80211_WTP_RADIO_FAIL_ALARM_INDICATION] = nil,
    [IEEE80211_WTP_RADIO_INFORMATION] = wtpRadioInformationDecoder,
    [IEEE80211_SUPPORTED_MAC_PROFILES] = nil,
    [IEEE80211_MAC_PROFILE] = nil,
}

function capwap.dissector(tvbuf,pktinfo,root)
    pktinfo.cols.protocol:set("FTNT-CAPWAP-Control")
    
    local pktlen = tvbuf:reported_length_remaining()

    local tree = root:add(capwap, tvbuf:range(0,pktlen))

    local preamble_range = tvbuf:range(0,1)
    local preamble_tree = tree:add("Preamble")
    preamble_tree:add(pf.preamble_version, preamble_range)
    preamble_tree:add(pf.preamble_type, preamble_range)

    local ptype = tvbuf:range(0,1):bitfield(4,4)
    if ptype == 1 then
        preamble_tree:add(pf.preamble_reserved, tvbuf:range(1,3))
        local dtls = Dissector.get("dtls")
        dtls:call(tvbuf:range(4):tvb(), pktinfo, root)
        return
    end

    local header_tree = tree:add("Header")
    local header_flags_range = tvbuf:range(1,3)
    header_tree:add(pf.header_length, header_flags_range)
    header_tree:add(pf.header_radio_id, header_flags_range)
    header_tree:add(pf.header_binding_id, header_flags_range)
    header_tree:add(pf.header_flags, header_flags_range)
    header_tree:add(pf.header_fragment_id, tvbuf:range(4,2))
    header_tree:add(pf.header_fragment_offset, tvbuf:range(6,2))
    header_tree:add(pf.header_reserved, tvbuf:range(6,2))

    local control_header = tree:add("Control Header")
    local message_type = control_header:add(pf.control_header_message_type, tvbuf:range(8,4))
    message_type:add(pf.control_header_message_type_enterprise_number, tvbuf:range(8,3))
    message_type:add(pf.control_header_message_type_enterprise_specific, tvbuf:range(11,1))
    control_header:add(pf.control_header_sequence_number, tvbuf:range(12,1))
    control_header:add(pf.control_header_message_element_length, tvbuf:range(13,2))
    control_header:add(pf.control_header_message_flags, tvbuf:range(15,1))

    local binding_id = header_flags_range:bitfield(10, 5)
    if 1 == binding_id then
        pktinfo.cols.info:set("FTNT-CAPWAP-Control - "..stypes[tvbuf:range(8,4):uint()])
    else
        pktinfo.cols.info:set("FTNT-CAPWAP-Control - "..stypes[tvbuf:range(11,1):uint()])
    end

    local message_element = tree:add("Message Element")

    local pos = CAPWAP_HDR_LEN
    local pktlen_remaining = pktlen - pos

    while pktlen_remaining > 0 do
        -- todo: error length check
        local type = tvbuf:range(pos,2):uint()
        local length = tvbuf:range(pos+2,2):uint()
        local value = tvbuf:range(pos+4,length)

        local tlv = message_element:add(pf.tlv, tvbuf:range(pos, length+4))

        if type ~= TYPE_VENDOR_SPECIFIC_PAYLOAD then
            tlv:set_text("Type: (t="..type..",l="..length..") "..tlvTypes[type])
        else
            local ftntElementId = tvbuf:range(pos+8, 2):uint()
            if fortinet_element_id_vals[ftntElementId] then
                tlv:set_text("Type: (t="..type..",l="..length..") "..tlvTypes[type]..": Fortinet "..fortinet_element_id_vals[ftntElementId])
            else
                tlv:set_text("Type: (t="..type..",l="..length..") "..tlvTypes[type]..": Fortinet Unknown")
                tlv:add_expert_info(PI_MALFORMED, PI_ERROR, "no decoder for ftnt element id "..ftntElementId)
            end
        end

        tlv:add(pf.tlv_type, tvbuf:range(pos,2))
        tlv:add(pf.tlv_length, tvbuf:range(pos+2,2))
        tlv:add(pf.tlv_value, tvbuf:range(pos+4,length))

        if messageElementDecoder[type] then
            messageElementDecoder[type](tlv, tvbuf:range(pos+4,length))
        end

        pos = pos + length + 4
        pktlen_remaining = pktlen_remaining - length - 4
    end

end

udp_table = DissectorTable.get("udp.port")
udp_table:add(5246, capwap)
