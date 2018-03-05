LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- jesli mozliwe, nie uzywac std_logic_unsigned -- nie wspiera standardow
--USE ieee.std_logic_unsigned.ALL;
-- numeric_std i owszem
use ieee.numeric_std.all;
 

ENTITY Xand_tb IS
END Xand_tb;
 
ARCHITECTURE behavior OF Xand_tb IS 
 
    -- deklaracja komponentu Unit Under Test (UUT)
 
    COMPONENT Xand is 
    generic (width : integer);
    PORT(
          a : in std_logic_vector(width - 1 downto 0);
          b : in std_logic_vector(width - 1 downto 0);
          c : out std_logic_vector(width - 1 downto 0)
        );
    END COMPONENT;

  
   -- inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   -- output
   signal c : std_logic_vector(3 downto 0) := (others => '0');

BEGIN
 
	-- instantiate the Unit Under Test (UUT)
   uut: Xand is 
   generic map (width => 4)
   PORT MAP (
          a => a,
          b => b,
          c => c
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	


      for i in 0 to 15 loop
        for j in 0 to 15 loop
          B <= std_logic_vector(unsigned(B) + 1);
          wait for 10 ns;
        end loop;
        A <= std_logic_vector(unsigned(A) + 1);
      end loop;

      wait;
   end process;

END;
