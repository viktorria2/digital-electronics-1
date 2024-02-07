library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- popisuje kod z venku
entity gates is
   Port (
      a, b, c : in  STD_LOGIC;
      AND_Out, OR_Out, XOR_Out, F_nand, F_orig, F_nor : out  STD_LOGIC
   );
end gates;

architecture Behavioral of gates is
begin
   -- 2-input AND gate; <= prirazeni hodnoty
   AND_Out <= a and b;

   -- 2-input OR gate
   OR_Out <= a or b;

   -- XOR gate
   XOR_Out <= a xor b;


    F_orig <= not (c and b) or (not(b) and a);
    F_nand <= not (c and b and not(not(b) and a));
    F_nor <= (not c or not b) or (not((b) or not a));
    
end Behavioral;