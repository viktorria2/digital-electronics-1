# VHDL project - Morse Code Receiver

### Team members

* Lysá Barbora (responsible for edge_detect,d_ff_rst, hex_7_seg and implementation)
* Shishkova Viktoriia (responsible for control_time1/2, decoders, stopwatches)
* Nguyen Nhat Truong (responsible for Top, testbenches and simulatioons)

## Theoretical description and explanation

The problem of this project is creating of Morse Code Receiver. Algorithm is simple: you should press the button and depending on pressing time the signal is recognised as dot or dash. After assembly all symbols we have the final letter or digit which is translated on the 7-segment display. The code is created such as "new-era" digital telegraph based on desk Nexys-A7-50T. 

We solved it with references on previous excersises and took some part of it from our previous solutions (for example clock_enable). Also we made new simulation sources to detect hashes and dots by pressing the BTNU-button. 

## Hardware description of demo application

Insert descriptive text and schematic(s) of your implementation.

## Software description

Put flowchats/state diagrams of your algorithm(s) and direct links to source/testbench files in `src` and `sim` folders. 

### Component(s) simulation

Write descriptive text and simulation screenshots of your components.

## Instructions

Write an instruction manual for your application, including photos or a link to a video.

## References

1. [Morse code (Wiki)](https://en.wikipedia.org/wiki/Morse_code)
2. [Morse code decoder design in VHDL](https://www.researchgate.net/publication/305379385_Morse_code_decoder_design_in_VHDL_using_FPGA_Spartan_3E_development_kit)
