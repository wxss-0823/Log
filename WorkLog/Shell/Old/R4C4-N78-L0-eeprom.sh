cli write_eepromreg 0x0fff 0xaa

#gain unit:3 (1/100dB)
cli write_eepromreg 0x02a0 0x03
cli write_eepromreg 0x02a1 0x03
cli write_eepromreg 0x02a2 0x03
cli write_eepromreg 0x02a3 0x03
cli write_eepromreg 0x02a4 0x03



#tx channel numnber:4
cli write_eepromreg 0x0300 0x00
cli write_eepromreg 0x0301 0x04
#tx carrier numnber:1
cli write_eepromreg 0x0302 0x00
cli write_eepromreg 0x0303 0x01
#TX Duplex(Bit[7:0] [Tx7:Tx0]; TDD,0; FDD,1)
cli write_eepromreg 0x0310 0x00
cli write_eepromreg 0x0311 0x00

#RxPathNum 4
cli write_eepromreg 0x0380 0x00
cli write_eepromreg 0x0381 0x04
#rx_max_carr_num
cli write_eepromreg 0x038a 0x00
cli write_eepromreg 0x038b 0x01
#RX Duplex(Bit[7:0] [Rx7:Rx0]; TDD:0; FDD:1)
cli write_eepromreg 0x0310 0x00
cli write_eepromreg 0x0311 0x00

#ORXPathNum:2
cli write_eepromreg 0x0400 0x00
cli write_eepromreg 0x0401 0x02
#FB_att_min:0(1/100dB)
cli write_eepromreg 0x0404 0x00
cli write_eepromreg 0x0405 0x00
#FB_att_max:3000(1/100dB)
cli write_eepromreg 0x0406 0x0b
cli write_eepromreg 0x0407 0xb8
#FB_att_step:50(1/100dB)
cli write_eepromreg 0x0408 0x00
cli write_eepromreg 0x0409 0x32

#FB1 PARAM
#FB1_cal_temp:500(0.1 degrees centigrade)
cli write_eepromreg 0x0500 0x01
cli write_eepromreg 0x0501 0xF4
#FB1_init_att:1200(1/100dB)
cli write_eepromreg 0x0502 0x04
cli write_eepromreg 0x0503 0xB0
#FB1_K1G_CH1:(1/65535dB/k)  0.018
cli write_eepromreg 0x0510 0x04
cli write_eepromreg 0x0511 0x9C
cli write_eepromreg 0x0512 0x04
cli write_eepromreg 0x0513 0x9C

cli write_eepromreg 0x0514 0x04
cli write_eepromreg 0x0515 0x9C
cli write_eepromreg 0x0516 0x04
cli write_eepromreg 0x0517 0x9C
cli write_eepromreg 0x0518 0x04
cli write_eepromreg 0x0519 0x9C

cli write_eepromreg 0x051a 0x04
cli write_eepromreg 0x051b 0x9C
cli write_eepromreg 0x051c 0x04
cli write_eepromreg 0x051d 0x9C


#FB1_K2G_CH1:0(1/65535dB/k)
cli write_eepromreg 0x0560 0x00
cli write_eepromreg 0x0561 0x00
#FB1_K3G_CH1:0(1/65535dB/k)
cli write_eepromreg 0x0562 0x00
cli write_eepromreg 0x0563 0x00

#FB1_K1G_CH2:(1/65535dB/k) 0.018
cli write_eepromreg 0x0538 0x04
cli write_eepromreg 0x0539 0x9C
cli write_eepromreg 0x053A 0x04
cli write_eepromreg 0x053B 0x9C

cli write_eepromreg 0x053C 0x04
cli write_eepromreg 0x053D 0x9C
cli write_eepromreg 0x053E 0x04
cli write_eepromreg 0x053F 0x9C
cli write_eepromreg 0x0540 0x04
cli write_eepromreg 0x0541 0x9C

cli write_eepromreg 0x0542 0x04
cli write_eepromreg 0x0543 0x9C
cli write_eepromreg 0x0544 0x04
cli write_eepromreg 0x0545 0x9C

