----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 22:20:20
-- Design Name: 
-- Module Name: morse_to8bit - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity morse_to8bit is
    Port ( dot     : in STD_LOGIC;
           dash    : in STD_LOGIC;
           enab1e1 : in STD_LOGIC;
           char    : in STD_LOGIC;
           word    : in STD_LOGIC;
           enable2 : in STD_LOGIC;
           rst     : in STD_logic;
           clk     : in STD_logic;
           data    : out STD_LOGIC_VECTOR (8 - 1 downto 0);
           ready   : out STD_LOGIC);  -- signal for activating loading into shift register to store the output, unused in the final version  
end morse_to8bit;

architecture Behavioral of morse_to8bit is
-- local signals
signal s_ready : std_logic;
signal data_int : std_logic_vector (8 - 1 downto 0);

begin
    shift_register:process (clk)
        begin
            if rst = '1' then           -- asynchronous reset
                data_int <= "00000001";
                data <= "10000000";
                ready <= '0';
            elsif rising_edge (clk) then    
                if (enab1e1 = '1' and enable2 = '0') then                                           -- input from decoder of dots/dashes is detected  
                    ready <= '0';                                                               -- output signaling is turned off 
                    if dot = '1' then                                                         -- if dot comes in
                        data_int <= data_int(6 downto 0) & '0';                                 ---- put '0' into shift register
                    elsif dash = '1' then                                                     -- if dash comes in
                        data_int <= data_int(6 downto 0) & '1';                                 ---- put '1'
                    end if;
                elsif (enab1e1 = '0' and enable2 = '1' and (char = '1' or word = '1')) then     -- input from decoder of pauses is detected
                    data <= data_int;                                                         ---- shift register contents are sent to the output
                    ready <= '1';                                                               ---- and rdy_o signals new output is present 
                    s_ready <= '1';     
                elsif(s_ready = '1' and enable2 = '0') then                                         -- after input from decoder of pauses stops
                     data_int <= "00000001";                                                    ---- shift register is resetted
                     s_ready <= '0';                                                              ---- and s_rdy is set for the next output cycle 
                else
                    ready <= '0';                                                               -- output signaling is turned off
                end if;
            end if;    
    end process;
end Behavioral;