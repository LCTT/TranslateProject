Translating by XLCYun.
A Week With GNOME As My Linux Desktop: What They Get Right & Wrong - Page 2 - The GNOME Desktop
================================================================================
### The Desktop ###

![](http://www.phoronix.net/image.php?id=gnome-week-editorial&image=gnome_week_gdm_show&w=1920)

I spent the first five days of my week logging into Gnome manually-- not turning on automatic login. On night of the fifth day I got annoyed with having to login by hand and so I went into the User Manager and turned on automatic login. The next time I logged in I got a prompt: "Your keychain was not unlocked. Please enter your password to unlock your keychain." That was when I realized something... Gnome had been automatically unlocking my keychain—my wallet in KDE speak-- every time I logged in via GDM. It was only when I bypassed GDM's login that Gnome had to step in and make me do it manually.

Now, I am under the personal belief that if you enable automatic login then your key chain should be unlocked automatically as well-- otherwise what's the point? Either way you still have to type in your password and at least if you hit the GDM Login screen you have a chance to change your session if you want to.

But, regardless of that, it was at that moment that I realized it was such a simple thing that made the desktop feel so much more like it was working WITH ME. When I log into KDE via SDDM? Before the splash screen is even finished loading there is a window popping up over top the splash animation-- thereby disrupting the splash screen-- prompting me to unlock my KDE wallet or GPG keyring.

If a wallet doesn't exist already you get prompted to create a wallet-- why couldn't one have been created for me at user creation?-- and then get asked to pick between two encryption methods, where one is even implied as insecure (Blowfish), why are you letting me pick something that's insecure for my security? Author's Note: If you install the actual KDE spin and don't just install KDE after-the-fact then a wallet is created for you at user creation. Unfortunately it's not unlocked for you automatically, and it seems to use the older Blowfish method rather than the new, and more secure, GPG method.

![](http://www.phoronix.net/image.php?id=gnome-week-editorial&image=gnome_week_kgpg_show&w=1920)

If you DO pick the secure one (GPG) then it tries to load an Gpg key... which I hope you had one created already because if you don't you get yelled at. How do you create one? Well, it doesn't offer to make one for you... nor It doesn't tell you... and if you do manage TO figure out that you are supposed to use KGpg to create the key then you get taken through several menus and prompts that are nothing but confusing to new users. Why are you asking me where the GPG binary is located? How on earth am I supposed to know? Can't you just use the most recent one if there's more than one? And if there IS only one then, I ask again, why are you prompting me?

Why are you asking me what key size and encryption algorithm to use? You select 2048 and RSA/RSA by default, so why not just use those? If you want to have those options available then throw them under the "Expert mode" button that is right there. This isn't just about having configuration options available, its about needless things that get thrown in the user's face by default. This is going to be a theme for the rest of the article... KDE needs better sane defaults. Configuration is great, I love the configuration I get with KDE, but it needs to learn when to and when not to prompt. It also needs to learn that "Well its configurable" is no excuse for bad defaults. Defaults are what users see initially, bad defaults will lose users.

Let's move on from the key chain issue though, because I think I made my point. 

--------------------------------------------------------------------------------

via: http://www.phoronix.com/scan.php?page=article&item=gnome-week-editorial&num=2

作者：Eric Griffith
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出
