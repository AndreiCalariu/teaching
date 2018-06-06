# Organizarea Calculatoarelor

## Laborator 5( 26 - 30 Mar 2018)


### Exercises

1. Using restoring binary division algorithm divide 14 ( 1110) by 3 ( 0011).
2. Using restoring binary division algorithm divide 5 ( 0101) by 2 ( 0010).
3. Using restoring binary division algorithm divide 127 ( 0111 1111) by 25 ( 0001 1001).
4. Using non-restoring binary division algorithm divide 14 ( 1110) by 3 ( 0100).
5. Using non-restoring binary division algorithm divide 5 ( 0101) by 2 ( 0010).
6. Using non-restoring binary division algorithm divide 127 ( 0111 1111) by 25 ( 0001 1001).



### Assignment

1. Implement restoring binary division algorithm in Verilog.

```
register A[7:0],Q[7:0],M[8:0],COUNT[2:0],S;
bus INBUS[7:0],OUTBUS[7:0];
BEGIN :		S:=0, COUNT:=0,					{c0}
INPUT : 	A:=INBUS;					{c0}
		Q[7:0]:=INBUS[7:0]; 				{c1} 
       		M[7:0]=INBUS[7:0],M[8]:=0; 			{c2}
SUBTRACT: 	
		S.A.Q[7:1]:=A.Q;				{c3,c4}
		S.A:=S.A-M;					{c3,c4}
TEST:		if S=0 then begin
			Q[0]:=1,				{c5}
			if COUNT7=1 then go to OUTPUT; 
			else begin COUNT:=COUNT+1;end; 		{c6}
			go to SUBSTRACT;			{c3,c4}
		end
		else begin
			Q[0]:=0,				{c7}
			if COUNT7=1 then go to OUTPUT; 
			else begin COUNT:=COUNT+1; end		{c6}
			S.A:=S.A+M, go to SUBTRACT;		{c3}
		end
OUTPUT:		OUTBUS:=Q;					{c8}
		OUTBUS:=A;					{c9}
END: 								{end}			


```


2. Implement non-restoring binary division algorithm in Verilog.

```
register A[7:0],Q[7:0],M[8:0],COUNT[2:0],S;
bus INBUS[7:0],OUTBUS[7:0];
BEGIN :		S:=0, COUNT:=0,						{c0}
INPUT : 	A:=INBUS; 						{c0}
		Q[7:0]:=INBUS[7:0];					{c1} 
       		M[7:0]=INBUS[7:0],M[8]:=0;				{c2}
TEST:		if S=0 then begin
			Q[0]:=1,					{c5}
			if COUNT7=1 then go to CORRECTION; 
			else begin COUNT:=COUNT+1,S.A.Q[7:1]:=A.Q;end; 	{c6}
			S.A:=S.A-M, go to TEST;				{c3,c4}
		end
		else begin
			Q[0]:=0,					{c7}
			if COUNT7=1 then go to CORRECTION; 
			else begin COUNT:=COUNT+1,S.A.Q[7:1]:=A.Q; end	{c6}
			S.A:=S.A+M, go to TEST;				{c3}
		end
CORRECTION:	if S=1 then S.A:=S.A+M;					{c3}
OUTPUT:		OUTBUS:=Q;						{c8}
		OUTBUS:=A;						{c9}
END: 									{end}			

```


3. Create a testbench as in [Example][5]


### Bibliography
[1] [Teaching ACSA](http://www.acsa.upt.ro/teaching/AC/Lucrarea_9.pdf)

[2] [J.L.Hennessy, D.A. Patterson, Computer Architecture a Quantitive Approach 4th edition](https://ia600208.us.archive.org/12/items/ComputerArchitectureAQuantitativeApproach4thEditionJohnLHennessyDavidAPatterson/Computer_Architecture_A_Quantitative_Approach_4th_Edition_John_L_Hennessy_David_A_Patterson.pdf)

[3] [System Verilog 3.1a](http://www.ece.uah.edu/~gaede/cpe526/SystemVerilog_3.1a.pdf)

[4] [Verilog Tutorial](http://www.asic-world.com/verilog/veritut.html)

[5]: https://github.com/ardeleanasm/teaching/blob/master/OC/templates/booth_tb.v



