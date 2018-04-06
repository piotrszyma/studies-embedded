LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- include also the local library for 'str' call 
USE ieee.numeric_std.ALL;
--             50 Mhz    100 hz       1.1 kHz
--  divider    2         1 250 000    113 636
--  ctr size   2         21           17
--

ENTITY task2_tb IS
END task2_tb;
 
ARCHITECTURE behavior OF task2_tb IS 
    constant NUM_OF_OUTS: natural := 4;
    COMPONENT task2
    GENERIC(
      NUM_OF_OUTS: IN natural := NUM_OF_OUTS
    );
    PORT(
        clk:     in std_logic;
	      changed_clk : out unsigned(NUM_OF_OUTS - 1 downto 0) := (others => '0')
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs

   signal changed_clk : unsigned(NUM_OF_OUTS - 1 downto 0) := (others => '0');

   -- Clock period definitions
   constant clk_period : time := 8 ns;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: task2 PORT MAP (
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

		
