

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_top is
end entity tb_top;

architecture testbench of tb_top is

 signal s_SW  : std_logic_vector(4 - 1 downto 0);
 signal s_CA : std_logic;
 signal s_CB : std_logic;
 signal s_CC : std_logic;
 signal s_CD : std_logic;
 signal s_CE : std_logic;
 signal s_CF : std_logic;
 signal s_CG : std_logic;
 signal s_AN  : std_logic_vector(8 - 1 downto 0);
 signal s_LED  : std_logic_vector(7 downto 0);
 
begin

uut_top : entity work.top
        port map(
            SW => s_SW,
            CA => s_CA,
            CB => s_CB,
            CC => s_CC,
            CD => s_CD,
            CE => s_CE,
            CF => s_CF,
            CG => s_CG,
            AN => s_AN,
            LED => s_LED
         );

p_stimulus : process
    begin


report "Stimulus process started" severity note;

        -- First test value
        s_SW <= "0000"; wait for 50 ns;
        assert (s_LED(4) = '1')
        report "Test failed for input combination: 0000 the LED 4 does not turn on" severity error;


        s_SW <= "1011"; wait for 50 ns;
        assert (s_LED(5) = '1')
        report "Test failed for input combination: 1011 the LED 5 does not turn on" severity error;

        s_SW <= "0001"; wait for 50 ns;
        assert (s_LED(6) = '1')
        report "Test failed for input combination: 0001 the LED 6 does not turn on with odd numbers" severity error;

        assert (s_LED(7) = '1')
        report "Test failed for input combination: 0001 the LED 1 does not turn on with the powers of two" severity error;


        report "Stimulus process finished" severity note;
        wait;  
     end process  p_stimulus;


end architecture testbench;
