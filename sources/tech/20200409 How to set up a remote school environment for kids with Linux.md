[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to set up a remote school environment for kids with Linux)
[#]: via: (https://opensource.com/article/20/4/school-home-linux)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

How to set up a remote school environment for kids with Linux
======
Repurpose an old computer to support the new home-schooler in your life.
![Image by Alan Formy-Duvall][1]

COVID-19 has suddenly thrown all of us into a new and challenging situation. Many of us are now working full-time from home, and for a lot of us (especially people who aren't used to working remotely), this is taking some getting used to.

Another group that is similarly challenged is our kids. They can't go to school or participate in their regular after-school activities. My daughter's elementary school closed its classrooms and is teaching through an online, web-based learning portal instead. And one of her favorite extracurricular activities—a coding school where she has been learning Scratch and just recently "graduated" to WoofJS–has also gone to an online-only format.

We are fortunate that so many of our children's activities can be done online now, as this is the only way they will be able to learn, share, and socialize for at least the next several months.

### Setting up a temporary homeschool environment

When our daughter's school went to an online-only format, we realized she needed a place and some tools to do her work. So we cleaned off her desk and cleared the toys from the floor around it to make an "office" for her. We also realized she would need a computer. While I could have shopped online and ordered a new computer (and spent at least several hundred dollars—if not more than $1,000—in the process), I chose an alternative and put an old, unused laptop back to work.

If you have an unused computer sitting around and are willing to do a bit of tech work, you, too, can set something up to get your kids online. Here's how I did it.

### The hardware

While my daughter already has her own small IT department (as I like to say), it consists of some gaming systems, a tablet, and a Chromebook. Even her Chromebook has just an 11.6" screen and a small keyboard, so none of her devices are really quite adequate for full-time school duty.

So we found ourselves in a pinch. She really needed a desktop-capable computer system with a decent-sized screen, a full keyboard, a good-quality microphone, a set of speakers, and a headphone jack. And having an external video connector helps if you decide one screen isn't enough.

I didn't have a spare desktop, but I did have a laptop: a Lenovo G550 with a Pentium Dual-Core T4500 2.3GHz processor and 4GB RAM. I replaced its aging 5400RPM spindle hard drive with a 240GB solid-state drive. The laptop has a 15.6" screen, which is much easier to view than the small screens on her other devices, and a comfortable, full-size keyboard. Its CPU scores a bit better in PassMark's benchmarks (913 vs. 674) than the 1.6GHz Intel Celeron N3060 Dual-Core in the Chromebook.

However, it is 10 years old, certainly on the edge of usability by today's standards. But, thanks to the efficiency of the Linux operating system, it gets the job done. I installed the latest version (v31) of [Fedora Workstation][2], but many other distributions will work just fine. If you really want to eke out every drop of performance, you could use one of the [lightweight Linux distributions][3]. The only area that required a little extra effort with Fedora was the wireless; I had to install the driver for the Broadcom WiFi hardware. But really, this was only a few extra steps and a restart, and it was good to go.

Linux supports all of the other hardware in the laptop. My daughter prefers a full-sized mouse over the touchpad, so I attached one. She likes the keyboard on this laptop, but if she wants an external keyboard, there are enough USB ports to hook one up.

It has a traditional 3.5mm audio jack, so she can use headphones. I recommend giving children decibel-limited headphones to protect their hearing.

Even though this laptop has a 15.6" widescreen display, I think having a second monitor gives the best experience. I have a spare that I might hook up to the external VGA connector.

### The software

My daughter's school set up an online learning portal. The benefit is that students just need a supported web browser to log on and get to work, and I thank the school for its efforts and choice of a vendor-agnostic solution. Most Linux distributions include the Mozilla Firefox web browser installed by default, and Linux provides a full operating system, so I can install any applications she might need. Fedora is also updated regularly (unlike the old Windows Vista that came with the laptop and is no longer supported).

![][4]

Scratch running on Fedora

Her extracurricular coding school is using the Zoom client. I'm happy to report that it was an easy [install with RPM][5] and works great on Fedora 31.

### Success!

My daughter has no trouble using her new laptop. She likes the [GNOME desktop][6], particularly the fact that it "Looks like Dad's!" This is turning out to be a great experiment in practical (and under-pressure) use of a Linux desktop.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/school-home-linux

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/homeschool.jpg?itok=vYEd9NON (Image by Alan Formy-Duvall)
[2]: https://getfedora.org/en/workstation/
[3]: https://opensource.com/article/19/6/linux-distros-to-try
[4]: https://opensource.com/sites/default/files/scratch.jpg
[5]: https://zoom.us/download?os=linux
[6]: https://www.gnome.org/
