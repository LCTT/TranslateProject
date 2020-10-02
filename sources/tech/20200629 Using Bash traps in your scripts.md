[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Bash traps in your scripts)
[#]: via: (https://opensource.com/article/20/6/bash-trap)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Using Bash traps in your scripts
======
Traps help your scripts end cleanly, whether they run successfully or
not.
![Hands programming][1]

It's easy to detect when a shell script starts, but it's not always easy to know when it stops. A script might end normally, just as its author intends it to end, but it could also fail due to an unexpected fatal error. Sometimes it's beneficial to preserve the remnants of whatever was in progress when a script failed, and other times it's inconvenient. Either way, detecting the end of a script and reacting to it in some pre-calculated manner is why the [Bash][2] `trap` directive exists.

### Responding to failure

Here's an example of how one failure in a script can lead to future failures. Say you have written a program that creates a temporary directory in `/tmp` so that it can unarchive and process files before bundling them back together in a different format:


```
#!/usr/bin/env bash
CWD=`pwd`
TMP=${TMP:-/tmp/tmpdir}

## create tmp dir
mkdir $TMP

## extract files to tmp
tar xf "${1}" --directory $TMP

## move to tmpdir and run commands
pushd $TMP
for IMG in *.jpg; do
  mogrify -verbose -flip -flop $IMG
done
tar --create --file "${1%.*}".tar *.jpg

## move back to origin
popd

## bundle with bzip2
bzip2 --compress $TMP/"${1%.*}".tar \
      --stdout &gt; "${1%.*}".tbz

## clean up
/usr/bin/rm -r /tmp/tmpdir
```

Most of the time, the script works as expected. However, if you accidentally run it on an archive filled with PNG files instead of the expected JPEG files, it fails halfway through. One failure leads to another, and eventually, the script exits without reaching its final directive to remove the temporary directory. As long as you manually remove the directory, you can recover quickly, but if you aren't around to do that, then the next time the script runs, it has to deal with an existing temporary directory full of unpredictable leftover files.

One way to combat this is to reverse and double-up on the logic by adding a precautionary removal to the start of the script. While valid, that relies on brute force instead of structure. A more elegant solution is `trap`.

### Catching signals with trap

The `trap` keyword catches _signals_ that may happen during execution. You've used one of these signals if you've ever used the `kill` or `killall` commands, which call `SIGTERM` by default. There are many other signals that shells respond to, and you can see most of them with `trap -l` (as in "list"):


```
$ trap --list
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
```

Any of these signals may be anticipated with `trap`. In addition to these, `trap` recognizes:

  * `EXIT`: Occurs when a process exits
  * `ERR`: Occurs when a process exits with a non-zero status
  * `DEBUG`: A Boolean representing debug mode



To set a trap in Bash, use `trap` followed by a list of commands you want to be executed, followed by a list of signals to trigger it.

For instance, this trap detects a `SIGINT`, the signal sent when a user presses **Ctrl+C** while a process is running:


```
`trap "{ echo 'Terminated with Ctrl+C'; }" SIGINT`
```

The example script with temporary directory problems can be fixed with a trap detecting `SIGINT`, errors, and successful exits:


```
#!/usr/bin/env bash
CWD=`pwd`
TMP=${TMP:-/tmp/tmpdir}

trap \
 "{ /usr/bin/rm -r $TMP ; exit 255; }" \
 SIGINT SIGTERM ERR EXIT

## create tmp dir
mkdir $TMP
tar xf "${1}" --directory $TMP

## move to tmp and run commands
pushd $TMP
for IMG in *.jpg; do
  mogrify -verbose -flip -flop $IMG
done
tar --create --file "${1%.*}".tar *.jpgh

## move back to origin
popd

## zip tar
bzip2 --compress $TMP/"${1%.*}".tar \
      --stdout &gt; "${1%.*}".tbz
```

For complex actions, you can simplify `trap` statements with [Bash functions][3].

### Traps in Bash

Traps are useful to ensure that your scripts end cleanly, whether they run successfully or not. It's never safe to rely completely on automated garbage collection, so this is a good habit to get into in general. Try using them in your scripts, and see what they can do!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/bash-trap

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S (Hands programming)
[2]: https://opensource.com/resources/what-bash
[3]: https://opensource.com/article/20/6/how-write-functions-bash
