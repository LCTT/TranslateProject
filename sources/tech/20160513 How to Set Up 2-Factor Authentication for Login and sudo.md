ictlyh Translating
How to Set Up 2-Factor Authentication for Login and sudo
==========================================================

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/auth_crop.png?itok=z_cdYZZf)
>[Used with permission][1]

Security is all the rage—as it should be. We live in a world where data is an incredibly valuable currency, and you’re always at risk of loss. Because of this, you must do everything you can to ensure what you hold on your desktops and servers is safe. To that end, administrators and users will create incredibly complex passwords, employ password managers, and more. But, what if I told you could take the login to your Linux servers and desktops one step—nay, two steps—further? Thanks to the [Google Authenticator][2], you can. On top of that, it’s incredibly easy to set up.

I am going to walk you through the process of setting up two-factor authentication for use on login and sudo. I will demonstrate this on a Ubuntu 16.04 desktop, but the process works for the server as well. To handle the two-factor side of things, I will be making use of the Google Authenticator.

There is one very important caveat to this: Once you’ve set this up, you will not be able to log into the account (or issue sudo commands) without a six-digit code from the authenticator. This also adds another step for you, so if having to pull out your smartphone every time you need to log into your Linux machine (or use sudo), this might not be for you. Remember, however, this added step brings with it an extra layer of security you wouldn’t have otherwise.

With that said, let’s set this up.

### Installing the Necessary Components

There are two pieces of this puzzle that must be installed—both in the form of the Google Authenticator. The first is the smartphone app. Here’s how to install from the Google Play Store:

1. Open the Google Play Store on your Android device

2. Search for google authenticator

3. Locate and tap the entry by Google Inc.

4. Tap Install

5. Tap Accept

6. Allow the installation to complete

Now let’s move on to installing the authenticator on your Linux machine. Here’s how:

1. Open a terminal window

2. Issue the command sudo apt-get install google-authenticator

3. Type your sudo password and hit Enter

4. If prompted, type y and hit Enter

5. Allow the installation to complete

It’s now time to configure the login process to work with the google-authenticator.

### Configuration

Just one file must be edited to add two-step authentication for both login and sudo usage. The file is /etc/pam.d/common-auth. Open it and look for the line:

```
auth    [success=1 default=ignore]      pam_unix.so nullok_secure
```

Above that line, add the following:

```
auth required pam_google_authenticator.so
```

Save and close the file.

The next step is to set up google-authenticator for every user on the system (otherwise, they will not be able to log in). For example’s sake, we’ll assume there are two users on your system: jack and olivia. We’ll first set this up for jack (we’ll assume this is the account we’ve been working with all along).

Open up a terminal window and issue the command google-authenticator. You will be asked a series of questions (each of which you should answer with a y. The questions are:

* Do you want me to update your "/home/jlwallen/.google_authenticator" file (y/n) y

* Do you want to disallow multiple uses of the same authentication token? This restricts you to one login about every 30s, but it increases your chances to notice or even prevent man-in-the-middle attacks (y/n)

* By default, tokens are good for 30 seconds, and to compensate for possible time-skew between the client and the server, we allow an extra token before and after the current time. If you experience problems with poor time synchronization, you can increase the window from its default size of 1:30min to about 4min. Do you want to do so (y/n)

* If the computer that you are logging into isn't hardened against brute-force login attempts, you can enable rate-limiting for the authentication module. By default, this limits attackers to no more than 3 login attempts every 30s. Do you want to enable rate-limiting (y/n)

Once you’ve answered these questions, you’ll be presented with your secret key, a verification code, and five emergency scratch codes. Print out the scratch codes and keep them with you. These codes can be used if you do not have your phone (each code is a one-time use only). The secret key is what you use to set up the account on the Google Authenticator app and the verification code is a one-time use code that you can use immediately (if needed).

### Setting Up the App

You now have the user jack set up. Before you can set up the user olivia, you need to add an account for jack on the Google Authenticator app. Open the app and the, from the main window, tap the menu button (three vertical dots in the upper right hand corner). Tap Set up account and then tap Enter provided key. In the next window (Figure 1), you will enter 16-digit secret key provided when you issued the google-authenticator app. Give the account a name (so you will remember which account this is to be used on) and tap ADD.

![](https://www.linux.com/sites/lcom/files/styles/floated_images/public/auth_a.png?itok=xSMkd-Mf)
>Figure 1: Adding a new account to the Google Authenticator app.

Now that you’ve added the account, you will be presented with six-digit keys that will be requested every time you log in or attempt to use sudo.

Finally, you have to set up the other accounts on the system. As I mentioned, we’re going to set up the account called olivia. Here’s how:

1. Open up a terminal window

2. Issue the command sudo su olivia

3. Open the Google Authenticator on your smartphone

4. Type the six digit authentication code (provided by the app) in the terminal window (Figure 2) and hit Enter

5. Type your sudo password and hit Enter

6. As the new user, issue the google-authenticator command, answer the questions, and record the keys and codes provided

After you’ve successfully set up the user olivia, with the google-authenticator command, add a new account on the Google Authenticator app with that user’s info (in the same manner you did for the initial user). You should now have accounts on the Google Authenticator app for both jack and olivia.

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/auth_b.png?itok=FH36V1r0)
>Figure 2: Entering the six-digit authentication code for sudo.

That’s it. Every time you attempt to log into your machine (or use sudo), you will be required to provide a six-digit authentication key, before you can enter your user password. Your Linux machine is now far more secure than it was before adding two-factor authentication. Although some might consider this process a hassle, I highly recommend setting it up...especially for machines that house sensitive data.

--------------------------------------------------------------------------------

via: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/auth_b.png?itok=FH36V1r0

作者：[JACK WALLEN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

[a]: https://www.linux.com/users/jlwallen
[1]: https://www.linux.com/licenses/category/used-permission
[2]: https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2

