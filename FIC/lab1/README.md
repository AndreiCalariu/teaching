# LABS

## Week 1 : Compiling; Assembly Language; 

### General Infos

Create a \*.c file and write a simple function:

```c
int accum=0;

int sum(int x,int y)
{
  int t=x+y;
  accum+=t;
  return t;
}
```

* Compile the program using gcc command line. Use GCC [Documentation][gcc doc] for more information about the options passed.

```
gcc [options] file...
```

* Generate assembly code using the command:

```
gcc -O1 -S file.c
```

* Compile and assemble the code using the command:

```
gcc -O1 -c file.c
```
The above command will generate an object-code file that is in binary format. 

* Using a dissasembler ( **objdump**) inspect the content of machine-code file:

```
objdump -d file.o
```
> On the left there are hexadecimal byte values partitioned into groups of 1 to 6 bytes each. Each of these groups is a single instruction, with the assembly language equivalent shown on the right.

* Compile and assemble the program with debug symbols (**-g**). 

* Using **objdump** inspect the resulted obj file. Use objdump [documentation][objdump_doc] for more information about the options passed.

```
objdump -d -M intel -S obj_name

```

* Understand the assembly code and try to annotate it. Use the resources listed below to understand the x86_64 instructions and assembly mnemonics.

  * [Computer Systems: A programmer's Perspective, chapter 3 ][resource1]
  * [Intel® 64 and IA-32 Architectures Software Developer’s Manual][asmresource1]
  * [PC Assembly Language][asmresource2]
  
* Generating the executable requires running a linker on the set of object-code files, one of which must contain a function **main**. Create a **main.c** file with the following content:

```c
int main()
{
  return sum(1, 3);
}
```

Use the next command to compile & link the program:

```
gcc -O1 -o progr_name obj_name.o main.c
```

### Assignment

* Write in C a function that performs the multiplication of two integers and try the above commands.
* Inspect the assembly code and annotate it.



[gcc doc]:https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html
[objdump_doc]:https://linux.die.net/man/1/objdump
[resource1]:https://github.com/iovanalex/nokia-acsa/blob/master/Docs/Documentatie-CPU.pdf
[asmresource1]:https://software.intel.com/sites/default/files/managed/39/c5/325462-sdm-vol-1-2abcd-3abcd.pdf
[asmresource2]:http://pacman128.github.io/pcasm/


