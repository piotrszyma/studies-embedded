LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- jesli mozliwe, nie uzywac std_logic_unsigned -- nie wspiera standardow
--USE ieee.std_logic_unsigned.ALL;
-- numeric_std i owszem
use ieee.numeric_std.all;
 

ENTITY task5_tb IS
END task5_tb;
 
ARCHITECTURE behavior OF task5_tb IS 
 
    -- deklaracja komponentu Unit Under Test (UUT)
 
    COMPONENT task5 is 
    PORT(
         a : IN  std_logic;
         b : IN  std_logic;
         c : IN  std_logic;
         d : IN  std_logic;
         x : OUT  std_logic;
         y : OUT  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;

    -- inputs
   signal a : std_logic := '0';
   signal b : std_logic := '0';
   signal c : std_logic := '0';
   signal d : std_logic := '0';

   signal abcd : std_logic_vector(3 downto 0) := (others => '0');
   
   -- outputs
   signal x : std_logic;
   signal y : std_logic;
   signal z : std_logic;
   

BEGIN
 
	-- instantiate the Unit Under Test (UUT)
   uut : task5 PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          x => x,
          y => y,
          z => z
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	


      	-- another way to do this... 
      for i in 0 to 15 loop
    -- w zaleznosci od tego, jak zadeklarowano sygnal 'abc',
    --     mozna go zwiekszyc na rozne sposoby
    -- sprawdz, ktory pasuje do ktorej deklaracji
    --  ten:
      abcd <= std_logic_vector( unsigned(abcd) + 1 );
    --  i ten:
      -- abc <= abc + 1;
        a <= abcd(3);
        b <= abcd(2);
        c <= abcd(1);
        d <= abcd(0);
        wait for 10 ns;
      end loop;

      wait;
   end process;

END;
