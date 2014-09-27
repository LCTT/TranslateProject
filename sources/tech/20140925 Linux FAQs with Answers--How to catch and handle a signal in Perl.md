Translating-------geekpi

Linux FAQs with Answers--How to catch and handle a signal in Perl
================================================================================
> **Question**: I need to handle an interrupt signal by using a custom signal handler in Perl. In general, how can I catch and handle various signals (e.g., INT, TERM) in a Perl program? 

As an asynchronous notification mechanism in the POSIX standard, a signal is sent by an operating system to a process to notify it of a certain event. When a signal is generated, the target process's execution is interrupted by an operating system, and the signal is delivered to the process's signal handler routine. One can define and register a custom signal handler or rely on the default signal handler.

In Perl, signals can be caught and handled by using a global %SIG hash variable. This %SIG hash variable is keyed by signal numbers, and contains references to corresponding signal handlers. Therefore, if you want to define a custom signal handler for a particular signal, you can simply update the hash value of %SIG for the signal.

Here is a code snippet to handle interrupt (INT) and termination (TERM) signals using a custom signal handler.

    $SIG{INT}  = \&signal_handler;
    $SIG{TERM} = \&signal_handler;
     
    sub signal_handler {
        print "This is a custom signal handler\n";
        die "Caught a signal $!";
    }

![](https://farm4.staticflickr.com/3910/15141131060_f7958f20fb.jpg)

Other valid hash values for %SIG are 'IGNORE' and 'DEFAULT'. When an assigned hash value is 'IGNORE' (e.g., $SIG{CHLD}='IGNORE'), the corresponding signal will be ignored. Assigning 'DEFAULT' hash value (e.g., $SIG{HUP}='DEFAULT') means that we will be using a default signal handler.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/catch-handle-interrupt-signal-perl.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出