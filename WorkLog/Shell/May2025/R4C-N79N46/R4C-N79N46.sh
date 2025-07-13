##############################################
## R4C-N79N46
##############################################
## Version Management
##############################################
## Upgrade
q
serverip@ 192.168.35.117
cd /mnt/flash/upgrade/
dow nr_fpga.gew_250710.zip
mv nr_fpga.gew_250710.zip nr_fpga.gew.zip
burn_fpga
hwb
##############################################
## Link Delay Check
AdrvGetExternalPathDelay 0 1
AdrvGetExternalPathDelay 0 2
AdrvGetExternalPathDelay 0 4
AdrvGetExternalPathDelay 0 8
##############################################
## Optical Port In-place Check
# 1
m00_axi_read 0x2b0
m00_axi_read 0x2d0
m00_axi_read 0x2f0
m00_axi_read 0x310
# 1 ? Optical
m00_axi_read 0x2c0
m00_axi_read 0x2e0
m00_axi_read 0x300
m00_axi_read 0x320

CH1--CH4
m00_axi_read 0x203
m00_axi_read 0x204

m00_axi_read 0x213
m00_axi_read 0x214

m00_axi_read 0x223
m00_axi_read 0x224

m00_axi_read 0x233
m00_axi_read 0x234
##############################################

## TX Single Tone Test
##############################################
## CH1 TX FB
get_tx_pll 0 
AdrvSetTxTestTone 0 1 1 1 0
AdrvSetRxTxEnable 0 0x10 0x1
AdrvSetTxAtten 0 1 15000
write_fpgareg 0x29 0x40e
write_fpgareg 0x28 0x0000
AdrvSetRxGain 0 0x10 215
AdrvGetRxDecPower 0 0x10 
AdrvSetRxTxEnable 0 0 0

## CH2 TX FB
AdrvSetTxTestTone 0 2 1 1 0
AdrvSetRxTxEnable 0 0x10 0x2
AdrvSetTxAtten 0 2 15000
AdrvSetRxGain 0 0x10 215
write_fpgareg 0x29 0x40d
write_fpgareg 0x28 0x0800
AdrvGetRxDecPower 0 0x10
AdrvSetRxTxEnable 0 0 0

## CH3 TX FB
AdrvSetTxTestTone 0 4 1 1 0
AdrvSetRxTxEnable 0 0x40 0x4
AdrvSetTxAtten 0 4 15000
AdrvSetRxGain 0 0x40 215
write_fpgareg 0x29 0x40b
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x40
AdrvSetRxTxEnable 0 0 0

## CH4 TXFB
AdrvSetTxTestTone 0 8 1 1 0
AdrvSetRxTxEnable 0 0x40 0x8
AdrvSetTxAtten 0 8 15000
AdrvSetRxGain 0 0x40 215
write_fpgareg 0x29 0x407
write_fpgareg 0x28 0x1000
AdrvGetRxDecPower 0 0x40
AdrvSetRxTxEnable 0 0 0

##############################################
## 100 M Internal Source Test
##############################################
## 100 M Source
write_fpgareg 0xa1a 3
set_tx_pll 0 2185
AdrvSetTxTestTone 0 1 0 1 0
AdrvSetTxTestTone 0 2 0 1 0
AdrvSetTxTestTone 0 4 0 1 0
AdrvSetTxTestTone 0 8 0 1 0
AdrvSetRxTxEnable 0 0 0

## CH1 TX FB
AdrvSetRxTxEnable 0 0x10 0x1
AdrvSetRxGain 0 0x10 215
AdrvSetTxAtten 0 1 4000
write_fpgareg 0x29 0x40e
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x10
AdrvSetRxTxEnable 0 0 0

## CH2 TX FB
AdrvSetRxTxEnable 0 0x10 0x2
AdrvSetTxAtten 0 2 4000
AdrvSetRxGain 0 0x10 215
write_fpgareg 0x29 0x40d
write_fpgareg 0x28 0x0800
AdrvGetRxDecPower 0 0x10
AdrvSetRxTxEnable 0 0 0

## CH3 TX FB
AdrvSetRxTxEnable 0 0x40 0x4
AdrvSetTxAtten 0 4 4000
AdrvSetRxGain 0 0x40 215
write_fpgareg 0x29 0x40b
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x40
AdrvSetRxTxEnable 0 0 0

## CH4 TX FB
AdrvSetRxTxEnable 0 0x40 0x8
AdrvSetTxAtten 0 8 4000
AdrvSetRxGain 0 0x40 215
write_fpgareg 0x29 0x407
write_fpgareg 0x28 0x1000
AdrvGetRxDecPower 0 0x40
AdrvSetRxTxEnable 0 0 0

## Rx Single Tone Test
get_rx_pll 0
## Open ADRV's all Rx Link
AdrvSetRxGainCtrlMode 0 0xf 0
AdrvSetRxTxEnable 0 0xf 0
AdrvSetRxGain 0 1 235
AdrvSetRxGain 0 2 235
AdrvSetRxGain 0 4 235
AdrvSetRxGain 0 8 235
AdrvGetRxDecPower 0 0x1
AdrvGetRxDecPower 0 0x2
AdrvGetRxDecPower 0 0x4
AdrvGetRxDecPower 0 0x8
get_rssi

## Isolation
write_fpgareg 0x29 0x400
write_fpgareg 0x28 0x0000
AdrvSetRxTxEnable 0 0 0xf
AdrvInitCalsRun 0 0x200800 1
AdrvGetExternalPathDelay 0 1
AdrvInitCalsRun 0 0x200800 2
AdrvGetExternalPathDelay 0 2
AdrvInitCalsRun 0 0x200800 4
AdrvGetExternalPathDelay 0 4
AdrvInitCalsRun 0 0x200800 8
AdrvGetExternalPathDelay 0 8
AdrvSetTrackCalsEnable 0 0xffffff 1
AdrvGetTrackCalsEnable 0
AdrvSetRxGain 0 0x10 255
AdrvSetRxGain 0 0x20 255
AdrvSetRxGain 0 0x40 255
AdrvSetRxGain 0 0x80 255
AdrvSetTxTestTone 0 0xf 1 1 0
AdrvGetClgcStatus 0 0x1
AdrvGetClgcStatus 0 0x2
AdrvGetClgcStatus 0 0x4
AdrvGetClgcStatus 0 0x8
AdrvSetTxTestTone 0 1 0 1 0


##############################################
## Comments
##############################################
##TX测试
get_tx_pll 0                 		# 2185
AdrvSetTxTestTone 0 1 1 1 0  		# Set test single tone signal, interval 1M, gain: 0 -18dBFs; 1 -12dBFs
AdrvGetTxTestTone 0 1
AdrvSetRxTxEnable 0 0x10 0x1  		# Open Tx1
AdrvGetRxTxEnable 0
AdrvSetTxAtten 0 1 15000
write_fpgareg 0x29 0x40e  			# Enable TX1 LNA

write_fpgareg 0x28 0x0000 			# Switch ORx1 to TX
AdrvSetRxGain 0 0x10 215
AdrvGetRxDecPower 0 0x10         	# Statistic FB power

AdrvGetTxRadioCtrlCfg 0 1        	# View Tx control mode 0:SPI 1:GPIO
AdrvGetTxToOrxMapping 0 0x10     	# Config ORx-Mappingto-Tx
AdrvGetOrxRadioCtrlCfg 0 1      	# View ORx control mode 0:SPI 1:GPIO 


