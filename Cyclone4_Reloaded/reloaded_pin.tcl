set_location_assignment PIN_T2 -to CLK_50M

set_location_assignment PIN_A5 -to LED_USER

#SRAM
set_location_assignment PIN_AB14 -to sram_addr[20]
set_location_assignment PIN_AB13 -to sram_addr[19]
set_location_assignment PIN_E21  -to sram_addr[18]
set_location_assignment PIN_F21  -to sram_addr[17]
set_location_assignment PIN_H21  -to sram_addr[16]
set_location_assignment PIN_J21  -to sram_addr[15]
set_location_assignment PIN_K21 -to sram_addr[14]
set_location_assignment PIN_L21  -to sram_addr[13]
set_location_assignment PIN_M21 -to sram_addr[12]
set_location_assignment PIN_N21  -to sram_addr[11]
set_location_assignment PIN_P21 -to sram_addr[10]
set_location_assignment PIN_R21  -to sram_addr[9]
set_location_assignment PIN_U21  -to sram_addr[8]
set_location_assignment PIN_V21  -to sram_addr[7]
set_location_assignment PIN_W21  -to sram_addr[6]
set_location_assignment PIN_Y21 -to sram_addr[5]
set_location_assignment PIN_AB20 -to sram_addr[4]
set_location_assignment PIN_AB19 -to sram_addr[3]
set_location_assignment PIN_AB18 -to sram_addr[2]
set_location_assignment PIN_AB17 -to sram_addr[1]
set_location_assignment PIN_AB16 -to sram_addr[0]
                        
set_location_assignment PIN_AB15 -to sram_data[7]
set_location_assignment PIN_W22  -to sram_data[6]
set_location_assignment PIN_Y22  -to sram_data[5]
set_location_assignment PIN_AA20 -to sram_data[4]
set_location_assignment PIN_AA19 -to sram_data[3]
set_location_assignment PIN_AA18 -to sram_data[2]
set_location_assignment PIN_AA17 -to sram_data[1]
set_location_assignment PIN_AA16 -to sram_data[0]

set_location_assignment PIN_D21 -to sram_we_n

#SD
set_location_assignment PIN_C22 -to SD_SCK
set_location_assignment PIN_B22 -to SD_CS
set_location_assignment PIN_C21 -to SD_MISO
set_location_assignment PIN_B21 -to SD_MOSI

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
set_location_assignment PIN_L22 -to VGA_R[7]
set_location_assignment PIN_K22 -to VGA_R[6]
set_location_assignment PIN_F1 -to VGA_R[5]
set_location_assignment PIN_D2 -to VGA_R[4]
set_location_assignment PIN_E1 -to VGA_R[3]
set_location_assignment PIN_C2 -to VGA_R[2]
set_location_assignment PIN_C1 -to VGA_R[1]
set_location_assignment PIN_B1 -to VGA_R[0]

set_location_assignment PIN_N22 -to VGA_G[7]
set_location_assignment PIN_M22 -to VGA_G[6]
set_location_assignment PIN_P2 -to VGA_G[5]
set_location_assignment PIN_N2 -to VGA_G[4]
set_location_assignment PIN_M2 -to VGA_G[3]
set_location_assignment PIN_J2 -to VGA_G[2]
set_location_assignment PIN_H2 -to VGA_G[1]
set_location_assignment PIN_F2 -to VGA_G[0]

set_location_assignment PIN_R22 -to VGA_B[7]
set_location_assignment PIN_P22 -to VGA_B[6]
set_location_assignment PIN_R1 -to VGA_B[5]
set_location_assignment PIN_P1 -to VGA_B[4]
set_location_assignment PIN_N1 -to VGA_B[3]
set_location_assignment PIN_M1 -to VGA_B[2]
set_location_assignment PIN_J1 -to VGA_B[1]
set_location_assignment PIN_H1 -to VGA_B[0]

set_location_assignment PIN_B3 -to VGA_HS
set_location_assignment PIN_B2 -to VGA_VS
set_location_assignment PIN_V22 -to VGA_BLANK
set_location_assignment PIN_U22 -to VGA_CLOCK
#PS2
set_location_assignment PIN_M19 -to PS2_CLK
set_location_assignment PIN_M20 -to PS2_DAT
set_location_assignment PIN_N20 -to PS2_MCLK
set_location_assignment PIN_N19 -to PS2_MDAT

#AUDIO_IN
set_location_assignment PIN_A20 -to AUDIO_IN

#STM32
set_location_assignment PIN_A7   -to STM_RST
set_location_assignment PIN_AA15 -to SPI_SS2
set_location_assignment PIN_A10  -to SPI_SCK
set_location_assignment PIN_AA14 -to SPI_DO
set_location_assignment PIN_A9   -to SPI_DI

#JOY
set_location_assignment PIN_B16 -to JOYSTICK1[0]
set_location_assignment PIN_B17 -to JOYSTICK1[1]
set_location_assignment PIN_B18 -to JOYSTICK1[2]
set_location_assignment PIN_B19 -to JOYSTICK1[3]
set_location_assignment PIN_B14 -to JOYSTICK1[4]
set_location_assignment PIN_B13 -to JOYSTICK1[5]

set_location_assignment PIN_B7 -to JOYSTICK2[0]
set_location_assignment PIN_B8 -to JOYSTICK2[1]
set_location_assignment PIN_B9 -to JOYSTICK2[2]
set_location_assignment PIN_B10 -to JOYSTICK2[3]
set_location_assignment PIN_B5 -to JOYSTICK2[4]
set_location_assignment PIN_B4 -to JOYSTICK2[5]

set_location_assignment PIN_A15 -to JOY_SELECT

#I2s
set_location_assignment PIN_E22 -to SCLK
set_location_assignment PIN_J22 -to SDIN
set_location_assignment PIN_H22 -to MCLK
set_location_assignment PIN_F22 -to LRCLK