#FB1_K2G_CH2:0(1/65535dB/k)
cli write_eepromreg 0x0570 0x00
cli write_eepromreg 0x0571 0x00
#FB1_K3G_CH2:0(1/65535dB/k)
cli write_eepromreg 0x0572 0x00
cli write_eepromreg 0x0573 0x00


#TX1-FB1_G0:1/100dB 5900 13+46
cli write_eepromreg 0x05a0 0x17
cli write_eepromreg 0x05a1 0x0C
cli write_eepromreg 0x05a2 0x17
cli write_eepromreg 0x05a3 0x0C

cli write_eepromreg 0x05a4 0x17
cli write_eepromreg 0x05a5 0x0C
cli write_eepromreg 0x05a6 0x17
cli write_eepromreg 0x05a7 0x0C
cli write_eepromreg 0x05a8 0x17
cli write_eepromreg 0x05a9 0x0C

cli write_eepromreg 0x05aa 0x17
cli write_eepromreg 0x05ab 0x0C
cli write_eepromreg 0x05ac 0x17
cli write_eepromreg 0x05ad 0x0C


#TX2-FB1_G0:1/100dB 5900 13+46
cli write_eepromreg 0x05c8 0x17
cli write_eepromreg 0x05c9 0x0C
cli write_eepromreg 0x05ca 0x17
cli write_eepromreg 0x05cb 0x0C

cli write_eepromreg 0x05cc 0x17
cli write_eepromreg 0x05cd 0x0C
cli write_eepromreg 0x05ce 0x17
cli write_eepromreg 0x05cf 0x0C
cli write_eepromreg 0x05d0 0x17
cli write_eepromreg 0x05d1 0x0C

cli write_eepromreg 0x05d2 0x17
cli write_eepromreg 0x05d3 0x0C
cli write_eepromreg 0x05d4 0x17
cli write_eepromreg 0x05d5 0x0C


#FB2 PARAM
#FB2_cal_temp:500(0.1 degrees centigrade)
cli write_eepromreg 0x0600 0x01
cli write_eepromreg 0x0601 0xF4
#FB2_init_att:1200(1/100dB)
cli write_eepromreg 0x0602 0x04
cli write_eepromreg 0x0603 0xb0


#FB2_K1G_CH1:(1/65535dB/k)
cli write_eepromreg 0x0610 0x04
cli write_eepromreg 0x0611 0x9C
cli write_eepromreg 0x0612 0x04
cli write_eepromreg 0x0613 0x9C

cli write_eepromreg 0x0614 0x04
cli write_eepromreg 0x0615 0x9C
cli write_eepromreg 0x0616 0x04
cli write_eepromreg 0x0617 0x9C
cli write_eepromreg 0x0618 0x04
cli write_eepromreg 0x0619 0x9C

cli write_eepromreg 0x061a 0x04
cli write_eepromreg 0x061b 0x9C
cli write_eepromreg 0x061c 0x04
cli write_eepromreg 0x061d 0x9C

#FB2_K2G_CH1:0(1/65535dB/k)
cli write_eepromreg 0x0660 0x00
cli write_eepromreg 0x0661 0x00
#FB2_K3G_CH1:0(1/65535dB/k)
cli write_eepromreg 0x0662 0x00
cli write_eepromreg 0x0663 0x00


#FB2_K1G_CH2:(1/65535dB/k)
cli write_eepromreg 0x0638 0x04
cli write_eepromreg 0x0639 0x9C
cli write_eepromreg 0x063A 0x04
cli write_eepromreg 0x063B 0x9C

cli write_eepromreg 0x063C 0x04
cli write_eepromreg 0x063D 0x9C
cli write_eepromreg 0x063E 0x04
cli write_eepromreg 0x063F 0x9C
cli write_eepromreg 0x0640 0x04
cli write_eepromreg 0x0641 0x9C

cli write_eepromreg 0x0642 0x04
cli write_eepromreg 0x0643 0x9C
cli write_eepromreg 0x0644 0x04
cli write_eepromreg 0x0645 0x9C

#FB2_K2G_CH2:0(1/65535dB/k)
cli write_eepromreg 0x0670 0x00
cli write_eepromreg 0x0671 0x00
#FB2_K3G_CH2:0(1/65535dB/k)
cli write_eepromreg 0x0672 0x00
cli write_eepromreg 0x0673 0x00



#TX3-FB2_G0:1/100dB 5900 13+46
cli write_eepromreg 0x06a0 0x17
cli write_eepromreg 0x06a1 0x0C
cli write_eepromreg 0x06a2 0x17
cli write_eepromreg 0x06a3 0x0C

cli write_eepromreg 0x06a4 0x17
cli write_eepromreg 0x06a5 0x0C
cli write_eepromreg 0x06a6 0x17
cli write_eepromreg 0x06a7 0x0C
cli write_eepromreg 0x06a8 0x17
cli write_eepromreg 0x06a9 0x0C

cli write_eepromreg 0x06aa 0x17
cli write_eepromreg 0x06ab 0x0C
cli write_eepromreg 0x06ac 0x17
cli write_eepromreg 0x06ad 0x0C

#TX4-FB2_G0:1/100dB 5900 13+46  
cli write_eepromreg 0x06c8 0x17
cli write_eepromreg 0x06c9 0x0C
cli write_eepromreg 0x06ca 0x17
cli write_eepromreg 0x06cb 0x0C

cli write_eepromreg 0x06cc 0x17
cli write_eepromreg 0x06cd 0x0C
cli write_eepromreg 0x06ce 0x17
cli write_eepromreg 0x06cf 0x0C
cli write_eepromreg 0x06d0 0x17
cli write_eepromreg 0x06d1 0x0C

cli write_eepromreg 0x06d2 0x17
cli write_eepromreg 0x06d3 0x0C
cli write_eepromreg 0x06d4 0x17
cli write_eepromreg 0x06d5 0x0C


#TX1 PARAM
#TX1_cal_temp:500(0.1 degrees centigrade)
cli write_eepromreg 0x0700 0x01
cli write_eepromreg 0x0701 0xF4
#TX1_init_att:1500(1/100dB)
cli write_eepromreg 0x0702 0x05
cli write_eepromreg 0x0703 0xdc
#TX1_nom_gain:6100(1/100dB)（46+15)
cli write_eepromreg 0x0704 0x17
cli write_eepromreg 0x0705 0xd4
#TX1_dBfs_power:-1500(1/100dBfs)
cli write_eepromreg 0x0706 0xfA
cli write_eepromreg 0x0707 0x24
#tx_max_power:4600(1/100dBm)4600
cli write_eepromreg 0x0708 0x11
cli write_eepromreg 0x0709 0xf8
#TX1_CLGC_gain:200(1/100dB)
cli write_eepromreg 0x070c 0x00
cli write_eepromreg 0x070d 0xc8
#TX1_CCDF:800(1/100dB)
cli write_eepromreg 0x070e 0x03
cli write_eepromreg 0x070f 0x20
#TX1_DPD_model:142
cli write_eepromreg 0x0710 0x00
cli write_eepromreg 0x0711 0x8e
#TX1_att_min:0(1/100dB)
cli write_eepromreg 0x0712 0x00
cli write_eepromreg 0x0713 0x00
#TX1_att_max:4000(1/100dB)
cli write_eepromreg 0x0714 0x0F
cli write_eepromreg 0x0715 0xA0
#TX1_att_step:10(1/100dB)
cli write_eepromreg 0x0716 0x00
cli write_eepromreg 0x0717 0x0a
#TX1_freq_min:33000(100kHz)
cli write_eepromreg 0x0718 0x80
cli write_eepromreg 0x0719 0xe8
#TX1_freq_max:36000(100kHz)
cli write_eepromreg 0x071a 0x8c
cli write_eepromreg 0x071b 0xa0
#TX1_freq_step:500(100kHz)
cli write_eepromreg 0x071c 0x01
cli write_eepromreg 0x071d 0xf4

