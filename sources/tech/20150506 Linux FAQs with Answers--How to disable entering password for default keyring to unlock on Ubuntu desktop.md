Linux FAQs with Answers--How to disable entering password for default keyring to unlock on Ubuntu desktop
================================================================================
> **Question**: When I boot up my Ubuntu desktop, a pop up dialog appears, asking me to enter a password to unlock default keyring. How can I disable this "unlock default keyring" pop up window, and automatically unlock my keyring? 

A keyring is thought of as a local database that stores your login information in encrypted forms. Various desktop applications (e.g., browsers, email clients) use a keyring to store and manage your login credentials, secrets, passwords, certificates, or keys securely. For those applications to retrieve the information stored in a keyring, the keyring needs to be unlocked.

GNOME keyring used by Ubuntu desktop is integrated with desktop login, and the keyring is automatically unlocked when you authenticate into your desktop. But your default keyring can remain "locked" if you set up automatic desktop login or wake up from hibernation. In this case, you will be prompted:

> "Enter password for keyring 'Default keyring' to unlock. An application wants to access to the keyring 'Default keyring,' but it is locked."

![](https://farm9.staticflickr.com/8787/16716456754_309c39513c_o.png)

If you want to avoid typing a password to unlock your default keyring every time such a pop-up dialog appears, here is how you can do it.

Before doing that, understand the implication of disabling the password prompt. By automatically unlocking the default keyring, you will make your keyring (and any information stored in the keyring) accessible to anyone who uses your desktop, without them having to know your password.

### Disable Password for Unlocking Default Keyring ###

Open up Dash, and type "password" to launch "Passwords and Keys" app.

![](https://farm8.staticflickr.com/7709/17312949416_ed9c4fbe2d_b.jpg)

Alternatively, use the seahorse command to launch the GUI from the command line.

    $ seahorse 

On the left side panel, right-click on the "Default keyring," and choose "Change Password."

![](https://farm8.staticflickr.com/7740/17159959750_ba5b675b00_b.jpg)

Type your current login password.

![](https://farm8.staticflickr.com/7775/17347551135_ce09260818_b.jpg)

Leave a new password for the "Default" keyring as blank.

![](https://farm8.staticflickr.com/7669/17345663222_c9334c738b_c.jpg)

Click on "Continue" button to confirm to store passwords unencrypted.

![](https://farm8.staticflickr.com/7761/17152692309_ce3891a0d9_c.jpg)

That's it. From now on, you won't be prompted to unlock the default keyring.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/disable-entering-password-unlock-default-keyring.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni