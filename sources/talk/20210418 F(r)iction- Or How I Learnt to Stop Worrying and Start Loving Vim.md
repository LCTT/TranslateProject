[#]: subject: (F(r)iction: Or How I Learnt to Stop Worrying and Start Loving Vim)
[#]: via: (https://news.itsfoss.com/how-i-started-loving-vim/)
[#]: author: (Theena https://news.itsfoss.com/author/theena/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

F(r)iction: Or How I Learnt to Stop Worrying and Start Loving Vim
======

It is Dec 2009, and I am ready to quit my job.

I wanted to focus on writing my first book; neither my commitments at work nor the state of technology was helping.

Writing is hard work.

Few tasks in the modern world can be as singular – or as daunting – a pursuit as sitting down in front of a blank piece of paper, and asking your brain to vomit out words that communicate an idea to readers. I am not suggesting that writing can’t be collaborative of course, but merely illustrating how daunting it can be for writers to set off on a new piece by themselves. This is true for fiction
and non-fiction writing, but since I am a novelist I’d like to focus primarily on fiction in this article.

![][1]

Remember what 2009 was like?

Smart phones were 3 years old – I still hadn’t gone away from feature phones. Laptops were big and bulky. Meanwhile, cloud-based web applications for productivity was in their infancy, and just not good. Technologically speaking, writers like me were using their Gmail accounts (and a very young cloud-based storage called Dropbox) as an always-available option to work on their drafts, even while away from my personal computer. While this was a nice change from what writers had to go through when working with typewriters (or god forbid, pen and paper), it wasn’t much.

For one thing, version control of manuscripts was a nightmare. Further, the more tools I added to my tool kit to simplify the workflow, the more I had to switch context – both from a UI and a UX sense.

I would start writing drafts on Windows Notepad, save it on a MS Word Document on my PC at home, email myself a copy, keep another copy on Dropbox (since Dropbox wasn’t accessible at work), work on the copy of that file at work, email it back to myself at the end of the day, download it on the home computer, saving it under a new name and the respective date so that I would recognize the changes in the file were made at work (as opposed to home)…well you get the picture. If you think this workflow involving Windows Notepad, MS Word, Gmail, and Dropbox is insane, well now you know why I quit my job.

More soberingly, I still know writers, damn good writers too, who use variations of the workflow that I followed in 2009.

Over the next three years, I worked on the manuscript, completing the first draft in 2012. During the three years much had changed with the state of technology. Smart phones were actually pretty great, and some of the complications I had in 2009 had disappeared. I could still work on the same file that I had been working from at home, on my phone (not necessarily fresh writing, but editing had become considerably easier thanks to Dropbox on the phone.) My main writing tool remained Microsoft’s Windows Notepad and Word, which is how I completed the first draft.

The novel [**First Utterance**][2] was released in 2016 to critical and commercial acclaim.

The end.

Or so I thought.

As soon as I completed the manuscript and sent it to my editor, I had begun working on the second novel. I was no longer quitting my job to work on writing, but I had taken a more pragmatic approach: I’d take two weeks off at the end of ever year so that I could go to a little cabin in the mountains to write.

It took me half a day to realize that the things that annoyed me about my [writing tools][3] and workflow had not disappeared, but morphed into a more complex beast. As a writer, I wasn’t being productive or as efficient as I wanted.

### Linux in the time of Corona

![][4]

It is 2020 and the world is on the verge of mass hysteria.

What had started out as an isolated novel virus in China was morphing into the first global pandemic since 1911. On March 20th, Sri Lanka followed most of the rest of the world and shutdown.

April in Sri Lanka is the height of the dry season. Temperatures in concrete jungles like Colombo can reach the mid 30s, with humidity in the high 90s. It can drive most people to distraction at the best of times, but stuck at home with no always-on air conditioning while a global pandemic is underway? That is a good recipe for madness.

My madness was Linux or, as we in the open source community call it, ‘distro-hopping’.

The more I played around with *nix distros, the more enamoured I came to be with the idea of control. When nothing seems to be within our control – not even the simple act of shaking hands with another person – then it is only natural we lean towards things where we feel more in control.

Where better to get more control in my life than with my computing? Naturally, this extended to my writing tools and workflow too.

### The path to Vim

There’s a joke about [Vim][5] that describes perfectly my first experience with it. People are obsessive about Vim because they don’t know how to close it.

I was attempting to edit a configuration file, and the [fresh install of Ubuntu Server][6] had only Vim pre-installed. First there was panic – so much so I restarted the machine thinking the OS wasn’t picking up my keyboard. Then when it happened again, the inevitable Google search: ‘[How do I close vim?][7]‘

_Oh. That’s interesting_, I thought.

_But why?_

To understand why I was even remotely interested in a text editor that was too complex to close, you have to understand how much I adore Windows Notepad.

As a writer, I loved writing on its no-nonsense, no buttons, white-abyss like canvas. It had no spell check. It had no formatting. But I didn’t care.

For the writer in me, Notepad was the best writing scratch pad ever devised. Unfortunately, it isn’t powerful – so even if I start writing my drafts in Notepad, I would move it to MS Word once I had passed a 1000 words – Notepad wasn’t built for prose, and those limitations would be glaringly obvious when I passed that word limit.

So the first thing I installed I moved all my computing away from Windows, was a good text editor.

[Kate][8] was the first replacement where I felt more comfortable than I did on Windows Notepad – it was more powerful (it had spell-checker!), and hey, I could mess around with some hobbyist-type coding in the same environment.

It was love.

But then Vim happened.

The more I learnt about Vim, the more I watched developers live coding on Vim, the more I found myself opening Vim for my text editing needs. I use the phrase ‘text editing’ in the traditional Unix sense: editing blocks of text in configuration files, or sometimes writing basic Bash scripts.

I still hadn’t used Vim remotely for my prose writing needs.

For that I had LibreOffice.

Sort of.

While it is an adequate [replacement for MS Office][9], I found myself underwhelmed. The UI is perhaps even more distracting than MS Word, and with each distro having different packages of LibreOffice, I found myself using a hellishly fragmented tool kit and workflow, to say nothing about how different the UI can look in various distros and desktop environments.

Things had become even more complicated because I had also started my Masters. In this scenario, I was taking notes down on Kate, transferring them to LibreOffice, and then saving it on to my Dropbox.

Context switching was staring at me in the face every day.

Productivity dropped as I had to open and close a number of unrelated applications. I needed one writing tool to meet all my needs – as a novelist, as a student, and as a hobbyist coder.

And that’s when I realized that the solution to my context switching nightmare was also staring at me in the face at the same time.

By this point, I had used Vim often enough – even used it with Termux on my Android phone – to be pretty comfortable with the idea of moving everything to Vim. Since it supported markdown syntax, note-taking would also become even easier.

This was just about two months ago.

How am I doing?

It is April 2021.

I started this draft on my phone, [using Vim][10] via Termux (with the aid of a Bluetooth keyboard), while in a taxi. I pushed the file to a GitHub private repo for my writing, from which I pulled the file to my PC, wrote a few more lines, before heading out again. I pulled the new version of the file from GitHub to my phone, made changes, pushed it, repeat, until I emailed the final draft to the editor.

The context switching is now no more.

The distractions that come from writing in word processors is no more.

Editing is infinitely easier, and faster.

My wrists are no longer in pain because I hid my mouse from sight.

It is April 2021.

I am a novelist.

And I write on Vim.

How? I’ll discuss the specific of this workflow in the second part of this column series on how non-tech people are using free and open source technology. Stay tuned.

![][11]

I'm not interested

#### _Related_

  * [Going Against Google Analytics With Plausible's Co-Founder [Interview]][12]
  * ![][13] ![Interview with Plausible founder Marco Saric][14]


  * [The Progress Linux has Made in Terms of Gaming is Simply Incredible: Lutris Creator][15]
  * ![][13] ![][16]


  * [Multi Monitor and HiDPI Setup is Looking Better on Ubuntu 21.04 [My Experience So Far]][17]
  * ![][13] ![Multimonitor setup with Ubuntu 21.04][18]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/how-i-started-loving-vim/

作者：[Theena][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/theena/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzM5MCcgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[2]: https://www.goodreads.com/book/show/29616237-first-utterance
[3]: https://itsfoss.com/open-source-tools-writers/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzM5NScgd2lkdGg9Jzc4MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[5]: https://www.vim.org/
[6]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[7]: https://itsfoss.com/how-to-exit-vim/
[8]: https://kate-editor.org/
[9]: https://itsfoss.com/best-free-open-source-alternatives-microsoft-office/
[10]: https://linuxhandbook.com/basic-vim-commands/
[11]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzI1MCcgd2lkdGg9Jzc1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[12]: https://news.itsfoss.com/marko-saric-plausible/
[13]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[14]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/04/Interview-plausible.jpg?fit=1200%2C675&ssl=1&resize=350%2C200
[15]: https://news.itsfoss.com/lutris-creator-interview/
[16]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/lutris-interview-ft.png?fit=1200%2C675&ssl=1&resize=350%2C200
[17]: https://news.itsfoss.com/ubuntu-21-04-multi-monitor-support/
[18]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/multi-monitor-ubuntu-21-itsfoss.jpg?fit=1200%2C675&ssl=1&resize=350%2C200
