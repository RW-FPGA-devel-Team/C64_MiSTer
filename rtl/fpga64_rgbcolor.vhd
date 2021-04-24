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
-- Multy Palette by NeuroRulez
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
		palette: in std_logic_vector(1 downto 0)
	);
end fpga64_rgbcolor;

-- -----------------------------------------------------------------------

architecture Behavioral of fpga64_rgbcolor is
begin
	process(index,palette)
	begin
	if(palette = "00") then 
		case index is --Default Palette by Rampa
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
			when others => r <= X"00"; g <= X"00"; b <= X"00";
		end case;
	elsif(palette = "01") then
		case index is --CePeCe Palette by NeuroRulez
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
	elsif(palette = "10") then
		case index is --Violety Palette by Pepto
			when X"0" => r <= X"00"; g <= X"00"; b <= X"00";
			when X"1" => r <= X"FF"; g <= X"FF"; b <= X"FF";
			when X"2" => r <= X"68"; g <= X"37"; b <= X"2B";
			when X"3" => r <= X"70"; g <= X"A4"; b <= X"B2";
			when X"4" => r <= X"6F"; g <= X"3D"; b <= X"86";
			when X"5" => r <= X"58"; g <= X"8D"; b <= X"43";
			when X"6" => r <= X"35"; g <= X"28"; b <= X"79";
			when X"7" => r <= X"B8"; g <= X"C7"; b <= X"6F";
			when X"8" => r <= X"6F"; g <= X"4F"; b <= X"25";
			when X"9" => r <= X"43"; g <= X"39"; b <= X"00";
			when X"A" => r <= X"9A"; g <= X"67"; b <= X"59";
			when X"B" => r <= X"44"; g <= X"44"; b <= X"44";
			when X"C" => r <= X"6C"; g <= X"6C"; b <= X"6C";
			when X"D" => r <= X"9A"; g <= X"D2"; b <= X"84";
			when X"E" => r <= X"6C"; g <= X"5E"; b <= X"B5";
			when X"F" => r <= X"95"; g <= X"95"; b <= X"95";
			when others => r <= X"00"; g <= X"00"; b <= X"00";
		end case;	 
	elsif(palette = "11") then
		case index is --Colodore
		 when X"0" => r <= X"00"; g <= X"00"; b <= X"00";
		 when X"1" => r <= X"FF"; g <= X"FF"; b <= X"FF";
		 when X"2" => r <= X"96"; g <= X"28"; b <= X"2E";
		 when X"3" => r <= X"5B"; g <= X"D6"; b <= X"CE";
		 when X"4" => r <= X"9F"; g <= X"2D"; b <= X"AD";
		 when X"5" => r <= X"41"; g <= X"B9"; b <= X"36";
		 when X"6" => r <= X"27"; g <= X"24"; b <= X"C4";
		 when X"7" => r <= X"EF"; g <= X"F3"; b <= X"47";
		 when X"8" => r <= X"9F"; g <= X"48"; b <= X"15";
		 when X"9" => r <= X"5E"; g <= X"35"; b <= X"00";
		 when X"A" => r <= X"DA"; g <= X"5F"; b <= X"66";
		 when X"B" => r <= X"47"; g <= X"47"; b <= X"47";
		 when X"C" => r <= X"78"; g <= X"78"; b <= X"78";
		 when X"D" => r <= X"91"; g <= X"FF"; b <= X"84";
		 when X"E" => r <= X"68"; g <= X"64"; b <= X"FF";
		 when X"F" => r <= X"AE"; g <= X"AE"; b <= X"AE";
		 when others => r <= X"00"; g <= X"00"; b <= X"00";

		end case;	 
	end if;
	end process;
end Behavioral;