#RX1 PARAM
#RX1_cal_temp:500(0.1 degrees centigrade)
cli write_eepromreg 0x0800 0x01
cli write_eepromreg 0x0801 0xF4
#RX1_init_att:500(1/100dB)
cli write_eepromreg 0x0802 0x01
cli write_eepromreg 0x0803 0xF4
#RX1_att_min:0(1/100dB)
cli write_eepromreg 0x0804 0x00
cli write_eepromreg 0x0805 0x00
#RX1_att_max:3000(1/100dB)
cli write_eepromreg 0x0806 0x0b
cli write_eepromreg 0x0807 0xb8
#RX1_att_step:50(1/100dB)
cli write_eepromreg 0x0808 0x00
cli write_eepromreg 0x0809 0x32
#RX1_freq_min:33000(100kHz)
cli write_eepromreg 0x080a 0x80
cli write_eepromreg 0x080b 0xe8
#RX1_freq_max:36000(100kHz)
cli write_eepromreg 0x080c 0x8c
cli write_eepromreg 0x080d 0xa0
#RX1_freq_step:500(100kHz)
cli write_eepromreg 0x080e 0x01
cli write_eepromreg 0x080f 0xF4
#RX1_nom_gain:3300(1/10dB)
cli write_eepromreg 0x0810 0x0c
cli write_eepromreg 0x0811 0xe4
#RX1_K1G:(1/65535dB/k) 0.05
cli write_eepromreg 0x0820 0x0C
cli write_eepromreg 0x0821 0xCC
cli write_eepromreg 0x0822 0x0C
cli write_eepromreg 0x0823 0xCC

cli write_eepromreg 0x0824 0x0C
cli write_eepromreg 0x0825 0xCC
cli write_eepromreg 0x0826 0x0C
cli write_eepromreg 0x0827 0xCC
cli write_eepromreg 0x0828 0x0C
cli write_eepromreg 0x0829 0xCC

cli write_eepromreg 0x082a 0x0C
cli write_eepromreg 0x082b 0xCC
cli write_eepromreg 0x082c 0x0C
cli write_eepromreg 0x082d 0xCC

#RX1_K2G:0(1/65535dB/k)
cli write_eepromreg 0x0870 0x00
cli write_eepromreg 0x0871 0x00
#RX1_K3G:0(1/65535dB/k)
cli write_eepromreg 0x0872 0x00
cli write_eepromreg 0x0873 0x00


#RX1_G0:1/100dB  3300
cli write_eepromreg 0x08a0 0x0c
cli write_eepromreg 0x08a1 0xe4
cli write_eepromreg 0x08a2 0x0c
cli write_eepromreg 0x08a3 0xe4

cli write_eepromreg 0x08a4 0x0c
cli write_eepromreg 0x08a5 0xe4
cli write_eepromreg 0x08a6 0x0c
cli write_eepromreg 0x08a7 0xe4
cli write_eepromreg 0x08a8 0x0c
cli write_eepromreg 0x08a9 0xe4

cli write_eepromreg 0x08aa 0x0c
cli write_eepromreg 0x08ab 0xe4
cli write_eepromreg 0x08ac 0x0c
cli write_eepromreg 0x08ad 0xe4


