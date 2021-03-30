library ieee ;
use ieee.std_logic_1164.all;
-------------------------------------
entity t_ff_rst is
port( clk : in std_logic ;
      rst : in std_logic;
      t  : in std_logic ;
      q : buffer std_logic ;
      q_bar : buffer std_logic ) ;
end entity t_ff_rst ;
-------------------------------------
architecture Behavioral of  t_ff_rst is
signal q_i : std_logic;
begin
    p_t_ff : process ( clk , rst )
    begin
    
        if rising_edge(clk) then    
            if(rst = '1') then 
                q <= '0';
            elsif t = '1' then
            q <= not q ;
            q_bar <= not q ;
            end if ;
        end if;
    end process p_t_ff ;
end architecture Behavioral ;
