



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 20:25:32
-- Design Name: 
-- Module Name: tb_mux_2bit_4to1 - Behavioral
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

entity tb_mux_2bit_4to1 is
end entity;

architecture test of tb_mux_2bit_4to1 is

    signal s_a_i : std_logic_vector(1 downto 0);
    signal s_b_i : std_logic_vector(1 downto 0);
    signal s_c_i : std_logic_vector(1 downto 0);
    signal s_d_i : std_logic_vector(1 downto 0);
    signal s_sel_i : std_logic_vector(1 downto 0);
    signal s_f_o : std_logic_vector(1 downto 0);

begin
    -- Connecting testbench signals with comparator_2bit entity (Unit Under Test)
    uut_mux_2bit_4to1: entity work.mux_2bit_4to1
        port map(
            a_i           => s_a_i,
            b_i           => s_b_i,
            c_i           => s_c_i,
            d_i           => s_d_i,
            sel_i         => s_sel_i,
            f_o           => s_f_o
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;
        
        s_a_i <= "00";
        s_b_i <= "01";
        s_c_i <= "10";
        s_d_i <= "11";
        s_sel_i <= "00";

        wait for 100 ns;
        -- First test values
        
        s_sel_i <= "00";  wait for 100 ns;
        s_sel_i <= "01";  wait for 100 ns;
        s_sel_i <= "10";  wait for 100 ns;
        s_sel_i <= "11";  wait for 100 ns;
        

    end process  p_stimulus;

end test;
