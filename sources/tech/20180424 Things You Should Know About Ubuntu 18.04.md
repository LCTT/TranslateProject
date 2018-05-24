translating by wyxplus
Things You Should Know About Ubuntu 18.04
======
[Ubuntu 18.04 release][1] is just around the corner. I can see lots of questions from Ubuntu users in various Facebook groups and forums. I also organized Q&A sessions on Facebook and Instagram to know what Ubuntu users are wondering about Ubuntu 18.04.

I have tried to answer those frequently asked questions about Ubuntu 18.04 here. I hope it helps clear your doubts if you had any. And if you still have questions, feel free to ask in the comment section below.

### What to expect in Ubuntu 18.04

![Ubuntu 18.04 Frequently Asked Questions][2]

Just for clarification, some of the answers here are influenced by my personal opinion. If you are an experienced/aware Ubuntu user, some of the questions may sound silly to you. If that’s case, just ignore those questions.

#### Can I install Unity on Ubuntu 18.04?

Yes, you can.

Canonical knows that there are people who simply loved Unity. This is why it has made Unity 7 available in the Universe repository. This is a community maintained edition and Ubuntu doesn’t develop it directly.

I advise using the default GNOME first and if you really cannot tolerate it, then go on [installing Unity on Ubuntu 18.04][3].

#### What GNOME version does it have?

At the time of its release, Ubuntu 18.04 has GNOME 3.28.

#### Can I install vanilla GNOME on it?

Yes, you can.

Existing GNOME users might not like the Unity resembling, customized GNOME desktop in Ubuntu 18.04. There are some packages available in Ubuntu’s main and universe repositories that allows you to [install vanilla GNOME on Ubuntu 18.04][4].

#### Has the memory leak in GNOME fixed?

Yes. The [infamous memory leak in GNOME 3.28][5] has been fixed and [Ubuntu is already testing the fix][6].

Just to clarify, the memory leak was not caused by Ubuntu. It was/is impacting all Linux distributions that use GNOME 3.28. A new patch was released under GNOME 3.28.1 to fix this memory leak.

#### How long will Ubuntu 18.04 be supported?

It is a long-term support (LTS) release and like any LTS release, it will be supported for five years. Which means that Ubuntu 18.04 will get security and maintenance updates until April 2023. This is also true for all participating flavors except Ubuntu Studio.

#### When will Ubuntu 18.04 be released?

Ubuntu 18.04 LTS has been released on 26th April. All the participating flavors like Kubuntu, Lubuntu, Xubuntu, Budgie, MATE etc will have their 18.04 release available on the same day.

It seems [Ubuntu Studio will not have 18.04 as LTS release][7].

#### Is it possible to upgrade to Ubuntu 18.04 from 16.04/17.10? Can I upgrade from Ubuntu 16.04 with Unity to Ubuntu 18.04 with GNOME?

Yes, absolutely. Once Ubuntu 18.04 LTS is released, you can easily upgrade to the new version.

If you are using Ubuntu 17.10, make sure that in Software & Updates -> Updates, the ‘Notify me of a new Ubuntu version’ is set to ‘For any new version’.

![Get notified for a new version in Ubuntu][8]

If you are using Ubuntu 16.04, make sure that in Software & Updates -> Updates, the ‘Notify me of a new Ubuntu version’ is set to ‘For long-term support versions’.

![Ubuntu 18.04 upgrade from Ubuntu 16.04][9]

You should get system notification about the availability of the new versions. After that, upgrading to Ubuntu 18.04 is a matter of clicks.

Even if Ubuntu 16.04 was Unity, you can still [upgrade to Ubuntu 18.04][10] GNOME.

#### What does upgrading to Ubuntu 18.04 mean? Will I lose my data?

If you are using Ubuntu 17.10 or Ubuntu 16.04, sooner or later, Ubuntu will notify you that Ubuntu 18.04 is available. If you have a good internet connection that can download 1.5 Gb of data, you can upgrade to Ubuntu 18.04 in a few clicks and in under 30 minutes.

You don’t need to create a new USB and do a fresh install. Once the upgrade procedure finishes, you’ll have the new Ubuntu version available.

Normally, your data, documents etc are safe in the upgrade procedure. However, keeping a backup of your important documents is always a good idea.

#### When will I get to upgrade to Ubuntu 18.04?

If you are using Ubuntu 17.10 and have correct update settings in place (as mentioned in the previous section), you should be notified for upgrading to Ubuntu 18.04 within a few days of Ubuntu 18.04 release. Since Ubuntu servers encounter heavy load on the release day, not everyone gets the upgrade the same day.

