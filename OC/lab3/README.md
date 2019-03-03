# Organizarea Calculatoarelor

## Laborator 3( 12 - 16 Mar 201)



### Exercises

1. Using Booth's Algorithm multiply 7 ( 0111) with 3 (0011).
2. Using Booth's Algortihm multiply -4 (1100) with -5 (1011).
3. Using Booth's Algorithm multiply -105 * 2^-7 (1001 0111) with -89 * 2^-7 (1010 0111). Result must be 9345*2^-14 (0100 1001 0000 0010)


Note: You can use the following flowchart:

![Booth's Algorithm flowchart][booth_flowchart]

### Assignment

1. Implement Booth's Algorithm in Verilog.

```
register A[7:0],Q[7:-1],M[7:0],COUNT[2:0];
bus INBUS[7:0],OUTBUS[7:0];
BEGIN : A:=0, COUNT:=0,
INPUT : M:=INBUS; {c0}
	Q:=INBUS, Q[-1]:=0; {c1}
SCAN :  if Q[0]Q[-1]=01 then A[7:0] := A[7:0] + M[7:0], goto TEST; {c2}
	else if Q[0]Q[-1]=10 then A[7:0]:=A[7:0]-M[7:0];{c2,c3}
TEST :
	if COUNT7=1 then goto OUTPUT, 
	RSHIFT: A[7]:=A[7], A[6:0].Q:=A.Q[7:0], 
	COUNT:=COUNT+1, 
	goto SCAN; {c4}
OUTPUT:
	OUTBUS:=A, Q[0]:=0; {c5}
	OUTBUS:=Q; {c6}
END.
```



2. Create a testbench as in [Example][5]


### Bibliography
[1] [Teaching ACSA](http://www.acsa.upt.ro/teaching/AC/Lucrarea_9.pdf)

[2] [J.L.Hennessy, D.A. Patterson, Computer Architecture a Quantitive Approach 4th edition](http://uni-site.ir/khuelec/wp-content/uploads/Computer-Architecture-A-Quantitative-Approach.pdf)

[3] [System Verilog 3.1a](http://www.ece.uah.edu/~gaede/cpe526/SystemVerilog_3.1a.pdf)

[4] [Verilog Tutorial](http://www.asic-world.com/verilog/veritut.html)

[5]: ../templates/booth_tb.v

[booth_flowchart]:booth_flowchart.PNG

