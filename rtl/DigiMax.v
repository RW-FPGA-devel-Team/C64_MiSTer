module digimax
(
	input         clk,
   input         reset_n,
	input         wr_n,
	input   [2:0] addr,
	input   [7:0] data_in,
	output  reg [7:0] dac_0,
	output  reg [7:0] dac_1,
	output  reg [7:0] dac_2,
	output  reg [7:0] dac_3
);


////////////////////////////////////////////////////////////////

always @(posedge clk) begin
   if (!wr_n) begin
	   case (addr)
			3'h0: dac_0 <= data_in;
			3'h1: dac_1 <= data_in;
			3'h2: dac_2 <= data_in;
			3'h3: dac_3 <= data_in;
	   endcase
	end
end

endmodule
