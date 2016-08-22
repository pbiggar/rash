# Rash - the Rebourne Again SHell


Rash is a shell scripting language intended to replace bash. Its goal is to allow simple, readable, understandable and secure shell scripting. In particular, it aims at the niche currently occupied by Bash programs, and specifically aims to address problems in bash and with bash programs.

In particular, the goal is to make it easy to write 5-500 line scripts that mostly involve string handling, filesystem manipulation, and calling other programs.

Rash was created after frustration with trying to create a set of readable and writable bash scripts, and discovering that:
- the core ideas of bash (treating functions and programs in the same way, functions use stdin and generate stdout, core focus on program execution and pipelines of data) are powerful and elegant
- while bash 4 has come a long way:
  - simple string operations are complex
  - regexes are terrible
  - passing around data is complex
  - hard to do web stuff
  - writing functions is unreasonably hard
  - you need to use expr, awk and sed, which are also terrible



## Major goals



### Be easy to read


Bash is hard to read and understand. It uses obscure idioms (eg [[ vs [,), and has no (or many) sets of best practices. While not as "write-only" as perl, it certainly requires a trained eye to read it and to understand it.

Rash aims to be readable to somebody who has never seen a rash script before.



### Be easy to write

There are many things that are hard to do in bash, or that don't have a simple idiomatic solution. Many things that you would consider language builtins (and are in other languages) missing, or are supposed to be provided by other unix programs (such as awk, sed, bc, curl, grep or jq)

- storing and sharing data (have you seen the syntax for array and hashtable operations?)
- regex operations (bash 4 has reasonable regex, but it's not PCRE; sed is awful)
- string operations (how do you trim a string, or convert to uppercase)
- http operations (it should be easy to deal with APIs in the shell)
- file operations (do you remember all the incantations that [[ supports, or know how to redirect both stderr and stdout to different files)
- integer operations (bash has very basic support, you're expected to use dc, bc, expr or awk)
- handling errors in the middle of a set of piped operations (set -opipefail, or set -e. Ugh)
- threading, concurrency, parallelism

It should be straightforward to write Rash programs.



### Be harder to make mistakes in


Bash is very easy to make mistakes in, especially security mistakes. There are two types of flaws that are super common:
- failure to properly read and write to variables,
- failure to handle errors in pipes.

While the former can be handled with unpleasant idioms ("${MY_VAR}"), the latter has no good support.

Rash aims to be very difficult to make this sort of mistake in.

Finally, Rash aims to include tools that check and validate programs, to help the programer write safer more secure, and more correct code.


### Be easy to convert your bash scripts into rash

Rash will be no good if only new programs can be written in it. We intend to provide a tool to convert Bash programs into Rash programs.


### Be easy to convert your rash scripts into something else

You know when you have a 300 line bash script and it starts to get unwieldy and you wish you'd used python from the start? Hopefully we're be able to automatically translate rash scripts into mostly-equivalent python scripts, should you need then to grow beyond their original purpose.


### Be modern

Lastly, Bash is aimed at the programs we want to write in 2015, not the programs from 1980. It has native support for JSON, HTTP, integers(!), hashtables, arrays, streams, and string operations. A little bit of batteries included will go a long way.


## Lessor goals

rash should
- be easy to distribute (static binaries only)
- be portable
- have a good versioning story


## Non-goals

- to be useful as an interactive shell (for now, maybe later, once I figure out what that really means)
- to be syntactically similar to bash (as bash did to sh)
- to stick strictly to unixisms such as "do one thing well"
- to be useful for large programs
- to compete with python, perl, ruby, node, etc
- to be "pure" in some sense (eg a lovely functional language)


## Language design

### The pipe is the fundamental unit

Bash makes it super easy to pipe programs together. The fundamental intuition that allowed me understand functions in bash was that they are simply programs, that is:
- you pass them data via stdin
- you get output via stdout
- the return value is an exit code
- parameters are akin to command line arguments

And so it will be in rash.


### No library facility

Only the code in the file is executed, and there should be no way to import code. If you need to import code, your program is already outside the scope of rash.

Avoids all sorts of problems:
- package manager
- import facilities (and library paths, etc, etc)
- allows to be entirely typechecked
- how to install scripts

Of course, you can always extend rash by writing programs. The whole point, afterall, is to pipe together other programs. Don't write modules, write other programs (which can also be rash, I guess).


### Batteries included

Since you can't import libraries, the stdlib should be good.

Obvious inclusions:
- http support
- json support
- integer and float support
- string manipulation
- hashtable and array support
- regex (perl-compatible, of course)
- job control
- filesystem stuff

These should replace using any of the shell tools that suck or are difficult to use, include sed, awk, expr, bc, and dc. It should also include facilities from amazing tools like curl and jq, which make sense to be part of the language.

### Built-in analytics / exception reporting

It is important to know how your scripts are being used, so that you have better information on how to write them. In the web world, analytics and exception reporting are very useful for this. There should be built-in, optional, support for analytics and exception reporting.

Obviously, it should go without saying that there are security and privacy concerns here, which must be taken into account in the design. Script authors, and the users of those scripts, should be able to limit what is sent, including sending nothing at all.


### Static checking without type signatures

It is very useful to have static checking, but often hard to do so. In particular, static checking often requires adding type signatures, which is boring, especially for a language aimed at small scripts.

However, because the programs you write in rash are small, it should be possible to quickly typecheck them, even without type signatures. This will catch obvious errors, and provide a level of security that, at the very least, the structure of your program is correct.

### Versioning

Backward compatibility is a serious concern. Often, that concern holds back languages and prevents them from innovating and making things better for their users.

To combat this, rash will have versioning built-in. You can (and should) specify the version of rash that your program was developed with. All versions of bash will check for this, and if the version is different, will automatically download the correct version and run the script with that.

(Of course, the security conscious folks will be able to disable this, or manually approve it, or something)


### Streams

In bash, often multiple programs are working simultaneously, processing the output of one command before that command has finished. That's great. We should do that too.



## Language notes

- execute external procs with ``
 - returns map
 - stdout and stderr are streams
 - exit code is a promise of a value, will block until execution
 - if operated on using string functions, refers to stdout
- awk: file.read | string.words 3
- regex.match returns list of values
- use pipes liberally for composing functions
- string functions all work on streams. no non-stream operations
 - warning when something function appears to cause blocking a stream
- vars start with $ sign
- statically verify all types
- true and false types - dont use 0/non-zero
- proc.success? instead of checking $_ for zero
- functions receive params as values.
 - string values are really streams with a known input
- can we prevent globals entirely?
- exitcode type?
- should we allow returning values? procs cant do that. Should functions == procs?
 - if we assume there is a return value, how do we choose between stdout and exitcode for procs
- the whole point of bash is that the executed functions have their stdout output
- how to put infix functions within a pipe. Maybe \*equal as (==) is not readable.
- let string, arrays, hashtables, collections, proc and int have methods, which are the same as piping to string.whatever, arguments using ()
- normally a function returns the output, which then goes into the caller's output, and so on. Do the same here.
- include analytics and crash reporting so you can see how your program are being use (optional, of course)



TODO
++++++++++++++++++++
- what to do for unset variables?
 - do we want to have a maybe type?
- translate some scripts
