library ieee ;
use ieee.std_logic_1164.all;
-------------------------------------
entity jk_ff_rst is
port( clk : in std_logic ;
      rst : in std_logic;
      j  : in std_logic ;
      k  : in std_logic ;
      q : out std_logic ;
      q_bar : out std_logic ) ;
end entity jk_ff_rst ;
-------------------------------------
architecture Behavioral of  jk_ff_rst is
 signal q_i: std_logic;
begin
    p_jk_ff_rst : process ( clk ,rst )
    begin
    
        if rising_edge(clk) then
          if (rst = '1') then 
            q_i <= '0';
          elsif (j = '0' and k = '0') then
            q_i <= q_i ;
          elsif (j = '0' and k = '1') then
            q_i <= '0';
          elsif (j = '1' and k = '0') then
            q_i <= '1'; 
          elsif (j = '1' and k = '1') then
            q_i <= not q_i; 
          end if;
        end if ;
    end process p_jk_ff_rst ;
    
  q <= q_i;
  q_bar <= not q_i;
  
end architecture Behavioral ;
