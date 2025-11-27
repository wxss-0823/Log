##### 起振点 #####
lmk_inchannelconfig 0
set_rx1freq 266000000
set_rx2freq 266000000
set_rx3freq 266000000
set_rx4freq 266000000
set_tx1freq 349000000


##### RX 链路 #####
# RX on
write_fpgareg 0x259 2
# LF
set_multi_carr_mode 3 2
freq_config 0 230
freq_config 1 230
freq_config 2 230

powercalc 10 10000000
powercalc 11 10000000
powercalc 12 10000000
powercalc 13 10000000
powercalc 18 10000000
powercalc 19 10000000

# MF
set_multi_carr_mode 3 2
freq_config 0 232.5
freq_config 1 232.5
freq_config 2 232.5

powercalc 10 10000000
powercalc 11 10000000
powercalc 12 10000000
powercalc 13 10000000
powercalc 18 10000000
powercalc 19 10000000

# HF
set_multi_carr_mode 3 2
freq_config 0 235
freq_config 1 235
freq_config 2 235

powercalc 10 10000000
powercalc 11 10000000
powercalc 12 10000000
powercalc 13 10000000
powercalc 18 10000000
powercalc 19 10000000

##### TX 链路 #####
# TX on
write_fpgareg 0x259 1
# DAC 单音
set_testsource
dl_tetrasource 5120 0 0
set_dacsingletest 0 -9
set_multi_carr_mode 1 1
freq_config 0 232.5
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 8
write_fbdvga 16
powercalctxfb 14 1000000















set_testsource
dl_tetrasource 5120 0 0
set_dacsingletest 0 -9
set_multi_carr_mode 1 1
freq_config 0 233.5
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 8
powercalc 0 1000000
set_testsource
dl_tetrasource 5120 0 0
write_fbdvga 16
powercalctxfb 14 1000000


cli
admin
lmk_inchannelconfig 2
set_abms fb_power_fault
set_abms returnloss_alarm
set_abms fwd_power_fault
set_testsource
dl_tetrasource 5120 0 0
set_multi_carr_mode 2 2
freq_config 0 230
freq_config 1 230.5
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 12.5
powercalc 0 1000000
write_fbdvga 20
powercalctxfb 14 1000000
set_dpden 0
dpd_change
dpd_startup





set_dacsingletest 0.5 -9




cli
admin
lmk_inchannelconfig 2
set_rx1freq 771000000
set_rx2freq 407000000
set_rx3freq 407000000
set_rx4freq 407000000
set_tx1freq 470000000

cli
admin
lmk_inchannelconfig 0
set_multi_carr_mode 2 2
freq_config 0 858.5
freq_config 1 858.5


freq_config 0 851
freq_config 1 851

freq_config 0 866
freq_config 1 866

powercalc 10 1000000 
powercalc 11 1000000 
powercalc 12 1000000 
powercalc 13 1000000 


cli
admin
lmk_inchannelconfig 0
set_testsource
dl_tetrasource 5120 0 0
set_multi_carr_mode 1 1
freq_config 0 363.5
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 10
powercalc 0 1000000
write_fbdvga 12
powercalctxfb 14 1000000




powercalc 10 1000000
powercalc 11 1000000
powercalc 12 1000000
powercalc 13 1000000
powercalc 18 1000000
powercalc 19 1000000
powercalc 26 1000000
powercalc 27 1000000

set_dactwotonetest -0.25 0.25 -9.6


write_txdvga 25
set_dpden 0
dpd_change
dpd_startup
dpd_ctrl_read 0 82

cli
admin
write_fpgareg 0x20 0x70
powercalc 1 1000000
powercalc 0 1000000
set_multi_carr_mode 1 1
freq_config 0 363.5
set_rx1freq 406500000
set_abms fb_power_fault
set_abms returnloss_alarm
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 10
powercalc 0 1000000
write_fbdvga 12
powercalctxfb 14 1000000



****DAC 单音 TX链路****
lmk_inchannelconfig 0
set_testsource
set_dacsingletest 0 -9

set_multi_carr_mode 1 1
freq_config 0 232.5
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 8
write_fbdvga 16
powercalctxfb 14 1000000


cd mnt/flash/patch/bin/
mv dtru_fpga.gew.bin dtru_fpga.gew.bbk
dow dtru_fpga.gew2.bin
mv dtru_fpga.gew2.bin dtru_fpga.gew.bin

