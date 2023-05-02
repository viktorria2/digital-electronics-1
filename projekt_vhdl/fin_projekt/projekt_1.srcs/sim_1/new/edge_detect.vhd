----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2023 04:24:03 PM
-- Design Name: 
-- Module Name: edge_detect - Behavioral
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

entity edge_detect is
  Port (  clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           input1_i : in STD_LOGIC; -- input tlacitka
           switch_i : in STD_LOGIC; -- prepinanie medzi inputom tlacitka a druhej dosky
           input2_i : in STD_LOGIC; -- input z druhej dosky
           rise_o : out STD_LOGIC;
           fall_o : out STD_LOGIC);
end edge_detect;

architecture Behavioral of edge_detect is
    signal s_input_o : STD_LOGIC_VECTOR(1 downto 0);
    signal s_input_i : STD_LOGIC;
begin
    p_edge_detect : process(clk) --prepinanie zdroju inputu
         begin
        if rising_edge(clk) then
            if (switch_i = '1')then
                s_input_i <= input1_i;
            else
                s_input_i <=input2_i;    
            end if;  
        end if;
    end process p_edge_detect;
    
    d_ff0: entity work.d_ff_rst
        port map(
            clk => clk,
            rst => reset,
            d => s_input_i,
            q => s_input_o(1)
    );
    
    d_ff1: entity work.d_ff_rst
        port map(
            clk => clk,
            rst => reset,
            d => s_input_o(1),
            q => s_input_o(0)
    );
    
    rise_o <= s_input_o(1) and not (s_input_o(0));
    fall_o <= not(s_input_o(1)) and s_input_o(0);
    
end Behavioral;