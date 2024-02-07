library ieee;
use ieee.std_logic_1164.all;

entity tb_gates is
end tb_gates;

architecture tb of tb_gates is

    component gates is
        port (
              A       : in std_logic;
              B       : in std_logic;
              C       : in std_logic;
      F_orig : out   std_logic;
      F_nand : out   std_logic;
      F_nor  : out   std_logic
      );       
    end component;

    signal sig_a       : std_logic;
    signal sig_b       : std_logic;
    signal sig_c       : std_logic;
    signal sig_F_orig : std_logic;
    signal sig_F_nand  : std_logic;
    signal sig_F_nor : std_logic;

begin

            --device under test
    dut_gates: component gates
    port map (A       => sig_a,
              B       => sig_b,
              C       => sig_c,
              F_orig => sig_F_orig,
              F_nand  => sig_F_nand,
              F_nor => sig_F_nor
);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
       -- Set one test case and wait for 100 ns ...
    sig_c <= '0';
    sig_b <= '0';
    sig_a <= '0';
    wait for 100 ns;
    sig_c <= '0';
    sig_b <= '0';
    sig_a <= '1';
    wait for 100 ns;
    sig_c <= '0';
    sig_b <= '1';
    sig_a <= '0';
    wait for 100 ns;
    sig_c <= '0';
    sig_b <= '1';
    sig_a <= '1';
    wait for 100 ns;
    sig_c <= '1';
    sig_b <= '0';
    sig_a <= '0';
    wait for 100 ns;
    sig_c <= '1';
    sig_b <= '0';
    sig_a <= '1';
    wait for 100 ns;
    sig_c <= '1';
    sig_b <= '1';
    sig_a <= '0';
    wait for 100 ns;
    sig_c <= '1';
    sig_b <= '1';
    sig_a <= '1';
    wait for 100 ns;
        
        -- EDIT Add stimuli here

        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_gates of tb_gates is
    for tb
    end for;
end cfg_tb_gates;