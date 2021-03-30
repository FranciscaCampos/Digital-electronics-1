----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 17:18:00
-- Design Name: 
-- Module Name: tb_d_latch - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_d_latch is
end tb_d_latch;

architecture Behavioral of tb_d_latch is
  signal anrst: std_logic;
  signal en:    std_logic;
  signal d:     std_logic;
  signal q:     std_logic;
  signal q_bar: std_logic;
begin

    uut_d_latch : entity work.d_latch
        port map(
            anrst => anrst,
            en => en,
            d => d,
            q => q,
            q_bar => q_bar);
            
     p_stimulus : process
    begin
    
        report "Stimulus process started" severity note;
        
        anrst <= '1'; d <= '1'; en <= '1'; wait for 50 ns;
        assert (q = '0')
        report "Asynchronous reset is failing" severity error;
        
        anrst <= '0';
        d <= '0';
        wait for 50 ns;
        assert (q = '0')
        report "The enable does not work properly" severity error;
        
        d <= '1';
        wait for 50 ns;
        assert (q = '1')
        report "The output does not fit with the epected" severity error;
        
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end Behavioral;
