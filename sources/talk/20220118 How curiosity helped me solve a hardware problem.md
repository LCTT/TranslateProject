[#]: subject: "How curiosity helped me solve a hardware problem"
[#]: via: "https://opensource.com/article/22/1/troubleshoot-hardware-sysadmin"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How curiosity helped me solve a hardware problem
======
Curiosity fuels the quest for knowledge and truth, whether it's about
hardware, open source software, programming, building a PC, optimizing
settings, or just learning a new application.
![Puzzle pieces coming together to form a computer screen][1]

I typically have a dozen computers up and running on my home network—yes, 12. And I am responsible for several more in other locations. With so many computers, there are always failures of various types, and I ultimately diagnose many of them as hardware problems. But it can be difficult to diagnose which hardware component is causing the issue.

Just this week, I had a perplexing problem that I misdiagnosed the cause of on my primary workstation—twice. This article takes you through the process I followed. I show you where and why I went down the wrong path and how easy it can be to do so.

### The first symptoms

I have been working on several projects. Recently, I had many applications open on multiple desktops and was just starting to work when the display went blank. Most (not all) of the fans in my primary workstation came to a stop, and I sucked in a deep breath. I'd never seen anything quite like this before, but I did know that my system was in trouble.

There were two primary clues I had to work with. The display went dark, and several fans had stopped. However, the front-panel power and disk activity LEDs were still on, although at a lower brightness level than usual. Most of the decorative RGB LED lights on my motherboard, memory DIMMs, and fans also went out.

I tried the power and reset buttons with no results. I turned off the power supply directly using the PSU rocker switch. Powering it back on resulted in the same set of symptoms.

### Initial thoughts

These symptoms and decades of experience with all kinds of failures pointed me to the power supply.

I removed the power supply and used my PSU tester to check it. The tester indicated that the PSU was good, and all voltages were within specs. However, I knew the tester could be wrong. PSU testers do not test under full load conditions such as those that exist when the computer is running and drawing a few hundred watts of power. I went with my gut and installed my spare 1000W power supply.

With an average of 12 computers in my home network, I have learned to keep plenty of spare parts on hand. It saves a lot of frustration that I don't have to run to the local computer store or order online and wait for delivery when things break—and things are always breaking with that many computers around.

That replacement power supply solved the problem despite the result I got from the PSU tester. Even though the tester has been correct many times in the past, my experience, my knowledge, and my gut told me differently.

Unfortunately, my gut instinct was wrong.

### Second thoughts

My workstation was exhibiting the same symptoms again. It is very unlikely that two different PSUs would fail exactly the same way.

Next idea: It had to be the motherboard. I don't keep spare motherboards around, so I ordered a new one online and figured that I could use extra memory I already had and move the CPU to the new motherboard along with its all-in-one liquid cooling unit.

### Disciplined troubleshooting

The new motherboard would take a couple of days to arrive, so I decided to prepare by removing the old one from the workstation. But before I unplugged the power feeds to the motherboard, my curiosity took over and forced me to power on the system with only the motherboard, CPU, and memory installed. I had disconnected everything else.

Good troubleshooting demands that you isolate all potential variables, and all I'd done so far was test the PSU. I had to test every component.

This process required me to disconnect the front panel cables for sound and the dashboard media panel that includes various USB, SATA, and memory card slots.

With just the motherboard connected, I got a surprise: Everything worked as normal!

The computer itself wouldn't boot because there were no connected storage drives, and nothing was displayed because I had removed the display adapter. But there were no symptoms of either power or motherboard failure. That piqued my curiosity even more. If the motherboard were truly bad, the symptoms would still exist.

So I started a sequence of powering off, reinstalling one of the removed components, and powering back on.

It turns out that the front panel media dashboard caused the symptoms.

I removed the media dashboard and plugged everything else back in. My workstation booted up properly and performed as expected. I had identified the culprit.

### How it started

Having figured out the actual problem, I immediately understood the root cause. It had started a couple of days previously. I was working with and testing several external USB devices, including various cameras, storage devices that I use for backups, and an external USB hub.

I picked up one USB cable and plugged it into a USB 2.0 slot on the media dashboard. Everything ground to a halt, and most of the lights and fans went out. I unplugged the USB cable, which was now very hot, and burned my fingers. I had inadvertently plugged the type C end into the USB 3.0 type A socket, which had shorted the power.

After unplugging the USB cable, everything went back to "normal"—except it didn't. The media dashboard lasted a few more days and then shorted out completely, having been weakened by my careless mistake.

### Jumping to conclusions

Knowledge and experience can sometimes count for more than tools like PSU testers. Except when they don't. I eventually found the actual cause of the problem, but I should have seen it sooner.

Although I was correct about this being a power problem, I was sidetracked by not correctly reading the symptoms and following that line of inquiry to its logical conclusion. I could have isolated the true cause of the problem sooner than I did and saved the time I spent configuring my laptop to be a temporary primary device until I could fix my primary workstation.

Sysadmins work with complex devices, and it can be easy to jump to conclusions. I have over 50 years of experience in the computer industry, and I still do it. I just need to remember to take a few deep [yoga breaths][2] and keep digging until I isolate the root cause of the problem.

### Curiosity

At least I followed my curiosity while waiting for the replacement motherboard to arrive. That allowed me to return things to normal much sooner than had I waited until the new motherboard arrived. And I might have discarded a perfectly good motherboard by not testing it further.

There is a saying about curiosity killing the cat. I hate that saying because it is all too frequently used by parents, colleagues, pointy-haired bosses, teachers, and others who just want us curious folk to leave them alone. In reality, curiosity fuels the quest for knowledge and truth, whether it's about hardware, open source software, programming, building a PC, optimizing settings, or just learning a new application. Feed your curiosity!

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/troubleshoot-hardware-sysadmin

作者：[David Both][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://opensource.com/article/21/11/linux-yoga
