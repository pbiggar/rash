# Rash - the Rebourne Again SHell


Rash is a shell scripting language intended to replace bash scripts. Its goal is to allow simple, readable, understandable and secure shell scripting. In particular, it aims at the niche currently occupied by Bash programs, and specifically aims to address problems in bash and with bash programs.

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


## Installation instructions

Rash is written in haskell, using Stack.

To build: `stack build`

To run tests: `stack test`

To run on your own bash scripts: `stack exec rash-exe -- --debug ast mysh.sh`

- this shows you the test output


## Language design

### The pipe is the fundamental unit

Bash makes it super easy to pipe programs together. The fundamental intuition that allowed me understand functions in bash was that they are simply programs, that is:
- you pass them data via stdin
- you get output via stdout
- the return value is an exit code
- parameters are akin to command line arguments

And so it will be in rash.

In addition, Rash allows you to consume more than just a text stream from the previous program in the pipe:
- stdin can be a stream of objects. The previous process/function would call `send` instead of `print`.
 - an example what this allows is built-in jq-like functionality
- when a program ends, the stdin, stderr and exit code are all available to the next process in the pipe
 - you could use this to swallow errors without special syntax

### No library facility

Only the code in the file is executed, and there should be no way to import code. If you need to import code, your program is already outside the scope of rash.

Avoids all sorts of problems:
- package manager
- import facilities (and library paths, etc, etc)
- allows the entire program be typechecked
- make it easy to turn scripts into static binaries

Of course, you can always extend rash by writing programs. The whole point, after all, is to pipe together other programs. Don't write modules, write other programs (which could also be written in Rash).


### Batteries included

Since you can't import libraries, the stdlib should be really good.

Obvious inclusions:
- http support
- json support
- integer (bigints?) and float support
- string manipulation
- hashtable and array support
- regex (perl-compatible, of course)
- job control
- filesystem stuff

These should replace using any of the shell tools that suck or are difficult to use, include sed, awk, expr, bc, and dc. It should also include facilities from amazing tools like curl and jq, which make sense to be part of the language.

### Built-in analytics / exception reporting

It is important to know how your scripts are being used, so that you have better information on how to write them. In the web world, analytics and exception reporting are very useful for this. There should be built-in, optional, support for analytics and exception reporting.

Obviously, it should go without saying that there are security and privacy concerns here, which must be taken into account in the design. Script authors, and the users of those scripts, should be able to limit what is sent, including sending nothing at all.

There are a ton of wonderful applications here:
- send a stack trace to the developer when the program errors for a user
- understand who is using your script (eg in corporate environments)
- know, broadly, what command-lines are rarely used
  - perhaps that feature should be documented better
  - if no-one uses that feature maybe you can kill it
- what commands lead to crashes most often

Of course, we can use this to develop rash too, by running analytics on:
- what syntax errors are most commonly
- do developers immediately solve those errors (if not, we can improve the error)
  - what countries are most rash developers on (or what locales do they use)
    - allows us to focus documentation on those languages
  - when are

### Static checking without type signatures

It is very useful to have static checking, but often hard to do so. In particular, static checking often requires adding type signatures, which is boring, especially for a language aimed at small scripts.

However, because the programs you write in rash are small, it should be possible to quickly typecheck them, even without type signatures. This will catch obvious errors, and provide a level of security that, at the very least, the structure of your program is correct.

### Versioning

Backward compatibility is a serious concern. Often, that concern holds back languages and prevents them from innovating and making things better for their users.

To combat this, rash will have versioning built-in. You can (and should) specify the version of rash that your program was developed with. All versions of bash will check for this, and if the version is different, will automatically download the correct version and run the script with that.

(Of course, the security conscious folks will be able to disable this, or manually approve it, or something)


### Streams

In bash, often multiple programs are working simultaneously, processing the output of one command before that command has finished. That's great. We should do that too.




## Design Decisions

### Builtins and pipes
Try to represent all builtin syntax using pipes. For example, to read from stdin, do

  `$x | someFunc`

instead of bash's

  `someFunc <(echo $x)`

How do you know whether something should be passed as an argument or via a pipe? Pipes are for data, and arguments are for configuration. For example, `cat` takes data piped into it, but when you specify the filename instead you are giving it configuration.


### Redirection, stdin, conditions, exit codes, stderr

Because we're trying to unify a bunch of different things into a single syntax -- pipes -- there's a few problems we run into.

Bash has different syntax for different concepts:
- stream redirection (`wc > a`, `wc 2&>1`, `wc >/dev/null`) is a property of the command on which it operates
- timing is too
- so is backgrounding
- other pipes (rarely used but there) aswell.
- condition checks are in their own syntactic world: `if [[ ! -a myfile && -z $x ]]`

We're trying to unify this into a singular concept, but how do we deal with the fact that they're ever so slightly different?

Let's discuss how they're different first.

When you run a command, you take all the commands in the pipelines, create pipes between then, and then run them all. That was, they context switch nicely when each waits for IO, and doesn't explode the memory requirements.

To be concrete, consider `x | y | z`. `y` isn't really given an opportunity to access `x`'s stderr; while `x`'s stdout is pipes into `y`'s stdin, where is `x`'s stderr? Well, it's mapped to the caller's stderr, and is busy writing to it before any data reaches `y`.

Now consider `x 2>/dev/null` vs `x | stderr.ignore`. In the first version, we know when we run `x` that we're sending its stderr to /dev/null. In the second version, how to we know?

There's a similar problem with `time` and `&` (backgrounding) and other pipes. Each uses syntactic constructs to indicate that the function being called is to be treated specially. How do we signal this statically in Rash?

Finally, testing conditions is a little tricky. Bash uses special syntax, eg `[ -a filename ]` to operate on "boolean" values. Commands only sort-of get involved here: `my command; $?` will give you the exit code. Super ugly. But when we try to combine them into one concept, such as `ls | grep $name | uniq | head -n 1 | file.exists?`, how do we know whether to operate on stdout or exit code? In `if (x | file.exists?) == $x`, does equality operate on the exit code, or the stdout? What about in `if ($x | grep mystr) == $somestring`?

For the command syntax, I think the simplest thing is to have some sort of decorator (for the functional crowd, a decorate is a sort of middleware that wraps a function, a kind of limited macro facility). Functions that come later in the pipe can operate on the pipes that lead into them. That way they can change the pipes, wrap it in a testing function, background it, etc.

For the conditions syntax, there's a few options:
- we could do comparisons on output, then exit codes (if output is equal, check the exit code, or vice-versa)
- we usually want to exit the program on a bad exit code (eg `set -e` in bash). But sometimes, we don't: grep, file.exists, etc. How do we distinguish these use cases? Usually in the middle of a pipe at least.
- maybe we want to look at the functions that come after it. If the exit code of grep isn't zero and isn't consumed, then it was probably an error. Throw at run-time (and maybe statically, after a bit of analysis).
- we could compare strings to stdout, and numbers/bools to exit codes.
- none of these options are particularly great, tbh.




## Bash -> Rash translation:

`$@` -> `sys.argv`

`$#` -> `sys.argv | length`

`$1` -> `sys.argv[1]`

`prog > file` -> `prog | fs.save file`

`prog < file` -> `fs.read file | prog`

`[[ $x == "https*" ]]` -> `$x | string.matches? https.*`

`exit 1` -> `sys.exit 1`

`type grep` -> `sys.onPath? grep`

`prog1 | prog2` -> `prog1 | exit.suppress | prog2`

`set -eo pipefail; prog1 | prog2` -> `prog1 | prog2`

`$myprog | prog2` -> `exec $myprog | prog2`

`time x` -> `x | @sys.time`




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
- what to do for unset variables?
 - do we want to have a maybe type?
- translate some scripts
