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

# //===========PR3C-B3N78============//

测试前置操作
cli AdrvSetRxGainPinCtrlCfg 0 0x4 0.5 0.5 1 2 0
cli AdrvSetRxGainPinCtrlCfg 0 0x2 0.5 0.5 3 4 0
cli AdrvSetRxGainPinCtrlCfg 1 0x2 0.5 0.5 1 2 0
cli AdrvSetRxGainPinCtrlCfg 1 0x4 0.5 0.5 3 4 0
cli write_fpgareg 0x26 0
AdrvSetTxRadioCtrlCfg 0 4 1
AdrvSetTxRadioCtrlCfg 1 4 1

B3 DL 1805~1880
   UL 1710~1775

N78 3400~3600

下行及反馈测试（B3）：
set_tx_pll 0 1815   
//设置本振频点
AdrvSetTxTestTone 0 4 1 1 0  
//设置测试单音信号，间隔本振1M
set_pa_mode 0 0 1   
//设置下行常开
set_tx_att 0 2000  
//设置tx att
write_fpgareg 0x1fa 0x10  
//设置反馈信号指向B3通道
AdrvSetRxTxEnable 0 0x40 0
AdrvGetRxDecPower 0 0x40  
//读取反馈功率


下行及反馈测试（N78）：
set_tx_pll 3 3450   
//设置本振频点
AdrvSetTxTestTone 1 4 1 1 0  
//设置测试单音信号，间隔本振1M
set_pa_mode 0 3 1   
//设置下行常开
set_tx_att 3 2000  
//设置tx att
write_fpgareg 0x1fa 0x13  
//设置反馈信号指向N78通道
AdrvSetRxTxEnable 1 0x40 0
AdrvGetRxDecPower 1 0x40  
//读取反馈功率


上行测试（B3）：

set_tx_pll 0 1715   
//设置本振频点
set_pa_mode 0 0 2   
//设置上行常开
AdrvSetRxTxEnable 0 0x4 0
set_rx_att 0 2000  
//设置rx att
AdrvGetRxDecPower 0 4  
//读取功率



上行测试（N78）：

set_tx_pll 3 3450   
//设置本振频点
set_pa_mode 0 3 2   
//设置上行常开
AdrvSetRxTxEnable 1 0x4 0
set_rx_att 3 2000  
//设置rx att
AdrvGetRxDecPower 1 4  
//读取功率
