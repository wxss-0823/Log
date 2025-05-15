# //===========PR3C-B1B3N41============//

#############
通道 0 N41 2515~2675
通道 1 N78 3400~3600
通道 2 B1 2110~2170/1920~1980
通道 3 B3 1805~1880/1710~1785
#############


# 通道1发射信号，att=10 tssi=-18dbfs 本振1805 右偏1M 1810-1880 
AdrvSetPllFrequency 0 1 1805
AdrvSetTxTestTone 0 4 1 1 0
AdrvSetTxAtten 0 4 2000

# 打开通道1上下行 B3
AdrvSetRxTxEnable 0 0x4 0x4
write_fpgareg 0x1fa 0x10
set_pa_mode 0 0 1


# 通道2发射信号，att=10 tssi=-18dbfs 本振2110 右偏1M
AdrvSetPllFrequency 0 0 2110
AdrvSetTxTestTone 0 2 1 1 0
AdrvSetTxAtten 0 2 2000

# 打开通道2上下行 B1
AdrvSetRxTxEnable 0 0x2 0x2
write_fpgareg 0x1fa 0x11
set_pa_mode 0 1 1


通道3发射信号，att=10 tssi=-18dbfs 本振2565 右偏1M
AdrvSetPllFrequency 1 0 2565
AdrvSetTxTestTone 1 2 1 1 0
AdrvSetTxAtten 1 2 2000

# 打开通道3上下行 N41
AdrvSetRxTxEnable 1 0x2 0x2
write_fpgareg 0x1fa 0x12
set_pa_mode 0 2 1


# 通道4发射信号，att=10 tssi=-18dbfs 本振3350 右偏1M
AdrvSetPllFrequency 1 1 3450
AdrvSetTxTestTone 1 4 1 1 0
AdrvSetTxAtten 1 4 2000

# 打开通道4上下行 N78
AdrvSetRxTxEnable 1 0x4 0x4
write_fpgareg 0x1fa 0x13
set_pa_mode 0 3 1

set_pa_mode 0 0 0
set_pa_mode 0 1 0
set_pa_mode 0 2 0
set_pa_mode 0 3 0


##################################
# 测 通道 1 B3 接收功率 1.8G
AdrvSetRxTxEnable 0 4 0
AdrvSetRxGainCtrlMode 0 4 0
set_rx_att 0 10000
AdrvSetTrackCalsEnable 0 0x400 1 
set_pa_mode 0 0 2
AdrvGetRxDecPower 0 4

# 测 通道2 B1 接收功率 2.1G
AdrvSetRxTxEnable 0 6 0
AdrvSetRxGainCtrlMode 0 6 0
set_rx_att 1 7000
AdrvSetTrackCalsEnable 0 0X600 1 
set_pa_mode 0 1 2
AdrvGetRxDecPower 0 2

# 测 通道3 N41 接收功率 2.5G (0X600:6-RX:0,2,4.8;)
AdrvSetRxTxEnable 1 6 0
AdrvSetRxGainCtrlMode 1 6 0
set_rx_att 3 7000
AdrvSetTrackCalsEnable 1 0X600 1  
set_pa_mode 0 2 2
AdrvGetRxDecPower 1 2

# 测 通道4 N78 接收功率 3.6G  (0X600:6-RX:0,2,4.8;)
AdrvSetRxTxEnable 1 6 0
AdrvSetRxGainCtrlMode 1 6 0
set_rx_att 2 7000
AdrvSetTrackCalsEnable 1 0X600 1  
set_pa_mode 0 3 2
AdrvGetRxDecPower 1 4




##################################
# 测 通道1 反馈功率 B3
set_fb_att 0 12000
AdrvSetRxTxEnable 0 0x44 0x4
write_fpgareg 0x1fa 0x10
AdrvGetRxDecPower 0 0x40

# 测 通道2 反馈功率 B1 1/2
set_fb_att 1 12000
AdrvSetRxTxEnable 0 0x12 0x2
write_fpgareg 0x1fa 0x11
AdrvGetRxDecPower 0 0x10

# 测 通道3 反馈功率 N41
set_fb_att 2 12000
AdrvSetRxTxEnable 1 0x12 0x2
write_fpgareg 0x1fa 0x12
AdrvGetRxDecPower 1 0x10

# 测 通道4 反馈功率 N78
set_fb_att 3 12000
AdrvSetRxTxEnable 1 0x44 0x4
write_fpgareg 0x1fa 0x13
AdrvGetRxDecPower 1 0x40



##################################
set_pa_mode 0 0 3  (0关闭，1下行，2上行，3TDD/FDD）
