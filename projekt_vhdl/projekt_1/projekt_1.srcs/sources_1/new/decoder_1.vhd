----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2023 03:56:49 PM
-- Design Name: 
-- Module Name: decoder_1 - Behavioral
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

--zadaní prom?nných

entity decoder_1 is 
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           rise : in STD_LOGIC;
           fall : in STD_LOGIC;
           time_dot : in STD_LOGIC_VECTOR (3 downto 0);
           time_dash : in STD_LOGIC_VECTOR (4 downto 0);
           bin_dot : in STD_LOGIC_VECTOR (4 downto 0);
           bin_dash : in STD_LOGIC_VECTOR (4 downto 0);
           enbl : out STD_LOGIC;
           dash : out STD_LOGIC;
           dot : out STD_LOGIC);
end decoder_1;

architecture Behavioral of decoder_1 is
            
            signal s_enbl: std_logic;
            
    p_decoder_1: process(clk) is
    
begin

    if rising_edge(clk) then
     -- ve p?ipad? resetování <= vynulování
     if (rst = '1') then 
        enbl <= '0';
        dash <= '0';
        dot <= '0';
        
     -- kontrola je-li to te?ka
     elseif (fall = '1') then
        if(time_dash <= "0001" and bin_dot >= "0001") then 
           dash <= '1';
           dot <= '1';
         
     -- když ne, je to ?arka
        elseif(time_dash > "0001") then 
           dash <= '1';
           dot <= '1';
        end if;
     
     -- znovu vynulovani
        
        else 
            enbl <= '0';
            dash <= '0';
            dot <= '0';
            
        end if;
      end if;
      
      end process p_decoder_1;

end Behavioral;
