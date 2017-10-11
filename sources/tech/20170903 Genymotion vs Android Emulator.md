Genymotion vs Android Emulator
============================================================

### Has the Android emulator improved enough to take on Genymotion


There has always been a debate about which android emulator to choose or to go with Genymotion, I’ve seen most of the discussion ending in favor of Genymotion.
I’ve gathered some data around the most common use case according to me, based on this I’ll be evaluating all the android emulators along with Genymotion.

TL;DR: Android emulator is faster than Genymotion when configured right.
Use x86 (32 bit) image with Google APIs, 3GB ram, quad-core CPU.

> Pheww, glad we’re past that
> Now, let’s dive deep

Disclaimer: I’ve tested my use case which to me looks the general use case i.e. running tests. All benchmarks were done on a mid-2015 MacBook Pro.
Wherever I say Genymotion I mean Genymotion Desktop. They have other products like Genymotion on Cloud & Genymotion on Demand which are not being considered here.
I’m not saying Genymotion is inadequate but is slower when running tests compared to certain Android emulators.

A little background on the subject and then we’ll jump to the good stuff.

 _Psst: I have some benchmarks down the line, stick around._ 

Long ago Android emulator was the only way to go. But they were too slow to use, the reason being a change of architecture.
What can you expect out of an ARM emulator running on an x86 machine? Every instruction had to be converted from ARM to x86 architecture which makes it really slow.

Then came along the x86 images of Android which are way faster as they get rid of the ARM to x86 platform change.
Now you can run x86 Android emulator on an x86 machine.

> _Problem solved!!!_ 
> 
> NO!

Android emulators were still slow from what people wanted.
Then came along Genymotion, which is just an Android VM running in a virtual box. But it is quite stable & fast compared to plain old android emulators which run on qemu.

Let’s jump to how the situation is today.

My team is using Genymotion in CI infrastructure and on developer machines. The task at hand was to get rid of all the Genymotion used in our CI infrastructure and developer machines.

> You ask why?
> Licenses cost money. Duh…

At a quick glance it seems like a stupid move as Android emulators are slow and buggy, they seem counterproductive, but when you get into the nitty-gritty of the situation you’ll actually find Android emulator to be superior.

Our use case is to run integration tests on them (mostly espresso).
We have just over 1100 tests in our app and Genymotion takes ~23 minutes to run all the tests.

A few other problems we were facing with Genymotion.

*   Limited command line tools ([GMTool][1]).

*   They needed periodic restart because of memory issues. This was a manual task, imagine doing it on a CI infrastructure with lots of machines.

Enter Android Emulator

The first time you try to set-up one of these it gives you so many options that you’ll feel like you are in Subway restaurant.
The biggest question of all is x86 or x86_64 and with Google APIs or without them.

I did some research and benchmarking with these combinations and this is what we came up with.

Drum Roll…

> The winner of the competition is x86 with Google APIs
> But how? why?

Well, I’ll tell you the problem with every one of them.

x86_64 is slower compared to x86

> By how much you ask.
> 
> 28.2% much !!!

Emulator with Google APIs is more stable, things tend to crash without them.

This brings us to the conclusion that the best one is x86 with Google APIs.

Before we pit our winning emulator against Genymotion. There are few more details that are of great importance.

*   I’ve used Nexus 5 system image with Google APIs.

*   I noticed that giving emulator less ram caused a lot of Google API crashes. So I’ve settled for 3GB of ram for an emulator.

*   The emulator has a quad-core.

*   HAXM was installed on the host machine.

Time for few benchmark

![Genymotion and Android Emulator Espresso Benchmark](https://d33wubrfki0l68.cloudfront.net/5ffb16e99dbccd5f6e4848d7a1b6b92646fea15f/1356a/assets/images/genymotion-vs-android-emulator/espressobenchmark.png)

![Linpack](https://d33wubrfki0l68.cloudfront.net/e5c28d737abf8dee69333f83657928c362157b4e/ede85/assets/images/genymotion-vs-android-emulator/linpack.png)

![Geekbench 4](https://d33wubrfki0l68.cloudfront.net/b5af78db6d6eddd090d601fcf32c11e7622759f0/b00c1/assets/images/genymotion-vs-android-emulator/geekbench4.png)

From the benchmarks, you can see that Android emulator beats Genymotion expect for in Geekbench4 which to me feels more of a virtual box beating qemu thing.

> All hail the King of the Emulators

We are now having a faster test execution time, better command line tools. Also with the latest [Android Emulator][2], things have gone a notch up. Faster boot time and what not.

Google has been working very hard to

> Make Android Emulator great again

If you haven’t been using android emulator from some time. I’d suggest you revisit and save some money.

One other solution which I was trying but couldn’t really get it to work was running an [Android-x86][3] image on AWS.
I was able to run it on a vSphere ESXi Hypervisor but not on AWS or any other cloud platform. If someone knows anything about it do comment below.

PS: [VMWare is now available on AWS][4], [Android-x86][5] on AWS might be possible after all.

--------------------------------------------------------------------------------

作者简介：

Hi, My name is Sumit Gupta. I’m a software/application/web developer, from Gurgaon, India.
I’m in this business because I love technology and it never fails to fascinate me. I’ve been working for more than 3 years, in this time I’ve had many learning though this time. Don’t they say If you have knowledge, let others light their candles in it.

When it’s compiling, I read articles, lots of them or listening to music.

Below are my social feeds & [email][6] if you want to reach me.

via: https://www.plightofbyte.com/android/2017/09/03/genymotion-vs-android-emulator/

作者：[Sumit Gupta ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.plightofbyte.com/about-me
[1]:https://docs.genymotion.com/Content/04_Tools/GMTool/GMTool.htm
[2]:https://developer.android.com/studio/releases/emulator.html
[3]:http://www.android-x86.org/
[4]:https://aws.amazon.com/vmware/
[5]:http://www.android-x86.org/
[6]:thesumitgupta@outlook.com
