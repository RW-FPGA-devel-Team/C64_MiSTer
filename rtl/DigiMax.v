module digimax
(
	input         clk,
   input         reset_n,
	input         wr_n,
	input  [15:0] addr,
	input   [7:0] data_in,
	input         sid_redirect,
   output  reg   sid_sample,
	output  reg [3:0] sid_dm,
	output  reg [7:0] dac_0,
	output  reg [7:0] dac_1,
	output  reg [7:0] dac_2,
	output  reg [7:0] dac_3
);


////////////////////////////////////////////////////////////////

always @(posedge clk) begin
   if (!wr_n) begin
	   sid_sample <= 1'b0;
	   case (addr)
			16'hde00: dac_0 <= data_in;
			16'hde01: dac_1 <= data_in;
			16'hde02: dac_2 <= data_in;
			16'hde03: dac_3 <= data_in;
			16'hdf00: dac_0 <= data_in;
			16'hdf01: dac_1 <= data_in;
			16'hdf02: dac_2 <= data_in;
			16'hdf03: dac_3 <= data_in;
			16'hd418: if (sid_redirect)
						 begin
			            sid_sample <= 1'b1;
							sid_dm <= data_in[3:0];
						 end						
	   endcase
	end
end

endmodule
