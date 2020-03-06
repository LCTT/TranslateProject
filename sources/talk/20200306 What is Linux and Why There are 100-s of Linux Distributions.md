[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is Linux and Why There are 100’s of Linux Distributions?)
[#]: via: (https://itsfoss.com/what-is-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

What is Linux and Why There are 100’s of Linux Distributions?
======

When you are just starting with Linux, it’s easy to get overwhelmed.

You probably know only Windows and now you want to use Linux because you read that [Linux is better than Windows][1] as it is more secure and you don’t have to buy a license to use Linux.

But then when you go about downloading and installing Linux, you learn that Linux is not a single entity. There are [Ubuntu][2], [Fedora][3], [Linux Mint][4], elementary and hundreds of such ‘Linux variants’. The trouble is that some of them look just like the other.

If that’s the case, why are there multiple of those Linux operating systems? And then you also learn that Linux is just a kernel not an operating system.

![Too Many Linux!][5]

It gets messy. And you may feel like pulling out your hair. For a person who has a receding hairline, I would like you to keep your hair intact by explaining things in a way you could easily understand.

I am going to take an analogy and explain why Linux is just a kernel, why there are hundreds of Linux and why, despite looking similar, they are different.

The explanation here may not be considered good enough for an answer in an exam or interview but it should give you a better understanding of the topic.

Apology in advance!

My analogy may not be entirely correct from mechanical point of view as well. I am not knowledgeable about engines, cars and other related mechanical stuff.
But in my experience, I have noticed that this analogy helps people clearly understand the concept of Linux and operating system.
Also, I have used the term Linux OS instead of Linux distribution deliberately so that newcomers don’t start wondering about distribution.

### Linux is just a kernel

_**Linux is not an operating system, it’s just a kernel.**_

The statement is entirely true. But how do you understand it. If you look into books, you’ll find Linux kernel structure described like this:

![Linux Kernel Structure][6]

There is absolutely correct, however, let’s take a different approach. Think of operating systems as vehicles, any kind of vehicle be it motorbikes, cars or trucks.

What is at the core of a vehicle? An engine.

Think of kernel as the engine. It’s an essential part of the vehicle and you cannot use a vehicle without the engine.

![The Operating System Analogy][7]

But you cannot drive an engine, can you? You need a lot of other stuff to interact with the engine and drive the vehicle. You need wheels, steering, gears, clutch, brakes and more to drive a vehicle on top of that engine.

Similarly, you cannot use a kernel on its own. You need lots of tool to interact with the kernel and use the operating system. These stuff could be shell, commands, graphical interface (also called desktop environments) etc.

This makes sense, right? Now that you understand this analogy, let’s take it further so that you understand the rest of it.

Windows and other operating systems have kernel too

Kernel is not something exclusive to Linux. You may not have realized but Windows, macOS and other operating systems have a kernel underneath as well.
Microsoft Windows operating systems are based on [Windows NT kernel][8]. Apple’s macOS is based on the [XNU kernel][9].

### Think of operating systems as vehicles

Think of Microsoft as an automobile company that makes a general purpose car (Windows operating system) that is hugely popular and dominates the car market. They use their own patented engine that no one else can use. But these ‘Microsoft cars’ do not offer scope of customization. You cannot modify the engine on your own.

Now come to ‘Apple automobile’. They offer shiny looking, luxury cars at an expensive price. If you got a problem, they have a premium support system where they might just replace the car.

Now comes Linux. Remember, Linux is just an engine (kernel). But this ‘Linux engine’ is not patented and thus anyone is free to modify and build cars (desktop operating system), bikes (small embed system in your toys, tvs etc), trucks (servers) or jet-planes ([supercomputers][10]) on top of it. In real world, no such engine exists but accept it for the sake of this analogy.

![][11]

  * kernel = engine
  * Linux kernel = specific type of engine
  * desktop operating systems = cars
  * server operating systems = heavy trucks
  * embed systems = motor-bikes
  * desktop environment = body of the vehicle along with interiors (dashboard and all)
  * themes and icons = paint job, rim job and other customization
  * applications = accessories you put for specific purpose (like music system)



### Why there are so many Linux OS/distributions? Why some look similar?

Why there are so many cars? Because there are several vehicle manufacturers using the ‘Linux engine’ and each of them have so many cars of different type and for different purposes.

Since ‘Linux engine’ is free to use and modify, anyone can use it to build a vehicle on top of it.

This is why Ubuntu, Debian, Fedora, SUSE, [Manjaro][12] and many other **Linux-based operating systems (also called Linux distributions or Linux distros)** exist.

You might also have noticed that these Linux operating systems offer different variants but they look similar. I mean look at Fedora’s default GNOME version and Debian’s GNOME version. They do look the same, don’t they?

![Fedora GNOME vs Debian GNOME: Virtually No Visual Difference][13]

The component that gives the look and feel in a Linux OS is called [desktop environment][14]. In our analogy here, you can think of it as a combination of outer body and matching interiors. This is what provides the look and feel to your vehicle, does it not?

It’s from the exterior that you can identify the cars into category of sedan, SUV, hatchback, station wagon, convertible, minivan, van, compact car, 4×4 etc.

But these ‘type of cars’ are not exclusive to a single automobile company. Ford offers SUV, compact cars, vans etc and so do other companies like General Motors, Toyota.

![Vehicles of same type look similar even if they are from different automobile companies][15]

Similarly, distributions (Linux OSes) like Fedora, Ubuntu, Debian, Manjaro etc also offer different variants in the form of GNOME, KDE, Cinnamon, MATE and other [desktop environments][16].

Ford’s SUV may look similar to Toyota’s or Renault’s SUV. Fedora’s GNOME version may look similar to Manjaro or Debian’s GNOME version.

#### Some type of cars consume more fuel, some desktop environments need more RAM

You probably understand the ‘usefulness’ of different types of cars. Compact cars are good for driving in the cities, vans are good for long trip with family, 4×4 are good for adventures in jungles and other rough terrain. A SUV may look good and feel comfortable for sitting but it consumes more fuel than a compact car that might not be comfortable to sit in.

Similarly, desktop environments (GNOME, MATE, KDE, Xfce etc) also serve some purpose other than just providing the looks to your Linux operating system.

GNOME gives a modern looking desktop but it consumes more RAM and thus require that your computer has more than 4 GB of RAM. Xfce on the other hand may look old/vintage but it can run on systems with 1 GB of RAM.

#### Difference between getting desktop environment from distribution and installing on your own

As you start using Linux, you’ll also come across suggestions that you can easily install other desktop environments on your current system.

Remember that Linux is a free world. You are free to modify the engine, customize the looks on your own, if you have the knowledge/experience or if you are an enthusiastic learner.

Think of it as customizing cars. You may modify a Hundai i20 to look like Suzuki Swift Dzire. But it might not be the same as using a Swift Dzire.

When you are inside the i20 modified to look like Swiftz Dzire, you’ll find that it may not have the same experience from the inside. Dashboard is different, seats are different. You may also notice that the exterior doesn’t fit the same on i20’s body.

The same goes for switching desktop environments. You will find that you don’t have the same set of apps in Ubuntu that you should be getting in Mint Cinnamon. Few apps will look out of place. Not to mention that you may find a few things broken, such as network manager indicator missing etc.

Of course, you can put time, effort and skills to make Hundai i20 look as much like Swift Dzire as possible but you may feel like getting Suzuki Swift Dzire is a better idea in the first place.

This is the reason why installing Ubuntu MATE is better than installing Ubuntu (GNOME version) and then [installing MATE desktop][17] on it.

### Linux operating systems also differ in the way they handle applications

Another major criteria on which the Linux operating systems differ from each other is the package management.

Package management is basically how you get new software and updates in your systems. It’s up to your Linux distribution/OS to provide the security and maintenance updates. Your Linux OS also provides the means of installing new software on your system.

Some Linux OS provides all the new software version immediately after their release while some take time to test them for your own good. Some Linux OS (like Ubuntu) provides easier way of installing a new software while you may find it complicated in some other Linux OS (like [Gentoo][18]).

Keeping the line of our analogy, consider installing software as adding accessories to your vehicle.

Suppose you have to install a music system in your car. You may have two options here. Your car is designed in such a way that you just insert the music player, you hear the click sound and you know it’s installed. The second option could be to get a screwdriver and then fix the music player on screws.

Most people would prefer the hassle-free click lock installing system. Some people might take matter (and screwdriver) into their own hands.

If an automobile company provides scope for installing lots of accessories in click-lock fashion in their cars, they will be preferred, won’t they?

This is why Linux distributions like Ubuntu have a more users because they have a huge collection of software that can be easily installed in matter of clicks.

### Conclusion

Before I conclude this article, I’ll also like to talk about support that plays a significant role in choosing a Linux OS. For your car, you would like to have its official service center or other garages that service the automobile brand you own, don’t you? If the automobile company is popular, naturally, it will have more and more garages providing services.

The same goes for Linux as well. For a popular Linux OS like Ubuntu, you have some official forums to seek support and a good number of websites and forums providing troubleshooting tips to fix your problem.

Again, I know this is not a perfect analogy but this helps understand the things slightly better.

If you are absolutely new to Linux, did this article made things clear for you or you are more confused than before?

If you already know Linux, how would you explain Linux to someone from non-technical background?

Your suggestions and feedback is welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/what-is-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-better-than-windows/
[2]: https://ubuntu.com/
[3]: https://getfedora.org/
[4]: https://linuxmint.com/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/too-many-linux-choices.png?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Linux_Kernel_structure.png?ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/operating_system_analogy.png?ssl=1
[8]: https://en.wikipedia.org/wiki/Architecture_of_Windows_NT
[9]: https://en.wikipedia.org/wiki/XNU
[10]: https://itsfoss.com/linux-runs-top-supercomputers/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/linux-kernel-as-engine.png?ssl=1
[12]: https://manjaro.org/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/fedora-gnome-vs-debian-gnome.jpg?ssl=1
[14]: https://itsfoss.com/glossary/desktop-environment/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/linux_suv_analogy.jpg?ssl=1
[16]: https://itsfoss.com/best-linux-desktop-environments/
[17]: https://itsfoss.com/install-mate-desktop-ubuntu/
[18]: https://www.gentoo.org/
