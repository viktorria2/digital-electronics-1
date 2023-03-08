----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2023 03:25:01 PM
-- Design Name: 
-- Module Name: d_f_fsp - Behavioral
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

entity d_f_fsp is
    Port ( d : in STD_LOGIC;
           q : out STD_LOGIC;
           q_bar : out STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC);
end d_f_fsp;

architecture behavioral of d_f_fsp is
begin
    --------------------------------------------------------
    -- d_f_fsp;
    -- D type flip-flop with a high-active sync reset and
    -- rising-edge clk.
    -- q(n+1) = d
    --------------------------------------------------------
    d_f_fsp : process (clk) is
    begin
        if rising_edge(clk) then  -- Synchronous process

            if (rst = '1') then
            q  <= '0';
            q_bar   <= '1';
         else
            q     <= d;
            q_bar <= not d;
        end if;
        end if;
        
    end process d_f_fsp;
end architecture behavioral;
