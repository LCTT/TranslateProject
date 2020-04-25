[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What Happened to IPv5? Why there is IPv4, IPv6 but no IPv5?)
[#]: via: (https://itsfoss.com/what-happened-to-ipv5/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

What Happened to IPv5? Why there is IPv4, IPv6 but no IPv5?
======

If you have spent any amount of time in the world of the internet, you should have heard about the IPv4 and IPv6 protocols that our computers use every day.

One question that you might be asking is: Why there is no IPv5? Why IPv6 came after IPv4 and not IPv5? Was there ever a IPv5 and if yes, whatever happened to IPv5?

The answer is yes, there was an IPv5…sort of. Let me quickly explain a few things around it.

### The early history of the internet

![ARPA Logical Map in 1977 | Image courtesy: Wikipedia][1]

In the late 1960s, the US Department of Defense’s [Advanced Research Projects Agency][2] (ARPA) started a [project][3] to link computers across the country. The initial goal was to create a networked system of all of the ARPA-funded computers across the country.

Since this was the first time a network of this scale was put together, they were also creating the technology and hardware as they went. One of the first things they worked was an internet protocol (IP) named [Transmission Control Protocol][4] (TCP). This protocol “reliable, ordered, and error-checked delivery of a stream of octets (bytes) between applications running on hosts communicating via an IP network”. Basically, it made sure data got where it needed to go safely.

Originally, TCP was designed to be [“a host-level, end-to-end protocol and a packaging and routing protocol”][5]. However, they realized that they needed to split the protocol to make it more manageable. It was decided that IP would handle packaging and routing.

By this time TCP had gone through three versions, so the new protocol became known as IPv4.

### The birth of IPv5

IPv5 started life under a different name: Internet Stream Protocol (or ST). It was created to experiment with streaming voice and video [“by Apple, NeXT, and Sun Microsystems”][6].

This new protocol was capable of “transferring data packets on specific frequencies while maintaining communication”.

### So what happened to IPv5?

![][7]

IPv5 was never accepted as an official internet protocol. This was mainly due to the 32-bit limitation.

IPV5 used the same addressing system as IPv4. Each address was made up of four sets of numbers between 0 and 255. This limited the number of possible addresses to [4.3 billion][6].

In the early 1970s, that might have seemed like more than the world would ever need. However, the explosive growth of the Internet proved that idea wrong. In 2011, the world officially ran out of the IPv4 addresses.

In the 1990s, a new project was started to work on the next generation of internet protocol (IPng). This led to the 128-bit IPv6. An IPv6 address contains a [“series of eight 4-character hexadecimal numbers”][6] that can contain numbers from 0 to 9 and letters from A to F. Unlike IPv4, IPv6 had trillions of possible addresses, so we should be safe for a while.

Meanwhile, IPv5 laid the groundwork for the voice-over-IP technology that we use to communicate all over the world today. **So, I guess in some small way, you could say that IPv5 still survives to this day**.

I hope you liked this anecdote about internet history. You may read some other [trivia article about Linux and tech in general][8].

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][9].

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-happened-to-ipv5/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/Arpa_internet.png?fit=800%2C573&ssl=1
[2]: https://en.wikipedia.org/wiki/DARPA
[3]: https://en.wikipedia.org/wiki/ARPANET
[4]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol
[5]: https://fcw.com/articles/2006/07/31/what-ever-happened-to-ipv5.aspx
[6]: https://www.lifewire.com/what-happened-to-ipv5-3971327
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/what-happened-to-ipv5.png?ssl=1
[8]: https://itsfoss.com/category/story/
[9]: https://reddit.com/r/linuxusersgroup
