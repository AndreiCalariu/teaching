# Organizarea Calculatoarelor

## Laborator 4( 12 - 16 Mar 201)


### Exercises

1. Using radix-4 Booth Algorithm multiply 69 ( 0100 0101) with -45 ( 1101 0011).
2. Using radix-4 Booth Algorithm multiply -123 ( 1000 0101) with -105 ( 1001 0111).
3. Using radix-4 Booth Algorithm -105 * 2^-7 (1001 0111) with -89 * 2^-7 (1010 0111). Result must be 9345*2^-14 (0100 1001 0000 0010)


Note: You can use the following flowchart:

![radix-4 Booth's Algorithm flowchart][radix4_flowchart]

### Assignment

1. Implement radix-4 Booth Algorithm in Verilog.

```
register A[8:0],Q[7:-1],M[7:0],COUNT[1:0];
bus INBUS[7:0],OUTBUS[7:0];
BEGIN : A:=0, COUNT:=0,
INPUT : Q:=INBUS,Q[-1]:=0; {c0}
       	M:=INBUS; {c1}
SCAN : 	if Q[1]Q[0]Q[-1]=001 or Q[1]Q[0]Q[-1]=010 then A:=A+M, goto RSHIFT; {c2}
	else if Q[1]Q[0]Q[-1]=101 or Q[1]Q[0]Q[-1]=110 then A:=A-M, goto RSHIFT; {c2,c3}
	else if Q[1]Q[0]Q[-1]=011 then A:=A+2M,  goto RSHIFT; {c2,c4}
	else if Q[1]Q[0]Q[-1]=100 then A:=A-2M; {c2,c3,c4}
RSHIFT:	A[6:0].Q[7:-1]:=A.Q[7.1], A[7]:=A[8],A[8]:=A[8]; {c5}
TEST:  	if COUNT3=1 then goto OUTPUT;
	COUNT:=COUNT+1,
	goto SCAN; {c6}
OUTPUT:
	OUTBUS:=Q, {c7}
	OUTBUS:=A; {c8}
END.
```



2. Create a testbench as in [Example][5]


### Bibliography
[1] [Teaching ACSA](http://www.acsa.upt.ro/teaching/AC/Lucrarea_9.pdf)

[2] [J.L.Hennessy, D.A. Patterson, Computer Architecture a Quantitive Approach 4th edition](https://ia600208.us.archive.org/12/items/ComputerArchitectureAQuantitativeApproach4thEditionJohnLHennessyDavidAPatterson/Computer_Architecture_A_Quantitative_Approach_4th_Edition_John_L_Hennessy_David_A_Patterson.pdf)

[3] [System Verilog 3.1a](http://www.ece.uah.edu/~gaede/cpe526/SystemVerilog_3.1a.pdf)

[4] [Verilog Tutorial](http://www.asic-world.com/verilog/veritut.html)

[5]: https://github.com/ardeleanasm/teaching/blob/master/OC/templates/booth_tb.v

[radix4_flowchart]:https://raw.githubusercontent.com/ardeleanasm/teaching/master/OC/lab4/radix4.png

