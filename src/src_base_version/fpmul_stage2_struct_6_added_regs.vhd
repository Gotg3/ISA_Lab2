-- VHDL Entity HAVOC.FPmul_stage2.interface
--
-- Created by
-- Guillermo Marcus, gmarcus@ieee.org
-- using Mentor Graphics FPGA Advantage tools.
--
-- Visit "http://fpga.mty.itesm.mx" for more info.
--
-- 2003-2004. V1.0
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY fpmul_stage2 IS
   PORT( 
      A_EXP           : IN     std_logic_vector (7 DOWNTO 0);
      A_SIG           : IN     std_logic_vector (31 DOWNTO 0);
      B_EXP           : IN     std_logic_vector (7 DOWNTO 0);
      B_SIG           : IN     std_logic_vector (31 DOWNTO 0);
      SIGN_out_stage1 : IN     std_logic;
      clk             : IN     std_logic;
      isINF_stage1    : IN     std_logic;
      isNaN_stage1    : IN     std_logic;
      isZ_tab_stage1  : IN     std_logic;
      EXP_in          : OUT    std_logic_vector (7 DOWNTO 0);
      EXP_neg_stage2  : OUT    std_logic;
      EXP_pos_stage2  : OUT    std_logic;
      SIGN_out_stage2 : OUT    std_logic;
      SIG_in          : OUT    std_logic_vector (27 DOWNTO 0);
      isINF_stage2    : OUT    std_logic;
      isNaN_stage2    : OUT    std_logic;
      isZ_tab_stage2  : OUT    std_logic
   );

-- Declarations

END fpmul_stage2;

--
-- VHDL Architecture HAVOC.FPmul_stage2.struct
--
-- Created by
-- Guillermo Marcus, gmarcus@ieee.org
-- using Mentor Graphics FPGA Advantage tools.
--
-- Visit "http://fpga.mty.itesm.mx" for more info.
--
-- Copyright 2003-2004. V1.0
--


LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ARCHITECTURE struct OF fpmul_stage2 IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL EXP_in_int  : std_logic_vector(7 DOWNTO 0);
   SIGNAL EXP_neg_int : std_logic;
   SIGNAL EXP_pos_int : std_logic;
   SIGNAL SIG_in_int  : std_logic_vector(27 DOWNTO 0);
   SIGNAL dout        : std_logic;
   SIGNAL dout1       : std_logic_vector(7 DOWNTO 0);
   SIGNAL prod        : std_logic_vector(63 DOWNTO 0);
   -- Signals for new first regs
   signal isINF_stage2s_1    : std_logic;
   signal isNaN_stage2s_1   : std_logic;
   signal isZ_tab_stage2s_1 : std_logic;
   signal SIGN_out_stage2s_1: std_logic;
   
   signal EXP_ins_1: std_logic_vector(7 DOWNTO 0);
   SIGNAL EXP_pos_stage2s_1: std_logic;
   SIGNAL EXP_neg_stage2s_1: std_logic;
   signal SIG_ins_1 : std_logic_vector(27 DOWNTO 0);
	
	--Signals for new second regs
   
   signal isINF_stage2s_2    : std_logic;
   signal isNaN_stage2s_2   : std_logic;
   signal isZ_tab_stage2s_2  : std_logic;
   signal SIGN_out_stage2s_2: std_logic;
   
   signal EXP_ins_2: std_logic_vector(7 DOWNTO 0);
   SIGNAL EXP_pos_stage2s_2: std_logic;
   SIGNAL EXP_neg_stage2s_2: std_logic;
   signal SIG_ins_2 : std_logic_vector(27 DOWNTO 0);
	
		--Signals for new third regs
   
   signal isINF_stage2s_3    : std_logic;
   signal isNaN_stage2s_3   : std_logic;
   signal isZ_tab_stage2s_3  : std_logic;
   signal SIGN_out_stage2s_3: std_logic;
   
   signal EXP_ins_3: std_logic_vector(7 DOWNTO 0);
   SIGNAL EXP_pos_stage2s_3: std_logic;
   SIGNAL EXP_neg_stage2s_3: std_logic;
   signal SIG_ins_3 : std_logic_vector(27 DOWNTO 0);
   
		--Signals for new 4th regs
		
   signal isINF_stage2s_4    : std_logic;
   signal isNaN_stage2s_4   : std_logic;
   signal isZ_tab_stage2s_4  : std_logic;
   signal SIGN_out_stage2s_4: std_logic;
   
   signal EXP_ins_4: std_logic_vector(7 DOWNTO 0);
   SIGNAL EXP_pos_stage2s_4: std_logic;
   SIGNAL EXP_neg_stage2s_4: std_logic;
   signal SIG_ins_4 : std_logic_vector(27 DOWNTO 0);
   
   		--Signals for new 5th regs
		
   signal isINF_stage2s_5    : std_logic;
   signal isNaN_stage2s_5   : std_logic;
   signal isZ_tab_stage2s_5  : std_logic;
   signal SIGN_out_stage2s_5: std_logic;
   
   signal EXP_ins_5: std_logic_vector(7 DOWNTO 0);
   SIGNAL EXP_pos_stage2s_5: std_logic;
   SIGNAL EXP_neg_stage2s_5: std_logic;
   signal SIG_ins_5 : std_logic_vector(27 DOWNTO 0);
   
   		--Signals for new 6th regs
		
   signal isINF_stage2s_6    : std_logic;
   signal isNaN_stage2s_6  : std_logic;
   signal isZ_tab_stage2s_6  : std_logic;
   signal SIGN_out_stage2s_6: std_logic;
   
   signal EXP_ins_6: std_logic_vector(7 DOWNTO 0);
   SIGNAL EXP_pos_stage2s_6: std_logic;
   SIGNAL EXP_neg_stage2s_6: std_logic;
   signal SIG_ins_6 : std_logic_vector(27 DOWNTO 0);
   
   
   
BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 sig
   -- eb1 1
   SIG_in_int <= prod(47 DOWNTO 20);

   -- HDL Embedded Text Block 2 inv
   -- eb5 5
   EXP_in_int <= (NOT dout1(7)) & dout1(6 DOWNTO 0);

   -- HDL Embedded Text Block 3 latch
   -- eb2 2
   
   PROCESS(clk)
   BEGIN
      IF RISING_EDGE(clk) THEN
         EXP_ins_1 <= EXP_in_int;
         SIG_ins_1 <= SIG_in_int;
         EXP_pos_stage2s_1 <= EXP_pos_int;
         EXP_neg_stage2s_1 <= EXP_neg_int;
      END IF;
   END PROCESS;

   -- HDL Embedded Text Block 4 latch2
   -- latch2 4
   PROCESS(clk)
   BEGIN
      IF RISING_EDGE(clk) THEN
         isINF_stage2s_1 <= isINF_stage1;
         isNaN_stage2s_1 <= isNaN_stage1;
         isZ_tab_stage2s_1 <= isZ_tab_stage1;
         SIGN_out_stage2s_1 <= SIGN_out_stage1;
      END IF;
   END PROCESS;
   
	
	
	
	   -----------------------NEW FIRST REG---------------------------
   
   process(clk)  -- isolated signals
   begin	
		if CLK'event and CLK = '1' then	
			isINF_stage2s_2 <= isINF_stage2s_1; 
			isNaN_stage2s_2 <=	isNaN_stage2s_1;  
			isZ_tab_stage2s_2 <= isZ_tab_stage2s_1;					
		   SIGN_out_stage2s_2 <=  SIGN_out_stage2s_1;	
		end if;
	end process;
	
	process (clk) -- out add1 signals, EXP_pos_int, EXP_pos_int
	begin
		if CLK'event and CLK = '1' then	
			EXP_ins_2 <= EXP_ins_1;
			SIG_ins_2 <= SIG_ins_1;
		    EXP_neg_stage2s_2 <= EXP_neg_stage2s_1;
		    EXP_pos_stage2s_2 <= EXP_pos_stage2s_1;
		end if;
	end process;
	

   -----------------------NEW SECOND REG---------------------------
   
   process(clk)  -- isolated signals
   begin	
		if CLK'event and CLK = '1' then	
			isINF_stage2s_3 <= isINF_stage2s_2; 
			isNaN_stage2s_3 <=	isNaN_stage2s_2;  
			isZ_tab_stage2s_3 <= isZ_tab_stage2s_2;					
		   SIGN_out_stage2s_3 <=  SIGN_out_stage2s_2;	
		end if;
	end process;
	
	process (clk) -- out add1 signals, EXP_pos_int, EXP_pos_int
	begin
		if CLK'event and CLK = '1' then	
			EXP_ins_3 <= EXP_ins_2;
			SIG_ins_3 <= SIG_ins_2;
		    EXP_neg_stage2s_3 <= EXP_neg_stage2s_2;
		    EXP_pos_stage2s_3 <= EXP_pos_stage2s_2;
		end if;
	end process;
	
	 -----------------------NEW THIRD REG---------------------------
	process(clk)  -- isolated signals
   begin	
		if CLK'event and CLK = '1' then	
			isINF_stage2s_4 <= isINF_stage2s_3; 
			isNaN_stage2s_4 <=	isNaN_stage2s_3;  
			isZ_tab_stage2s_4 <= isZ_tab_stage2s_3;					
		   SIGN_out_stage2s_4 <=  SIGN_out_stage2s_3;	
		end if;
	end process;
	
	process (clk) -- out add1 signals, EXP_pos_int, EXP_pos_int
	begin
		if CLK'event and CLK = '1' then	
			EXP_ins_4 <= EXP_ins_3;
			SIG_ins_4 <= SIG_ins_3;
		    EXP_neg_stage2s_4 <= EXP_neg_stage2s_3;
		    EXP_pos_stage2s_4 <= EXP_pos_stage2s_3;
		end if;
	end process;
   
	
	-----------------------NEW 4TH REGs---------------------------
	
	process(clk)  -- isolated signals
   begin	
		if CLK'event and CLK = '1' then	
			isINF_stage2s_5 <= isINF_stage2s_4; 
			isNaN_stage2s_5 <=	isNaN_stage2s_4;  
			isZ_tab_stage2s_5 <= isZ_tab_stage2s_4;					
		   SIGN_out_stage2s_5 <=  SIGN_out_stage2s_4;	
		end if;
	end process;
	
	process (clk) -- out add1 signals, EXP_pos_int, EXP_pos_int
	begin
		if CLK'event and CLK = '1' then	
			EXP_ins_5 <= EXP_ins_4;
			SIG_ins_5 <= SIG_ins_4;
		    EXP_neg_stage2s_5 <= EXP_neg_stage2s_4;
		    EXP_pos_stage2s_5 <= EXP_pos_stage2s_4;
		end if;
	end process;
	
	
		-----------------------NEW 5TH REGs---------------------------
	
	process(clk)  -- isolated signals
   begin	
		if CLK'event and CLK = '1' then	
			isINF_stage2s_6 <= isINF_stage2s_5; 
			isNaN_stage2s_6<=	isNaN_stage2s_5;  
			isZ_tab_stage2s_6 <= isZ_tab_stage2s_5;					
		   SIGN_out_stage2s_6<=  SIGN_out_stage2s_5;	
		end if;
	end process;
	
	process (clk) -- out add1 signals, EXP_pos_int, EXP_pos_int
	begin
		if CLK'event and CLK = '1' then	
			EXP_ins_6 <= EXP_ins_5;
			SIG_ins_6 <= SIG_ins_5;
		    EXP_neg_stage2s_6 <= EXP_neg_stage2s_5;
		    EXP_pos_stage2s_6 <= EXP_pos_stage2s_5;
		end if;
	end process;
	
	
	-----------------------NEW 6TH REGs---------------------------
	
	process(clk)  -- isolated signals
   begin	
		if CLK'event and CLK = '1' then	
			isINF_stage2 <= isINF_stage2s_6; 
			isNaN_stage2 <=	isNaN_stage2s_6;  
			isZ_tab_stage2 <= isZ_tab_stage2s_6;					
		   SIGN_out_stage2 <=  SIGN_out_stage2s_6;	
		end if;
	end process;
	
	process (clk) -- out add1 signals, EXP_pos_int, EXP_pos_int
	begin
		if CLK'event and CLK = '1' then	
			EXP_in <= EXP_ins_6;
			SIG_in <= SIG_ins_6;
		    EXP_neg_stage2 <= EXP_neg_stage2s_6;
		    EXP_pos_stage2 <= EXP_pos_stage2s_6;
		end if;
	end process;
	
	

	-----------------------------------------------------------
	
	
	
	
	
	
	
		

   -- HDL Embedded Text Block 5 eb1
   -- exp_pos 5
   EXP_pos_int <= A_EXP(7) AND B_EXP(7);
