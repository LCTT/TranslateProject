[#]: subject: "Talking digital with Brian Kernighan"
[#]: via: "https://opensource.com/article/22/1/interview-brian-kernighan"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Talking digital with Brian Kernighan
======
Brian Kernighan shares his inspiration and research behind the latest
edition of his book, Understanding the Digital World.
![Brain on a computer screen][1]

Brian Kernighan has written many popular books about programming, computers, and technology. My own bookshelf includes several books authored or co-authored by Kernighan, including _The C Programming Language_, _Unix: A History and A Memoir_, _The AWK Programming Language_, and others. I just added another book by Kernighan, _Understanding the Digital World: What You Need to Know about Computers, the Internet, Privacy, and Security_, Second Edition, published in 2021 by Princeton University Press. I recently had an opportunity to interview Kernighan about his latest book:

**What prompted you to write _Understanding the Digital World_?**

I started teaching a Computer Science course, "Computers in Our World," during the Fall of 1999, and I never found a book that I liked. Most of the books were pretty superficial; they were the kind that had lots of colored pictures but didn't have any content. I finally decided, "The only way I'm going to get something that I feel is the right balance of actual technical information, but kind of interesting writing, is that I have to write it myself."

Arguably, the book is, in some ways, the transcription of what was going on in the lectures. So a lot of the prose flowed from that.

The class is aimed at a very non-technical population, but the computing that we're talking about, and communications, is pervasive. It's part of the world. It's changing our lives, and so an educated person—and that would be the students in my class or the people who read your articles—they need to know about this stuff. They're going to be making decisions about it someday, and it'd be nice if they made those on the basis of some understanding of what the technology is and what its applications are. That was why I wrote the book.

**What was your process when you wrote this book?**

For this revision, it was definitely incremental. It was going through the thing fairly carefully and saying, "Wait a minute, that's dusty. That's no longer true." For example, I talked about the CPU, and you don't really think about the CPU anymore. It's more like there's a processor, except that inside it, they may have more structure.

For the programming language stuff, I really thought about how might people most profitably learn about programming. And when I was first teaching, that was Visual BASIC. Those days are gone, but it was really great at the time. And then, I used JavaScript because it was available on the web. And now Python.

In fact, one of the reasons people take this course is because it satisfies a requirement called Quantitative Reasoning. They changed the name of that to Computational Reasoning last year. And I thought, _let me put a bit more computation in_. That's the genesis of the Python stuff.

And I wanted to talk about machine learning. It's not something I am an expert in at all; most of what I know about it I've learned from others. But it's clearly central to a lot of what's going on. And it's a combination of really great ideas and serious snake oil—and in the book, I'm trying to explain that from my perspective, as an interested dilettante.

**What are some of the major changes that you made in this edition of the book?**

The basics like bits and bytes still work the same way they always did, and how you represent information, how processors work, a lot of stuff that's pretty stable at this point.

But a lot of other things are changing. I would say these are societal things. But also, to some extent, technology is changing too. For example, the smooth exponential growth of Moore's Law no longer applies to processor speeds. They're not getting faster. Instead of getting faster and faster, they're getting wider and wider. You get more processors, and that leads to some interesting problems.

Wireless is evolving. I looked at the section I had written on cell phones, and I realized it's incredibly dusty. 3G is falling off one end, and 5G is becoming more real. I think there's still a fair amount of hype, but that's something which has really evolved.

And then, of course, the societal side. This incredible number of advances and threats and risks and so on, on the Internet: privacy, surveillance by government and commercial interests, packing various degrees of sophistication. Ransomware is one of the manifestations of that.

I had for a long time been using JavaScript as a programming language just to explain what programming was. And I decided that was too narrow and maybe off-target a bit. So I added basically equivalent material on Python. So now there's some stuff on JavaScript, and there's also some on Python. And part of the reason is Python is a language for anything involving data science.

And the other thing is that you can now use Python on the web; you don't have to install anything. In class, I've been using [Google's Colab][2], which is basically [Jupyter Notebook][3] in disguise. That has worked remarkably well, and I'm happy to have added the Python part.

I added a chapter on artificial intelligence (AI)/machine learning/natural language processing. Some of that's history, some of it is "what are the basic ideas" and what can you do with those things. But also, what can't you do, and what are the interesting problems like intrinsic bias, or the fact you're putting in numbers and properties you don't know and the algorithm doesn't tell you what the meaning of the answer is. There's a lot of room for skepticism about AI.

**[ Get the cheat sheet: [AI glossary][4] ]**

I also think a lot about privacy and security, sort of "self-defense" kinds of things. You know, watch out for social networks. I finished _An Ugly Truth: Inside Facebook's Battle for Domination_, the book about Facebook and Zuckerberg. That confirms my belief that I was wise never to use Facebook.

So the book has more in it about defenses you might use, suggestions to use DuckDuckGo instead of Google, or for example, use Tor.

And more broadly, the march of technology. For example, five or six years ago, laptops had rotating machinery for disks, and now they have solid-state disks. Those have different sets of properties. It's not deep, but it's an interesting change. I already mentioned multiple cores in CPUs and 5G. In the book, I also talk about those kinds of technical changes as well as societal changes.

**What should people take away from reading the book?**

An understanding of computing and communications and how those work. And more than purely superficial, so one layer underneath the surface, but also some advice on how to manage your digital life. Because all of us are using it.

We already talked about if folks can understand how a technical system works and how might different things work. Another thing that I try to stress is tradeoffs; that you don't get something for nothing. There's no free lunch. For example, you get these wonderful free services from companies like Google, Facebook, and so on. But you pay for that by revealing an awful lot of personal information about yourself. That's the tradeoff there.

A more technical tradeoff comes up later on about cryptography. If you have strong cryptography, that's going to help the bad guys as well as the good guys. If you have weak cryptography, that's going to hurt the good guys, but the bad guys aren't going to use it anyways. So that's a tradeoff kind of thing.

Broadly, technology is a two-edged sword. For the most part, it's been good for us, but there have been plenty of times when it's not been good. And how do you maximize good and minimize the not-so-good?

* * *

_Understanding the Digital World: What You Need to Know about Computers, the Internet, Privacy, and Security_, Second Edition explains how computer hardware, software, networks, and systems work. It includes enough detail that you can understand how these systems work, no matter what your technical background. The social, political, and legal issues that new technology creates are discussed as well, so you can understand the difficult issues we face and appreciate the tradeoffs that have to be made to resolve them.

_Understanding the Digital World: What You Need to Know about Computers, the Internet, Privacy, and Security_, Second Edition is published by Princeton University Press, [available at Amazon][5] and other booksellers in hardback, paperback, and e-book.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/interview-brian-kernighan

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_computer_solve_fix_tool.png?itok=okq8joti (Brain on a computer screen)
[2]: https://colab.research.google.com/
[3]: https://jupyter.org/
[4]: https://enterprisersproject.com/ai-artificial-intelligence-glossary
[5]: https://www.amazon.com/Understanding-Digital-World-Computers-Internet/dp/0691219109
