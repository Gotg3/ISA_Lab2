library ieee;
use ieee.std_logic_1164.all;
library work;
use work.dadda_package.all;

entity BEU_pp17 is
port(
	a_in: 	in std_logic_vector(k-1 downto 0); -- 32 bits
	x: 		in std_logic_vector(2 downto 0); -- xj+1, xj, xj-1
	sj:		out std_logic;
	ppj: 	out std_logic_vector(k-1 downto 0) -- 32 bits

);
end BEU_pp17;

architecture structural of BEU_pp17 is

signal a_s: std_logic_vector(k-1 downto 0):=(others=>'0');
signal x_s: std_logic_vector(2 downto 0):=(others=>'0');

begin

mux:process (x_s, a_s)
begin
		case x_s is
			when "000" => ppj <= (others=>'0');
			when "001" => ppj <= a_s;
			when others => ppj <= (others => '0');
		end case;
	end process;
	
	x_s<=x;
	a_s<=a_in;
	sj<=x_s(2); -- the sign is the MSB of the triplet
end architecture;
