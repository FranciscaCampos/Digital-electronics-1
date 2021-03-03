----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 19:54:51
-- Design Name: 
-- Module Name: mux_2bit_4to1 - Behavioral
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

entity mux_2bit_4to1 is
    Port ( a_i : in STD_LOGIC_VECTOR (1 downto 0);
           b_i : in STD_LOGIC_VECTOR (1 downto 0);
           c_i : in STD_LOGIC_VECTOR (1 downto 0);
           d_i : in STD_LOGIC_VECTOR (1 downto 0);
           sel_i : in STD_LOGIC_VECTOR (1 downto 0);
           f_o : out STD_LOGIC_VECTOR (1 downto 0));
end mux_2bit_4to1;

architecture Behavioral of mux_2bit_4to1 is
begin

f_o <= a_i when sel_i = "00" else
       b_i when sel_i = "01" else
       c_i when sel_i = "10" else
       d_i when sel_i = "11";


end Behavioral;

