##############################
# TX
##############################

# CH0
set_tx_att 0 15000
set_tx_pll 0 2160
AdrvSetTxTestTone 0 1 1 1 0
AdrvSetRxTxEnable 0 0 1
write_fpgareg 0x28 0x0101
# set fb enable
AdrvSetRxTxEnable 0 0x10 0x1

# CH1
set_tx_att 1 15000
set_tx_pll 1 2160
AdrvSetTxTestTone 0 2 1 1 0
AdrvSetRxTxEnable 0 0 2
write_fpgareg 0x28 0x0102
# set fb enable
AdrvSetRxTxEnable 0 0x20 0x2

# CH0
set_tx_att 2 15000
set_tx_pll 2 2160
AdrvSetTxTestTone 0 4 1 1 0
AdrvSetRxTxEnable 0 0 4
write_fpgareg 0x28 0x0104
# set fb enable
AdrvSetRxTxEnable 0 0x40 0x4

# CH4
set_tx_att 3 15000
set_tx_pll 3 2160
AdrvSetTxTestTone 0 8 1 1 0
AdrvSetRxTxEnable 0 0 8
write_fpgareg 0x28 0x0108
# set fb enable
AdrvSetRxTxEnable 0 0x80 0x8

# set tx att
# att = (255 - 215) / 2
AdrvSetRxGain 0 0x80 215
##############################

##############################
# RX
##############################
# CH0 ~ CH3
set_rx_att 0 20000
set_rx_att 1 20000
set_rx_att 2 20000
set_rx_att 3 20000
write_fpgareg 0x29 0x100
AdrvSetRxTxEnable 0 0xf 0
# read rx power
get_rssi
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