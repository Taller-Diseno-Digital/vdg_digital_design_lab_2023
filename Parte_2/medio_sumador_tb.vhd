library ieee;
use ieee.std_logic_1164.all; 

entity medio_sumador_tb is
end medio_sumador_tb;

architecture tb of medio_sumador_tb is
    signal a, b : std_logic;
    signal sum, carry : std_logic; 
begin
    UUT : entity work.medio_sumador port map (a => a, b => b, s => sum, c => carry);

    a <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    b <= '0', '1' after 40 ns;        
end tb ;