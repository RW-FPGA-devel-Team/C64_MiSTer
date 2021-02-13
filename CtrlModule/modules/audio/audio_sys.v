module audio_sys
(
	input         clk_audio,
	input         reset,
	input  [15:0] L_data,
	input  [15:0] R_data,
	input         S_data,
	input   [1:0] audio_mix,
	output        dac_SCLK,
	output        dac_LRCK,
	output        dac_SDIN,
	output        sigma_L,
	output        sigma_R
);

wire spdif;
wire [15:0] alsa_l, alsa_r;

reg [31:0] aflt_rate = 7056000;
reg [39:0] acx  = 4258969;
reg  [7:0] acx0 = 3;
reg  [7:0] acx1 = 3;
reg  [7:0] acx2 = 1;
reg [23:0] acy0 = -24'd6216759;
reg [23:0] acy1 =  24'd6143386;
reg [23:0] acy2 = -24'd2023767;
reg        areset = 0;

audio_out audio_out
(
	.reset(reset | areset),
	.clk(clk_audio),

	.att(vol_att),
	.mix(audio_mix),
	.sample_rate(audio_96k),

	.flt_rate(aflt_rate),
	.cx(acx),
	.cx0(acx0),
	.cx1(acx1),
	.cx2(acx2),
	.cy0(acy0),
	.cy1(acy1),
	.cy2(acy2),

	.is_signed(S_data),
	.core_l(L_data),
	.core_r(R_data),

	.alsa_l(alsa_l),
	.alsa_r(alsa_r),

	.i2s_bclk(dac_SCLK),
	.i2s_lrclk(dac_LRCK),
	.i2s_data(dac_SDIN),
	.dac_l(sigma_L),
	.dac_r(sigma_R),
	.spdif(spdif)
);


endmodule