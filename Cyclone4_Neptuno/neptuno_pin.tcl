#Basic Global Defines
set_global_assignment -name GENERATE_RBF_FILE ON
set_global_assignment -name ON_CHIP_BITSTREAM_DECOMPRESSION OFF

#Clock & LED
set_location_assignment PIN_T2 -to CLK_50M
set_location_assignment PIN_E4 -to LED_USER

#SRAM
set_location_assignment PIN_AB15 -to SRAM_ADDR[20]
set_location_assignment PIN_U21 -to SRAM_ADDR[19]
set_location_assignment PIN_A17 -to SRAM_ADDR[18]
set_location_assignment PIN_B18 -to SRAM_ADDR[17]
set_location_assignment PIN_A18 -to SRAM_ADDR[16]
set_location_assignment PIN_A19 -to SRAM_ADDR[15]
set_location_assignment PIN_A5 -to SRAM_ADDR[14]
set_location_assignment PIN_A15 -to SRAM_ADDR[13]
set_location_assignment PIN_B6 -to SRAM_ADDR[12]
set_location_assignment PIN_A14 -to SRAM_ADDR[11]
set_location_assignment PIN_A8 -to SRAM_ADDR[10]
set_location_assignment PIN_B13 -to SRAM_ADDR[9]
set_location_assignment PIN_B10 -to SRAM_ADDR[8]
set_location_assignment PIN_B14 -to SRAM_ADDR[7]
set_location_assignment PIN_B15 -to SRAM_ADDR[6]
set_location_assignment PIN_B9 -to SRAM_ADDR[5]
set_location_assignment PIN_A7 -to SRAM_ADDR[4]
set_location_assignment PIN_A6 -to SRAM_ADDR[3]
set_location_assignment PIN_B5 -to SRAM_ADDR[2]
set_location_assignment PIN_C3 -to SRAM_ADDR[1]
set_location_assignment PIN_A4 -to SRAM_ADDR[0]

set_location_assignment PIN_F21 -to SRAM_DATA[15]
set_location_assignment PIN_J22 -to SRAM_DATA[14]
set_location_assignment PIN_L21 -to SRAM_DATA[13]
set_location_assignment PIN_M22 -to SRAM_DATA[12]
set_location_assignment PIN_L22 -to SRAM_DATA[11]
set_location_assignment PIN_H22 -to SRAM_DATA[10]
set_location_assignment PIN_H21 -to SRAM_DATA[9]
set_location_assignment PIN_F22 -to SRAM_DATA[8]                        
set_location_assignment PIN_B17 -to SRAM_DATA[7]
set_location_assignment PIN_A16 -to SRAM_DATA[6]
set_location_assignment PIN_B16 -to SRAM_DATA[5]
set_location_assignment PIN_C4 -to SRAM_DATA[4]
set_location_assignment PIN_A9 -to SRAM_DATA[3]
set_location_assignment PIN_B8 -to SRAM_DATA[2]
set_location_assignment PIN_A13 -to SRAM_DATA[1]
set_location_assignment PIN_B7 -to SRAM_DATA[0]

set_location_assignment PIN_A10 -to SRAM_WE_N
set_location_assignment PIN_AA20 -to SRAM_OE_N
set_location_assignment PIN_AA16 -to SRAM_LB_N
set_location_assignment PIN_R2 -to SRAM_UB_N

#SD
set_location_assignment PIN_E22 -to SD_SCK
set_location_assignment PIN_D22 -to SD_CS
set_location_assignment PIN_E21 -to SD_MISO
set_location_assignment PIN_D21 -to SD_MOSI

#SDRAM
set_location_assignment PIN_V6 -to SDRAM_A[12]
set_location_assignment PIN_Y4 -to SDRAM_A[11]
set_location_assignment PIN_W1 -to SDRAM_A[10]
set_location_assignment PIN_V5 -to SDRAM_A[9]
set_location_assignment PIN_Y3 -to SDRAM_A[8]
set_location_assignment PIN_AA1 -to SDRAM_A[7]
set_location_assignment PIN_Y2 -to SDRAM_A[6]
set_location_assignment PIN_V4 -to SDRAM_A[5]
set_location_assignment PIN_V3 -to SDRAM_A[4]
set_location_assignment PIN_U1 -to SDRAM_A[3]
set_location_assignment PIN_U2 -to SDRAM_A[2]
set_location_assignment PIN_V1 -to SDRAM_A[1]
set_location_assignment PIN_V2 -to SDRAM_A[0]

