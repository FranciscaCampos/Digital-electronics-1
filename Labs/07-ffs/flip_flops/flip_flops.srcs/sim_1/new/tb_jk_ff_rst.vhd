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

entity tb_jk_ff_rst is
end tb_jk_ff_rst;

architecture Behavioral of tb_jk_ff_rst is

  constant c_CLK_100MHZ_PERIOD : time    := 10 ns;
    
  signal clk:   std_logic;
  signal rst:  std_logic;
  signal j:     std_logic;
  signal k:     std_logic;
  signal q:     std_logic;
  signal q_bar: std_logic;
  signal q_i : std_logic;
begin

    uut_d_latch : entity work.jk_ff_rst
        port map(
            clk => clk,
            rst => rst,
            j => j,
            k => k,
            q => q,
            q_bar => q_bar);
             
     --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

   
            
    p_stimulus : process
    begin
    
        report "Stimulus process started" severity note;
        
        rst <= '1'; j <= '0'; k <= '0'; wait for 10 ns;
        
        
        rst <= '0';wait for 10 ns;
        
        j <= '0'; k <= '1'; wait for 10 ns;
        j <= '1'; k <= '0'; wait for 10 ns;
        j <= '1'; k <= '1'; wait for 10 ns;
        
        j <= '0'; k <= '0'; wait for 10 ns;
        j <= '0'; k <= '1'; wait for 10 ns;
        j <= '1'; k <= '0'; wait for 10 ns;
        j <= '1'; k <= '1'; wait for 10 ns;
        
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end Behavioral;