For Ubuntu 16.04 users, it may take some weeks before they are officially notified of the availability of Ubuntu 18.04. Usually, this will happen after the first point release Ubuntu 18.04.1. This point release fixes the newly discovered bugs in 18.04.

#### If I upgrade to Ubuntu 18.04 can I downgrade to 17.10 or 16.04?

No, you cannot. While upgrading to the newer version is easy, there is no option to downgrade. If you want to go back to Ubuntu 16.04, you’ll have to do a fresh install.

#### Can I use Ubuntu 18.04 on 32-bit systems?

Yes and no.

If you are already using the 32-bit version of Ubuntu 16.04 or 17.10, you may still get to upgrade to Ubuntu 18.04. However, you won’t find Ubuntu 18.04 bit ISO in 32-bit format anymore. In other words, you cannot do a fresh install of the 32-bit version of Ubuntu 18.04 GNOME.

The good news here is that other official flavors like Ubuntu MATE, Lubuntu etc still have the 32-bit ISO of their new versions.

In any case, if you have a 32-bit system, chances are that your system is weak on hardware. You’ll be better off using lightweight [Ubuntu MATE][11] or [Lubuntu][12] on such system.

#### Where can I download Ubuntu 18.04?

Once 18.04 is released, you can get the ISO image of Ubuntu 18.04 from its website. You have both direct download and torrent options. Other official flavors will be available on their official websites.

#### Should I do a fresh install of Ubuntu 18.04 or upgrade to it from 16.04/17.10?

If you have a choice, make a backup of your data and do a fresh install of Ubuntu 18.04.

Upgrading to 18.04 from an existing version is a convenient option. However, in my opinion, it still keeps some traces/packages of the older version. A fresh install is always cleaner.

For a fresh install, should I install Ubuntu 16.04 or Ubuntu 18.04?

If you are going to install Ubuntu on a system, go for Ubuntu 18.04 instead of 16.04.

Both of them are long-term support release and will be supported for a long time. Ubuntu 16.04 will get maintenance and security updates until 2021 and 18.04 until 2023.

However, I would suggest that you use Ubuntu 18.04. Any LTS release gets [hardware updates for a limited time][13] (two and a half years I think). After that, it only gets maintenance updates. If you have newer hardware, you’ll get better support in 18.04.

Also, many application developers will start focusing on Ubuntu 18.04 soon. Newly created PPAs might only support 18.04 in a few months. Using 18.04 has its advantages over 16.04.

#### Will it be easier to install printer-scanner drivers instead of using the CLI?

I am not an expert when it comes to printers so my opinion is based on my limited knowledge in this field. Most of the new printers support [IPP protocol][14] and thus they should be well supported in Ubuntu 18.04. I cannot say the same about older printers.

#### Does Ubuntu 18.04 have better support for Realtek and other WiFi adapters?

No specific information on this part.

#### What are the system requirements for Ubuntu 18.04?

For the default GNOME version, you should have [4 GB of RAM for a comfortable use][15]. A processor released in last 8 years will work as well. Anything older than that should use a [lightweight Linux distribution][16] such as [Lubuntu][12].

#### Any other questions about Ubuntu 18.04?

If you have any other doubts regarding Ubuntu 18.04, please feel free to leave a comment below. If you think some other information should be added to the list, please let me know.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-18-04-faq/

作者：[Abhishek Prakash][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/ubuntu-18-04-release-features/
[2]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/04/ubuntu-18-04-faq-800x450.png
[3]:https://itsfoss.com/use-unity-ubuntu-17-10/
[4]:https://itsfoss.com/vanilla-gnome-ubuntu/
[5]:https://feaneron.com/2018/04/20/the-infamous-gnome-shell-memory-leak/
[6]:https://community.ubuntu.com/t/help-test-memory-leak-fixes-in-18-04-lts/5251
[7]:https://www.omgubuntu.co.uk/2018/04/ubuntu-studio-plans-to-reboot
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/03/upgrade-ubuntu-2.jpeg
[9]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/10/ubuntu-18-04-upgrade-settings-800x379.png
[10]:https://itsfoss.com/upgrade-ubuntu-version/
[11]:https://ubuntu-mate.org/
[12]:https://lubuntu.net/
[13]:https://www.ubuntu.com/info/release-end-of-life
[14]:https://www.pwg.org/ipp/everywhere.html
[15]:https://help.ubuntu.com/community/Installation/SystemRequirements
[16]:https://itsfoss.com/lightweight-linux-beginners/
