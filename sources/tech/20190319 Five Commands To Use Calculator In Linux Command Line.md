[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Five Commands To Use Calculator In Linux Command Line?)
[#]: via: (https://www.2daygeek.com/linux-command-line-calculator-bc-calc-qalc-gcalccmd/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Five Commands To Use Calculator In Linux Command Line?
======

As a Linux administrator you may use the command line calculator many times in a day for some purpose.

I had used this especially when LVM creation using the PE values.

There are many commands available for this purpose and i’m going to list most used commands in this article.

These command line calculators are allow us to perform all kind of actions such as scientific, financial, or even simple calculation.

Also, we can use these commands in shell scripts for complex math.

In this article, I’m listing the top five command line calculator commands.

Those command line calculator commands are below.

  * **`bc:`** An arbitrary precision calculator language
  * **`calc:`** arbitrary precision calculator
  * **`expr:`** evaluate expressions
  * **`gcalccmd:`** gnome-calculator – a desktop calculator
  * **`qalc:`**
  * **`Linux Shell:`**



### How To Perform Calculation In Linux Using bc Command?

bs stands for Basic Calculator. bc is a language that supports arbitrary precision numbers with interactive execution of statements. There are some similarities in the syntax to the C programming language.

A standard math library is available by command line option. If requested, the math library is defined before processing any files. bc starts by processing code from all the files listed on the command line in the order listed.

After all files have been processed, bc reads from the standard input. All code is executed as it is read.

By default bc command has installed in all the Linux system. If not, use the following procedure to install it.

For **`Fedora`** system, use **[DNF Command][1]** to install bc.

```
$ sudo dnf install bc
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][2]** or **[APT Command][3]** to install bc.

```
$ sudo apt install bc
```

For **`Arch Linux`** based systems, use **[Pacman Command][4]** to install bc.

```
$ sudo pacman -S bc
```

For **`RHEL/CentOS`** systems, use **[YUM Command][5]** to install bc.

```
$ sudo yum install bc
```

For **`openSUSE Leap`** system, use **[Zypper Command][6]** to install bc.

```
$ sudo zypper install bc
```

### How To Use The bc Command To Perform Calculation In Linux?

We can use the bc command to perform all kind of calculation right from the terminal.

```
$ bc
bc 1.07.1
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'.

1+2
3

10-5
5

2*5
10

10/2
5

(2+4)*5-5
25

quit
```

Use `-l` flag to define the standard math library.

```
$ bc -l
bc 1.07.1
Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'.

3/5
.60000000000000000000

quit
```

### How To Perform Calculation In Linux Using calc Command?

calc is an arbitrary precision calculator. It’s a simple calculator that allow us to perform all kind of calculation in Linux command line.

For **`Fedora`** system, use **[DNF Command][1]** to install calc.

```
$ sudo dnf install calc
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][2]** or **[APT Command][3]** to install calc.

```
$ sudo apt install calc
```

For **`Arch Linux`** based systems, use **[Pacman Command][4]** to install calc.

```
$ sudo pacman -S calc
```

For **`RHEL/CentOS`** systems, use **[YUM Command][5]** to install calc.

```
$ sudo yum install calc
```

For **`openSUSE Leap`** system, use **[Zypper Command][6]** to install calc.

```
$ sudo zypper install calc
```

### How To Use The calc Command To Perform Calculation In Linux?

We can use the calc command to perform all kind of calculation right from the terminal.

Intractive mode

```
$ calc
C-style arbitrary precision calculator (version 2.12.7.1)
Calc is open software. For license details type:  help copyright
[Type "exit" to exit, or "help" for help.]

; 5+1
	6
; 5-1
	4
; 5*2
	10
; 10/2
	5
; quit
```

Non-Intractive mode

```
$ calc 3/5
         0.6
```

### How To Perform Calculation In Linux Using expr Command?

Print the value of EXPRESSION to standard output. A blank line below separates increasing precedence groups. It’s part of coreutils so, we no need to install it.

### How To Use The expr Command To Perform Calculation In Linux?

Use the following format for basic calculations.

For addition

```
$ expr 5 + 1
6
```

For subtraction

```
$ expr 5 - 1
4
```

For division.

```
$ expr 10 / 2
5
```

### How To Perform Calculation In Linux Using gcalccmd Command?

gnome-calculator is the official calculator of the GNOME desktop environment. gcalccmd is the console version of Gnome Calculator utility. By default it has installed in the GNOME desktop.

### How To Use The gcalccmd Command To Perform Calculation In Linux?

I have added few examples on this.

```
$ gcalccmd

> 5+1
6

> 5-1
4

> 5*2
10

> 10/2
5

> sqrt(16)   
4

> 3/5
0.6

> quit
```

### How To Perform Calculation In Linux Using qalc Command?

Qalculate is a multi-purpose cross-platform desktop calculator. It is simple to use but provides power and versatility normally reserved for complicated math packages, as well as useful tools for everyday needs (such as currency conversion and percent calculation).

Features include a large library of customizable functions, unit calculations and conversion, symbolic calculations (including integrals and equations), arbitrary precision, uncertainty propagation, interval arithmetic, plotting, and a user-friendly interface (GTK+ and CLI).

For **`Fedora`** system, use **[DNF Command][1]** to install qalc.

```
$ sudo dnf install libqalculate
```

For **`Debian/Ubuntu`** systems, use **[APT-GET Command][2]** or **[APT Command][3]** to install qalc.

```
$ sudo apt install libqalculate
```

For **`Arch Linux`** based systems, use **[Pacman Command][4]** to install qalc.

```
$ sudo pacman -S libqalculate
```

For **`RHEL/CentOS`** systems, use **[YUM Command][5]** to install qalc.

```
$ sudo yum install libqalculate
```

For **`openSUSE Leap`** system, use **[Zypper Command][6]** to install qalc.

```
$ sudo zypper install libqalculate
```

### How To Use The qalc Command To Perform Calculation In Linux?

I have added few examples on this.

```
$ qalc
> 5+1

  5 + 1 = 6

> ans*2

  ans * 2 = 12

> ans-2

  ans - 2 = 10

> 1 USD to INR
It has been 36 day(s) since the exchange rates last were updated.
Do you wish to update the exchange rates now? y

  error: Failed to download exchange rates from coinbase.com: Resolving timed out after 15000 milliseconds.
  1 * dollar = approx. INR 69.638581

> 10 USD to INR

  10 * dollar = approx. INR 696.38581

> quit
```

### How To Perform Calculation In Linux Using Linux Shell Command?

We can use the shell commands such as echo, awk, etc to perform the calculation.

For Addition using echo command.

```
$ echo $((5+5))
10
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-command-line-calculator-bc-calc-qalc-gcalccmd/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[2]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[5]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[6]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
