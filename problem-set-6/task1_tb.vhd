LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- include also the local library for 'str' call 

--             50 Mhz    100 hz       1.1 kHz   125 Mhz
--  divider    2         1 250 000    113 636   1
--  ctr size   2         21           17        1
--

ENTITY task1_tb IS
END task1_tb;
 
ARCHITECTURE behavior OF task1_tb IS 
    COMPONENT task1
    GENERIC(
      DIVIDER: IN natural := 1;
      CTR_SIZE: IN natural := 2
    );
    PORT(
         clk: IN  std_logic;
         changed_clk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs

   signal changed_clk : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 8 ns;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: task1 PORT MAP (
          clk => clk,
          changed_clk => changed_clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
    wait for 200 ns;
   end process;

END;

		
