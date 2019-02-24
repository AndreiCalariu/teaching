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





### Tools

1. [Quartus IDE](https://www.altera.com/downloads/download-center.html)
2. [ModelSim](https://www.mentor.com/company/higher_ed/modelsim-student-edition)
3. For Linux users only I recommend **iverilog**, **Emacs** and **GTKWave**


### Exercises

1. Define a sequential logic circuit.
2. Define a combinational logic circuit.
3. What is an FPGA? 
4. What is an ASIC?


### Assignment

1. Design in Verilog an architecture consisting of a multiplier and an adder. Use a select signal to choose between operations. The multiplier should perform multiplication by powers of 2.


### Bibliography
[1] [Teaching ACSA](http://www.acsa.upt.ro/teaching/AC/)

[2] [J.L.Hennessy, D.A. Patterson, Computer Architecture a Quantitive Approach 4th edition](https://ia600208.us.archive.org/12/items/ComputerArchitectureAQuantitativeApproach4thEditionJohnLHennessyDavidAPatterson/Computer_Architecture_A_Quantitative_Approach_4th_Edition_John_L_Hennessy_David_A_Patterson.pdf)

[3] [VHDL Tutorial: Learn By Example](http://esd.cs.ucr.edu/labs/tutorial/)
