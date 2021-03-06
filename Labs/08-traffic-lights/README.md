# Lab 8: Traffic light controller


## 1.  Preparation tasks

Input P  | 0 | 0 | 1 | 1 | 0 | 1 | 0 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 1 | 1 |
---------|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
 Clock   | ^ | ^ | ^ | ^ | ^ | ^ | ^ | ^ | ^ | ^ | ^ | ^ | ^ | ^ | ^ | ^ |
 State   | A | A | B | C | C | D | A | B | C | D | B | B | B | C | D | B |
Output R | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 |


![Connection](https://github.com/FranciscaCampos/Digital-electronics-1/blob/main/Labs/08-traffic-lights/Sch.PNG)	

![Connection2](https://github.com/FranciscaCampos/Digital-electronics-1/blob/main/Labs/08-traffic-lights/Schematic.PNG)	

RGB LED | 	Artix-7 pin names | Red   | Yellow | Green  |
--------|---------------------|-------|--------|--------|
 LD16   |    N15, M16, R12    | 1,0,0 | 1,1,0  | 0,1,0  |
 LD17   |    N16, R11, G14    | 1,0,0 | 1,1,0  | 0,1,0  |


## 2. Traffic light controller.

![Diag](https://github.com/FranciscaCampos/Digital-electronics-1/blob/main/Labs/08-traffic-lights/Diag1.PNG)	

```vhdl
p_traffic_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then       -- Synchronous reset
                s_state <= STOP1 ;      -- Set initial state
                s_cnt   <= c_ZERO;      -- Clear all bits

            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                case s_state is

                    -- If the current state is STOP1, then wait 1 sec
                    -- and move to the next GO_WAIT state.
                    when STOP1 =>
                        -- Count up to c_DELAY_1SEC
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= WEST_GO;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                    when WEST_GO =>
                    
                          -- Count up to c_DELAY_4SEC
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= WEST_WAIT;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;   
                      
                     when WEST_WAIT =>
                    
                          -- Count up to c_DELAY_2SEC
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STOP2;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                      when STOP2 =>
                    
                          -- Count up to c_DELAY_1SEC
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= SOUTH_GO;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;
                        
                      when SOUTH_WAIT =>
                    
                          -- Count up to c_DELAY_2SEC
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= SOUTH_WAIT;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                    -- It is a good programming practice to use the 
                    -- OTHERS clause, even if all CASE choices have 
                    -- been made. 
                    when others =>
                        s_state <= STOP1;

                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_traffic_fsm;
```

```vhdl
p_output_fsm : process(s_state)
    begin
        case s_state is
            when STOP1 =>
                south_o <= c_RED;
                west_o  <= c_RED;
            when WEST_GO =>
                south_o <= c_RED;
                west_o  <= c_GREEN;
            when WEST_WAIT =>
                south_o <= c_RED;
                west_o  <= c_YELLOW;
            when STOP2 =>
                south_o <= c_RED;
                west_o  <= c_RED;
            when SOUTH_GO =>
                south_o <= c_GREEN;
                west_o  <= c_RED;
             when SOUTH_WAIT =>
                south_o <= c_YELLOW;
                west_o  <= c_RED;

            when others =>
                south_o <= c_RED;
                west_o  <= c_RED;
        end case;
    end process p_output_fsm;
```
	 
![Sim1](https://github.com/FranciscaCampos/Digital-electronics-1/blob/main/Labs/08-traffic-lights/Sim1.PNG)	
	
## 3. Smart controller
	
	
	
States-Output\Input | No cars (00) | Cars to West(01) | Cars to South(10) | Cars to Bouth(11) |
----------------------------------------|------------------|------------------------|----------------------|---------------------| 
SOUTH_GO - south_o = green,west_o = red | SOUTH_GO | STOPS | SOUTH_GO | STOPS | 
STOPS   - south_o = yellow,west_o = red | WEST_GO | WEST_GO | WEST_GO | WEST_GO | 
WEST_GO  - south_o = red,west_o = green | WEST_GO | WEST_GO | STOPW |  STOPW | 
STOPW   - south_o = red,west_o = yellow | SOUTH_GO | SOUTH_GO | SOUTH_GO  | SOUTH_GO | 
 
 
 
 
 ![Diam2](https://github.com/FranciscaCampos/Digital-electronics-1/blob/main/Labs/08-traffic-lights/Diag2.PNG)	
 
 
 
```vhdl
p_smart_traffic_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then       -- Synchronous reset
                s_state <= SOUTH_GO ;      -- Set initial state
                s_cnt   <= c_ZERO;      -- Clear all bits

            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                case s_state is

                    -- If the current state is STOP1, then wait 1 sec
                    -- and move to the next GO_WAIT state.
                    when SOUTH_GO =>
                        -- Count up to c_DELAY_4SEC
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
				if ((sw1 = '0' and sw2 = '1') or (sw1 = '1' and sw2 = '1')) then
					s_state <= STOPS;
				end if;
                            -- Move to the next state
                            s_state <= STOPS;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;
						
						

                    when STOPS =>
                        -- Count up to c_DELAY_1SEC
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
				if ((sw1 = '0' and sw2 = '0') or (sw1 = '0' and sw2 = '1') or (sw1 = '1' and sw2 = '0') or (sw1 = '1' and sw2 = '1')) then
					s_state <= WEST_GO;
				end if;
                            -- Move to the next state
                            s_state <= WEST_GO;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;
						
											
					when WEST_GO =>
                        -- Count up to c_DELAY_4SEC
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else						
				if ((sw1 = '1' and sw2 = '0') or (sw1 = '1' and sw2 = '1')) then
					s_state <= STOPW;
				end if;
                            -- Move to the next state
                            s_state <= STOPW;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;
						
							
						
						
				    when STOPW =>
                        -- Count up to c_DELAY_1SEC
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
						
				if ((sw1 = '0' and sw2 = '0') or (sw1 = '0' and sw2 = '1') or (sw1 = '1' and sw2 = '0') or (sw1 = '1' and sw2 = '1')) then
						s_state <= SOUTH_GO;
				end if;
                            -- Move to the next state
                            s_state <= SOUTH_GO;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                    -- It is a good programming practice to use the 
                    -- OTHERS clause, even if all CASE choices have 
                    -- been made. 
                    when others =>
                        s_state <= STOP1;

                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_traffic_fsm;
```
 
 
 