#TX2 PARAM
#TX2_cal_temp:500(0.1 degrees centigrade)
cli write_eepromreg 0x0900 0x01
cli write_eepromreg 0x0901 0xF4
#TX2_init_att:1500(1/100dB)
cli write_eepromreg 0x0902 0x05
cli write_eepromreg 0x0903 0xdc
#TX2_nom_gain:6100(1/100dB) -15 46
cli write_eepromreg 0x0904 0x17
cli write_eepromreg 0x0905 0xd4
#TX2_dBfs_power:-1500(1/100dBfs)
cli write_eepromreg 0x0906 0xfA
cli write_eepromreg 0x0907 0x24
#tx_max_power:4600(1/100dBm)
cli write_eepromreg 0x0908 0x11
cli write_eepromreg 0x0909 0xf8
#TX2_CLGC_gain:200(1/100dB)  
cli write_eepromreg 0x090c 0x00
cli write_eepromreg 0x090d 0xc8
#TX2_CCDF:800(1/100dB)       
cli write_eepromreg 0x090e 0x03
cli write_eepromreg 0x090f 0x20
#TX2_DPD_model:142        
cli write_eepromreg 0x0910 0x00
cli write_eepromreg 0x0911 0x8e
#TX2_att_min:0(1/100dB)    
cli write_eepromreg 0x0912 0x00
cli write_eepromreg 0x0913 0x00
#TX2_att_max:4000(1/100dB) 
cli write_eepromreg 0x0914 0x0f
cli write_eepromreg 0x0915 0xa0
#TX2_att_step:10(1/100dB)  
cli write_eepromreg 0x0916 0x00
cli write_eepromreg 0x0917 0x0a
#TX2_freq_min:33000(100kHz)
cli write_eepromreg 0x0918 0x80
cli write_eepromreg 0x0919 0xe8
#TX2_freq_max:36000(100kHz)
cli write_eepromreg 0x091a 0x8c
cli write_eepromreg 0x091b 0xa0
#TX2_freq_step:500(100kHz) 
cli write_eepromreg 0x091c 0x01
cli write_eepromreg 0x091d 0xf4

#RX2 PARAM
#RX2_cal_temp:500(0.1 degrees centigrade)
cli write_eepromreg 0x0a00 0x01
cli write_eepromreg 0x0a01 0xF4
#RX2_init_att:500(1/100dB)
cli write_eepromreg 0x0a02 0x01
cli write_eepromreg 0x0a03 0xf4
#RX2_att_min:0(1/100dB)
cli write_eepromreg 0x0a04 0x00
cli write_eepromreg 0x0a05 0x00
#RX2_att_max:3000(1/100dB)
cli write_eepromreg 0x0a06 0x0b
cli write_eepromreg 0x0a07 0xb8
#RX2_att_step:50(1/100dB)
cli write_eepromreg 0x0a08 0x00
cli write_eepromreg 0x0a09 0x32
#RX2_freq_min:33000(100kHz)
cli write_eepromreg 0x0a0a 0x80
cli write_eepromreg 0x0a0b 0xe8
#RX2_freq_max:36000(100kHz)
cli write_eepromreg 0x0a0c 0x8c
cli write_eepromreg 0x0a0d 0xa0
#RX2_freq_step:500(100kHz) 
cli write_eepromreg 0x0a0e 0x01
cli write_eepromreg 0x0a0f 0xf4
#RX2_nom_gain:3300(1/10dB)
cli write_eepromreg 0x0a10 0x0c
cli write_eepromreg 0x0a11 0xe4
#RX2_K1G:(1/65535dB/k) 0.05
cli write_eepromreg 0x0a20 0x0c
cli write_eepromreg 0x0a21 0xcd
cli write_eepromreg 0x0a22 0x0c
cli write_eepromreg 0x0a23 0xcd

cli write_eepromreg 0x0a24 0x0c
cli write_eepromreg 0x0a25 0xcd
cli write_eepromreg 0x0a26 0x0c
cli write_eepromreg 0x0a27 0xcd
cli write_eepromreg 0x0a28 0x0c
cli write_eepromreg 0x0a29 0xcd

cli write_eepromreg 0x0a2a 0x0c
cli write_eepromreg 0x0a2b 0xcd
cli write_eepromreg 0x0a2c 0x0c
cli write_eepromreg 0x0a2d 0xcd


