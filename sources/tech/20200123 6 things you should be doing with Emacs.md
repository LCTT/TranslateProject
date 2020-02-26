[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 things you should be doing with Emacs)
[#]: via: (https://opensource.com/article/20/1/emacs-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

6 things you should be doing with Emacs
======
Here are six things you may not have realized you could do with Emacs.
Then, get our new cheat sheet to get the most out of Emacs.
![Text editor on a browser, in blue][1]

Imagine using Python's IDLE interface to edit text. You would be able to load files into memory, edit them, and save changes. But every action you perform would be defined by a Python function. Making a word all capitals, for instance, calls **upper()**, opening a file calls **open**, and so on. Everything in your text document is a Python object and can be manipulated accordingly. From the user's perspective, it's the same experience as any text editor. For a Python developer, it's a rich Python environment that can be changed and developed with just a few custom functions in a config file.

This is what [Emacs][2] does for the 1958 programming language [Lisp][3]. In Emacs, there's no separation between the Lisp engine running the application and the arbitrary text you type into it. To Emacs, everything is Lisp data, so everything can be analyzed and manipulated programmatically.

That makes for a powerful user interface (UI). But if you're a casual Emacs user, you may only be scratching the surface of what it can do for you. Here are six things you may not have realized you could do with Emacs.

## Use Tramp mode for cloud editing

Emacs has been network-transparent for a lot longer than has been trendy, and today it still provides one of the smoothest remote editor experiences available. The [Tramp mode][4] in Emacs (formerly known as RPC mode) stands for "Transparent Remote (file) Access, Multiple Protocol," which spells out exactly what it offers: easy access to remote files you want to edit over most popular network protocols. The most popular and safest protocol for remote editing these days is [OpenSSH][5], so that's the default.

Tramp is already included in Emacs 22.1 or greater, so to use Tramp, you just open a file in the Tramp syntax. In the **File** menu of Emacs, select **Open File**. When prompted in the mini-buffer at the bottom of the Emacs window, enter the file name using this syntax:


```
`/ssh:user@example.com:/path/to/file`
```

If you are required to log in interactively, Tramp prompts you for your password. However, Tramp uses OpenSSH directly, so to avoid interactive prompts, you can also add your hostname, username, and SSH key path to your **~/.ssh/config** file. Like Git, Emacs uses your SSH config first and only stops to ask for more information in the event of an error.

Tramp is great for editing files that don't exist on your computer, and the user experience is not noticeably any different from editing a local file. The next time you start to SSH into a server just to launch a Vim or Emacs session, try Tramp instead.

## Calendaring

If you parse text better than you parse graphical interfaces, you'll be happy to know that you can schedule your day (or life) in plain text with Emacs but still get fancy notifications on your mobile device with open source [Org mode][6] viewers.

The process takes a little setup to create a convenient way to sync your agenda with your mobile device (I use Git, but you could invoke Bluetooth, KDE Connect, Nextcloud, or your file synchronization tool of choice), and you have to install an Org mode viewer (such as [Orgzly][7]) and a Git client app on your mobile. Once you've got your infrastructure sorted, though, the process is inherently perfectly integrated with your usual (or developing, if you're a new user) Emacs workflow. You can refer to your agenda easily in Emacs, make updates to your schedule, and generally stay on task. Pushing changes to your agenda is reflected on your mobile, so you can stay organized even when Emacs isn't available.

![][8]

Intrigued? Read my step-by-step guide about [calendaring with Org mode and Git][9].

## Access the terminal

There are [lots of terminal emulators][10] available. Although the Elisp terminal emulator in Emacs isn't the greatest general-purpose one, it's got two notable advantages.

  1. **Opens in an Emacs buffer: **I use Emacs' Elisp shell because it's conveniently located in my Emacs window, which I often run in fullscreen. It's a small but significant advantage to have a terminal just a **Ctrl+x+o** (or C-x o in Emacs notation) away, and it's especially nice to be able to glance over at it for status reports when it's running a lengthy job.
  2. **Easy copying and pasting if no system clipboard is available:** Whether I'm too lazy to move my hand from the keys to the mouse, or I don't have mouse functionality because I'm running Emacs in a remote console, having a terminal in Emacs can sometimes mean a quick transfer of data from my Emacs buffer to Bash.



To try the Emacs terminal, type **Alt**+**x** (**M-x** in Emacs notation), then type **shell**, and press **Return**.

## Use Racket mode

[Racket][11] is an exciting emerging Lisp dialect with a dynamic programming environment, a GUI toolkit, and a passionate community. The default editor when learning Racket is DrRacket, which has a Definitions panel at the top and an Interactions panel at the bottom. Using this setup, the user writes definitions that affect the Racket runtime. Imagine the old [Logo Turtle][12] program, but with a terminal instead of just a turtle.

![Racket-mode][13]

LGPL sample code by PLT

Emacs, being based on Lisp, makes a great integrated development environment (IDE) for advanced Racket coders. It doesn't ship with [Racket mode][14] (yet), but you can install Racket mode and several other helper extensions using the Emacs package installer. To install it, press **Alt**+**X** (**M-x** in Emacs notation), type **package-install**, and press **Return**. Then enter the package you want to install (**racket-mode**), and press **Return**.

Enter Racket mode with **M-x racket-mode**. If you're new to Racket but not to Lisp or Emacs, start with the excellent [Quick introduction to Racket with pictures][15].

## Scripting

You might know that Bash scripts are popular for automating and enhancing your Linux or Unix experience. You may have heard that Python does a pretty good job of that, too. But did you know that Lisp scripts can be run in much the same way? There's sometimes confusion about just how useful Lisp really is because many people are introduced to Lisp through Emacs, so there's the latent impression that the only way to run Lisp in the 21st century is to open an Emacs window. Luckily, that's not the case at all, and Emacs is a great IDE for the tools that enable you to run Lisp scripts as general system executables.

There are two popular modern Lisps, aside from Elisp, that are easy to run as standalone scripts.

  1. **Racket:** You can run Racket scripts relying on your system's Racket install to provide runtime support, or you can use **raco exe** to produce an executable. The **raco exe** command packages your code together with runtime support files to create an executable. The **raco distribute** command then packages that executable into a distribution that works on other machines. Emacs has many Racket-specific tools, so creating Racket files in Emacs is easy and efficient.

  2. **GNU Guile:** [GNU Guile][16] (short for "GNU Ubiquitous Intelligent Language for Extensions") is an implementation of the [Scheme][17] programming language that's used for creating applications and games for the desktop, internet, terminal, and more. Writing Scheme is easy, using any one of the many Scheme extensions in Emacs. For example, here's a "Hello world" script in Guile: [code] #!/usr/bin/guile -s
!#

(display "hello world")
     (newline) [/code] Compile and run it with the **guile** command: [code] $ guile ./hello.scheme
;;; compiling /home/seth/./hello.scheme
;;; compiled [...]/hello.scheme.go
hello world
$ guile ./hello.scheme
hello world 
```
## Run Elisp without Emacs

Emacs can serve as an Elisp runtime, but you don't have to "open" Emacs in the traditional sense. The **\--script** option allows you to run Elisp scripts using Emacs as the engine but without launching the Emacs GUI (not even its terminal-based one). In this example, the **-Q** option causes Emacs to ignore your **.emacs** file to avoid any delays in executing the Elisp script (if your script relies upon something