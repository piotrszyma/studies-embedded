

-- bramka XOR
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateXOR is
port (
	X: in std_logic;
	Y: in std_logic;
	Z: out std_logic
);
end gateXOR;

architecture Behavioral of gateXOR is
begin
 Z <= X xor Y after 1 ns;
end Behavioral;



-- bramka NXOR
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateNXOR is
port (
	X: in std_logic;
	Y: in std_logic;
	Z: out std_logic
);
end gateNXOR;

architecture Behavioral of gateNXOR is
begin
 Z <= not(X xor Y) after 1 ns;
end Behavioral;


-- bramka AND
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateAND is
port (
	X: in std_logic;
	Y: in std_logic;
	Z: out std_logic
);
end gateAND;

architecture Behavioral of gateAND is
begin
 Z <= X and Y after 1 ns;
end Behavioral;



-- bramka NAND
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateNAND is
port (
	X: in std_logic;
	Y: in std_logic;
	Z: out std_logic
);
end gateNAND;

architecture Behavioral of gateNAND is
begin
 Z <= not(X and Y) after 1 ns;
end Behavioral;


-- bramka NOT
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateNOT is
port (
	X: in std_logic;
	Z: out std_logic
);
end gateNOT;

architecture Behavioral of gateNOT is
begin
 Z <= not(X) after 1 ns;
end Behavioral;

-- bramka HNAND
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity gateHNAND is
port (
	X: in std_logic;
	Y: in std_logic;
	Z: out std_logic
);
end gateHNAND;

architecture Behavioral of gateHNAND is
begin
 Z <= not(X) and Y after 1 ns;
end Behavioral;