set_location_assignment PIN_V11 -to SDRAM_DQ[15]
set_location_assignment PIN_W10 -to SDRAM_DQ[14]
set_location_assignment PIN_Y10 -to SDRAM_DQ[13]
set_location_assignment PIN_V10 -to SDRAM_DQ[12]
set_location_assignment PIN_V9 -to SDRAM_DQ[11]
set_location_assignment PIN_Y8 -to SDRAM_DQ[10]
set_location_assignment PIN_W8 -to SDRAM_DQ[9]
set_location_assignment PIN_Y7 -to SDRAM_DQ[8]
set_location_assignment PIN_AB5 -to SDRAM_DQ[7]
set_location_assignment PIN_AA7 -to SDRAM_DQ[6]
set_location_assignment PIN_AB7 -to SDRAM_DQ[5]
set_location_assignment PIN_AA8 -to SDRAM_DQ[4]
set_location_assignment PIN_AB8 -to SDRAM_DQ[3]
set_location_assignment PIN_AA9 -to SDRAM_DQ[2]
set_location_assignment PIN_AB9 -to SDRAM_DQ[1]
set_location_assignment PIN_AA10 -to SDRAM_DQ[0]

set_location_assignment PIN_W2 -to SDRAM_BA[1]
set_location_assignment PIN_Y1 -to SDRAM_BA[0]

set_location_assignment PIN_AA4 -to SDRAM_nCAS
set_location_assignment PIN_W6 -to SDRAM_CKE
set_location_assignment PIN_Y6 -to SDRAM_CLK
set_location_assignment PIN_AA3 -to SDRAM_nCS

set_location_assignment PIN_AA5 -to SDRAM_DQML
set_location_assignment PIN_W7 -to SDRAM_DQMH

set_location_assignment PIN_AB3 -to SDRAM_nRAS
set_location_assignment PIN_AB4 -to SDRAM_nWE

#VGA
set_location_assignment PIN_F1 -to VGA_R[7]
set_location_assignment PIN_D2 -to VGA_R[6]
set_location_assignment PIN_E1 -to VGA_R[5]
set_location_assignment PIN_C2 -to VGA_R[4]
set_location_assignment PIN_C1 -to VGA_R[3]
set_location_assignment PIN_B1 -to VGA_R[2]
set_location_assignment PIN_P2 -to VGA_G[7]
set_location_assignment PIN_N2 -to VGA_G[6]
set_location_assignment PIN_M2 -to VGA_G[5]
set_location_assignment PIN_J2 -to VGA_G[4]
set_location_assignment PIN_H2 -to VGA_G[3]
set_location_assignment PIN_F2 -to VGA_G[2]
set_location_assignment PIN_R1 -to VGA_B[7]
set_location_assignment PIN_P1 -to VGA_B[6]
set_location_assignment PIN_N1 -to VGA_B[5]
set_location_assignment PIN_M1 -to VGA_B[4]
set_location_assignment PIN_J1 -to VGA_B[3]
set_location_assignment PIN_H1 -to VGA_B[2]
set_location_assignment PIN_B3 -to VGA_HS
set_location_assignment PIN_B2 -to VGA_VS

#PS2
set_location_assignment PIN_N19 -to PS2_CLK
set_location_assignment PIN_N20 -to PS2_DAT
set_location_assignment PIN_C21 -to PS2_MCLK
set_location_assignment PIN_B21 -to PS2_MDAT

#UART
set_location_assignment PIN_K21 -to UART_RX
set_location_assignment PIN_J21 -to UART_TX

# AUDIO SIGGMADELTA
set_location_assignment PIN_A3 -to AUDSG_L
set_location_assignment PIN_B4 -to AUDSG_R

#AUDIO_IN
set_location_assignment PIN_AA13 -to AUDIO_IN

#STM32
set_location_assignment PIN_Y21 -to STM_RST
set_location_assignment PIN_N22 -to SPI_SS2
set_location_assignment PIN_N21 -to SPI_SCK
set_location_assignment PIN_M21 -to SPI_DO
set_location_assignment PIN_K22 -to SPI_DI

#JOY
set_location_assignment PIN_A20 -to JOY_CLK
set_location_assignment PIN_B20 -to JOY_LOAD
set_location_assignment PIN_B19 -to JOY_DATA
set_location_assignment PIN_AA18 -to JOY_SELECT

set_location_assignment PIN_M20 -to SCLK
set_location_assignment PIN_AB14 -to LRCLK
set_location_assignment PIN_AA15 -to SDIN
