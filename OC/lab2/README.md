# Organizarea Calculatoarelor

## Laborator 2( 5 - 9 Mar 2018) 


### General Info 

#### Sequential Circuits

La circuitele logice secvențiale, starea ieșirilor depinde nu numai de starea actuală a intrarilor, dar și de stările anterioare ale circuitului. Din acest motiv se spune că circuitele logice secvențiale sunt circuite cu memorie.

Acestea pot fi de tip **Latch** sau **Flip-Flop (FF)**, fiecare dintre ele putând memora un singur bit de informație la un moment dat.

Diferenta principala dintre ele consta in faptul ca:

1. iesirea latch-urilor este constant afectată de intrare (atâta timp cât semnalul de “enable” este setat corespunzător (e.g. palier “1” sau “0” al semnalului)).

2. ieșirea FF-urile se schimbă doar la momentul frontului crescător (sau descrescător, după caz) al semnalului de “enable” (e.g. tranziția de la “0”->”1” sau de la “1” la “0”).

##### Flip-Flop Circuits

Circuitele JK au avantajul de a prezenta multe stări indiferente la intrare, fapt ce permite simplificarea circuitelor.

Circuitele D au avantajul de a nu fi necesară resetarea, dar ecuațiile la intrare sunt mult mai complexe decât la circuitele JK. Sunt utilizare mai des deoarece:

1. Au o singură intrare
2. Nu au tabelă de excitare
3. Necesită mai puține componente electronice decât circuitele JK

#### Combinational Circuits

Circuitele logice combinaționale sunt circuite fără memorie și se caracterizează prin faptul că semnalele de ieșire sunt combinații logice ale semnalelor de intrare.

#### Verilog

```
//Combinational
always 
	@(signal_state_CURRENT) 
begin 
	// signal_state_NEXT = f(signal_state_CURRENT); 
	signal_state_NEXT = signal_state_CURRENT; 
	// or, as an example: 
	// signal_state_NEXT = ~signal_state_CURRENT; 
end
```

```
//sequential
always 
	@(posedge clk, posedge rst) 
begin 
	if (rst) 
		signal_state_CURRENT <= 1'b0; 
	else signal_state_CURRENT <= signal_state_NEXT; 
end
```

**Note**: Check out this [Link][[original_1]] for more details!


### Assignment

1. Implement a **Divide by 2 Counter** in Verilog.

![Divide by 2 Counter][img_1]

2. Create a testbench as in [Example][code_1].

3. Implement an **4-bit Asynchronous Up Counter** in Verilog.

![4-bit Asynchronous Up Counter][img_2]

4. Create a testbench as in [Example][code_1].


### Bibliography
[1] [Teaching ACSA](http://www.acsa.upt.ro/teaching/AC/)

[2] [J.L.Hennessy, D.A. Patterson, Computer Architecture a Quantitive Approach 4th edition](https://ia600208.us.archive.org/12/items/ComputerArchitectureAQuantitativeApproach4thEditionJohnLHennessyDavidAPatterson/Computer_Architecture_A_Quantitative_Approach_4th_Edition_John_L_Hennessy_David_A_Patterson.pdf)

[3] [System Verilog 3.1a](http://www.ece.uah.edu/~gaede/cpe526/SystemVerilog_3.1a.pdf)

[4] [Verilog Tutorial](http://www.asic-world.com/verilog/veritut.html)

[5] [Latches and Flip-Flops](http://www.cs.ucr.edu/~ehwang/courses/cs120b/flipflops.pdf)

[6] [Circuite Logice](https://mail.uaic.ro/~gasner/FI2_Arhitectura_Calculatoarelor/02_09_Circuite_logice_Analiza_secvential.pdf)

[7] [Compilation, Simulation of VHDL on Quartus](https://www.youtube.com/watch?v=u_fTkeIqe-Q&feature=youtu.be&t=687)

[8] [Quartus II Handbook](https://www.altera.com/content/dam/altera-www/global/en_US/pdfs/literature/hb/qts/qts_qii5v1.pdf)

[9] [Digital Counters](http://www.learnabout-electronics.org/Digital/dig56.php)

[10] [The D-type Flip Flop](https://www.electronics-tutorials.ws/sequential/seq_4.html)

[code_1]: https://github.com/ardeleanasm/teaching/blob/master/OC/templates/d_ff_tb.v

[original_1]: https://drive.google.com/open?id=10vYuaZuveKRsyXlc-t2sg79pO8SulvTJ



[img_1]: https://raw.githubusercontent.com/ardeleanasm/teaching/master/OC/lab2/divide_by_two_counter.png

[img_2]:https://raw.githubusercontent.com/ardeleanasm/teaching/master/OC/lab2/4_bit_async_counter.png
