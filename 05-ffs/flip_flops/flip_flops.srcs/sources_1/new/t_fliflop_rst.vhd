----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2023 03:49:29 PM
-- Design Name: 
-- Module Name: t_fliflop_rst - Behavioral
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

entity t_fliflop_rst is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           t : in STD_LOGIC;
           q : out STD_LOGIC;
           q_bar : out STD_LOGIC);
end t_fliflop_rst;

architecture behavioral of t_flipflop_rst is
    -- It must use this local signal instead of output ports
    -- because "out" ports cannot be read within the architecture
    signal sig_q : std_logic;
begin
    --------------------------------------------------------
    -- p_t_flipflop_rst:
    -- T type flip-flop with a high-active synchro reset and
    -- rising-edge clk.
    -- sig_q = t./sig_q + /t.sig_q
    -- sig_q =  sig_q if t = 0 (no change)
    -- sig_q = /sig_q if t = 1 (inversion)
    --------------------------------------------------------
    p_t_flipflop_rst : process (clk) is
    begin
        if rising_edge(clk) then

            if (rst='1') then
                s_q    <='0';
            elsif (t='0') then
                s_q    <= s_q;
            else
                s_q    <= not s_q;                
            end if;
        end if;
    end process p_t_flipflop_rst;
    q     <= sig_q;
    q_bar <= not sig_q;
end architecture behavioral;
