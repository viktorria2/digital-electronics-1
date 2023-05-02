------------------------------------------------------------
--
--! @title One-digit 7-segment display decoder
--! @author Tomas Fryza
--! Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
--!
--! @copyright (c) 2018 Tomas Fryza
--! This work is licensed under the terms of the MIT license
--!
--! Decoder for one-digit Seven-segment display, Common Anode
--! (active-low). Decoder defines 16 hexadecimal symbols: 0, 1,
--! ..., 9, A, b, C, d, E, F. All segments are turn off when
--
-- Hardware: Nexys A7-50T, xc7a50ticsg324-1L
-- Software: TerosHDL, Vivado 2020.2

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity hex_7seg is
    Port ( hex : in STD_LOGIC_VECTOR (8 - 1 downto 0);
           seg : out STD_LOGIC_VECTOR (7 - 1 downto 0));
end hex_7seg;

architecture Behavioral of hex_7seg is

begin

  --------------------------------------------------------
  -- p_7seg_decoder:
  -- A combinational process for 7-segment display (Common
  -- Anode) decoder. Any time "hex" or "blank" is changed,
  -- the process is "executed". Output pin seg(6) controls
  -- segment A, seg(5) segment B, etc.
  --     segment A
  --      | segment B
  --      |  | segment C
  --      +-+|  |   ...   segment G
  --        ||+-+          |
  --        |||            |
  -- seg = "0000001"-------+
  --
  -- Display is clear/blank if signal blank = 1.
  --------------------------------------------------------

  p_7seg_decoder : process (hex) is

  begin

     case hex is
            when "00011111" =>
                seg <= "0000001";     -- 0

            when "00101111" =>
                seg <= "1001111";     -- 1

            when "00100111" =>
                seg <= "0010010";     -- 2

            when "00100011" =>
                seg <= "0000110";     -- 3

            when "00100001" =>
                seg <= "1001100";     -- 4

            when "00100000" =>
                seg <= "0100100";     -- 5

            when "00110000" =>
                seg <= "0100000";     -- 6

            when "00111000" =>
                seg <= "0001111";     -- 7

            when "00111100" =>
                seg <= "0000000";     -- 8

            when "00111110" =>
                seg <= "0000100";     -- 9

            when "00000101" =>
                seg <= "0000010";     -- A

            when "00011000" =>
                seg <= "1100000";     -- B

            when "00011010" =>
                seg <= "1110010";     -- C 

            when "00001100" =>
                seg <= "1000010";     -- D 

            when "00000010" =>
                seg <= "0110000";     -- E

	        when "00010010" =>
                seg <= "0111000";     -- F

            when "00001110" =>
                seg <= "0100001";     -- G

            when "00010000" =>
                seg <= "1101000";     -- H

            when "00000100" =>
                seg <= "0111011";     -- I 

            when "00010111" =>
                seg <= "0100111";     -- J

            when "00001101" =>
                seg <= "0101000";     -- K

	        when "00010100" =>
                seg <= "1110001";     -- L

	        when "00000111" =>
                seg <= "0101010";     -- M

            when "00000110" =>
                seg <= "1101010";     -- N

            when "00001111" =>
                seg <= "1100010";     -- O 

            when "00010110" =>
                seg <= "0011000";     -- P

            when "00011101" =>
                seg <= "0001100";     -- Q

	        when "00001010" =>
                seg <= "1111010";     -- R

	        when "00001000" =>
                seg <= "0100101";     -- S

            when "00000011" =>
                seg <= "1110000";     -- T

	        when "00001001" =>
                seg <= "1100011";     -- U

	        when "00010001" =>
                seg <= "1010101";     -- V

	        when "00001011" =>
                seg <= "1010100";     -- W

            when "00011001" =>
                seg <= "1101011";     -- X

	        when "00011011" =>
                seg <= "1000100";     -- Y
	   
 	        when "00011100" =>
                seg <= "0010011";     -- Z

            when others =>
                seg <= "1111111";     --  segments don't light up with undefined input 

        end case;
    
  end process p_7seg_decoder;
  
end Behavioral;