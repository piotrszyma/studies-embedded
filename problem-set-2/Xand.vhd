library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std;


entity Xand is
	generic(width	: integer:=8);
	-- (	clk	: in std_logic;)
	port(
		A,B	: in std_logic_vector(width-1 downto 0);
		C	: out std_logic_vector(width-1 downto 0)
	);
end Xand;

architecture Behavioral of Xand is
begin
	C <= A and B;
end Behavioral;