--   EXP_neg_int <= NOT(A_EXP(7) OR B_EXP(7));
   EXP_neg_int <= '1' WHEN ( (A_EXP(7)='0' AND NOT (A_EXP=X"7F")) AND (B_EXP(7)='0' AND NOT (B_EXP=X"7F")) ) ELSE '0';


   -- ModuleWare code(v1.1) for instance 'I4' of 'add'
   I4combo: PROCESS (A_EXP, B_EXP, dout)
   VARIABLE mw_I4t0 : std_logic_vector(8 DOWNTO 0);
   VARIABLE mw_I4t1 : std_logic_vector(8 DOWNTO 0);
   VARIABLE mw_I4sum : unsigned(8 DOWNTO 0);
   VARIABLE mw_I4carry : std_logic;
   BEGIN
      mw_I4t0 := '0' & A_EXP;
      mw_I4t1 := '0' & B_EXP;
      mw_I4carry := dout;
      mw_I4sum := unsigned(mw_I4t0) + unsigned(mw_I4t1) + mw_I4carry;
      dout1 <= conv_std_logic_vector(mw_I4sum(7 DOWNTO 0),8);
   END PROCESS I4combo;

   -- ModuleWare code(v1.1) for instance 'I2' of 'mult'
   I2combo : PROCESS (A_SIG, B_SIG)
   VARIABLE dtemp : unsigned(63 DOWNTO 0);
   BEGIN
      dtemp := (unsigned(A_SIG) * unsigned(B_SIG));
      prod <= std_logic_vector(dtemp);
   END PROCESS I2combo;

   -- ModuleWare code(v1.1) for instance 'I6' of 'vdd'
   dout <= '1';

   -- Instance port mappings.

END struct;
