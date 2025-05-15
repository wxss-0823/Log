****起振点****
cli
admin
lmk_inchannelconfig 0
set_rx1freq 406500000
set_rx2freq 441000000
set_rx3freq 406500000
set_rx4freq 370000000
set_rx4freq 380000000
set_rx4freq 390000000
set_rx4freq 400000000
set_rx4freq 410000000
set_rx4freq 420000000
set_rx4freq 430000000



set_tx1freq 505000000

****RX链路****
cli
admin
set_multi_carr_mode 4 1
freq_config 0 231
freq_config 1 231
freq_config 2 231
freq_config 3 231

powercalc 10 1000000
powercalc 11 1000000
powercalc 12 1000000
powercalc 13 1000000
powercalc 18 1000000
powercalc 19 1000000
powercalc 26 1000000
powercalc 27 1000000

set_ul_cf_coe 222 25
set_ul_cf_coe 222 50
set_ul_cf_coe 222 100

root
cli
admin
lmk_inchannelconfig 0
set_multi_carr_mode 3 2
freq_config 0 364
freq_config 1 364
freq_config 2 364

powercalc 10 10000000
powercalc 11 10000000 
powercalc 12 10000000 
powercalc 13 10000000 

powercalc 18 10000000 
powercalc 19 10000000



powercalc 17 10000000



****TX链路****
root
cli
admin
lmk_inchannelconfig 0
set_testsource
dl_tetrasource 5120 0 0

set_multi_carr_mode 1 1
freq_config 0 363.5
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 7
powercalc 0 1000000
write_fbdvga 12
powercalctxfb 14 1000000


cli
admin
lmk_inchannelconfig 0
set_testsource
dl_tetrasource 5120 0 0
set_multi_carr_mode 2 2
freq_config 0 363.5
freq_config 1 363.5
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 7
powercalc 0 1000000
write_fbdvga 12
powercalctxfb 14 1000000



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
lmk_inchannelconfig 2
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
set_abms fwd_power_fault
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 9
powercalc 0 1000000
write_fbdvga 3
powercalctxfb 14 1000000


set_dpden 0
dpd_change
dpd_startup 
dpd_ctrl_read 0 82

****DAC 单音 TX链路****
root
cli
admin
lmk_inchannelconfig 2
set_dacsingletest 0 -9

set_multi_carr_mode 1 1
freq_config 0 365
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 7
powercalc 0 1000000
write_fbdvga 12
powercalctxfb 14 1000000

t

root
cli
admin
lmk_inchannelconfig 2
set_dacsingletest 0 -9
write_fpgareg 0x46 1
set_txdvga 15


====================================================
cli
admin
lmk_inchannelconfig 1
set_testsource_on

set_testsource_n 0 /mnt/flash/metadata/dtru/gmsk.txt
set_testsource_n 0 /mnt/flash/metadata/dtru/8psk.txt
set_testsource_n 0 /mnt/flash/metadata/dtru/16qam.txt

write_fpgareg 0xa5 1
write_fpgareg 0xa0 17
set_multi_carr_mode 1 1
freq_config 0 231
set_pa_input_sig_sw 1
write_fpgareg 0x46 1
write_txdvga 10
powercalc 0 1000000
write_fbdvga 12
powercalctxfb 14 1000000

set_dpden 0
dpd_change
dpd_startup

dpd_ctrl_read 0 82
dpd_ctrl_read 0 70
dpd_ctrl_read 0 55

