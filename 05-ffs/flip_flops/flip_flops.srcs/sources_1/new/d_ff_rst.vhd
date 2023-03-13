----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2023 03:25:01 PM
-- Design Name: 
-- Module Name: d_ff_rst - Behavioral
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

entity d_ff_rst is
    Port ( d : in STD_LOGIC;
           q : out STD_LOGIC;
           q_bar : out STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end d_ff_rst;

architecture behavioral of d_ff_rst is
begin
    --------------------------------------------------------
    -- d_ff_rst;
    -- D type flip-flop with a high-active sync reset and
    -- rising-edge clk.
    -- q(n+1) = d
    --------------------------------------------------------
    d_ff_rst : process (clk) is
    begin
        if rising_edge(clk) then  -- Synchronous process

           if (rst='1') then
                q     <='0';
                q_bar  <='1'; 
            else
                q     <= d;
                q_bar <= not d;
            end if;
        end if;
        
    end process d_ff_rst;
end architecture behavioral;