#RX2_K2G:0(1/65535dB/k)
cli write_eepromreg 0x0a70 0x00
cli write_eepromreg 0x0a71 0x00
#RX2_K3G:0(1/65535dB/k)
cli write_eepromreg 0x0a72 0x00
cli write_eepromreg 0x0a73 0x00
#RX2_G0:1/100dB  3300
cli write_eepromreg 0x0aa0 0x0c
cli write_eepromreg 0x0aa1 0xe4
cli write_eepromreg 0x0aa2 0x0c
cli write_eepromreg 0x0aa3 0xe4

cli write_eepromreg 0x0aa4 0x0c
cli write_eepromreg 0x0aa5 0xe4
cli write_eepromreg 0x0aa6 0x0c
cli write_eepromreg 0x0aa7 0xe4
cli write_eepromreg 0x0aa8 0x0c
cli write_eepromreg 0x0aa9 0xe4

cli write_eepromreg 0x0aaa 0x0c
cli write_eepromreg 0x0aab 0xe4
cli write_eepromreg 0x0aac 0x0c
cli write_eepromreg 0x0aad 0xe4


#TX3 PARAM
#TX3_cal_temp:500(0.1 degrees centigrade)
cli write_eepromreg 0x0b00 0x01
cli write_eepromreg 0x0b01 0xF4
#TX3_init_att:1500(1/100dB)
cli write_eepromreg 0x0b02 0x05
cli write_eepromreg 0x0b03 0xdc
#TX3_nom_gain:6100(1/100dB) -15+46
cli write_eepromreg 0x0b04 0x17
cli write_eepromreg 0x0b05 0xd4
#TX3_dBfs_power:-1500(1/100dBfs)
cli write_eepromreg 0x0b06 0xfA
cli write_eepromreg 0x0b07 0x24
#tx_max_power:4600(1/100dBm)
cli write_eepromreg 0x0b08 0x11
cli write_eepromreg 0x0b09 0xf8
#TX3_CLGC_gain:200(1/100dB)  
cli write_eepromreg 0x0b0c 0x00
cli write_eepromreg 0x0b0d 0xc8
#TX3_CCDF:800(1/100dB)       
cli write_eepromreg 0x0b0e 0x03
cli write_eepromreg 0x0b0f 0x20
#TX3_DPD_model:142        
cli write_eepromreg 0x0b10 0x00
cli write_eepromreg 0x0b11 0x8e
#TX3_att_min:0(1/100dB)    
cli write_eepromreg 0x0b12 0x00
cli write_eepromreg 0x0b13 0x00
#TX3_att_max:4000(1/100dB) 
cli write_eepromreg 0x0b14 0x0f
cli write_eepromreg 0x0b15 0xa0
#TX3_att_step:10(1/100dB)  
cli write_eepromreg 0x0b16 0x00
cli write_eepromreg 0x0b17 0x0a
#TX3_freq_min:33000(100kHz)
cli write_eepromreg 0x0b18 0x80
cli write_eepromreg 0x0b19 0xe8
#TX3_freq_max:36000(100kHz)  
cli write_eepromreg 0x0b1a 0x8c
cli write_eepromreg 0x0b1b 0xa0
#TX3_freq_step:500(100kHz) 
cli write_eepromreg 0x0b1c 0x01
cli write_eepromreg 0x0b1d 0xf4

#RX3 PARAM
#RX3_cal_temp:500(0.1 degrees centigrade)
cli write_eepromreg 0x0c00 0x01
cli write_eepromreg 0x0c01 0xF4
#RX3_init_att:500(1/100dB)
cli write_eepromreg 0x0c02 0x01
cli write_eepromreg 0x0c03 0xf4
#RX3_att_min:0(1/100dB)
cli write_eepromreg 0x0c04 0x00
cli write_eepromreg 0x0c05 0x00
#RX3_att_max:3000(1/100dB)
cli write_eepromreg 0x0c06 0x0b
cli write_eepromreg 0x0c07 0xb8
#RX3_att_step:50(1/100dB)
cli write_eepromreg 0x0c08 0x00
cli write_eepromreg 0x0c09 0x32
#RX3_freq_min:33000(100kHz)
cli write_eepromreg 0x0c0a 0x80
cli write_eepromreg 0x0c0b 0xe8
#RX3_freq_max:36000(100kHz)
cli write_eepromreg 0x0c0c 0x8c
cli write_eepromreg 0x0c0d 0xa0
#RX3_freq_step:500(100kHz)
cli write_eepromreg 0x0c0e 0x01
cli write_eepromreg 0x0c0f 0xf4
#RX3_nom_gain:3300(1/10dB)
cli write_eepromreg 0x0c10 0x0c
cli write_eepromreg 0x0c11 0xe4
#RX3_K1G:(1/65535dB/k)
cli write_eepromreg 0x0c20 0x0c
cli write_eepromreg 0x0c21 0xcd
cli write_eepromreg 0x0c22 0x0c
cli write_eepromreg 0x0c23 0xcd

