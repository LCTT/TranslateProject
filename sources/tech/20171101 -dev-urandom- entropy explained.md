/dev/[u]random: entropy explained
======
### Entropy

When the topic of /dev/random and /dev/urandom come up, you always hear this word: “Entropy”. Everyone seems to have their own analogy for it. So why not me? I like to think of Entropy as “Random juice”. It is juice, required for random to be more random.

If you have ever generated an SSL certificate, or a GPG key, you may have seen something like:
```
We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
++++++++++..+++++.+++++++++++++++.++++++++++...+++++++++++++++...++++++
+++++++++++++++++++++++++++++.+++++..+++++.+++++.+++++++++++++++++++++++++>.
++++++++++>+++++...........................................................+++++
Not enough random bytes available. Please do some other work to give
the OS a chance to collect more entropy! (Need 290 more bytes)

```


By typing on the keyboard, and moving the mouse, you help generate Entropy, or Random Juice.

You might be asking yourself… Why do I need Entropy? and why it is so important for random to be actually random? Well, lets say our Entropy was limited to keyboard, mouse, and disk IO. But our system is a server, so I know there is no mouse and keyboard input. This means the only factor is your IO. If it is a single disk, that was barely used, you will have low Entropy. This means your systems ability to be random is weak. In other words, I could play the probability game, and significantly decrease the amount of time it would take to crack things like your ssh keys, or decrypt what you thought was an encrypted session.

Okay, but that is pretty unrealistic right? No, actually it isn’t. Take a look at this [Debian OpenSSH Vulnerability][1]. This particular issue was caused by someone removing some of the code responsible for adding Entropy. Rumor has it they removed it because it was causing valgrind to throw warnings. However, in doing that, random is now MUCH less random. In fact, so much less that Brute forcing the private ssh keys generated is now a fesible attack vector.

Hopefully by now we understand how important Entropy is to security. Whether you realize you are using it or not.

### /dev/random & /dev/urandom


/dev/urandom is a Psuedo Random Number Generator, and it **does not** block if you run out of Entropy.
/dev/random is a True Random Number Generator, and it **does** block if you run out of Entropy.

Most often, if we are dealing with something pragmatic, and it doesn’t contain the keys to your nukes, /dev/urandom is the right choice. Otherwise if you go with /dev/random, then when the system runs out of Entropy your application is just going to behave funny. Whether it outright fails, or just hangs until it has enough depends on how you wrote your application.

### Checking the Entropy

So, how much Entropy do you have?
```
[root@testbox test]# cat /proc/sys/kernel/random/poolsize
4096
[root@testbox test]# cat /proc/sys/kernel/random/entropy_avail
2975
[root@testbox test]#

```

/proc/sys/kernel/random/poolsize, to state the obvious is the size(in bits) of the Entropy Pool. eg: How much random-juice we should save before we stop pumping more. /proc/sys/kernel/random/entropy_avail, is the amount(in bits) of random-juice in the pool currently.

### How can we influence this number?

The number is drained as we use it. The most crude example I can come up with is catting /dev/random into /dev/null:
```
[root@testbox test]# cat /dev/random > /dev/null &
[1] 19058
[root@testbox test]# cat /proc/sys/kernel/random/entropy_avail
0
[root@testbox test]# cat /proc/sys/kernel/random/entropy_avail
1
[root@testbox test]#

```

The easiest way to influence this is to run [Haveged][2]. Haveged is a daemon that uses the processor “flutter” to add Entropy to the systems Entropy Pool. Installation and basic setup is pretty straight forward
```
[root@b08s02ur ~]# systemctl enable haveged
Created symlink from /etc/systemd/system/multi-user.target.wants/haveged.service to /usr/lib/systemd/system/haveged.service.
[root@b08s02ur ~]# systemctl start haveged
[root@b08s02ur ~]#

```

On a machine with relatively moderate traffic:
```
[root@testbox ~]# pv /dev/random > /dev/null
 40 B 0:00:15 [ 0 B/s] [ <=> ]
 52 B 0:00:23 [ 0 B/s] [ <=> ]
 58 B 0:00:25 [5.92 B/s] [ <=> ]
 64 B 0:00:30 [6.03 B/s] [ <=> ]
^C
[root@testbox ~]# systemctl start haveged
[root@testbox ~]# pv /dev/random > /dev/null
7.12MiB 0:00:05 [1.43MiB/s] [ <=> ]
15.7MiB 0:00:11 [1.44MiB/s] [ <=> ]
27.2MiB 0:00:19 [1.46MiB/s] [ <=> ]
 43MiB 0:00:30 [1.47MiB/s] [ <=> ]
^C
[root@testbox ~]#

```

Using pv we are able to see how much data we are passing via pipe. As you can see, before haveged, we were getting 2.1 bits per second(B/s). Whereas after starting haveged, and adding processor flutter to our Entropy pool we get ~1.5MiB/sec.

--------------------------------------------------------------------------------

via: http://jhurani.com/linux/2017/11/01/entropy-explained.html

作者：[James J][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jblevins.org/log/ssh-vulnkey
[1]:http://jhurani.com/linux/2017/11/01/%22https://jblevins.org/log/ssh-vulnkey%22
[2]:http://www.issihosts.com/haveged/
