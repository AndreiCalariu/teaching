# Organizarea Calculatoarelor

## Laborator 6( 2 - 6 April 2018)


### Exercises

1. Using SRT division algorithm divide 14 ( 1110) by 3 ( 0011).
2. Using SRT division algorithm divide 8 ( 1000) by 3 ( 0011).
3. Using SRT division algorithm divide 127 ( 0111 1111) by 25 ( 0001 1001).
4. Using radix-4 SRT division algorithm divide 149 ( 1001 0101) by 5 ( 0000 0101).
5. Using radix-4 SRT division algorithm divide 127 ( 0111 1111) by 25 ( 0001 1001).
6. Using radix-4 SRT division algorithm divide 238 ( 1110 1110) by 11 ( 0000 1011).
7. Using radix-4 SRT division algorithm divide 228 ( 1110 0100) by 41 ( 0010 1001).
8. Using radix-4 SRT division algorithm divide 154 ( 1001 1010) by 27 ( 0001 1011).

![Quotient digits for radix-4 SRT division with a propagate adder][radix4srt_quotient_digits]

### Assignment

1. Implement SRT division algorithm in Verilog.

```
declare register A[7:0],Q[7:0],M[7:0],COUNT[3:0],COUNTC[2:0];
bus INBUS[7:0],OUTBUS[7:0];
BEGIN:		COUNT:=0, COUNTC:=0,
INPUT:	 	A[7:0]:=INBUS[7:0];
		Q[7:0]:=INBUS[7:0];
		M[7:0]:=INBUS[7:0];
NORMALIZE: 	if M[7]=1 then go to TEST1,
		M[7:1]:=M[6:0],A.Q[7:1]:=A[6:0].Q,COUNTC:=COUNTC+1,go to NORMALIZE;
TEST1: 		if (A[7] ex-nor A[6])=1 then
			A.Q[7:1]:=A[6:0].Q,COUNT:=COUNT+1,Q*[0]:=0, go to TEST2;
		if A[7]=1 then begin
			A.Q[7:1]:=A[6:0].Q,COUNT:=COUNT+1,Q*[0]:=-1;
			A:=A+M, go to TEST2;
		end
		else begin
			A.Q[7:1]:=A[6:0].Q,COUNT:=COUNT+1,Q*[0]:=1;
			A:=A-M, go to TEST2;
		end
TEST2:		if COUNT8=1 then go to TEST1
CORRECTION: 	if A[7]=1 then A:=A+M, Q:=Q-1;
TEST3:		if COUNTC=0 then A[6:0]:=A[7:1], COUNTC:=COUNTC-1, go to TEST3;
OUTPUT:		OUTBUS:=Q;
		OUTBUS:=A;
END:			

```







### Bibliography

[1] M. Vladutiu, Computer Arithmetic Algorithms and Hardware Implementations

[2] [J.L.Hennessy, D.A. Patterson, Computer Architecture a Quantitive Approach 5th edition, Appendix J](https://booksite.elsevier.com/9780123838728/references/appendix_j.pdf)

[3] [System Verilog 3.1a](http://www.ece.uah.edu/~gaede/cpe526/SystemVerilog_3.1a.pdf)

[4] [Verilog Tutorial](http://www.asic-world.com/verilog/veritut.html)

[radix4srt_quotient_digits]:https://raw.githubusercontent.com/ardeleanasm/teaching/master/OC/lab6/quotient_digits_radix4_srt.PNG


