[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Have a cow at the Linux command line)
[#]: via: (https://opensource.com/article/18/12/linux-toy-cowsay)
[#]: author: (Jason Baker https://opensource.com/users/jason-baker)
[#]: url: ( )

Have a cow at the Linux command line
======
Bring a bovine voice to your terminal output with the cowsay utility.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/uploads/linux-toy-cowsay.png?itok=RA4NDbrY)

Welcome to the fourth day of the Linux command-line toys advent calendar. If this is your first visit to the series, you might be asking yourself, what’s a command-line toy. We’re figuring that out as we go, but generally, it could be a game, or any simple diversion that helps you have fun at the terminal.

Some of you will have seen various selections from our calendar before, but we hope there’s at least one new thing for everyone. Because just about everyone who I’ve mentioned this series to has asked me about it already, today’s selection is an obligatory one.

You didn’t think we’d make it through this series without mentioning cowsay, did you?

Cowsay is an udderly fantastic utility that takes text and outputs it as the spoken text of an ASCII-art bovine.

You’ll likely find cowsay packaged in your default repositories, and perhaps even already installed. For me, in Fedora, all it took to install was:

```
$ sudo dnf install -y cowsay
```

Then, invoke it with cowsay followed by your message. Perhaps you’d like to pipe in the [fortune][1] [utility][1] we talked about yesterday.

```
$ fortune | cowsay
 _________________________________________
/ If at first you do succeed, try to hide \
\ your astonishment.                      /
 -----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

That’s it! **Cowsay** ships with few variations, called cow files, that can usually be found in **/usr/share/cowsay.** To see the cow file options available on your system, use **-l** flag after cowsay. Then, use the **-f** flag to try one out.

```
$ cowsay -f dragon "Run for cover, I feel a sneeze coming on."
 _______________________________________
/ Run for cover, I feel a sneeze coming \
\ on.                                   /
 ---------------------------------------
      \                    / \  //\
       \    |\___/|      /   \//  \\
            /0  0  \__  /    //  | \ \    
           /     /  \/_/    //   |  \  \  
           @_^_@'/   \/_   //    |   \   \ 
           //_^_/     \/_ //     |    \    \
        ( //) |        \///      |     \     \
      ( / /) _|_ /   )  //       |      \     _\
    ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
  (( / / )) ,-{        _      `-.|.-~-.           .~         `.
 (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
 (( /// ))      `.   {            }                   /      \  \
  (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
             ///.----..>        \             _ -~             `.  ^-`  ^-_
               ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
                                                                  /.-~
```

My real beef with **cowsay** is that I don’t have enough time today to really milk the cow puns for all they are worth. The steaks are just too high, and I might butcher the joke.

On a more serious note, I had completely forgotten about **cowsay** until I re-encountered it when learning Ansible playbooks. If you happen to have **cowsay** installed, when you run a playbook, you’ll get your output from a series of cows. For example, running this playbook:

```
- hosts:
    - localhost
  tasks:
    - action: ping
```

Might give you the following:

```
$ ansible-playbook playbook.yml
 __________________
< PLAY [localhost] >
 ------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

 ________________________
< TASK [Gathering Facts] >
 ------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [localhost]
 _____________
< TASK [ping] >
 -------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

ok: [localhost]
 ____________
< PLAY RECAP >
 ------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

localhost                  : ok=2    changed=0    unreachable=0    failed=0  
```

**Cowsay** is available under a GPLv3 license, and you can find the Perl [source code][2] on GitHub. I’ve also seen versions floating around in other languages, so take a look around for other variants; here’s [one in R][3], for example. Implementing your own version in your language of choice might even be a fun programming learning task.

Now that **cowsay** is out of the way, we can move on to greener pastures.

Do you have a favorite command-line toy that you think I ought to profile? The calendar for this series is mostly filled out but I've got a few spots left. Let me know in the comments below, and I'll check it out. If there's space, I'll try to include it. If not, but I get some good submissions, I'll do a round-up of honorable mentions at the end.

Check out yesterday's toy, [How to bring good fortune to your Linux terminal][1], and check back tomorrow for another!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/linux-toy-cowsay

作者：[Jason Baker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jason-baker
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/18/12/linux-toy-fortune
[2]: https://github.com/tnalpgge/rank-amateur-cowsay
[3]: https://github.com/sckott/cowsay
