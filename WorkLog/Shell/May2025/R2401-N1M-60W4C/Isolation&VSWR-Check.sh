#############################################################################
# ps查看进程，出现下面进程，说明单板启动完毕
# {ir_monitor.sh} /bin/sh /app/ir/scripts/ir_monitor.sh
#############################################################################

#############################################################################
# 1.更新程序
将R2401-N1M-60W4C_R_FLASH_V1.00.012.txz文件放入/mnt/flash/upgrade里面
之后复位

# 2.加载eeprom
程序上电完成后，加载下面两个EEPROM文件
cd /app/metadata/eeprom/
./R2401_EEPROM_VGS_20250420.sh 
./R2401_EEPROM_normal_cfg_20250425.sh 
执行完毕后复位

# 3.取功放静流，取完复位 （注意询问是否换了驱动）
新驱动，主管110mA，峰20mA
取完静流复位
#############################################################################

#############################################################################
# 4.发内部源，看隔离度
# 发内部源
write_fpgareg 0xda4 0
write_fpgareg 0xda5 0
write_fpgareg 0xda6 0
write_fpgareg 0xda7 0
write_fpgareg 0xd80 3
write_fpgareg 0xd85 3
write_fpgareg 0xd8a 3
write_fpgareg 0xd8f 3
write_fpgareg 0xda0 1
write_fpgareg 0xda1 1
write_fpgareg 0xda2 1
write_fpgareg 0xda3 1
set_axc_info_index 0 0 0 0
set_axc_dl_num 0 0 1 1
set_axc_info_index 1 0 0 0
set_axc_dl_num 1 0 1 2
set_axc_info_index 2 0 0 0
set_axc_dl_num 2 0 1 3
set_axc_info_index 3 0 0 0
set_axc_dl_num 3 0 1 4
write_fpgareg 0xda0 0
write_fpgareg 0xda1 0
write_fpgareg 0xda2 0
write_fpgareg 0xda3 0
write_fpgareg 0xda4 1
write_fpgareg 0xda5 1
write_fpgareg 0xda6 1
write_fpgareg 0xda7 1
write_fpgareg 0x105 1
write_fpgareg 0x110 0x0
write_fpgareg 0x570 3
write_fpgareg 0x573 3
write_fpgareg 0x576 3
write_fpgareg 0x579 3
write_fpgareg 0x1c0 3
write_fpgareg 0x1c3 3
write_fpgareg 0x1c6 3
write_fpgareg 0x1c9 3
write_fpgareg 0x100 0
msleep 1000
write_fpgareg 0x100 0xffff
write_fpgareg 0xd70  0
write_fpgareg 0x114 16
write_fpgareg 0x110 0x20
write_fpgareg 0x153 0xf

# 配置载波
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 0 0 3 10 0 2160 1970 47.8
carr_cfg 1 0 3 10 0 2160 1970 47.8
carr_cfg 2 0 3 10 0 2160 1970 47.8
carr_cfg 3 0 3 10 0 2160 1970 47.8
carr_activate 0
carr_activate 1
carr_activate 2
carr_activate 3

AdrvSetClgcEnable 0 1 0
AdrvSetClgcEnable 0 2 0
AdrvSetClgcEnable 0 4 0
AdrvSetClgcEnable 0 8 0
set_fb_att 0 0
set_fb_att 2 0
AdrvSetTrackCalsEnable 0 0xf00000 1
#############################################################################

#############################################################################
# procedure
######################################################
# 前向功率一般都为-18dbfs
######################################################
# 通道0前向功率 （看反馈功率clgcOrxRmsPower: -inf dBFS）
write_fpgareg 0x5c 0
AdrvSetTxToOrxMapping 0 0x10 1
AdrvGetClgcStatus 0 1   

# 通道1前向功率
write_fpgareg 0x5c 1
AdrvSetTxToOrxMapping 0 0x10 2
AdrvGetClgcStatus 0 2   

