*This project has been created as part of the 42 curriculum by grivault.*

# Pipex

## Description
This project focuses on handling pipes by implementing a well-known UNIX 
mechanism in C. The program acts as a pipeline between an input file, two 
shell commands, and an output file. It reads from the first file, executes 
the first command using the file's content as standard input, routes the 
output to the second command and so on for as many commands as there is, and 
writes the final result into the second file. 

The program is designed to behave like the following standard shell 
command:
`< file1 cmd1 | cmd2 > file2`

## Instructions

### Compilation
    The project includes a `Makefile` that compiles the source files into the 
    `pipex` executable using `cc` and the mandatory `-Wall -Wextra -Werror` 
    flags. It resolves dependencies and compiles your custom `libft` library 
    before the main project. It is built to avoid unnecessary relinking.

    To compile the program, run:
    ```bash
    make
    ```
    The Makefile also supports the standard rules: `clean`, `fclean`, `re`, 
    and a custom `redo` rule.

### Execution
    The program must be executed with at least 4 arguments:
    ```bash
    ./pipex file1 cmd1 cmd2 file2
    ```
    * `file1`: The name of the input file.
    * `cmd1`: The first shell command along with its parameters (e.g., "ls -l").
    * `cmd2`: The second shell command along with its parameters (e.g., "wc -l").
    * `file2`: The name of the output file.

    **Usage Example:**
    ```bash
    ./pipex infile "grep a1" "wc -w" outfile
    ```
    This execution is strictly equivalent to running 
    `< infile grep a1 | wc -w > outfile` in your shell. Errors are handled 
    identically to the standard shell command behavior. More than two commands 
    can be executed in the pipeline by adding them betwen the file1 and file2

## Resources

**Classic References:**
- UNIX Programmer's Manual (man pages) for: `pipe`, `fork`, `dup2`, 
`execve`, `perror`, `waitpid`, etc.*
- Advanced Programming in the UNIX Environment* (APUE) for process 
control and inter-process communication.
- Medium articles about the project especially for how to handle multiple pipes
- AI was used to debug the code (trace the origin of Segfaults for exemple) and
to help me handle the quotes in a comands argument
