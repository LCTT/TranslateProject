HankChow translating

5 Easy Tips for Linux Web Browser Security
======
![](https://www.linux.com/learn/intro-to-linux/2018/11/5-easy-tips-linux-web-browser-security)

If you use your Linux desktop and never open a web browser, you are a special kind of user. For most of us, however, a web browser has become one of the most-used digital tools on the planet. We work, we play, we get news, we interact, we bank… the number of things we do via a web browser far exceeds what we do in local applications. Because of that, we need to be cognizant of how we work with web browsers, and do so with a nod to security. Why? Because there will always be nefarious sites and people, attempting to steal information. Considering the sensitive nature of the information we send through our web browsers, it should be obvious why security is of utmost importance.

So, what is a user to do? In this article, I’ll offer a few basic tips, for users of all sorts, to help decrease the chances that your data will end up in the hands of the wrong people. I will be demonstrating on the Firefox web browser, but many of these tips cross the application threshold and can be applied to any flavor of web browser.

### 1. Choose Your Browser Wisely

Although most of these tips apply to most browsers, it is imperative that you select your web browser wisely. One of the more important aspects of browser security is the frequency of updates. New issues are discovered quite frequently and you need to have a web browser that is as up to date as possible. Of major browsers, here is how they rank with updates released in 2017:

  1. Chrome released 8 updates (with Chromium following up with numerous security patches throughout the year).

  2. Firefox released 7 updates.

  3. Edge released 2 updates.

  4. Safari released 1 update (although Apple does release 5-6 security patches yearly).




But even if your browser of choice releases an update every month, if you (as a user) don’t upgrade, that update does you no good. This can be problematic with certain Linux distributions. Although many of the more popular flavors of Linux do a good job of keeping web browsers up to date, others do not. So, it’s crucial that you manually keep on top of browser updates. This might mean your distribution of choice doesn’t include the latest version of your web browser of choice in its standard repository. If that’s the case, you can always manually download the latest version of the browser from the developer’s download page and install from there.

If you like to live on the edge, you can always use a beta or daily build version of your browser. Do note, that using a daily build or beta version does come with it the possibility of unstable software. Say, however, you’re okay with using a daily build of Firefox on a Ubuntu-based distribution. To do that, add the necessary repository with the command:

```
sudo apt-add-repository ppa:ubuntu-mozilla-daily/ppa
```

Update apt and install the daily Firefox with the commands:

```
sudo apt-get update
sudo apt-get install firefox
```

What’s most important here is to never allow your browser to get far out of date. You want to have the most updated version possible on your desktop. Period. If you fail this one thing, you could be using a browser that is vulnerable to numerous issues.

### 2. Use A Private Window

Now that you have your browser updated, how do you best make use of it? If you happen to be of the really concerned type, you should consider always using a private window. Why? Private browser windows don’t retain your data: No passwords, no cookies, no cache, no history… nothing. The one caveat to browsing through a private window is that (as you probably expect), every time you go back to a web site, or use a service, you’ll have to re-type any credentials to log in. If you’re serious about browser security, never saving credentials should be your default behavior.

This leads me to a reminder that everyone needs: Make your passwords strong! In fact, at this point in the game, everyone should be using a password manager to store very strong passwords. My password manager of choice is [Universal Password Manager][1].

### 3\. Protect Your Passwords

For some, having to retype those passwords every single time might be too much. So what do you do if you want to protect those passwords, while not having to type them constantly? If you use Firefox, there’s a built-in tool, called Master Password. With this enabled, none of your browser’s saved passwords are accessible, until you correctly type the master password. To set this up, do the following:

  1. Open Firefox.

  2. Click the menu button.

  3. Click Preferences.

  4. In the Preferences window, click Privacy & Security.

  5. In the resulting window, click the checkbox for Use a master password (Figure 1).

  6. When prompted, type and verify your new master password (Figure 2).

  7. Close and reopen Firefox.




![Master Password][3]

Figure 1: The Master Password option in Firefox Preferences.

[Used with permission][4]

![Setting password][6]

Figure 2: Setting the Master Password in Firefox.

[Used with permission][4]

### 4\. Know your Extensions

There are plenty of privacy-focused extensions available for most browsers. What extensions you use will depend upon what you want to focus on. For myself, I choose the following extensions for Firefox:

  * [Firefox Multi-Account Containers][7] \- Allows you to configure certain sites to open in a containerized tab.

  * [Facebook Container][8] \- Always opens Facebook in a containerized tab (Firefox Multi-Account Containers is required for this).

  * [Avast Online Security][9] \- Identifies and blocks known phishing sites and displays a website’s security rating (curated by the Avast community of over 400 million users).

  * [Mining Blocker][10] \- Blocks all CPU-Crypto Miners before they are loaded.

  * [PassFF][11] \- Integrates with pass (A UNIX password manager) to store credentials safely.

  * [Privacy Badger][12] \- Automatically learns to block trackers.

  * [uBlock Origin][13] \- Blocks trackers based on known lists.


Of course, you’ll find plenty more security-focused extensions for:



+ [Firefox][2]

+ [Chrome, Chromium, & Vivaldi][5]

+ [Opera][14]


Not every web browser offers extensions. Some, such as Midoria, offer a limited about of built-in plugins, that can be enabled/disabled (Figure 3). However, you won’t find third-party plugins available for the majority of these lightweight browsers.

![Midori Browser][15]

Figure 3: The Midori Browser plugins window.

[Used with permission][4]

### 5\. Virtualize

For those that are concerned about releasing locally stored data to prying eyes, one option would be to only use a browser on a virtual machine. To do this, install the likes of [VirtualBox][16], install a Linux guest, and then run whatever browser you like in the virtual environment. If you then apply the above tips, you can be sure your browsing experience will be safe.

### The Truth of the Matter

The truth is, if the machine you are working from is on a network, you’re never going to be 100% safe. However, if you use that web browser intelligently you’ll get more bang out of your security buck and be less prone to having data stolen. The silver lining with Linux is that the chances of getting malicious software installed on your machine is exponentially less than if you were using another platform. Just remember to always use the latest release of your browser, keep your operating system updated, and use caution with the sites you visit.

Learn more about Linux through the free ["Introduction to Linux" ][17] course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/11/5-easy-tips-linux-web-browser-security

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: http://upm.sourceforge.net/
[2]: https://addons.mozilla.org/en-US/firefox/search/?q=security
[3]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/browsersecurity_1.jpg?itok=gHMPKEvr (Master Password)
[4]: https://www.linux.com/licenses/category/used-permission
[5]: https://chrome.google.com/webstore/search/security
[6]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/browsersecurity_2.jpg?itok=4L7DR2Ik (Setting password)
[7]: https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/?src=search
[8]: https://addons.mozilla.org/en-US/firefox/addon/facebook-container/?src=search
[9]: https://addons.mozilla.org/en-US/firefox/addon/avast-online-security/?src=search
[10]: https://addons.mozilla.org/en-US/firefox/addon/miningblocker/?src=search
[11]: https://addons.mozilla.org/en-US/firefox/addon/passff/?src=search
[12]: https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17/
[13]: https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/?src=search
[14]: https://addons.opera.com/en/search/?query=security
[15]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/browsersecurity_3.jpg?itok=hdNor0gw (Midori Browser)
[16]: https://www.virtualbox.org/
[17]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
