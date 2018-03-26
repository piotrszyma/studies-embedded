
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE work.txt_util.ALL;


entity statemachine2 is
  port(
	clk:     in std_logic;
	pusher:  in std_logic;
	reset:	 in std_logic;
	driver : out std_logic_vector(1 downto 0) := "00"
  );
  
end statemachine2;

architecture Flow of statemachine2 is
  type stan is (S1, S2, S3);
	signal stan_poprzedni : stan := S3;
  signal stan_teraz : stan := S2;
  signal stan_potem : stan := S3;
begin

state_advance: process(clk)
begin
	if rising_edge(clk) then
		stan_poprzedni <= stan_teraz;
		stan_teraz <= stan_potem;
	end if;
end process;

next_state: process(stan_teraz, stan_poprzedni)
begin
		case stan_teraz is
	  when S1 =>
				print("hop");
				stan_potem <= S3;
	  when S2 => 
				print("");
				print("############");
				print("");
				print("tra");
				stan_potem <= S3;
	  when S3 => 
				print("la");
				case stan_poprzedni is
					when S1 =>
						stan_potem <= S2;
					when S2 =>
						stan_potem <= S3;
					when S3 =>
						stan_potem <= S1;
				end case;
   end case;
end process;

end Flow;

