****起振点****
lmk_inchannelconfig 0
set_rx1freq 257000000
set_rx2freq 258000000
set_rx3freq 256000000
set_rx4freq 256000000
set_tx1freq 311000000

****RX链路**** 229
lmk_inchannelconfig 0
set_rx1freq 272000000
set_rx2freq 274000000
set_rx3freq 272000000
set_rx4freq 273000000
set_tx1freq 319300000

powercalc 10 1000000
powercalc 11 1000000
powercalc 12 1000000
powercalc 13 1000000


lmk_inchannelconfig 0
set_multi_carr_mode 4 1
freq_config 0 231
freq_config 1 231
freq_config 2 231
freq_config 3 231



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