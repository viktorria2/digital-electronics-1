library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- declaration of inputs and outputs
------------------------------------------------------------
entity top is
  port(  CLK100MHZ : in STD_LOGIC;
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           SW : in STD_logic;
           JB : in std_logic);
end entity top;

------------------------------------------------------------
-- Architecture body
------------------------------------------------------------
architecture behavior of top is
    --Local signals
    signal s_rise       : std_logic;
    signal s_fall       : std_logic;
    signal s_seconds_h    : std_logic_vector(3 - 1 downto 0);
    signal s_seconds_l    : std_logic_vector(4 - 1 downto 0);
    signal s_hundredths_h : std_logic_vector(4 - 1 downto 0);
    signal s_hundredths_l : std_logic_vector(4 - 1 downto 0);
    signal s_seconds_h2    : std_logic_vector(3 - 1 downto 0);
    signal s_seconds_l2    : std_logic_vector(4 - 1 downto 0);
    signal s_hundredths_h2 : std_logic_vector(4 - 1 downto 0);
    signal s_hundredths_l2 : std_logic_vector(4 - 1 downto 0);
    signal s_dot   : std_logic;
    signal s_dash        : std_logic;
    signal s_char        : std_logic;
    signal s_word        : std_logic;
    signal s_en        : std_logic;
    signal s_en2        : std_logic;
    signal s_num : std_logic;
    signal s_dec_reset : std_logic;
    signal s_rdy : std_logic;
    signal s_data_to_memory : std_logic_vector(8 - 1 downto 0);    
    signal s_seg_o : std_logic_vector(7 - 1 downto 0);
    signal s_dig_o : std_logic_vector(8 - 1 downto 0);
    
begin
  
    -- creating instances of all needed functional modules
    -- and connecting them together using local signals
    -- or connecting them to their respective inputs and outputs
  
    edge_detect : entity work.edge_detect
        port map(
            clk     => CLK100MHZ,
            reset     => BTNC,
            input1_i   => BTNU,
            input2_i  => JB,
            rise_o => s_rise,
            fall_o => s_fall,
            switch_i => SW             
        );
        
     stopwatch : entity work.stopwatch
        port map(
            clk            => CLK100MHZ,
            reset          => BTNC,
            start        => s_rise,
            pause        => s_fall,
            seconds_h_o    => s_seconds_h,
            seconds_l_o    => s_seconds_l,
            hundredths_h_o => s_hundredths_h,
            hundredths_l_o => s_hundredths_l
        );
        
     stopwatch2 : entity work.stopwatch2
        port map(
            clk            => CLK100MHZ,
            reset          => BTNC,
            start          => s_fall,
            pause          => s_rise,
            seconds_h_o    => s_seconds_h2,
            seconds_l_o    => s_seconds_l2,
            hundredths_h_o => s_hundredths_h2,
            hundredths_l_o => s_hundredths_l2,
            dec_reset => s_dec_reset
        ); 
       decoder_1 : entity work.decoder_1
        port map(
            clk            => CLK100MHZ,
            rst            => BTNC,
            time_dot       => s_seconds_h,
            time_dash      => s_seconds_l,
            bin_dot        => s_hundredths_h,
            bin_dash       => s_hundredths_l,
            rise   => s_rise,
            fall   => s_fall,
            dot    => s_dot,
            dash   => s_dash,
            enbl   => s_en
        ); 
      decoder_2 : entity work.decoder_2
        port map(
            clk            => CLK100MHZ,
            rst            => BTNC,
            time_dot       => s_seconds_h2,
            time_dash      => s_seconds_l2,
            bin_dot        => s_hundredths_h2,
            bin_dash       => s_hundredths_l2,
            rise   => s_rise,
            fall   => s_fall,
            char   => s_char,
            intgr  => s_word,
            enbl   => s_en2,
            reset  => s_dec_reset
        ); 
     morse_to8bit : entity work.morse_to8bit
        port map(
            clk            => CLK100MHZ,
            rst   => BTNC,
            ready => s_rdy,
            dot  => s_dot,
            dash => s_dash,
            enab1e1   => s_en,
            char => s_char,
            word => s_word,
            enable2   => s_en2,
            data => s_data_to_memory
        ); 

     hex_7seg : entity work.hex_7seg
        port map(

            hex => s_data_to_memory,
            seg(6) => CA,
            seg(5) => CB,
            seg(4) => CC,
            seg(3) => CD,
            seg(2) => CE,
            seg(1) => CF,
            seg(0) => CG
        );                
     AN <= b"01111111";
end architecture behavior;