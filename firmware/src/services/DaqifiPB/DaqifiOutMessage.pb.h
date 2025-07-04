/* Automatically generated nanopb header */
/* Generated by nanopb-0.3.9 at Fri Mar 30 16:30:48 2018. */

#ifndef PB_DAQIFIOUTMESSAGE_PB_H_INCLUDED
#define PB_DAQIFIOUTMESSAGE_PB_H_INCLUDED
#include "libraries/nanopb/pb.h"

/* @@protoc_insertion_point(includes) */
#if PB_PROTO_HEADER_VERSION != 30
#error Regenerate this file with the current version of nanopb generator.
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Struct definitions */
typedef PB_BYTES_ARRAY_T(2) DaqifiOutMessage_digital_data_t;
typedef PB_BYTES_ARRAY_T(16) DaqifiOutMessage_analog_in_port_type_t;
typedef PB_BYTES_ARRAY_T(2) DaqifiOutMessage_analog_in_port_av_rse_t;
typedef PB_BYTES_ARRAY_T(2) DaqifiOutMessage_analog_in_port_rse_t;
typedef PB_BYTES_ARRAY_T(2) DaqifiOutMessage_analog_in_port_enabled_t;
typedef PB_BYTES_ARRAY_T(16) DaqifiOutMessage_digital_port_type_t;
typedef PB_BYTES_ARRAY_T(2) DaqifiOutMessage_digital_port_dir_t;
typedef PB_BYTES_ARRAY_T(16) DaqifiOutMessage_analog_out_port_type_t;
typedef PB_BYTES_ARRAY_T(4) DaqifiOutMessage_ip_addr_t;
typedef PB_BYTES_ARRAY_T(4) DaqifiOutMessage_net_mask_t;
typedef PB_BYTES_ARRAY_T(4) DaqifiOutMessage_gateway_t;
typedef PB_BYTES_ARRAY_T(4) DaqifiOutMessage_primary_dns_t;
typedef PB_BYTES_ARRAY_T(4) DaqifiOutMessage_secondary_dns_t;
typedef PB_BYTES_ARRAY_T(6) DaqifiOutMessage_mac_addr_t;
typedef PB_BYTES_ARRAY_T(16) DaqifiOutMessage_ip_addr_v6_t;
typedef PB_BYTES_ARRAY_T(1) DaqifiOutMessage_sub_pre_length_v6_t;
typedef PB_BYTES_ARRAY_T(16) DaqifiOutMessage_gateway_v6_t;
typedef PB_BYTES_ARRAY_T(16) DaqifiOutMessage_primary_dns_v6_t;
typedef PB_BYTES_ARRAY_T(16) DaqifiOutMessage_secondary_dns_v6_t;
typedef PB_BYTES_ARRAY_T(8) DaqifiOutMessage_eui_64_t;
typedef struct _DaqifiOutMessage {
    bool has_msg_time_stamp;
    uint32_t msg_time_stamp;
    pb_size_t analog_in_data_count;
    int32_t analog_in_data[16];
    pb_size_t analog_in_data_float_count;
    float analog_in_data_float[16];
    pb_size_t analog_in_data_ts_count;
    uint32_t analog_in_data_ts[16];
    bool has_digital_data;
    DaqifiOutMessage_digital_data_t digital_data;
    pb_size_t digital_data_ts_count;
    uint32_t digital_data_ts[16];
    pb_size_t analog_out_data_count;
    uint16_t analog_out_data[8];
    bool has_device_status;
    uint32_t device_status;
    bool has_pwr_status;
    uint32_t pwr_status;
    bool has_batt_status;
    uint8_t batt_status;
    bool has_temp_status;
    int32_t temp_status;
    bool has_timestamp_freq;
    uint32_t timestamp_freq;
    bool has_analog_in_port_num;
    uint32_t analog_in_port_num;
    bool has_analog_in_port_num_priv;
    uint32_t analog_in_port_num_priv;
    bool has_analog_in_port_type;
    DaqifiOutMessage_analog_in_port_type_t analog_in_port_type;
    bool has_analog_in_port_av_rse;
    DaqifiOutMessage_analog_in_port_av_rse_t analog_in_port_av_rse;
    bool has_analog_in_port_rse;
    DaqifiOutMessage_analog_in_port_rse_t analog_in_port_rse;
    bool has_analog_in_port_enabled;
    DaqifiOutMessage_analog_in_port_enabled_t analog_in_port_enabled;
    pb_size_t analog_in_port_av_range_count;
    float analog_in_port_av_range[2];
    pb_size_t analog_in_port_av_range_priv_count;
    float analog_in_port_av_range_priv[1];
    pb_size_t analog_in_port_range_count;
    float analog_in_port_range[16];
    pb_size_t analog_in_port_range_priv_count;
    float analog_in_port_range_priv[8];
    bool has_analog_in_res;
    uint32_t analog_in_res;
    bool has_analog_in_res_priv;
    uint32_t analog_in_res_priv;
    pb_size_t analog_in_int_scale_m_count;
    float analog_in_int_scale_m[16];
    pb_size_t analog_in_int_scale_m_priv_count;
    float analog_in_int_scale_m_priv[16];
    pb_size_t analog_in_cal_m_count;
    float analog_in_cal_m[16];
    pb_size_t analog_in_cal_b_count;
    float analog_in_cal_b[16];
    pb_size_t analog_in_cal_m_priv_count;
    float analog_in_cal_m_priv[8];
    pb_size_t analog_in_cal_b_priv_count;
    float analog_in_cal_b_priv[8];
    bool has_digital_port_num;
    uint32_t digital_port_num;
    bool has_digital_port_type;
    DaqifiOutMessage_digital_port_type_t digital_port_type;
    bool has_digital_port_dir;
    DaqifiOutMessage_digital_port_dir_t digital_port_dir;
    bool has_analog_out_port_num;
    uint32_t analog_out_port_num;
    bool has_analog_out_port_type;
    DaqifiOutMessage_analog_out_port_type_t analog_out_port_type;
    bool has_analog_out_res;
    uint32_t analog_out_res;
    pb_size_t analog_out_port_av_range_count;
    float analog_out_port_av_range[1];
    bool has_analog_out_port_range;
    float analog_out_port_range;
    bool has_ip_addr;
    DaqifiOutMessage_ip_addr_t ip_addr;
    bool has_net_mask;
    DaqifiOutMessage_net_mask_t net_mask;
    bool has_gateway;
    DaqifiOutMessage_gateway_t gateway;
    bool has_primary_dns;
    DaqifiOutMessage_primary_dns_t primary_dns;
    bool has_secondary_dns;
    DaqifiOutMessage_secondary_dns_t secondary_dns;
    bool has_mac_addr;
    DaqifiOutMessage_mac_addr_t mac_addr;
    bool has_ip_addr_v6;
    DaqifiOutMessage_ip_addr_v6_t ip_addr_v6;
    bool has_sub_pre_length_v6;
    DaqifiOutMessage_sub_pre_length_v6_t sub_pre_length_v6;
    bool has_gateway_v6;
    DaqifiOutMessage_gateway_v6_t gateway_v6;
    bool has_primary_dns_v6;
    DaqifiOutMessage_primary_dns_v6_t primary_dns_v6;
    bool has_secondary_dns_v6;
    DaqifiOutMessage_secondary_dns_v6_t secondary_dns_v6;
    bool has_eui_64;
    DaqifiOutMessage_eui_64_t eui_64;
    bool has_host_name;
    char host_name[34];
    bool has_device_port;
    uint32_t device_port;
    bool has_friendly_device_name;
    char friendly_device_name[32];
    bool has_ssid;
    char ssid[34];
    bool has_ssid_strength;
    uint32_t ssid_strength;
    bool has_wifi_security_mode;
    uint8_t wifi_security_mode;
    bool has_wifi_inf_mode;
    uint32_t wifi_inf_mode;
    pb_size_t av_ssid_count;
    char av_ssid[8][34];
    pb_size_t av_ssid_strength_count;
    uint32_t av_ssid_strength[8];
    pb_size_t av_wifi_security_mode_count;
    uint32_t av_wifi_security_mode[8];
    pb_size_t av_wifi_inf_mode_count;
    uint32_t av_wifi_inf_mode[8];
    bool has_device_pn;
    char device_pn[16];
    bool has_device_hw_rev;
    char device_hw_rev[16];
    bool has_device_fw_rev;
    char device_fw_rev[16];
    bool has_device_sn;
    uint64_t device_sn;
/* @@protoc_insertion_point(struct:DaqifiOutMessage) */
} DaqifiOutMessage;

