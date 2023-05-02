----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/15/2023 03:10:59 PM
-- Design Name: 
-- Module Name: clock_enable - Behavioral
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------------------------------
-- Entity declaration for stopwatch counter
------------------------------------------------------------------------
entity stopwatch2 is
    port(
        clk            : in  std_logic;
        reset          : in  std_logic;
        dec_reset      : in std_logic;
        start          : in  std_logic;     -- Start counting
        pause          : in  std_logic;     -- Pause counting
        -- seconds
        seconds_h_o    : out std_logic_vector(3 - 1 downto 0);
        -- tenths of a second
        seconds_l_o    : out std_logic_vector(4 - 1 downto 0);
        -- hundredths of a second
        hundredths_h_o : out std_logic_vector(4 - 1 downto 0);
        -- milliseconds
        hundredths_l_o : out std_logic_vector(4 - 1 downto 0)
    );
end entity stopwatch2;

------------------------------------------------------------------------
-- Architecture declaration for stopwatch counter
------------------------------------------------------------------------
architecture Behavioral of stopwatch2 is

    -- Internal clock enable
    signal s_en    : std_logic;
    -- Internal start button flag
    signal s_start : std_logic;
    -- Local counters
    signal cnt3  : unsigned(3 - 1 downto 0);  -- seconds
    signal cnt2  : unsigned(4 - 1 downto 0);  -- tenths of a second
    signal cnt1  : unsigned(4 - 1 downto 0);  -- hundredths of a second
    signal cnt0  : unsigned(4 - 1 downto 0);  -- milliseconds

begin
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates an enable pulse
    -- every 1 ms (1000 Hz).

    -- JUST FOR SHORTER/FASTER SIMULATION
   -- s_en <= '1';
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX =>  100000      --100000 = 1 ms / (1/100 MHz) = g_MAX  ---- simulation = 1
        )
        port map(
            ce_0 => s_en,
            clk => clk,
            rst => reset
      
        );

    --------------------------------------------------------------------
    -- p_stopwatch_cnt:
    -- Sequential process with synchronous reset and clock enable,
    -- which implements four decimal counters. The lowest of the 
    -- counters is incremented every 1 ms, and each higher-order 
    -- counter is incremented if all lower-order counters are equal 
    -- to the maximum value.
    --------------------------------------------------------------------
    p_stopwatch2_cnt : process(clk)
    begin
        if rising_edge(clk) then

            if (reset = '1' or dec_reset ='1') then           -- Synchronous reset, stopwatch can be resetted also using special reset from the decoder2
                cnt3 <= (others => '0');  -- Clear all bits
                cnt2 <= (others => '0');
                cnt1 <= (others => '0');
                cnt0 <= (others => '0');
                s_start <= '0';             -- Clear start button flag

            -- Use flag to remember if start button was pressed
            elsif (start = '1') then
                s_start <= '1';             -- Set start button flag

            -- Counting only if start was pressed and pause is inactive
            elsif (s_en = '1' and s_start = '1' and pause = '0') then
                cnt0 <= cnt0 + 1;       -- Increment every 1 ms
                if(cnt0 = "1001") then    -- after 10 ms, 1 hundredth of a second is added and milliseconds go back to zero
                    cnt1 <= cnt1 + 1;
                    cnt0 <= cnt0 - 9;
                end if;
                if(cnt1 = "1001" and cnt0 = "1001") then    -- after 10 hundredths , 1 tenth of a second is added and hundredths go back to zero
                    cnt2 <= cnt2 + 1;
                    cnt1 <= cnt1 - 9;
                end if; 
                if(cnt2 = "1001" and cnt1 = "1001") then    -- after 10 tenths , 1 second is added and tenths go back to zero 
                    cnt3 <= cnt3 + 1;
                    cnt2 <= cnt2 - 9;
                end if; 
            elsif(pause = '1')then        -- upon stopping the stopwatch, everything is resetted
                s_start <= '0';
                cnt0 <= "0000";
                cnt1 <= "0000"; 
                cnt2 <= "0000";
                cnt3 <= "000";                        
            end if;
        end if;
    end process p_stopwatch2_cnt;

    -- Outputs must be retyped from "unsigned" to "std_logic_vector"
    seconds_h_o    <= std_logic_vector(cnt3);
    seconds_l_o    <= std_logic_vector(cnt2);
    hundredths_h_o <= std_logic_vector(cnt1);
    hundredths_l_o <= std_logic_vector(cnt0);

end architecture Behavioral;