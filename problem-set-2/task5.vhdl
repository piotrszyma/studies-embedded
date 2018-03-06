library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity task5 is
port (
  a,b,c,d   : in std_logic;
  x,y,z     : out std_logic
);
end task5;

architecture Synthetic of task5 is
 component gateXOR
   port (X: in std_logic; 
         Y: in std_logic;
	       Z: out std_logic);
 end component;

 component gateNXOR
   port (X: in std_logic; 
         Y: in std_logic;
	       Z: out std_logic);
 end component;

 component gateAND
   port (X: in std_logic; 
         Y: in std_logic;
	       Z: out std_logic);
 end component;

 component gateNAND
   port (X: in std_logic; 
         Y: in std_logic;
	       Z: out std_logic);
 end component;

 component gateHNAND
   port (X: in std_logic; 
         Y: in std_logic;
	       Z: out std_logic);
 end component;

 component gateNOT
   port (X: in std_logic; 
	       Z: out std_logic);
 end component;

--  signal NOT_OR,
--         OR_OR,
-- 		    OR_NOT : std_logic;
-- begin
--  G1: gateNOT port map (a,NOT_OR);
--  G2: gateOR  port map (b,c,OR_OR);
-- -- alternatywne sposoby opisu mapowania portow
--  --G3: gateOR  port map (NOT_OR,OR_OR,OR_NOT);
--  G3: gateOR port map (X => NOT_OR, Y => OR_OR, Z => OR_NOT);
--  G4: gateNOT port map (OR_NOT, x);
-- end Synthetic;

 signal C_D_AND,
        B_C_NXOR,
        A_B_XOR : std_logic;
begin
 
 G1:      gateXOR    port map (a, b, A_B_XOR);
 G2:      gateNXOR   port map (b, c, B_C_NXOR);
 G3:      gateAND    port map (c, d, C_D_AND);
 G_4_OUT: gateNAND   port map (A_B_XOR, B_C_NXOR, x);
 G_5_OUT: gateNOT    port map (B_C_NXOR, y);
 G_6_OUT: gateHNAND  port map (B_C_NXOR, C_D_AND, z);
 
end Synthetic;


