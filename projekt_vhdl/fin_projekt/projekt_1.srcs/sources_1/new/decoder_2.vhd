----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2023 03:56:49 PM
-- Design Name: 
-- Module Name: decoder_2 - Behavioral
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

entity decoder_2 is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           rise : in STD_LOGIC;
           fall : in STD_LOGIC;
           enbl : out STD_LOGIC;
           dash : out STD_LOGIC;
           dot : out STD_LOGIC;
           reset : out STD_LOGIC;
           char : out STD_LOGIC;
           intgr : out STD_LOGIC;
           time_dot : in STD_LOGIC_VECTOR (3 -1 downto 0);
           time_dash : in STD_LOGIC_VECTOR (4 - 1 downto 0);
           bin_dot : in STD_LOGIC_VECTOR (4 - 1 downto 0);
           bin_dash : in STD_LOGIC_VECTOR (4 - 1 downto 0));
end decoder_2;

architecture Behavioral of decoder_2 is

begin p_decoder_2: process(clk) 
    
begin

if rising_edge(clk) then
     -- ve pripade resetov?n? <= vynulov?n?
        if (rst = '1') then 
            enbl <= '0';
            char <= '0';
            intgr <= '0';
        
     -- kontrola je-li to pismeno
        elsif (fall = '1') then
             if(time_dash >= "0001" and bin_dot < "0011") then 
                 enbl <= '1';
                 char <= '1';
         
     -- kdy? ne, je to cifra
             elsif(time_dash > "0001") then 
                 enbl <= '1';
                 intgr <= '1';
             end if;
        
        elsif (time_dot = "001") then
           enbl <= '1';
           intgr <= '1';
           char <= '1';
         
     
     -- znovu vynulovani
        
        else
            enbl <= '0';
            char <= '0';
            intgr <= '0';
            reset <= '0';
            
        end if;
    end if;
      
      end process p_decoder_2;

end Behavioral;