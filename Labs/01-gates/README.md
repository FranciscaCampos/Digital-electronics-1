# Lab 1: Introduction to Git and VHDL

## 1. Github

[Link to my repository] (https://github.com/FranciscaCampos/Digital-electronics-1)

## 2. Verification of De Morgan's laws of function f(c,b,a)


c | b | a | f(c,b,a) |
--|---|---|----------|
0|0|0|1|
0|0|1|1|
0|1|0|0|
0|1|1|0|
1|0|0|0|
1|0|1|1|
1|1|0|0|
1|1|1|0|


```
------------------------------------------------------------------------
--
-- Example of basic OR, AND, XOR gates.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        a_i    : in  std_logic;         -- Data input
        b_i    : in  std_logic;         -- Data input
        c_i    : in  std_logic;         -- Data input
        fres_o  : out std_logic;        --  output function
        fnand_o : out std_logic;        --  output function
        fnor_o : out std_logic          --  output function
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
    fres_o  <= ( (not b_i) and (a_i)) or ((not b_i) and (not c_i));
    fnand_o <= ((not a_i) or (b_i)) nand (c_i or b_i);
    fnor_o <= (b_i nor (not a_i)) or (c_i nor b_i);

end architecture dataflow;






------------------------------------------------------------------------
--
-- Testbench for basic gates circuit.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_gates is
    -- Entity of testbench is always empty
end entity tb_gates;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_gates is

    -- Local signals
    signal s_a     : std_logic;
    signal s_b     : std_logic;
    signal s_c     : std_logic;
    signal s_fres  : std_logic;
    signal s_fnand : std_logic;
    signal s_fnor  : std_logic;

begin
    -- Connecting testbench signals with gates entity (Unit Under Test)
    uut_gates : entity work.gates
        port map(
            a_i    => s_a,
            b_i    => s_b,
            c_i    => s_c,
            fres_o  => s_fres,
            fnand_o => s_fnand,
            fnor_o => s_fnor
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
    	s_c <= '0';
        s_b <= '0';          -- Set input values and wait for 100 ns
        s_a <= '0';
        wait for 100 ns;
		s_c <= '0';
        s_b <= '0';          -- Set input values and wait for 100 ns
        s_a <= '1';
        wait for 100 ns;
        s_c <= '0';
        s_b <= '1';          -- Set input values and wait for 100 ns
        s_a <= '0';
        wait for 100 ns;
        s_c <= '0';
        s_b <= '1';          -- Set input values and wait for 100 ns
        s_a <= '1';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '0';          -- Set input values and wait for 100 ns
        s_a <= '0';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '0';          -- Set input values and wait for 100 ns
        s_a <= '1';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '1';          -- Set input values and wait for 100 ns
        s_a <= '0';
        wait for 100 ns;
        s_c <= '1';
        s_b <= '1';          -- Set input values and wait for 100 ns
        s_a <= '1';
        wait for 100 ns;
        
        wait;                   -- Process is suspended forever
    end process p_stimulus;

end architecture testbench;

```


[Link to the Morgan's Law exercise] (https://www.edaplayground.com/x/vDBe)


## 3. Verification of Distributive laws

```
------------------------------------------------------------------------
--
-- Example of basic OR, AND, XOR gates.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations

------------------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------------------
entity gates is
    port(
        x_i      : in  std_logic;         -- Data input
        y_i      : in  std_logic;         -- Data input
        z_i      : in  std_logic;         -- Data input
        fres1_o  : out std_logic;        --  output function
        fres2_o  : out std_logic;        --  output function
        fres3_o  : out std_logic;        --  output function
        fres4_o  : out std_logic         --  output function
    );
end entity gates;

------------------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------------------
architecture dataflow of gates is
begin
  fres1_o  <= (x_i and y_i) or (x_i and z_i) ;
  fres2_o  <= x_i and (y_i or z_i) ;
  fres3_o  <= (x_i or y_i) and (x_i or z_i) ;
  fres4_o  <= x_i or (y_i and z_i) ;
   

end architecture dataflow;







------------------------------------------------------------------------
--
-- Testbench for basic gates circuit.
-- Nexys A7-50T, Vivado v2020.1, EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_gates is
    -- Entity of testbench is always empty
end entity tb_gates;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_gates is

    -- Local signals
    signal s_x      : std_logic;
    signal s_y      : std_logic;
    signal s_z      : std_logic;
    signal s_fres1  : std_logic;
    signal s_fres2  : std_logic;
    signal s_fres3  : std_logic;
    signal s_fres4  : std_logic;

begin
    -- Connecting testbench signals with gates entity (Unit Under Test)
    uut_gates : entity work.gates
        port map(
            x_i    => s_x,
            y_i    => s_y,
            z_i    => s_z,
            fres1_o  => s_fres1,
            fres2_o  => s_fres2,
            fres3_o  => s_fres3,
            fres4_o  => s_fres4
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
    	s_z <= '0';
        s_y <= '0';          -- Set input values and wait for 100 ns
        s_x <= '0';
        wait for 100 ns;
		s_z <= '0';
        s_y <= '0';          -- Set input values and wait for 100 ns
        s_x <= '1';
        wait for 100 ns;
        s_z <= '0';
        s_y <= '1';          -- Set input values and wait for 100 ns
        s_x <= '0';
        wait for 100 ns;
        s_z <= '0';
        s_y <= '1';          -- Set input values and wait for 100 ns
        s_x <= '1';
        wait for 100 ns;
        s_z <= '1';
        s_y <= '0';          -- Set input values and wait for 100 ns
        s_x <= '0';
        wait for 100 ns;
        s_z <= '1';
        s_y <= '0';          -- Set input values and wait for 100 ns
        s_x <= '1';
        wait for 100 ns;
        s_z <= '1';
        s_y <= '1';          -- Set input values and wait for 100 ns
        s_x <= '0';
        wait for 100 ns;
        s_z <= '1';
        s_y <= '1';          -- Set input values and wait for 100 ns
        s_x <= '1';
        wait for 100 ns;
        
        wait;                   -- Process is suspended forever
    end process p_stimulus;

end architecture testbench;

```

[Link to the Distributive exercise](https://www.edaplayground.com/x/ZtxU)