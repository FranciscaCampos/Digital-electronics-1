library ieee ;
use ieee.std_logic_1164.all;
-------------------------------------
entity d_ff_arst is
port( clk : in std_logic ;
      arst : in std_logic;
      d  : in std_logic ;
      q : out std_logic ;
      q_bar : out std_logic ) ;
end entity d_ff_arst ;
-------------------------------------
architecture Behavioral of  d_ff_arst is
begin
    p_d_ff : process ( clk , d, arst )
    begin
    
        if(arst = '1') then 
            q <= '0';
        elsif rising_edge(clk) then
            q <= d ;
            q_bar <= not d ;
        end if ;
    end process p_d_ff ;
end architecture Behavioral ;
