#############
通道 0 N41 2515~2675
通道 1 N78 3400~3600
通道 2 B1 2110~2170/1920~1980
通道 3 B3 1805~1880/1710~1785
#############

set_pa_mode 0 0 0
set_pa_mode 0 1 0
set_pa_mode 0 2 0
set_pa_mode 0 3 0

B3 DL 1805~1880
   UL 1710~1775

N78 3400~3600
# //===========PR3C-B3N78============//

测试前置操作
cli AdrvSetRxGainPinCtrlCfg 0 0x4 0.5 0.5 1 2 0
cli AdrvSetRxGainPinCtrlCfg 0 0x2 0.5 0.5 3 4 0
cli AdrvSetRxGainPinCtrlCfg 1 0x2 0.5 0.5 1 2 0
cli AdrvSetRxGainPinCtrlCfg 1 0x4 0.5 0.5 3 4 0
cli write_fpgareg 0x26 0
cli AdrvSetTxRadioCtrlCfg 0 4 1
cli AdrvSetTxRadioCtrlCfg 0 2 1
cli AdrvSetTxRadioCtrlCfg 1 4 1
cli AdrvSetTxRadioCtrlCfg 1 2 1
cli AdrvSetRxRadioCtrlCfg 0 4 1
cli AdrvSetRxRadioCtrlCfg 0 2 1
cli AdrvSetRxRadioCtrlCfg 1 4 1
cli AdrvSetRxRadioCtrlCfg 1 2 1



下行及反馈测试（B3）：

set_tx_pll 0 1815
AdrvSetTxTestTone 0 4 1 1 0
set_pa_mode 0 0 1
set_tx_att 0 3000
set_fb_att 0 15000
write_fpgareg 0x1fa 0x10
AdrvSetRxTxEnable 0 0x40 0
AdrvGetRxDecPower 0 0x40


下行及反馈测试（B1）：

set_tx_pll 1 2130
AdrvSetTxTestTone 0 2 1 1 0
set_pa_mode 0 1 1
set_tx_att 1 3000
set_fb_att 1 15000
write_fpgareg 0x1fa 0x11
AdrvSetRxTxEnable 0 0x10 0
AdrvGetRxDecPower 0 0x10


下行及反馈测试（N41）：

set_tx_pll 2 2565
AdrvSetTxTestTone 1 4 1 1 0
set_pa_mode 0 2 1
set_tx_att 2 3000
set_fb_att 2 15000
write_fpgareg 0x1fa 0x12
AdrvSetRxTxEnable 1 0x40 0
AdrvGetRxDecPower 1 0x40


下行及反馈测试（N78）：

set_tx_pll 3 3450
AdrvSetTxTestTone 1 2 1 1 0
set_pa_mode 0 3 1
set_tx_att 3 3000
set_fb_att 3 15000
write_fpgareg 0x1fa 0x13
AdrvSetRxTxEnable 1 0x10 0
AdrvGetRxDecPower 1 0x10


上行测试（B3）：

set_tx_pll 0 1715
set_pa_mode 0 0 2
AdrvSetRxTxEnable 0 0x4 0
set_rx_att 0 11000
AdrvGetRxDecPower 0 4


上行测试（B1）：

set_tx_pll 1 1925
set_pa_mode 0 1 2
AdrvSetRxTxEnable 0 0x2 0
set_rx_att 1 5000
AdrvGetRxDecPower 0 2


上行测试（N41）：

set_tx_pll 2 2565
set_pa_mode 0 2 2
AdrvSetRxTxEnable 1 0x4 0
set_rx_att 2 9000
AdrvGetRxDecPower 1 4


上行测试（N78）：

set_tx_pll 3 3450
set_pa_mode 0 3 2
AdrvSetRxTxEnable 1 0x2 0
set_rx_att 3 9000
AdrvGetRxDecPower 1 2


 