# 通道2前向功率
write_fpgareg 0x5c 0
AdrvSetTxToOrxMapping 0 0x40 4
AdrvGetClgcStatus 0 4  

# 通道3前向功率
write_fpgareg 0x5c 1
AdrvSetTxToOrxMapping 0 0x40 8
AdrvGetClgcStatus 0 8  
######################################################

######################################################
# 反向功率一般比前向小13dbfs以上
######################################################
# 通道0反向功率 （看反馈功率clgcOrxRmsPower: -inf dBFS）
write_fpgareg 0x5c 4
AdrvSetTxToOrxMapping 0 0x10 1
AdrvGetClgcStatus 0 1   

# 通道1反向功率
write_fpgareg 0x5c 5
AdrvSetTxToOrxMapping 0 0x10 2
AdrvGetClgcStatus 0 2   

# 通道2反向功率
write_fpgareg 0x5c 4
AdrvSetTxToOrxMapping 0 0x40 4
AdrvGetClgcStatus 0 4  

# 通道3反向功率

write_fpgareg 0x5c 5
AdrvSetTxToOrxMapping 0 0x40 8
AdrvGetClgcStatus 0 8  

######################################################
# 前向功率差即为隔离度，隔离度应该有50dB以上
######################################################
# 观察隔离度 CH0
write_fpgareg 0x140 0x1fff
write_fpgareg 0x143 0x1fff
write_fpgareg 0x146 0x1fff
write_fpgareg 0x149 0x1fff

write_fpgareg 0x140 0
write_fpgareg 0x5c 0
AdrvSetTxToOrxMapping 0 0x10 1
AdrvGetClgcStatus 0 1

# 观察隔离度 CH1
write_fpgareg 0x140 0x1fff
write_fpgareg 0x143 0x1fff
write_fpgareg 0x146 0x1fff
write_fpgareg 0x149 0x1fff

write_fpgareg 0x143 0
write_fpgareg 0x5c 1
AdrvSetTxToOrxMapping 0 0x10 2
AdrvGetClgcStatus 0 2

# 观察隔离度 CH2
write_fpgareg 0x140 0x1fff
write_fpgareg 0x143 0x1fff
write_fpgareg 0x146 0x1fff
write_fpgareg 0x149 0x1fff

write_fpgareg 0x146 0
write_fpgareg 0x5c 0
AdrvSetTxToOrxMapping 0 0x40 4
AdrvGetClgcStatus 0 4

# 观察隔离度 CH3
write_fpgareg 0x140 0x1fff
write_fpgareg 0x143 0x1fff
write_fpgareg 0x146 0x1fff
write_fpgareg 0x149 0x1fff

write_fpgareg 0x149 0
write_fpgareg 0x5c 1
AdrvSetTxToOrxMapping 0 0x40 8
AdrvGetClgcStatus 0 8
######################################################


#############################################################################
# dpdStatus.dpdStatistics.dpdDirectEvm: 0.00 % 
# 关注这个参数，应该为 0 % ~ 1.2 % 算优，1.2 % ~ 2 % 算正常 2 % 以上说明整机存在其他泄露
#############################################################################
# 5.发内部源，看 DPD 状态
set_tx_gain_delta 0 5000
set_tx_gain_delta 1 5000
set_tx_gain_delta 2 5000
set_tx_gain_delta 3 5000
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_inactivate 2
carr_inactivate 3
carr_cfg 0 0 3 10 0 2160 1970 47.8
carr_cfg 1 0 3 10 0 2160 1970 47.8
carr_cfg 2 0 3 10 0 2160 1970 47.8
carr_cfg 3 0 3 10 0 2160 1970 47.8
carr_activate 0
carr_activate 1
carr_activate 2
carr_activate 3
set_power_control_enable 1

# 读取 4 个通道 DPD 状态
 AdrvGetDpdStatus 0 1
 AdrvGetDpdStatus 0 2
 AdrvGetDpdStatus 0 4
 AdrvGetDpdStatus 0 8
 #############################################################################