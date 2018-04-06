
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity task2 is
  GENERIC(
    NUM_OF_OUTS: IN natural := 0
  );
  port(
	clk:     in std_logic;
	changed_clk : out unsigned(NUM_OF_OUTS - 1 downto 0) := (others => '0')
  );
  
end task2;

architecture Flow of task2 is
begin

state_advance: process(clk)
variable counter: unsigned(NUM_OF_OUTS - 1 downto 0) := (others => '0');
begin
	if clk'event then
    changed_clk <= counter;
    counter := counter + 1;
	end if;
end process;
end Flow;

