# Organizarea Calculatoarelor

## Laborator 7( 16 - 20 April 2018)


### General Info

#### Digital Decoders IC

Digital Decoder ICs are devices which converts one digital format into another. 
For example, one of the most commonly used IC is BCD to 7-Segment Display Decoder.

#### 7-Segment Display

![7 segments][7seg]

A 7 segments display is a widely used electronic display device for displaying data in hexadecimal ( HEX characters from 0 to 9 and A to F). It consist of 8 LEDs, each LED is used to illuminate one segment of unit and the 8th LED is used to illuminate DOT. Usually it have 8 connections( displays without DOT) for each LED segment and one that acts as a GND of Vdd.

There are two types of 7 segment displays: 

1. **Common Cathode**: all the cathode connections of the LED segments are joined together to **Gnd**. This means that a segment is illuminated by applying a logic "1" signal to the *Anode* terminal. 

2. **Common Anode**:  all the anode connections of the LED segments are joined together to **Vdd** which means that to illuminate a segment a logic "0" needs to be applied to the *Cathode* terminal.


![7 segments Display Types][commonca]


#### Decoder Circuit Design

![7 segments][7segimg]

Based on the above image we can create the truth table:



| X3  | X2  | X1  | X0  |  a  |  b  |  c  |  d  |  e  |  f  |  g  | Display |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|  0  |  0  |  0  |  0  |  1  |  1  |  1  | 1   |  1  |  1  |  0  |  0  |
|  0  |  0  |  0  |  1  |  0  |  1  |  1  | 0   |  0  |  0  |  0  |  1  |
|  0  |  0  |  1  |  0  |  1  |  1  |  0  | 1   |  1  |  0  |  1  |  2  |
|  0  |  0  |  1  |  1  |  1  |  1  |  1  | 1   |  0  |  0  |  1  |  3  |
|  0  |  1  |  0  |  0  |  0  |  1  |  1  | 0   |  0  |  1  |  1  |  4  |
|  0  |  1  |  0  |  1  |  1  |  0  |  1  | 1   |  0  |  1  |  1  |  5  |
|  0  |  1  |  1  |  0  |  1  |  0  |  1  | 1   |  1  |  1  |  1  |  6  |
|  0  |  1  |  1  |  1  |  1  |  1  |  1  | 0   |  0  |  0  |  0  |  7  |
|  1  |  0  |  0  |  0  |  1  |  1  |  1  | 1   |  1  |  1  |  1  |  8  |
|  1  |  0  |  0  |  1  |  1  |  1  |  1  | 1   |  0  |  1  |  1  |  9  |
|  1  |  0  |  1  |  0  |  x  |  x  |  x  | 0   |  x  |  x  |  x  |  -  |
|  1  |  0  |  1  |  1  |  0  |  0  |  x  | x   |  x  |  x  |  x  |  -  |
|  1  |  1  |  0  |  0  |  x  |  0  |  0  | x   |  x  |  x  |  0  |  -  |
|  1  |  1  |  0  |  1  |  0  |  x  |  x  | x   |  x  |  0  |  x  |  -  |
|  1  |  1  |  1  |  0  |  x  |  0  |  0  | x   |  x  |  x  |  x  |  -  |
|  1  |  1  |  1  |  1  |  x  |  0  |  0  | 0   |  x  |  x  |  x  |  -  |

**Notes**: 
1. DOT LED is ignored.  
2. Since we will design a BCD to 7-segments the values from 10 to 15 are invalid. For these values we will mark the corresponding segment with X, meaning don’t care.

Now we can express output as minterm expansions:

![][minterm]

If we construct the Karnaugh's Map for each output term and then simplify it we will obtain a logic combination of inputs for each output:


![][output_val]


### Assignment

1. Simulate and synthesis in Verilog the HC4511 circuit from TI.

	![][circuit]

2. Use the provided [testbench][code] to verify the circuit


### Implementation

1. BCD to 7-segments Decoder

```verilog
module dec_7seg(
    datain,bl,dataout
    );

    input   [3:0]   datain; 
    input           bl;
    output  [7:0]   dataout;
    ...
endmodule // decoder
```

2. D-type Latches
```verilog
module dlatch(
    d,
    q,
    nq,
    ena,
    nena
    );
    
    input       d;
    input       ena;
    input       nena;
    output  reg q;
    output  reg nq;
    ...
endmodule // dlatch    
```

3. Driver
```verilog
module drv_7seg(
    lt,
    inbus,
    outbus
    );

    input               lt;
    input       [7:0]   inbus;
    output  reg [7:0]   outbus;
    ...
endmodule // drv_7seg    
```

4. HC4511 Circuit top-level entity
```verilog
module segments_decoder(
    inbus,
    le,
    lt,
    bl,
    outbus

    );
    
    input       [3:0]   inbus;      //input data
    input               le;             //latch-enable
    input               lt;             //lamp-test->displays 8
    input               bl;             //blanking-> blank
    output      [7:0]   outbus;


    wire [3:0]  latch_output;
    wire [7:0]  decoder_output;
    ...
endmodule // segments_decoder    
```




### Bibliography

[1] [Electronics Tutorials](https://www.electronics-tutorials.ws/combination/comb_6.html)

[2] [Electronics Hub](https://www.electronicshub.org/bcd-7-segment-led-display-decoder-circuit/)

[3] [TI HC4511 Datasheet](http://www.ti.com/lit/ds/symlink/cd74hc4511.pdf)

[4] [System Verilog 3.1a](http://www.ece.uah.edu/~gaede/cpe526/SystemVerilog_3.1a.pdf)

[5] [Verilog Tutorial](http://www.asic-world.com/verilog/veritut.html)



[7seg]: 7-segments_display_working.gif
[commonca]: common_cathode_anode_leds.png
[output_val]: output_values.png
[minterm]: minterm_expansion.png
[7segimg]: 7_seg.png
[circuit]: hc4511_block_scheme.png
[code]: circuit_tb.v
