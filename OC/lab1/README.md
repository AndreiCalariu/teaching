# Organizarea Calculatoarelor

## Laborator 1

### General Info

1. Define a Sequential Logic Circuit.
2. Define a Combinational Logic Circuit.
3. Latch vs Flip-Flop


### Verilog Implementations ( Examples)

```Verilog
//Combinational
always 
	@(signal_input_state) 
begin 
	// signal_output_state = f(signal_input_state); 
	
end

```

```Verilog
//sequential
always 
	@(posedge clk, posedge rst) 
begin 
	if (rst) 
		signal_state_CURRENT <= 1'b0; 
	else 
                signal_state_CURRENT <= signal_state_NEXT; 
end
```

### Recommended Tools

1. [Quartus IDE](https://www.altera.com/downloads/download-center.html)
2. [ModelSim](https://www.mentor.com/company/higher_ed/modelsim-student-edition)
3. For Linux users only I recommend **iverilog**, **Emacs** and **GTKWave**
4. [Online Editor & Simulator](https://www.edaplayground.com/)


### Assignment

1. 


### Bibliography
[1] [Teaching ACSA](http://www.acsa.upt.ro/teaching/AC/)

[2] [J.L.Hennessy, D.A. Patterson, Computer Architecture a Quantitive Approach 4th edition]()

[3] [M.Vladutiu, Computer Arithmetic: Algorithms and Hardware Implementations]()

[4] [VHDL Tutorial: Learn By Example](http://esd.cs.ucr.edu/labs/tutorial/)

[5] [Verilog Tutorial](http://www.asic-world.com/verilog/veritut.html)

[6] [Latches and Flip-Flops](http://www.cs.ucr.edu/~ehwang/courses/cs120b/flipflops.pdf)

[7] [Digital Counters](http://www.learnabout-electronics.org/Digital/dig56.php)

[8] [The D-type Flip Flop](https://www.electronics-tutorials.ws/sequential/seq_4.html)

