ir_kill

# 内部源指令（目前为40M指令） 
set_testsource  /app/ddr/NR40M_TDD.SH
write_fpgareg 0xda4 0
write_fpgareg 0xda5 0
write_fpgareg 0xd80 10
write_fpgareg 0xd85 10
write_fpgareg 0xda0 1
write_fpgareg 0xda1 1
set_axc_info_index 0 0 0 7
set_axc_dl_num 0 0 8 0
set_axc_info_index 1 0 0 7
set_axc_dl_num 1 0 8 8
write_fpgareg 0xda0 0
write_fpgareg 0xda1 0
write_fpgareg 0xda4 1
write_fpgareg 0xda5 1
write_fpgareg 0x105 1
write_fpgareg 0x110 0x0
write_fpgareg 0x570 10
write_fpgareg 0x573 10
write_fpgareg 0x1c0 10
write_fpgareg 0x1c3 10
write_fpgareg 0x100 0
msleep 1000
write_fpgareg 0x100 0xffff
write_fpgareg 0xd70  0
write_fpgareg 0x114 2
write_fpgareg 0x110 0x20

# 内部源指令（目前为100M指令）
set_testsource  /app/ddr/NR100M_FDD_TM31a.sh
write_fpgareg 0xda4 0
write_fpgareg 0xda5 0
write_fpgareg 0xd80 6
write_fpgareg 0xd85 6
write_fpgareg 0xda0 1
write_fpgareg 0xda1 1
set_axc_info_index 0 0 0 7
set_axc_dl_num 0 0 8 0
set_axc_info_index 1 0 0 7
set_axc_dl_num 1 0 8 8
write_fpgareg 0xda0 0
write_fpgareg 0xda1 0
write_fpgareg 0xda4 1
write_fpgareg 0xda5 1
write_fpgareg 0x105 1
write_fpgareg 0x110 0x0
write_fpgareg 0x570 6
write_fpgareg 0x573 6
write_fpgareg 0x1c0 6
write_fpgareg 0x1c3 6
write_fpgareg 0x100 0
msleep 1000
write_fpgareg 0x100 0xffff
write_fpgareg 0xd70  0

write_fpgareg 0x114 2
write_fpgareg 0x110 0x20



###########################################
## carr_cfg 2 0 1 20 0 1815 1725 46
## 2:  通道
## 0:  载波号
## 1:  LTE TDD 0;
##     LTE FDD 1;
##     NR  TDD 2;
##     NR  FDD 3;
## 20: 带宽
## 0:  子载波间隔0 15 K; 1 30 K


## 2515 ~ 2675
## 40 60 100
## 40 dBm
## TDD
###########################################

查看驻波，隔离度（40M配置）
set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_cfg 0 0 2 40 1 2535 2535 34 5 1 0.7 0.7 6 4 4
carr_cfg 1 0 2 40 1 2535 2535 34 5 1 0.7 0.7 6 4 4
carr_activate 0
carr_activate 1
set_power_control_enable 1

set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_cfg 0 0 2 40 1 2655 2655 34 5 1 0.7 0.7 6 4 4
carr_activate 0
set_power_control_enable 1

set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_cfg 0 0 2 100 1 2565 2565 37 5 1 0.7 0.7 6 4 4
carr_activate 0
set_power_control_enable 1



set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_cfg 1 0 2 40 1 2655 2655 34 5 1 0.7 0.7 6 4 4
carr_activate 1
set_power_control_enable 1

set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_cfg 1 0 2 100 1 2565 2565 37 5 1 0.7 0.7 6 4 4
carr_activate 1
set_power_control_enable 1

set_power_control_enable 0
carr_inactivate 0
carr_inactivate 1
carr_cfg 1 0 2 100 1 2615 2615 37 5 1 0.7 0.7 6 4 4
carr_activate 1
set_power_control_enable 1

