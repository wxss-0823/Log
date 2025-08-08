### 上下行频率等配置 ###
show_status
### 防自动重启 ###
cli write_fpgareg 0x7d 0
### 时钟锁 ###
alm
### 载波分级配置文件 ###
cd /mnt/flash/metadata/z/pdt
### 软件版本 ###
v
### 配置 FPGA ###
cd /tmp
# tftp 下载配置包
tftp 192.168.114.23 -gr app_start.sh
# tftp 上传配置包
tftp 192.168.114.23 -pr app_start.sh
upl app_start.sh
# 删除旧配置
rm -rf /mnt/flash/*
# 解压
tar -xvJf zg60_240914.txz -C /


****起振点****
cli
admin
lmk_inchannelconfig 2
set_rx1freq 754000000
set_rx2freq 754000000
set_rx3freq 754000000
set_rx4freq 754000000
set_tx1freq 750000000


****RX链路****
cli
admin
lmk_inchannelconfig 2
# RX on
write_fpgareg 0x259 2
# TX on
write_fpgareg 0x259 1

set_multi_carr_mode 1 1
freq_config 0 860
freq_config 1 860
freq_config 2 860

powercalc 10 10000000
powercalc 11 10000000
powercalc 12 10000000
powercalc 13 10000000
powercalc 18 10000000
powercalc 19 10000000





****TX链路****
lmk_inchannelconfig 2
set_testsource
dl_tetrasource 5120 0 0

set_multi_carr_mode 1 1
freq_config 0 860
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 5
powercalc 0 1000000
write_fbdvga 7
powercalctxfb 14 1000000