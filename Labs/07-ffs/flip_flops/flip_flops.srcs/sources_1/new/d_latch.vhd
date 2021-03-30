library ieee ;
use ieee.std_logic_1164.all;
-------------------------------------
entity d_latch is
port( en : in std_logic ;
      anrst : in std_logic;
      d  : in std_logic ;
      q : out std_logic ;
      q_bar : out std_logic ) ;
end entity d_latch ;
-------------------------------------
architecture Behavioral of  d_latch is
begin
    p_d_latch : process ( en , d, anrst )
    begin
    
        if(anrst = '1') then 
            q <= '0';
        elsif( en = '1' ) then
            q <= d ;
            q_bar <= not d ;
        end if ;
    end process p_d_latch ;
end architecture Behavioral ;
