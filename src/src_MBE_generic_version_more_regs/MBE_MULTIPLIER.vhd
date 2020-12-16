library ieee;
library work;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use work.dadda_package.all;

ENTITY MBE_MULTIPLIER IS
	PORT (  X: IN STD_LOGIC_VECTOR(k-1 DOWNTO 0);--32 bits
			A: IN STD_LOGIC_VECTOR(k-1 DOWNTO 0);--32 bits
			PROD: OUT STD_LOGIC_VECTOR(k*2-1 DOWNTO 0)--64bits
			);
END MBE_MULTIPLIER;

ARCHITECTURE ARCH OF MBE_MULTIPLIER IS

COMPONENT BEU IS
		PORT (
			a_in: 	in std_logic_vector(k downto 0); -- 33 bits
			a2_in:  in std_logic_vector(k downto 0); -- 33 bits
			x: 		in std_logic_vector(2 downto 0); -- xj+1, xj, xj-1
			sj:		out std_logic;
			ppj: 	out std_logic_vector(k downto 0) -- 33 bits
			);
END COMPONENT;

COMPONENT dadda_tree IS 
	PORT (
			pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,pp16: IN STD_LOGIC_VECTOR(k DOWNTO 0); --33 bit input, row 1
			pp17: IN STD_LOGIC_VECTOR(k-1 DOWNTO 0); --32 bit input row 17
			s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17: IN STD_LOGIC; -- sign pp1 to pp17
			out1: OUT STD_LOGIC_VECTOR(k*2-1 DOWNTO 0); --64 bit out
			out2: OUT STD_LOGIC_VECTOR(k*2-2 DOWNTO 0) --63 bit out
			);
END COMPONENT;

SIGNAL op1,op2,op3,op4,op5,op6,op7,op8,op9,op10,op11,op12,op13,op14,op15,op16,op17: STD_LOGIC_VECTOR(k DOWNTO 0); --33bit
SIGNAL pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,pp16: STD_LOGIC_VECTOR(k DOWNTO 0); --33 bit
SIGNAL pp17: STD_LOGIC_VECTOR(k-1 DOWNTO 0); --32 bits
SIGNAL s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17: STD_LOGIC;
SIGNAL out1: std_logic_vector(k*2-1 DOWNTO 0);--64 bits
SIGNAL out2: std_logic_vector(k*2-2 DOWNTO 0);--63 bits
signal x_ext: std_logic_vector(k+2 downto 0):=(others =>'0'); -- 32 + 3 zeros bits
signal prods: std_logic_vector(k*2-2 downto 0):=(others =>'0'); -- 63 bit 
signal a_sig:  std_logic_vector(k downto 0):=(others=>'0'); --33 bits
signal a_sig_pp17:  std_logic_vector(k-1 downto 0):=(others=>'0'); --32 bits
signal a2_sig: std_logic_vector(k downto 0):=(others=>'0'); --33 bits



BEGIN

x_ext<='0' & '0' & X & '0'; --add zeros
a_sig<= std_logic_vector(resize(unsigned(A), k+1)); -- a 33 bits
a2_sig<=std_logic_vector(shift_left(unsigned(a_sig), 1)); -- x2

BEU1 : BEU PORT MAP( a_sig, a2_sig, x_ext(2 downto 0), s1, op1);
BEU2 : BEU PORT MAP( a_sig, a2_sig, x_ext(4 downto 2), s2, op2);
BEU3 : BEU PORT MAP( a_sig, a2_sig, x_ext(6 downto 4), s3, op3);
BEU4 : BEU PORT MAP( a_sig, a2_sig, x_ext(8 downto 6), s4, op4);
BEU5 : BEU PORT MAP( a_sig, a2_sig, x_ext(10 downto 8), s5, op5);
BEU6 : BEU PORT MAP( a_sig, a2_sig, x_ext(12 downto 10), s6, op6);
BEU7 : BEU PORT MAP( a_sig, a2_sig, x_ext(14 downto 12), s7, op7);
BEU8 : BEU PORT MAP( a_sig, a2_sig, x_ext(16 downto 14), s8, op8);
BEU9 : BEU PORT MAP( a_sig, a2_sig, x_ext(18 downto 16), s9, op9);
BEU10: BEU PORT MAP( a_sig, a2_sig, x_ext(20 downto 18), s10, op10);
BEU11: BEU PORT MAP( a_sig, a2_sig, x_ext(22 downto 20), s11, op11);
BEU12: BEU PORT MAP( a_sig, a2_sig, x_ext(24 downto 22), s12, op12);
BEU13: BEU PORT MAP( a_sig, a2_sig, x_ext(26 downto 24), s13, op13);
BEU14: BEU PORT MAP( a_sig, a2_sig, x_ext(28 downto 26), s14, op14);
BEU15: BEU PORT MAP( a_sig, a2_sig, x_ext(30 downto 28), s15, op15);
BEU16: BEU PORT MAP( a_sig, a2_sig, x_ext(32 downto 30), s16, op16);
BEU17: BEU PORT MAP( a_sig, a2_sig, x_ext(34 downto 32), s17, op17);

pp1 <= op1;
pp2 <= op2;
pp3 <= op3;
pp4 <= op4;
pp5 <= op5;
pp6 <= op6;
pp7 <= op7;
pp8 <= op8;
pp9 <= op9;
pp10 <= op10;
pp11 <= op11;
pp12 <= op12;
pp13 <= op13;
pp14 <= op14;
pp15 <= op15;
pp16 <= op16;
pp17 <= op17(k-1 downto 0); -- (Only 0 or +A)


TREE : dadda_tree PORT MAP(pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,pp16,pp17,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,out1,out2);

prods<=std_logic_vector(unsigned(out1(k*2-1 downto 1))+ unsigned(out2));
		
PROD<=prods & out1(0); --LSB of prod come directly from the LSB of Dadda tree


END ARCH;