-- -----------------------------------------------------------------------
--
--                                 FPGA 64
--
--     A fully functional commodore 64 implementation in a single FPGA
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
-- -----------------------------------------------------------------------
--
-- C64 palette index to 24 bit RGB color
-- 
-- -----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- -----------------------------------------------------------------------

entity fpga64_rgbcolor is
	port (
		index: in unsigned(3 downto 0);
		r: out unsigned(7 downto 0);
		g: out unsigned(7 downto 0);
		b: out unsigned(7 downto 0);
		palette: in std_logic
	);
end fpga64_rgbcolor;

-- -----------------------------------------------------------------------

architecture Behavioral of fpga64_rgbcolor is
begin
	process(index)
	begin
	if(palette = '0') then 
		case index is
		when X"0" => r <= X"00"; g <= X"00"; b <= X"00";
		when X"1" => r <= X"FF"; g <= X"FF"; b <= X"FF";
		when X"2" => r <= X"81"; g <= X"33"; b <= X"38";
		when X"3" => r <= X"75"; g <= X"ce"; b <= X"c8";
		when X"4" => r <= X"8e"; g <= X"3c"; b <= X"97";
		when X"5" => r <= X"56"; g <= X"ac"; b <= X"4d";
		when X"6" => r <= X"2e"; g <= X"2c"; b <= X"9b";
		when X"7" => r <= X"ed"; g <= X"f1"; b <= X"71";
		when X"8" => r <= X"8e"; g <= X"50"; b <= X"29";
		when X"9" => r <= X"55"; g <= X"38"; b <= X"00";
		when X"A" => r <= X"c4"; g <= X"6c"; b <= X"71";
		when X"B" => r <= X"4a"; g <= X"4a"; b <= X"4a";
		when X"C" => r <= X"7b"; g <= X"7b"; b <= X"7b";
		when X"D" => r <= X"a9"; g <= X"ff"; b <= X"9f";
		when X"E" => r <= X"70"; g <= X"6d"; b <= X"eb";
		when X"F" => r <= X"b2"; g <= X"b2"; b <= X"b2";
		end case;
	elsif(palette = '1') then
		case index is
        when X"0" => r <= X"00"; g <= X"00"; b <= X"00";
        when X"1" => r <= X"FF"; g <= X"FF"; b <= X"FF";
        when X"2" => r <= X"AB"; g <= X"31"; b <= X"26";
        when X"3" => r <= X"66"; g <= X"DA"; b <= X"FF";
        when X"4" => r <= X"BB"; g <= X"3F"; b <= X"B8";
        when X"5" => r <= X"55"; g <= X"CE"; b <= X"58";
        when X"6" => r <= X"1D"; g <= X"0E"; b <= X"97";
        when X"7" => r <= X"EA"; g <= X"F5"; b <= X"7C";
        when X"8" => r <= X"B9"; g <= X"74"; b <= X"18";
        when X"9" => r <= X"78"; g <= X"53"; b <= X"00";
        when X"A" => r <= X"DD"; g <= X"93"; b <= X"87";
        when X"B" => r <= X"5B"; g <= X"5B"; b <= X"5B";
        when X"C" => r <= X"8B"; g <= X"8B"; b <= X"8B";
        when X"D" => r <= X"B0"; g <= X"F4"; b <= X"AC";
        when X"E" => r <= X"AA"; g <= X"9D"; b <= X"EF";
        when X"F" => r <= X"B8"; g <= X"B8"; b <= X"B8";
        when others => r <= X"00"; g <= X"00"; b <= X"00";
        end case;	  
	end if;
	end process;
end Behavioral;
