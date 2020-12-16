library ieee;
use ieee.std_logic_1164.all;
library work;
use work.dadda_package.all;

entity BEU is
port(
a_in: 	in std_logic_vector(k downto 0); -- 33 bits
a2_in:  in std_logic_vector(k downto 0); -- 33 bits
x: 		in std_logic_vector(2 downto 0); -- xj+1, xj, xj-1
sj:		out std_logic;
ppj: 	out std_logic_vector(k downto 0) -- 33 bits

);
end BEU;

architecture structural of BEU is

signal a_s: std_logic_vector(k downto 0):=(others=>'0');
signal a2_s: std_logic_vector(k downto 0):=(others=>'0');
signal x_s: std_logic_vector(2 downto 0):=(others=>'0');

begin

mux:process (x_s, a_s, a2_s)
begin
		case x_s is
			when "000" => ppj <= (others=>'0');
			when "001" => ppj <= a_s;
			when "010" => ppj <= a_s;
			when "011" => ppj <= a2_s;
			when "100" => ppj <= not(a2_s);
			when "101" => ppj <= not(a_s);
			when "110" => ppj <= not(a_s);
			when "111" => ppj <= (others => '1');
			when others => ppj <= (others => '0');
		end case;
	end process;
	x_s<=x;
	a_s<=a_in;
	a2_s<=a2_in;	
	sj<=x_s(2); -- the sign is the MSB of the triplet
end architecture;
