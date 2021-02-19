[#]: collector: (lujun9972)
[#]: translator: (scvoet)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Add Fingerprint Login in Ubuntu and Other Linux Distributions)
[#]: via: (https://itsfoss.com/fingerprint-login-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Add Fingerprint Login in Ubuntu and Other Linux Distributions
======

Many high-end laptops come with fingerprint readers these days. Windows and macOS have been supporting fingerprint login for some time. In desktop Linux, the support for fingerprint login was more of geeky tweaks but [GNOME][1] and [KDE][2] have started supporting it through system settings.

This means that on newer Linux distribution versions, you can easily use fingerprint reading. I am going to enable fingerprint login in Ubuntu here but you may use the steps on other distributions running GNOME 3.38.

Prerequisite

This is obvious, of course. Your computer must have a fingerprint reader.

This method works for any Linux distribution running GNOME version 3.38 or higher. If you are not certain, you may [check which desktop environment version you are using][3].

KDE 5.21 also has a fingerprint manager. The screenshots will look different, of course.

### Adding fingerprint login in Ubuntu and other Linux distributions

Go to **Settings** and the click on **Users** from left sidebar. You should see all the user account on your system here. You’ll see several option including **Fingerprint Login**.

Click on the Fingerprint Login option here.

![Enable fingerprint login in Ubuntu][4]

It will immediately ask you to scan a new fingerprint. When you click the + sign to add a fingerprint, it presents a few predefined options so that you can easily identify which finger or thumb it is.

You may of course scan left thumb by clicking right index finger though I don’t see a good reason why you would want to do that.

![Adding fingerprint][5]

While adding the fingerprint, rotate your finger or thumb as directed.

![Rotate your finger][6]

Once the system registers the entire finger, it will give you a green signal that the fingerprint has been added.

![Fingerprint successfully added][7]

If you want to test it right away, lock the screen by pressing Super+L keyboard shortcut in Ubuntu and then using the fingerprint for login.

![Login With Fingerprint in Ubuntu][8]

#### Experience with fingerprint login on Ubuntu

Fingerprint login is what its name suggests: login using your fingerprint. That’s it. You cannot use your finger when it asks for authentication for programs that need sudo access. It’s not a replacement of your password.

One more thing. The fingerprint login allows you to log in but you cannot use your finger when your system asks for sudo password. The [keyring in Ubuntu][9] also remains locked.

Another annoying thing is because of GNOME’s GDM login screen. When you login, you have to click on your account first to get to the password screen. This is where you can use your finger. It would have been nicer to not bothered about clicking the user account ID first.

I also notice that fingerprint reading is not as smooth and quick as it is in Windows. It works, though.

If you are somewhat disappointed with the fingerprint login on Linux, you may disable it. Let me show you the steps in the next section.

### Disable fingerprint login

Disabling fingerprint login is pretty much the same as enabling it in the first place.

Go to **Settings→User** and then click on Fingerprint Login option. It will show a screen with options to add more fingerprints or delete the existing ones. You need to delete the existing fingerprints.

![Disable Fingerprint Login][10]

Fingerprint login does have some benefits, specially for lazy people like me. I don’t have to type my password every time I lock the screen and I am happy with the limited usage.

Enabling sudo with fingerprint should not be entirely impossible with [PAM][11]. I remember that when I [set up face unlock in Ubuntu][12], it could be used with sudo as well. Let’s see if future versions add this feature.

Do you have a laptop with fingerprint reader? Do you use it often or is it just one of things you don’t care about?

--------------------------------------------------------------------------------

via: https://itsfoss.com/fingerprint-login-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.gnome.org/
[2]: https://kde.org/
[3]: https://itsfoss.com/find-desktop-environment/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/enable-fingerprint-ubuntu.png?resize=800%2C607&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/adding-fingerprint-login-ubuntu.png?resize=800%2C496&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/adding-fingerprint-ubuntu-linux.png?resize=800%2C603&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/fingerprint-added-ubuntu.png?resize=797%2C510&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/login-with-fingerprint-ubuntu.jpg?resize=800%2C320&ssl=1
[9]: https://itsfoss.com/ubuntu-keyring/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/disable-fingerprint-login.png?resize=798%2C524&ssl=1
[11]: https://tldp.org/HOWTO/User-Authentication-HOWTO/x115.html
[12]: https://itsfoss.com/face-unlock-ubuntu/
