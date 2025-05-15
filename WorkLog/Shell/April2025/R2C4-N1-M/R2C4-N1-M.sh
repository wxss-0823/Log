#################
测试前置操作
cli AdrvSetTxRadioCtrlCfg 0 1 1
cli AdrvSetTxRadioCtrlCfg 0 2 1
cli AdrvSetRxRadioCtrlCfg 0 1 1
cli AdrvSetRxRadioCtrlCfg 0 2 1


R2C4-N1-M
下行及反馈测试（CH0）：

set_tx_pll 0 2100
AdrvSetTxTestTone 0 1 1 10 0
set_pa_mode 0 0 1
set_tx_att 0 8000
set_fb_att 0 11000
write_fpgareg 0x5C 0x0
AdrvSetTxToOrxMapping 0 0x10 0
AdrvSetRxTxEnable 0 0x10 0
AdrvGetRxDecPower 0 0x10


下行及反馈测试（CH1）：

set_tx_pll 1 2100
AdrvSetTxTestTone 0 2 1 10 0
set_pa_mode 0 1 1
set_tx_att 1 8000
set_fb_att 0 11000
write_fpgareg 0x5C 0x0
AdrvSetTxToOrxMapping 0 0x10 2
AdrvSetRxTxEnable 0 0x10 0
AdrvGetRxDecPower 0 0x10


上行测试（CH0）：

set_tx_pll 0 1910
set_pa_mode 0 0 2
AdrvSetRxTxEnable 0 0x1 0
set_rx_att 0 13000
AdrvGetRxDecPower 0 1


上行测试（CH1）：

set_tx_pll 1 1910
set_pa_mode 0 1 2
AdrvSetRxTxEnable 0 0x2 0
set_rx_att 1 13000
AdrvGetRxDecPower 0 2