LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- include also the local library for 'str' call 
USE work.txt_util.ALL;

  
ENTITY statemachine2_tb IS
END statemachine2_tb;
 
ARCHITECTURE behavior OF statemachine2_tb IS 
    COMPONENT statemachine2
    PORT(
         clk: IN  std_logic;
         pusher: IN  std_logic;
         reset: IN std_logic;
         driver : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal pusher : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal driver : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: statemachine2 PORT MAP (
          clk => clk,
          pusher => pusher,
          reset => reset,
          driver => driver
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
    wait for clk_period * 6;
   end process;

END;

		
