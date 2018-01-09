Translating by Drshu

Fake A Hollywood Hacker Screen in Linux Terminal
======

**Brief: This tiny tool turns your Linux terminal into a Hollywood style real time hacking scene.**

![Hollywood hacking terminal in Linux][1]

I am in!

You might have heard this dialogue in almost every Hollywood movie that shows a hacking scene. There will be a dark terminal with ascii text, diagrams and hex code changing continuously and a hacker who is hitting the keyboards as if he/she is typing an angry forum response.

But that's Hollywood! Hackers break into a network system in minutes whereas it takes months of research to actually do that. But I'll put the Hollywood hacking criticism aside for the moment.

Because we are going to do the same. We are going to pretend like a hacker in Hollywood style.

There's this tiny tool that runs a script turning your Linux terminal into a Hollywood style real time hacking terminal:

Like what you see? It even plays Mission Impossible theme music in the background. Moreover, you get a new, random generated hacking terminal each time you run this tool.

Let's see how to become a Hollywood hacker in 30 seconds.

### How to install Hollywood hacking terminal in Linux

The tool is quite aptly called Hollywood. Basically, it runs in Byobu, a text based Window Manager and it creates a random number of random sized split windows and runs a noisy text app in each of them.

[Byobu][2] is an interesting tool developed by Dustin Kirkland of Ubuntu. More about it in some other article. Let's focus on installing this tool.

Ubuntu users can install Hollywood using this simple command:
```
sudo apt install hollywood
```

If the above command doesn't work in your Ubuntu or other Ubuntu based Linux distributions such as Linux Mint, elementary OS, Zorin OS, Linux Lite etc, you may use the below PPA:
```
sudo apt-add-repository ppa:hollywood/ppa
sudo apt-get update
sudo apt-get install byobu hollywood
```

You can also get the source code of Hollywood from its GitHub repository:

[Hollywood on GitHub][3]

Once installed, you can run it using the command below, no sudo required:

`hollywood`

As it runs Byobu first, you'll have to use Ctrl+C twice and then use `exit` command to stop the hacking terminal script.

Here's a video of the fake Hollywood hacking. Do [subscribe to our YouTube channel][4] for more Linux fun videos.

It's a fun little tool that you can use to amaze your friends, family, and colleagues. Maybe you can even impress girls in the bar though I don't think it is going to help you a lot in that field.

And if you liked Hollywood hacking terminal, perhaps you would like to check another tool that gives [Sneaker movie effect in Linux terminal][5].

If you know more such fun utilities, do share with us in the comment section below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/hollywood-hacker-screen/

作者：[Abhishek Prakash][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/abhishek/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/09/hollywood-hacking-linux-terminal.jpg
[2]:http://byobu.co/
[3]:https://github.com/dustinkirkland/hollywood
[4]:https://www.youtube.com/c/itsfoss?sub_confirmation=1
[5]:https://itsfoss.com/sneakers-movie-effect-linux/