cli write_eepromreg 0x0c24 0x0c
cli write_eepromreg 0x0c25 0xcd
cli write_eepromreg 0x0c26 0x0c
cli write_eepromreg 0x0c27 0xcd
cli write_eepromreg 0x0c28 0x0c
cli write_eepromreg 0x0c29 0xcd

cli write_eepromreg 0x0c2a 0x0c
cli write_eepromreg 0x0c2b 0xcd
cli write_eepromreg 0x0c2c 0x0c
cli write_eepromreg 0x0c2d 0xcd

#RX3_K2G:0(1/65535dB/k)
cli write_eepromreg 0x0c70 0x00
cli write_eepromreg 0x0c71 0x00
#RX3_K3G:0(1/65535dB/k)
cli write_eepromreg 0x0c72 0x00
cli write_eepromreg 0x0c73 0x00
#RX3_G0:1/100dB  3300
cli write_eepromreg 0x0ca0 0x0c
cli write_eepromreg 0x0ca1 0xe4
cli write_eepromreg 0x0ca2 0x0c
cli write_eepromreg 0x0ca3 0xe4

cli write_eepromreg 0x0ca4 0x0c
cli write_eepromreg 0x0ca5 0xe4
cli write_eepromreg 0x0ca6 0x0c
cli write_eepromreg 0x0ca7 0xe4
cli write_eepromreg 0x0ca8 0x0c
cli write_eepromreg 0x0ca9 0xe4

cli write_eepromreg 0x0caa 0x0c
cli write_eepromreg 0x0cab 0xe4
cli write_eepromreg 0x0cac 0x0c
cli write_eepromreg 0x0cad 0xe4

#TX4 PARAM
#TX4_cal_temp:500(0.1 degrees centigrade)
cli write_eepromreg 0x0d00 0x01
cli write_eepromreg 0x0d01 0xF4
#TX4_init_att:1500(1/100dB)
cli write_eepromreg 0x0d02 0x05
cli write_eepromreg 0x0d03 0xdc
#TX4_nom_gain:6100(1/100dB)
cli write_eepromreg 0x0d04 0x17
cli write_eepromreg 0x0d05 0xd4
#TX4_dBfs_power:-1500(1/100dBfs)
cli write_eepromreg 0x0d06 0xfA
cli write_eepromreg 0x0d07 0x24
#tx_max_power:4600(1/100dBm)
cli write_eepromreg 0x0d08 0x11
cli write_eepromreg 0x0d09 0xf8
#TX4_CLGC_gain:200(1/100dB)  
cli write_eepromreg 0x0d0c 0x00
cli write_eepromreg 0x0d0d 0xc8
#TX4_CCDF:800(1/100dB)       
cli write_eepromreg 0x0d0e 0x03
cli write_eepromreg 0x0d0f 0x20
#TX4_DPD_model:140         
cli write_eepromreg 0x0d10 0x00
cli write_eepromreg 0x0d11 0x8e
#TX4_att_min:0(1/100dB)    
cli write_eepromreg 0x0d12 0x00
cli write_eepromreg 0x0d13 0x00
#TX4_att_max:4000(1/100dB) 
cli write_eepromreg 0x0d14 0x0f
cli write_eepromreg 0x0d15 0xa0
#TX4_att_step:10(1/100dB)  
cli write_eepromreg 0x0d16 0x00
cli write_eepromreg 0x0d17 0x0a
#TX4_freq_min:33000(100kHz)
cli write_eepromreg 0x0d18 0x80
cli write_eepromreg 0x0d19 0xe8
#TX4_freq_max:36000(100kHz)
cli write_eepromreg 0x0d1a 0x8c
cli write_eepromreg 0x0d1b 0xa0
#TX4_freq_step:500(100kHz) 
cli write_eepromreg 0x0d1c 0x01
cli write_eepromreg 0x0d1d 0xf4

