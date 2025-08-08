##############################
# TX
##############################
write_fpgareg 0x25 0
write_fpgareg 0x26 0

# CH0
AdrvSetTxTestTone 0 1 0 1 0
write_fpgareg 0x25 0
write_fpgareg 0x26 0
set_tx_att 0 18000
set_tx_pll 0 2160
AdrvSetTxTestTone 0 1 1 1 0
AdrvSetRxTxEnable 0 0 1
write_fpgareg 0x1fa 0x10
set_pa_mode 0 0 1
AdrvSetTxToOrxMapping 0 0x10 1
AdrvInitCalsRun 0 0x200000 1

//OPD
write_fpgareg 0x1fa 0x10
AdrvSetTrackCalsEnable 0 0x100000 1
AdrvGetClgcStatus 0 1

//RPD
write_fpgareg 0x1fa 0x14
AdrvSetTrackCalsEnable 0 0x100000 1
AdrvGetClgcStatus 0 1


# CH1
write_fpgareg 0x25 0
write_fpgareg 0x26 0
AdrvSetTxTestTone 0 2 0 1 0
AdrvSetTrackCalsEnable 0 0xf00000 0
set_tx_att 1 18000
set_tx_pll 0 2160
AdrvSetRxTxEnable 0 0 0
write_fpgareg 0x1fa 0x11
set_pa_mode 0 1 1
AdrvSetTxToOrxMapping 0 0x20 2
AdrvInitCalsRun 0 0x200000 2
AdrvSetTxTestTone 0 2 1 1 0
AdrvSetRxTxEnable 0 0 2

//OPD
write_fpgareg 0x1fa 0x11
AdrvSetTrackCalsEnable 0 0x200000 1
AdrvGetClgcStatus 0 2

//RPD
write_fpgareg 0x1fa 0x15
AdrvSetTrackCalsEnable 0 0x200000 1
AdrvGetClgcStatus 0 2


# CH2
AdrvSetTxTestTone 0 4 0 1 0
set_tx_att 2 18000
set_tx_pll 0 2160
AdrvSetTxTestTone 0 4 1 1 0
AdrvSetRxTxEnable 0 0 4
write_fpgareg 0x1fa 0x12
set_pa_mode 0 2 1
AdrvSetTxToOrxMapping 0 0x40 4
AdrvInitCalsRun 0 0x200000 4

//OPD
write_fpgareg 0x1fa 0x12
AdrvSetTrackCalsEnable 0 0x400000 1
AdrvGetClgcStatus 0 4

//RPD
write_fpgareg 0x1fa 0x16
AdrvSetTrackCalsEnable 0 0x400000 1
AdrvGetClgcStatus 0 4

# CH3
AdrvSetTxTestTone 0 8 0 1 0
set_tx_att 3 18000
set_tx_pll 0 2160
AdrvSetTxTestTone 0 8 1 1 0
AdrvSetRxTxEnable 0 0 8
write_fpgareg 0x1fa 0x13
set_pa_mode 0 3 1
AdrvSetTxToOrxMapping 0 0x80 8
AdrvInitCalsRun 0 0x200000 8

//OPD
write_fpgareg 0x1fa 0x13
AdrvSetTrackCalsEnable 0 0x800000 1
AdrvGetClgcStatus 0 8

//RPD
write_fpgareg 0x1fa 0x17
AdrvSetTrackCalsEnable 0 0x800000 1
AdrvGetClgcStatus 0 8
##############################

##############################
# RX
##############################
# CH0 ~ CH3
set_tx_pll 0 2080
set_rx_att 0 20000
set_rx_att 1 20000
set_rx_att 2 20000
set_rx_att 3 20000
write_fpgareg 0x29 0x100
AdrvSetRxTxEnable 0 0xf 0
# read rx power
get_rssi
AdrvGetRxDecPower 0 0x1
AdrvGetRxDecPower 0 0x2
AdrvGetRxDecPower 0 0x4
AdrvGetRxDecPower 0 0x8

##############################

##############################
# 天线开关
write_fpgareg 0x27 0x80f0
write_fpgareg 0x27 0x0000
##############################

