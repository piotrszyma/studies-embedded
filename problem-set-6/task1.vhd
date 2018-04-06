
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity task1 is
  GENERIC(
    DIVIDER: IN natural := 0;
    CTR_SIZE: IN natural := 0
  );
  port(
	clk:     in std_logic;
	changed_clk : out std_logic := '0'
  );
  
end task1;

architecture Flow of task1 is
begin

state_advance: process(clk)
variable counter: unsigned(CTR_SIZE downto 0) := (others => '0');
begin
	if clk'event then
    counter := counter + 1;
    if counter = DIVIDER then
      changed_clk <= '1';
    elsif counter = DIVIDER * 2 then
      changed_clk <= '0';
      counter := (others => '0');
    end if;
	end if;
end process;
end Flow;

