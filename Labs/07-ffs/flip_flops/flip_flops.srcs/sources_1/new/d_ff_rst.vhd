library ieee ;
use ieee.std_logic_1164.all;
-------------------------------------
entity d_ff_rst is
port( clk : in std_logic ;
      rst : in std_logic;
      d  : in std_logic ;
      q : out std_logic ;
      q_bar : out std_logic ) ;
end entity d_ff_rst ;
-------------------------------------
architecture Behavioral of  d_ff_rst is
begin
    p_d_ff : process ( clk , d, rst )
    begin
    
        if rising_edge(clk) and (rst = '1') then 
            q <= '0';
        elsif rising_edge(clk) then
            q <= d ;
            q_bar <= not d ;
        end if ;
    end process p_d_ff ;
end architecture Behavioral ;
