#################
测试前置操作
cli AdrvSetTxRadioCtrlCfg 0 1 1
cli AdrvSetTxRadioCtrlCfg 0 2 1
cli AdrvSetRxRadioCtrlCfg 0 1 1
cli AdrvSetRxRadioCtrlCfg 0 2 1
cli write_fpgareg 0x25 0
cli write_fpgareg 0x26 0
cli write_fpgareg 0x27 0
cli write_fpgareg 0x28 0
cli write_fpgareg 0x29 0
cli write_fpgareg 0x2b 0

  
# R2C6-N28-D 功率 -6 ~ -4
# 下行测试（CH0）：

set_tx_pll 0 773
AdrvSetTxTestTone 0 1 1 1 0
set_pa_mode 0 0 1
set_pa_mode 0 1 1
set_tx_att 0 6000


# 下行测试（CH1）：

set_tx_pll 0 773
AdrvSetTxTestTone 0 2 1 1 0
set_pa_mode 0 1 1
set_tx_att 1 6000


# -3dBm进 读取功率 -12.5 ~ -14.5
# 反馈测试（CH0）：

set_fb_att 0 13000
write_fpgareg 0x5C 0x0
AdrvSetTxToOrxMapping 0 0x20 1
AdrvSetRxTxEnable 0 0x20 1
AdrvGetRxDecPower 0 0x20


# 反馈测试（CH1）：

set_fb_att 1 13000
write_fpgareg 0x5C 0x1
AdrvSetTxToOrxMapping 0 0x10 2
AdrvSetRxTxEnable 0 0x10 2
AdrvGetRxDecPower 0 0x10


# -43dBm进 读取功率 -14 ~ -16
# 上行测试（CH0）：

set_tx_pll 0 733
set_pa_mode 0 0 2
AdrvSetRxTxEnable 0 0x1 0
set_rx_att 0 14000
AdrvGetRxDecPower 0 1


# 上行测试（CH1）：

set_tx_pll 0 733
set_pa_mode 0 1 2
AdrvSetRxTxEnable 0 0x2 0
set_rx_att 1 14000
AdrvGetRxDecPower 0 2