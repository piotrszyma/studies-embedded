library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;


entity Xand is
	generic(width	: integer:=8);
	-- (	clk	: in std_logic;)
	port(
		a, b	: in std_logic_vector(width-1 downto 0);
		c	: out std_logic_vector(width-1 downto 0)
	);
end Xand;

architecture Behavioral of Xand is
begin
	c <= a and b;
end Behavioral;
