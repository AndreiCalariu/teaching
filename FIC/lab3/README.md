# LABS


## Week 3 : Compiling; Assembly Language; 

### General Info

## Conditional Move Instructions

The conventional way to implement conditional operations is through a conditional transfer of control, where the program follows one execution path when a condition holds. It's a simple and general mechanism but it can be inefficient on modern processors.

So, an alternate strategy is through a conditional transfer of data. This strategy makes sense only in restricted
cases, but it can then be implemented by a simple conditional move instruction
that is better matched to the performance characteristics of modern processors.


![Stack Frame][move_instr]
	
## Practice Problem 1

Try to annotate the assembly code.

```assembly

movl 8(%ebp), %ecx
movl 12(%ebp), %edx
movl %edx, %ebx
subl %ecx, %ebx
movl %ecx, %eax
subl %edx, %eax
cmpl %edx, %ecx
cmovl %ebx, %eax
```

## Practice Problem 2

Compile and assemble the following C code. Is the following code a good candidate to compile using a conditional move? Why?

```C
int lcount = 0;
int absdiff_se(int x, int y) {
	return x < y ? (lcount++, y-x) : x-y;
}
```

## Procedures

A Procedure call involves passing data and control from one part of a program to another. In addition, for local variables, it must allocate space on entry and deallocate them on exit. The passing of data ( procedures parameters and return values) and the allocation and deallocation is handled by manipulating the program stack.

## Stack Frame Structure

The machine uses the stack to pass procedure arguments, to store return information, to save registers for later restoration anf for local storage. The next figure diagrams the general structure of a stack frame[1] ( portion of the stack allocated for a single procedure call). The topmost stack frame is delimited by two pointers, with register **%ebp** serving as *frame pointer*, and **%esp** serving as *stack pointer*. The stack pointer can move while the procedure is executing, and hence most information is accessed relative to the frame pointer.


![Stack Frame][logo]


## Transferring Control

<table>
	<tr>
		<th>Instruction</th>
		<th>Description</th>
	</tr>
	<tr>
		<td>call <i>Label</i></td>
		<td>Procedure Call</td>
	</tr>
	<tr>
		<td>call <i>*Operand</i></td>
		<td>Procedure Call</td>
	</tr>
	<tr>
		<td>leave</i></td>
		<td>Prepare stack for return</td>
	</tr>
	<tr>	
		<td>ret</i></td>
		<td>Return from call</td>
	</tr>
</table>

The call instruction has a target indicating the address of the instruction where the called procedure starts and, like jumps can either be direct or indirect. An indirect call is given by a * followed by an operand specifier. The effect of a call instruction is to push a return address on the stack and jump to the start of the called procedure.

## Register Usage

By convention, registers %eax, %ecx and %edx are classified as *caller-save* registers while on the other hand %ebx, %esi and %edi are classified as *callee-save* registers.


### Assignment

## Practice Problem 1

Considering that a C function has the following code body:

```C
*p = d;
return x-c;
```

And the assembly code implementing this body is as follows:

```assembly
movsbl 	12(%ebp),%edx
movl 	16(%ebp), %eax
movl 	%edx, (%eax)
movswl 	8(%ebp),%eax   ;move sign extend
movl 	20(%ebp), %edx
subl 	%eax, %edx
movl 	%edx, %eax
```
Write a prototype for function **fun**, showing the types and the ordering of the arguments p,d,x and c.


## Practice Problem 2

The C code function for a recursive factorial has the following code body:

```C
int rfact(int n)
{
	int result;
	if (n <= 1)
		result = 1;
	else
		result = n * rfact(n-1);
	return result;
}

```

And the assembly code implementing this function is as follows:

```assembly
rfact:
	pushl %ebp
	movl %esp, %ebp
	pushl %ebx
	subl $4, %esp
	movl 8(%ebp), %ebx
	movl $1, %eax
	cmpl $1, %ebx
	jle .L53
	leal -1(%ebx), %eax
	movl %eax, (%esp)
	call rfact
	imull %ebx, %eax
.L53:
	addl $4, %esp
	popl %ebx
	popl %ebp
	ret
```

Try to annotate the assembly code with the correct C instruction.


## Practice Problem 2

For a C function having the general structure

```C
int rfun(unsigned x) 
{
	if (..... )
		return ....;
	unsigned nx = ....;
	int rv = rfun(nx);
	return ....;
}

```
GCC generates the following assembly code (with the setup and completion code
omitted):

```assembly
	movl 8(%ebp), %ebx
	movl $0, %eax
	testl %ebx, %ebx
	je .L3
	movl %ebx, %eax
	shrl %eax 			;Shift right by 1
	movl %eax, (%esp)
	call rfun
	movl %ebx, %edx
	andl $1, %edx
	leal (%edx,%eax), %eax
.L3:
```
----



[1]: R.E.Bryant, D.R.O'Hallaron, Computer Systems A programmer's Perspective, Chapter 3.7 page 220

[logo]: https://raw.githubusercontent.com/ardeleanasm/teaching/master/FIC/lab3/stack_frame.PNG
[move_instr]: https://raw.githubusercontent.com/ardeleanasm/teaching/master/FIC/lab3/move_instr.PNG


