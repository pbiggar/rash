# Rash - the Reborn Again SHell


Rash is a shell scripting language intended to replace bash.
Its goal is to allow simple, readable, understandable and secure shell scripting.
In particular, it aims at the niche currently occupied by Bash programs, and specifically aims to address problems in bash and with bash programs.

Rash was created after frustration with trying to create a set of readable and writable bash scripts, and discovering that:
- the core idea of bash (treating functions and programs in the same way, functions use stdin and generate stdout, core focus on program execution and pipelines of data) are powerful and elegant
- while bash 4 has come a long way, writing
- simple string operations are complex
- passing around data is complex


Major goals
+++++++++++++++++++


Be easy to read
-----------------------

Bash is hard to read and understand.
It uses obscure idioms (eg [[ vs [,), has no (or many) sets of best practices.
While not as "write-only" as perl, it certainly requires a trained eye to read it and to understand it.

Rash aims to be readable to somebody who has never seen a rash script before.



Be easy to write
-----------------------

There are many things that are hard to do in bash, or that don't have a simple idiomatic solution.
Many things that you would consider language builtins (and are in other languages) are provided by other unix programs (such as awk, sed, bc, curl or jq)

- storing and sharing data (have you seen the syntax for array and hashtable operations?)
- regex operations (bash 4 has reasonable regex, but it's not PCRE; sed is awful)
- string operations (how do you trim a string, or convert to uppercase)
- http operations (how do you make an http calls)
- file operations (do you remember all the incantations that [[ supports, or know how to redirect both stderr and stdout to different files)
- integer operations (bash has very basic support, you're expected to use dc, or use awk)
- handling errors in the middle of a set of piped operations
- threading, concurrency, parallelism

It should be straightforward to write Rash programs.



Be harder to make mistakes in
-----------------------

Bash is very easy to make mistakes in, especially security mistakes.
There are two types of flaws that are super common:
- failure to properly read and write to variables
- failure to handle errors in pipelines

While the former can be handled with unpleasant idioms ("${MY_VAR}"), the latter has no good support.

Rash aims to be very difficult to make this sort of mistake in.

Finally, Rash aims to include tools that check and validate programs, to help the programer write safer more secure, and more correct code.


Have tools to convert bash into it
-----------------------

Rash will be no good if only new programs can be written in it.
We intend to provide a tool to convert Bash programs into Rash programs.



Be modern
-----------------------

Lastly, Bash is aimed at the programs we want to write in 2015, not the programs from 1980.
It has native support for JSON, HTTP, integers(!), hashtables, arrays, streams, and string operations.
A little bit of batteries included will go a long way.


Lessor goals
++++++++++++++++++++++++++
- be easy to distribute (static binaries only)
- to be portable
- to be strictly versioned


non-goals
++++++++++++++++++++++++++
- to be useful as an inteactive shell (for now, maybe later, once I figure out what that really means)
- to be synctically similar to bash (as bash did to sh)
- to stick strictly to unixisms such as "do one thing well"
- to be useful for large programs
- to compete with python, perl, ruby, node, etc
