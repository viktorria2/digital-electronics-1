------------------------------------------------------------
--
-- Testbench for 4-bit binary comparator.
-- Nexys A7-50T, xc7a50ticsg324-1L
-- TerosHDL, Vivado 2020.2
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------

entity tb_comparator_4bit is
  -- Entity of testbench is always empty
end entity tb_comparator_4bit;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------

architecture testbench of tb_comparator_4bit is

  -- Testbench local signals
  signal sig_a           : std_logic_vector(2 downto 0);
  signal sig_b           : std_logic_vector(2 downto 0);
  signal sig_c :  std_logic_vector(2 downto 0);
  signal sig_d :  std_logic_vector(2 downto 0);
  signal sig_f :  std_logic_vector(2 downto 0);
  signal sig_out: std_logic_vector(1 downto 0);
 

begin

  -- Connecting testbench signals with comparator_4bit
  -- entity (Unit Under Test)
  uut_comparator_4bit : entity work.comparator_4bit
    port map (
      a           => sig_a,
      b           => sig_b,
      c           => sig_a,
      d           => sig_b,
      f           => sig_b,
    );

  --------------------------------------------------------
  -- Data generation process
  --------------------------------------------------------
  p_stimulus : process is
  begin

    -- Report a note at the beginning of stimulus process
    report "Stimulus process started";

    -- First test case ...
    sig_b <= "011";
    sig_a <= "000";
    wait for 100 ns;
    -- ... and its expected outputs
    assert (
            (sig_b_greater_a = '1') and
            (sig_b_equals_a  = '0') and
            (sig_b_less_a    = '0')
        )
      -- If false, then report an error
      -- If true, then do not report anything
      report "Input combination 0111, 0001 FAILED"
      severity error;

    ------------------------------
    -- WRITE OTHER TEST CASES HERE
    sig_b <= "1111";
    sig_a <= "1111";
    wait for 100 ns;
    assert (
            (sig_b_greater_a = '0') and
            (sig_b_equals_a  = '1') and
            (sig_b_less_a    = '0')
        )
      report "Input combination 1111, 1111 FAILED"
      severity error;

    ------------------------------
    sig_b <= "0100";
    sig_a <= "1001";
    wait for 100 ns;
    assert (
            (sig_b_greater_a = '0') and
            (sig_b_equals_a  = '0') and
            (sig_b_less_a    = '1')
        )
      report "Input combination 1001, 0100 FAILED"
      severity error;

    ------------------------------
   
    -- Report a note at the end of stimulus process
    report "Stimulus process finished";

    wait; -- Data generation process is suspended forever

  end process p_stimulus;

end architecture testbench;
