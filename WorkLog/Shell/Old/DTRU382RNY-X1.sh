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
lmk_inchannelconfig 0
set_rx1freq 441000000
set_rx2freq 441000000
set_rx3freq 406500000
set_rx4freq 370000000
set_tx1freq 505100000

****RX链路****
lmk_inchannelconfig 1
set_multi_carr_mode 4 1
freq_config 0 384
freq_config 1 384
freq_config 2 384
freq_config 3 384

powercalc 10 1000000
powercalc 11 1000000
powercalc 12 1000000
powercalc 13 1000000

****TX链路****
set_testsource
dl_tetrasource 5120 0 0

set_multi_carr_mode 1 1
freq_config 0 384.5
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 12
write_fbdvga 10
powercalc 0 1000000
powercalctxfb 14 1000000







