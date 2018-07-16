translating---geekpi

6 RFCs for understanding how the internet works
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe)

Reading the source is an important part of open source software. It means users have the ability to look at the code and see what it does.

But "read the source" doesn't apply only to code. Understanding the standards the code implements can be just as important. These standards are codified in documents called "Requests for Comments" (RFCs) published by the [Internet Engineering Task Force][1] (IETF). Thousands of RFCs have been published over the years, so we collected a few that our contributors consider must-reads.

### 6 must-read RFCs

#### RFC 2119—Key words for use in RFCs to indicate requirement levels

This is a quick read, but it's important to understanding other RFCs. [RFC 2119][2] defines the requirement levels used in subsequent RFCs. What does "MAY" really mean? If the standard says "SHOULD," do you really have to do it? By giving the requirements a well-defined taxonomy, RFC 2119 helps avoid ambiguity.

Time is the bane of programmers the world over. [RFC 3339][3] defines how timestamps are to be formatted. Based on the [ISO 8601][4] standard, 3339 gives us a common way to represent time and its relentless march. For example, redundant information like the day of the week should not be included in a stored timestamp since it is easy to compute.

#### RFC 1918—Address allocation for private internets

There's the internet that's everyone's and then there's the internet that's just yours. Private networks are used all the time, and [RFC 1918][5] defines those networks. Sure, you could set up your router to route public spaces internally, but that's a bad idea. Alternately, you could take your unused public IP addresses and treat them as an internal network. In either case, you're making it clear you've never read RFC 1918.

#### RFC 1912—Common DNS operational and configuration errors

Everything is a #@%@ DNS problem, right? [RFC 1912][6] lays out mistakes that admins make when they're just trying to keep the internet running. Although it was published in 1996, DNS (and the mistakes people make with it) hasn't really changed all that much. To understand why we need DNS in the first place, consider what [RFC 289—What we hope is an official list of host names][7] would look like today.

#### RFC 2822—Internet message format

Think you know what a valid email address looks like? If the number of sites that won't accept a "+" in my address is any indication, you don't. [RFC 2822][8] defines what a valid email address looks like. It also goes into detail about the rest of an email message.

#### RFC 7231—Hypertext Transfer Protocol (HTTP/1.1): Semantics and content

When you stop to think about it, almost everything we do online relies on HTTP. [RFC 7231][9] is among the most recent updates to that protocol. Weighing in at just over 100 pages, it defines methods, headers, and status codes.

### 3 should-read RFCs

Okay, not every RFC is serious business.

#### RFC 1149—A standard for the transmission of IP datagrams on avian carriers

Networks pass packets in many different ways. [RFC 1149][10] describes the use of carrier pigeons. They can't be any less reliable than my mobile provider when I'm more than a mile away from an interstate highway.

#### RFC 2324—Hypertext coffee pot control protocol (HTCPCP/1.0)

Coffee is very important to getting work done, so of course, we need a programmatic interface for managing our coffee pots. [RFC 2324][11] defines a protocol for interacting with coffee pots and adds HTTP 418 ("I am a teapot").

#### RFC 69—Distribution list change for M.I.T.

Is [RFC 69][12] the first published example of a misdirected unsubscribe request?

What are your must-read RFCs (whether they're serious or not)? Share your list in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/requests-for-comments-to-know

作者：[Ben Cotton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:https://www.ietf.org
[2]:https://www.rfc-editor.org/rfc/rfc2119.txt
[3]:https://www.rfc-editor.org/rfc/rfc3339.txt
[4]:https://www.iso.org/iso-8601-date-and-time-format.html
[5]:https://www.rfc-editor.org/rfc/rfc1918.txt
[6]:https://www.rfc-editor.org/rfc/rfc1912.txt
[7]:https://www.rfc-editor.org/rfc/rfc289.txt
[8]:https://www.rfc-editor.org/rfc/rfc2822.txt
[9]:https://www.rfc-editor.org/rfc/rfc7231.txt
[10]:https://www.rfc-editor.org/rfc/rfc1149.txt
[11]:https://www.rfc-editor.org/rfc/rfc2324.txt
[12]:https://www.rfc-editor.org/rfc/rfc69.txt