#RX4 PARAM
#RX4_cal_temp:500(0.1 degrees centigrade)
cli write_eepromreg 0x0e00 0x01
cli write_eepromreg 0x0e01 0xF4
#RX4_init_att:500(1/100dB)
cli write_eepromreg 0x0e02 0x01
cli write_eepromreg 0x0e03 0xf4
#RX4_att_min:0(1/100dB)
cli write_eepromreg 0x0e04 0x00
cli write_eepromreg 0x0e05 0x00
#RX4_att_max:3000(1/100dB)
cli write_eepromreg 0x0e06 0x0b
cli write_eepromreg 0x0e07 0xb8
#RX4_att_step:50(1/100dB)
cli write_eepromreg 0x0e08 0x00
cli write_eepromreg 0x0e09 0x32
#RX4_freq_min:33000(100kHz)
cli write_eepromreg 0x0e0a 0x80
cli write_eepromreg 0x0e0b 0xe8
#RX4_freq_max:36000(100kHz)
cli write_eepromreg 0x0e0c 0x8c
cli write_eepromreg 0x0e0d 0xa0
#RX4_freq_step:500(100kHz)
cli write_eepromreg 0x0e0e 0x01
cli write_eepromreg 0x0e0f 0xf4
#RX4_nom_gain:3300(1/10dB)
cli write_eepromreg 0x0e10 0x0c
cli write_eepromreg 0x0e11 0xe4
#RX4_K1G:(1/65535dB/k) 0.05
cli write_eepromreg 0x0e20 0x0C
cli write_eepromreg 0x0e21 0xCD
cli write_eepromreg 0x0e22 0x0C
cli write_eepromreg 0x0e23 0xCD

cli write_eepromreg 0x0e24 0x0C
cli write_eepromreg 0x0e25 0xCD
cli write_eepromreg 0x0e26 0x0C
cli write_eepromreg 0x0e27 0xCD
cli write_eepromreg 0x0e28 0x0C
cli write_eepromreg 0x0e29 0xCD

cli write_eepromreg 0x0e2a 0x0C
cli write_eepromreg 0x0e2b 0xCD
cli write_eepromreg 0x0e2c 0x0C
cli write_eepromreg 0x0e2d 0xCD

#RX4_K2G:0(1/65535dB/k)
cli write_eepromreg 0x0e70 0x00
cli write_eepromreg 0x0e71 0x00
#RX4_K3G:0(1/65535dB/k)
cli write_eepromreg 0x0e72 0x00
cli write_eepromreg 0x0e73 0x00
#RX4_G0:1/100dB  3300
cli write_eepromreg 0x0ea0 0x0c
cli write_eepromreg 0x0ea1 0xe4
cli write_eepromreg 0x0ea2 0x0c
cli write_eepromreg 0x0ea3 0xe4

cli write_eepromreg 0x0ea4 0x0c
cli write_eepromreg 0x0ea5 0xe4
cli write_eepromreg 0x0ea6 0x0c
cli write_eepromreg 0x0ea7 0xe4
cli write_eepromreg 0x0ea8 0x0c
cli write_eepromreg 0x0ea9 0xe4

cli write_eepromreg 0x0eaa 0x0c
cli write_eepromreg 0x0eab 0xe4
cli write_eepromreg 0x0eac 0x0c
cli write_eepromreg 0x0ead 0xe4