##############################
# 反馈前反向
write_fpgareg 0x25 0x8f00
write_fpgareg 0x25 0x8000
##############################

#########################################################################
# Run DPD
#########################################################################
# CH0
write_fpgareg 0x25 0x8f00
write_fpgareg 0x28 0x0101
AdrvSetRxTxEnable 0 0 1
AdrvInitCalsRun 0 0x200800 1
AdrvGetExternalPathDelay 0 1
AdrvSetTxAtten 0 1 19000
set_fb_att 0 20000

write_fpgareg 0x114 2
write_fpgareg 0x110 0x20
write_fpgareg 0x109 0x1111
write_fpgareg 0x1c0 3
write_fpgareg 0x1c3 3

set_tx_pll 0 2100
AdrvSetTxNcoShifter 0 1 1 60000 1 1

cli AdrvSetCfrCtrlCfg 0 1 0 511 0.436 0.98 0.985 0.99 0.98 2 5 5 5 1
cli AdrvWriteCfrCrcPulse 0 1 1 0 0 0 10 1 15 245.76 4 512 1
cli AdrvSetCfrEnable 0 1 1 0 1 0 1 0 1
cli AdrvSetCfrHardClipperCfg 0 1 1 0.436 1
cli AdrvInitCalsRun 0 0x20000000 1
cli AdrvSetDpdModelCfg 0 1 140 95
cli AdrvResetDpd 0 1 1
cli AdrvSetDpdTrackCfg 0 1 22 35 16384 8529034 819200 0 519 50 519 0 0 20
AdrvSetTrackCalsEnable 0 0x111111 1
AdrvSetTxAtten 0 1 12500

# AdrvSetRxTxEnable 0 0 0

# CH2
write_fpgareg 0x25 0x8f00
write_fpgareg 0x28 0x0102
AdrvSetRxTxEnable 0 0 2
AdrvInitCalsRun 0 0x200800 2
AdrvGetExternalPathDelay 0 2
AdrvSetTxAtten 0 2 19000
set_fb_att 1 20000

write_fpgareg 0x114 2
write_fpgareg 0x110 0x20
write_fpgareg 0x109 0x1111
write_fpgareg 0x1c0 3
write_fpgareg 0x1c3 3

set_tx_pll 0 2100
AdrvSetTxNcoShifter 0 2 1 60000 1 1
cli AdrvSetCfrCtrlCfg 0 2 0 511 0.436 0.98 0.985 0.99 0.98 2 5 5 5 1
cli AdrvWriteCfrCrcPulse 0 2 1 0 0 0 10 1 15 245.76 4 512 1
cli AdrvSetCfrEnable 0 2 1 0 1 0 1 0 1
cli AdrvSetCfrHardClipperCfg 0 2 1 0.436 1
cli AdrvInitCalsRun 0 0x20000000 2
cli AdrvSetDpdModelCfg 0 2 140 95
cli AdrvResetDpd 0 2 1
cli AdrvSetDpdTrackCfg 0 2 22 35 16384 8529034 819200 0 519 50 519 0 0 20
AdrvSetTrackCalsEnable 0 0x222222 1
AdrvSetTxAtten 0 2 12000
#########################################################################


# 1 内部源
set_power_control_enable 0
carr_inactivate 0
carr_cfg 0 0 3 10 1 2160 1970 24
carr_activate 0
write_fpgareg 0x114 2
write_fpgareg 0x110 0x20
set_power_control_enable 1


# 2 内部源
set_power_control_enable 0
carr_inactivate 1
carr_cfg 1 0 3 10 1 2160 1970 24
carr_activate 1
write_fpgareg 0x114 2
write_fpgareg 0x110 0x20
set_power_control_enable 1

# 3 内部源
set_power_control_enable 0
carr_inactivate 2
carr_cfg 2 0 3 10 1 2160 1970 24
carr_activate 2
write_fpgareg 0x114 2
write_fpgareg 0x110 0x20
set_power_control_enable 1

# 4 内部源
set_power_control_enable 0
carr_inactivate 3
carr_cfg 3 0 3 10 1 2160 1970 24
carr_activate 3
write_fpgareg 0x114 2
write_fpgareg 0x110 0x20
set_power_control_enable 1