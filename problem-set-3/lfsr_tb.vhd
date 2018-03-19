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
   signal q: STD_LOGIC_VECTOR(15 downto 0);
   signal number: STD_LOGIC_VECTOR(7 downto 0);

   -- set clock period 
   constant clk_period : time := 20 ns;
 
BEGIN
	-- instantiate UUT
   uut: lfsr PORT MAP (
          clk => clk,
          q   => q
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
  		variable bufor : STD_LOGIC_VECTOR(7 downto 0);
   BEGIN
          for i in 0 to 7 loop
            wait for clk_period;
            bufor(i) := q(0);
          end loop;
          number <= bufor;
          write (l, to_integer(unsigned(bufor)));
          writeline (output, l);
   END PROCESS;	

END;





