# LABS

## Week 2 : Compiling; Assembly Language; 

### General Info

In addition to the integer registers, the CPU maintains a set of single-bit condition code registers describing attributes of the most recent arithmetic or logical operation. These registers can be tested to perform conditional branches.

The most useful condition codes are:

* **CF**: Carry Flag. Used to detect overflow for unsigned operations.
* **ZF**: Zero Flag.
* **SF**: Sign Flag. The most recent operation yielded a negative value.
* **OF**: Overflow Flag. The most recen operation caused a two's-complement overflow, negative or positive.

#### Comparison and test Instructions

<table>
	<tr>
		<th>Instruction</th>
		<th>Based On</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>CMP S2,S1</td>
		<td>S1=S2</td>
		<td>Compare</td>
	</tr>
	<tr>
		<td>cmpb</td>
		<td>Compare byte</td>
	</tr>
	<tr>
		<td>cmpw</td>
		<td>Compare word</td>
	</tr>
	<tr>
		<td>cmpl</td>
		<td>Compare double word</td>
	</tr>
	<tr>
		<td>TEST S2,S1</td>
		<td>S1&S2</td>
		<td>Test</td>
	</tr>
	<tr>
		<td>testb</td>
		<td>Test byte</td>
	</tr>
	<tr>
		<td>testw</td>
		<td>Test word</td>
	</tr>
	<tr>
		<td>testl</td>
		<td>Test double word</td>
	</tr>		
</table>

### Assignment

#### Practice Problem 1

Compile and assemble the below C code. Try to annotate the assembly code.

```c
int absdiff(int x,int y){
  if(x<y)
    return y-x;
  else
    return x-y;

}
```
For the above code, try to write the equivalent goto version that mimics the control flow of the assembly code.


#### Practice Problem 2

For the below Assembly Code (AT&T syntax) try to write the equivalent C code.

```assembly
movl	8(%ebp),	%edx
movl	12(%ebp),	%eax
testl	%eax	,	%eax
je	.L3
testl	%edx,		%edx
jle	.L3
addl	%edx	,	(%eax)
.L3:
```

### Practice Problem 3

Compile and assemble the below C code. Try to annotate the assembly code.

```c
int fact_do(int n)
{
  int result=1;
  do{
    result*=n;
    n=n-1;
  }while(n>1);
  return result;
}
```
Create a table of register usage.
<table>
	<tr>
		<th>Register</th>
		<th>Variable</th>
		<th>Initially</th>
	</tr>
	<tr></tr>
</table>

#### Practice Problem 4

For the below Assembly Code (AT&T syntax) try to write the equivalent C code and create the register usage table.

```assembly
movl	8(%ebp)	,	%edx
movl	$1	,	%eax
cmpl	$1	,	%edx
jle	.L1
.L2:
imull	%edx	,	%eax
subl	$1	,	%edx
cmpl	$1	,	%edx
jg	.L2
.L2:
```

