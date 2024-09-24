## Docs 

First, create a simple C file, name it ‘hello.c’:

```c

#include <stdio.h>

int main() {
  printf("hello world\n");
  return 0;
}
```

Next, compile the C file into a native executable:

`clang hello.c -o hello`

## Note

Clang works just like GCC by default. The standard -S and -c arguments work as usual (producing a native .s or .o file, respectively).

## Next, compile the C file into an LLVM bitcode file:

`clang -O3 -emit-llvm hello.c -c -o hello.bc`

The -emit-llvm option can be used with the -S or -c options to emit an LLVM .ll or .bc file (respectively) for the code. This allows you to use the standard LLVM tools on the bitcode file.

Run the program in both forms. To run the program, use:

`./hello`

and

`lli hello.bc`

The second examples shows how to invoke the LLVM JIT, lli.

Use the llvm-dis utility to take a look at the LLVM assembly code:

`llvm-dis < hello.bc | less`

Compile the program to native assembly using the LLC code generator:

`llc hello.bc -o hello.s`

Assemble the native assembly language file into a program:
`
/opt/SUNWspro/bin/cc -xarch=v9 hello.s -o hello.native   # On Solaris

gcc hello.s -o hello.native                              # On others
`
Execute the native code program:

`./hello.native`

Note that using clang to compile directly to native code (i.e. when the -emit-llvm option is not present) does steps 6/7/8 for you.
