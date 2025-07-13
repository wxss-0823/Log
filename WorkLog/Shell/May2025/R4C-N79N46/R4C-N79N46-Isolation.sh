##############################################
## Config Internal Source & Reset Test Single
## Tone. Reset all Rx channel.
##############################################
# 100 M Source & Reset
write_fpgareg 0xa1a 3
set_tx_pll 0 2185
AdrvSetTxTestTone 0 1 0 1 0
AdrvSetTxTestTone 0 2 0 1 0
AdrvSetTxTestTone 0 4 0 1 0
AdrvSetTxTestTone 0 8 0 1 0
# Reset Rx Channel
set_rx_pll 0 1995
AdrvSetRxGainCtrlMode 0 0xf 0
AdrvSetRxGain 0 1 255
AdrvSetRxGain 0 2 255
AdrvSetRxGain 0 4 255
AdrvSetRxGain 0 8 255



# Open CH1, when Tx1 is equal to 0 dBm
AdrvSetRxTxEnable 0 0x5f 0x1
AdrvSetTxAtten 0 1 4000
write_fpgareg 0x29 0x40e
# Measuring Leakage
##############################################
## Tx to Tx Leakage
##############################################
# CH2
write_fpgareg 0x28 0x0800
AdrvGetRxDecPower 0 0x10
# CH3
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x40
# CH4
write_fpgareg 0x28 0x1000
AdrvGetRxDecPower 0 0x40
##############################################
## Tx to Rx Leakage
##############################################
AdrvGetRxDecPower 0 0x1
AdrvGetRxDecPower 0 0x2
AdrvGetRxDecPower 0 0x4
AdrvGetRxDecPower 0 0x8


# Open CH2, when Tx2 is equal to 0 dBm
AdrvSetRxTxEnable 0 0x5f 0x2
AdrvSetTxAtten 0 2 4000
write_fpgareg 0x29 0x40d
# Measuring Leakage
##############################################
## Tx to Tx Leakage
##############################################
# CH1
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x10
# CH3
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x40
# CH4
write_fpgareg 0x28 0x1000
AdrvGetRxDecPower 0 0x40
##############################################
## Tx to Rx Leakage
##############################################
AdrvGetRxDecPower 0 0x1
AdrvGetRxDecPower 0 0x2
AdrvGetRxDecPower 0 0x4
AdrvGetRxDecPower 0 0x8


# Open CH3, when Tx3 is equal to 0 dBm
AdrvSetRxTxEnable 0 0x5f 0x4
AdrvSetTxAtten 0 4 4000
write_fpgareg 0x29 0x40b
# Measuring Leakage
##############################################
## Tx to Tx Leakage
##############################################
# CH1
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x10
# CH2
write_fpgareg 0x28 0x0800
AdrvGetRxDecPower 0 0x10
# CH4
write_fpgareg 0x28 0x1000
AdrvGetRxDecPower 0 0x40
##############################################
## Tx to Rx Leakage
##############################################
AdrvGetRxDecPower 0 0x1
AdrvGetRxDecPower 0 0x2
AdrvGetRxDecPower 0 0x4
AdrvGetRxDecPower 0 0x8



# Open CH4, when Tx3 is equal to 0 dBm
AdrvSetRxTxEnable 0 0x5f 0x8
AdrvSetTxAtten 0 8 4000
write_fpgareg 0x29 0x407
# Measuring Leakage
##############################################
## Tx to Tx Leakage
##############################################
# CH1
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x10
# CH2
write_fpgareg 0x28 0x0800
AdrvGetRxDecPower 0 0x10
# CH3
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x40
##############################################
## Tx to Rx Leakage
##############################################
AdrvGetRxDecPower 0 0x1
AdrvGetRxDecPower 0 0x2
AdrvGetRxDecPower 0 0x4
AdrvGetRxDecPower 0 0x8
##############################################

############################################################################################
## Mapping ORx to Tx
# CH1
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x10
# CH2
write_fpgareg 0x28 0x0800
AdrvGetRxDecPower 0 0x10
# CH3
write_fpgareg 0x28 0x0000
AdrvGetRxDecPower 0 0x40
# CH4
write_fpgareg 0x28 0x1000
AdrvGetRxDecPower 0 0x40