/* Default values for struct fields */

/* Initializer values for message structs */
#define DaqifiOutMessage_init_default            {false, 0, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, false, {0, {0}}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, false, 0, false, 0, false, 0, false, 0, false, 0, false, 0, false, 0, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, 0, {0, 0}, 0, {0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, false, 0, false, 0, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, false, 0, false, {0, {0}}, false, {0, {0}}, false, 0, false, {0, {0}}, false, 0, 0, {0}, false, 0, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, "", false, 0, false, "", false, "", false, 0, false, 0, false, 0, 0, {"", "", "", "", "", "", "", ""}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, false, "", false, "", false, "", false, 0}
#define DaqifiOutMessage_init_zero               {false, 0, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, false, {0, {0}}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, false, 0, false, 0, false, 0, false, 0, false, 0, false, 0, false, 0, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, 0, {0, 0}, 0, {0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, false, 0, false, 0, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, false, 0, false, {0, {0}}, false, {0, {0}}, false, 0, false, {0, {0}}, false, 0, 0, {0}, false, 0, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, {0, {0}}, false, "", false, 0, false, "", false, "", false, 0, false, 0, false, 0, 0, {"", "", "", "", "", "", "", ""}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, 0, {0, 0, 0, 0, 0, 0, 0, 0}, false, "", false, "", false, "", false, 0}

