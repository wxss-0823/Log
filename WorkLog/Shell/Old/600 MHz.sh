# 配置DDR源
write_clkreg 0xc73d 0x12
write_clkreg 0xc7bd 0x12
write_clkreg 0xc681 0x12
set_ddr_source /mnt/flash/ddr/NR_FDD_100M_FRM_256QAM.txt  0 6 6 6

write_fpgareg 0x96 0x1680
write_fpgareg 0x43 0x100
write_fpgareg 0x5c 0x80

set_power_control_enable 0
carr_inactivate 0
carr_cfg 0 0 2 100 1 628 628 47.8 5 1 0.7 0.7 6 4 4
carr_activate 0
set_power_control_enable 1
set_pa_mode 0 0 1

# 新开一个窗口ps找到dpd.app
kill XXXX
cd /var/run
rm dpd+table
cd /app/bin
./dpd_app
cli
admin
dpd_run 0

# ch1:
# 出口 122.88 
get_capturedata 4 0 1000 2048 ddc0_out_600.txt
# 入口 245.76 
get_capturedata 4 1 1000 2048 ddc0_in_600.txt

# ch2:
# 出口 
122.88 get_capturedata 5 0 1000 2048 ddc1_out_n28.txt
# 入口 
245.76 get_capturedata 5 1 1000 2048 ddc1_in_n28.txt

get_capturedata 12 1 100 2048 fb_data.txt