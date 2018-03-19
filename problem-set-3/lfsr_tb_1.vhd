LIBRARY ieee;
library std;
use std.textio.all;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY lfsr_tb IS
END lfsr_tb;

ARCHITECTURE behavior OF lfsr_tb IS 
 
    -- UUT (Unit Under Test)
    COMPONENT lfsr
    Port ( clk : in  STD_LOGIC;
           q : inout  STD_LOGIC_VECTOR(15 downto 0)
			);
    END COMPONENT;

   signal clk : std_logic := '0';
   -- input/output signal
   signal qq : STD_LOGIC_VECTOR(15 downto 0);

   -- set clock period 
   constant clk_period : time := 20 ns;
 
BEGIN
	-- instantiate UUT
   uut: lfsr PORT MAP (
          clk => clk,
          q   => qq
        );
   
   -- clock management process
   -- no sensitivity list, but uses 'wait'
   clk_process :PROCESS
   BEGIN
		clk <= '0';
		WAIT FOR clk_period/2;
		clk <= '1';
		WAIT FOR clk_period/2;
   END PROCESS;
 
   -- stimulating process
   stim_proc: PROCESS
		  variable l : line;
   		variable c :integer;
  		variable random : STD_LOGIC_VECTOR(7 downto 0);
   BEGIN
       		c := 0;
       		while c < 100 loop
			for i in 0 to 7 loop
				wait for clk_period;
				random(i) := qq(0);
			end loop;
			write (l, to_integer(unsigned(random)));
			writeline (output, l);
			c := c + 1;
			wait for clk_period;
		end loop;
      wait;
   END PROCESS;	
END;
