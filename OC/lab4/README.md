# Organizarea Calculatoarelor

## Laborator 4( 12 - 16 Mar 201)


### Exercises

1. Using Modified Booth Algorithm multiply -13 ( 10011) with -15 ( 10001).
2. Using Modified Booth Algorithm multiply 69 ( 0100 0101) with -45 ( 1101 0011).
3. Using Modified Booth Algorithm multiply -123 ( 1000 0101) with -105 (1001 0111).
4. Using Radix-4 Booth Algorithm multiply 69 ( 0100 0101) with -45 ( 1101 0011).
5. Using Radix-4 Booth Algorithm multiply -123 ( 1000 0101) with -105 ( 1001 0111).


Note: You can use the following flowchart for Radix-4 Booth:

![radix-4 Booth's Algorithm flowchart][radix4_flowchart]

### Assignment

1. Implement Radix-4 Booth Algorithm in Verilog.

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

2. Implement Modified Booth Algorithm in Verilog.

```
            declare register A[7:0],Q[8:0],M[7:0],COUNT[2:0],R;
            declare bus INBUS[7:0],OUTBUS[7:0];
BEGIN:      A:=0, COUNT:=0,R:=0,                                                {c0}
INPUT:      M:=INBUS;                                                           {c0}
            Q[7:0]:=INBUS[7:0],Q[8]:=INBUS[7];                                  {c1}
ZEROTEST:   if ORQ=0 then go to OUTPUT,
            if ORM!=0 then go to TEST1, else Q:=0, go to OUTPUT;                {c2}
TEST1:      if (M[7]=1 and Q[0]=0) then
                A[7]:=0,A[6:0].Q:=A.Q[8:1],COUNT:=COUNT+1,go to TEST1;          {c3,c4}
TEST2:      if R=0 then begin
                if Q[1]Q[0]=01 then A:=A+M;                                     {c5}
                if Q[1]Q[0]=11 then A:=A-M,R:=1, else go to TEST3;              {c5,c6,c7}
            end
            if R=1 then begin
                if Q[1]Q[0]=00 then A:=A+M,R:=0;                                {c5,c8}
                else if Q[1]Q[0]=10 then A:=A-M;                                {c5,c6}
            end
            if COUNT7=1 then go to OUTPUT,
TEST3:      A[7]:=R EXOR M[7],A[6:0].Q=A.Q[8:1],                                {c3,c9}
RIGHTSHIFT: COUNT:=COUNT+1, go to TEST2;                                        {c3,c9}
INCREMENT:  OUTBUS:=A,Q[1]:=0;                                                  {c10}
OUTPUT:     OUTBUS[7:0]:=Q[8:1];                                                {c11}
END:                                                                            {END}
```

3. Create a testbench as in [Example][5]


### Bibliography
[1] [Teaching ACSA](http://www.acsa.upt.ro/teaching/AC/Lucrarea_9.pdf)

[2] [J.L.Hennessy, D.A. Patterson, Computer Architecture a Quantitive Approach 4th edition](https://ia600208.us.archive.org/12/items/ComputerArchitectureAQuantitativeApproach4thEditionJohnLHennessyDavidAPatterson/Computer_Architecture_A_Quantitative_Approach_4th_Edition_John_L_Hennessy_David_A_Patterson.pdf)

[3] [System Verilog 3.1a](http://www.ece.uah.edu/~gaede/cpe526/SystemVerilog_3.1a.pdf)

[4] [Verilog Tutorial](http://www.asic-world.com/verilog/veritut.html)

[5]: https://github.com/ardeleanasm/teaching/blob/master/OC/templates/booth_tb.v

[radix4_flowchart]:radix4.png