/* Field tags (for use in manual encoding/decoding) */
#define DaqifiOutMessage_msg_time_stamp_tag      1
#define DaqifiOutMessage_analog_in_data_tag      2
#define DaqifiOutMessage_analog_in_data_float_tag 3
#define DaqifiOutMessage_analog_in_data_ts_tag   4
#define DaqifiOutMessage_digital_data_tag        5
#define DaqifiOutMessage_digital_data_ts_tag     6
#define DaqifiOutMessage_analog_out_data_tag     7
#define DaqifiOutMessage_device_status_tag       8
#define DaqifiOutMessage_pwr_status_tag          9
#define DaqifiOutMessage_batt_status_tag         10
#define DaqifiOutMessage_temp_status_tag         11
#define DaqifiOutMessage_timestamp_freq_tag      16
#define DaqifiOutMessage_analog_in_port_num_tag  17
#define DaqifiOutMessage_analog_in_port_num_priv_tag 18
#define DaqifiOutMessage_analog_in_port_type_tag 19
#define DaqifiOutMessage_analog_in_port_av_rse_tag 20
#define DaqifiOutMessage_analog_in_port_rse_tag  21
#define DaqifiOutMessage_analog_in_port_enabled_tag 22
#define DaqifiOutMessage_analog_in_port_av_range_tag 23
#define DaqifiOutMessage_analog_in_port_av_range_priv_tag 24
#define DaqifiOutMessage_analog_in_port_range_tag 25
#define DaqifiOutMessage_analog_in_port_range_priv_tag 26
#define DaqifiOutMessage_analog_in_res_tag       27
#define DaqifiOutMessage_analog_in_res_priv_tag  28
#define DaqifiOutMessage_analog_in_int_scale_m_tag 29
#define DaqifiOutMessage_analog_in_int_scale_m_priv_tag 30
#define DaqifiOutMessage_analog_in_cal_m_tag     31
#define DaqifiOutMessage_analog_in_cal_b_tag     32
#define DaqifiOutMessage_analog_in_cal_m_priv_tag 33
#define DaqifiOutMessage_analog_in_cal_b_priv_tag 34
#define DaqifiOutMessage_digital_port_num_tag    35
#define DaqifiOutMessage_digital_port_type_tag   36
#define DaqifiOutMessage_digital_port_dir_tag    37
#define DaqifiOutMessage_analog_out_port_num_tag 38
#define DaqifiOutMessage_analog_out_port_type_tag 39
#define DaqifiOutMessage_analog_out_res_tag      40
#define DaqifiOutMessage_analog_out_port_av_range_tag 41
#define DaqifiOutMessage_analog_out_port_range_tag 42
#define DaqifiOutMessage_ip_addr_tag             43
#define DaqifiOutMessage_net_mask_tag            44
#define DaqifiOutMessage_gateway_tag             45
#define DaqifiOutMessage_primary_dns_tag         46
#define DaqifiOutMessage_secondary_dns_tag       47
#define DaqifiOutMessage_mac_addr_tag            48
#define DaqifiOutMessage_ip_addr_v6_tag          49
#define DaqifiOutMessage_sub_pre_length_v6_tag   50
#define DaqifiOutMessage_gateway_v6_tag          51
#define DaqifiOutMessage_primary_dns_v6_tag      52
#define DaqifiOutMessage_secondary_dns_v6_tag    53
#define DaqifiOutMessage_eui_64_tag              54
#define DaqifiOutMessage_host_name_tag           55
#define DaqifiOutMessage_device_port_tag         56
#define DaqifiOutMessage_friendly_device_name_tag 57
#define DaqifiOutMessage_ssid_tag                58
#define DaqifiOutMessage_ssid_strength_tag       59
#define DaqifiOutMessage_wifi_security_mode_tag  60
#define DaqifiOutMessage_wifi_inf_mode_tag       61
#define DaqifiOutMessage_av_ssid_tag             62
#define DaqifiOutMessage_av_ssid_strength_tag    63
#define DaqifiOutMessage_av_wifi_security_mode_tag 64
#define DaqifiOutMessage_av_wifi_inf_mode_tag    65
#define DaqifiOutMessage_device_pn_tag           66
#define DaqifiOutMessage_device_hw_rev_tag       67
#define DaqifiOutMessage_device_fw_rev_tag       68
#define DaqifiOutMessage_device_sn_tag           69

/* Struct field encoding specification for nanopb */
extern const pb_field_t DaqifiOutMessage_fields[66];

/* Maximum encoded size of messages (where known) */
#define DaqifiOutMessage_size                    2044

/* Message IDs (where set with "msgid" option) */
#ifdef PB_MSGID

#define DAQIFIOUTMESSAGE_MESSAGES \


#endif

#ifdef __cplusplus
} /* extern "C" */
#endif
/* @@protoc_insertion_point(eof) */

#endif
