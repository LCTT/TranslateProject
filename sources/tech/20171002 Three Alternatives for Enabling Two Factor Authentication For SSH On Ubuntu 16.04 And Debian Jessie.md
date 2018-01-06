Three Alternatives for Enabling Two Factor Authentication For SSH On Ubuntu 16.04 And Debian Jessie
======
Security is now more important than ever and securing your SSH server is one of the most important things that you can do as a systems administrator. Traditionally this has meant disabling password authentication and instead using SSH keys. Whilst this is absolutely the first thing you should do that doesn't mean that SSH can't be made even more secure.

Two-factor authentication simply means that two means of identification are required to log in. These could be a password and an SSH key, or a key and a 3rd party service like Google. It means that the compromise of a single authentication method does not compromise the server.

The following guides are three ways to enable two-factor authentication for SSH.

Whenever you are modifying the configuration of SSH always ensure that you have a second terminal open to the server. The second terminal means that you will be able to fix any mistakes you make with the SSH configuration. Open terminals will stay open even through SSH restarts.

### SSH Key and Password

SSH supports the ability to require more than a single authentication method for logins.

The authentication methods are set with the `AuthenticationMethods` option in the SSH server's configuration file at `/etc/ssh/sshd_config`.

When the following line is added into `/etc/ssh/sshd_config` SSH requires an SSH key to be submitted and then a password is prompted for:
```
AuthenticationMethods "publickey,password"

```

If you want to set these methods on a per use basis then use the following additional configuration:
```
Match User jsmith
 AuthenticationMethods "publickey,password"

```

When you have edited and saved the new `sshd_config` file you should check that you did not make any errors by running this command:
```
sshd -t

```

Any syntax or other errors that would stop SSH from starting will be flagged here. When `ssh -t` runs without error use `systemctl` to restart SSH"
```
systemctl restart sshd

```

Now you can log in with a new terminal to check that you are prompted for a password and your SSH key is required. If you use `ssh -v` e.g.:
```
ssh -v jsmith@example.com

```

you will be able to see every step of the login.

Note, if you do set `password` as a required authentication method then you will need to ensure that `PasswordAuthentication` option is set to `yes`.

### SSH With Google Authenticator

Google's two-factor authentication system that is used on Google's own products can be integrated into your SSH server. This makes this method very convenient if you already have use the Google Authenticator app.

Although the `libpam-google-authenticator` is written by Google it is [open source][1]. Also, the Google Authenticator app is written by Google but does not require a Google account to work. Thanks to [Sitaram Chamarty][2] for the heads up on that.

If you don't already have the Google Authenticator app installed and configured on your phone please see the instructions [here][3].

First, we need to install the Google Authenticator package on the server. The following commands will update your system and install the needed packages:
```
apt-get update
apt-get upgrade
apt-get install libpam-google-authenticator

```

Now, we need to register the server with the Google Authenticator app on your phone. This is done by first running the program we just installed:
```
google-authenticator

```

You will be asked a few questions when you run this. You should answer in the way that suits your setup, however, the most secure options are to answer `y` to every question. If you need to change these later you can simply re-run `google-authenticator` and select different options.

When you run `google-authenticator` a QR code will be printed to the terminal and some codes that look like:
```
Your new secret key is: VMFY27TYDFRDNKFY
Your verification code is 259652
Your emergency scratch codes are:
 96915246
 70222983
 31822707
 25181286
 28919992

```

You should record all of these codes to a secure location like a password manager. The scratch codes are single use codes that will always allow you access even if your phone is unavailable.

All you need to do to register your server with the Authenticator app is to open the app and hit the red plus symbol on the bottom right. Then select the **Scan a barcode** option and scan the QR code that was printed to the terminal. Your server and the app are now linked.

Back on the server, we now need to edit the PAM (Pluggable Authentication Module) for SSH so that it uses the authenticator package we just installed. PAM is the standalone system that takes care of most authentication on a Linux server.

The PAM file for SSH that needs modifying is located at `/etc/pam.d/sshd` and edited with the following command:
```
nano /etc/pam.d/sshd

```

Add the following line to the top of the file:
```
auth required pam_google_authenticator.so

```

In addition, we also need to comment out a line so that PAM will not prompt for a password. Change this line:
```
# Standard Un*x authentication.
@include common-auth

```

To this:
```
# Standard Un*x authentication.
# @include common-auth

```

Next, we need to edit the SSH server configuration file:
```
nano /etc/ssh/sshd_config

```

And change this line:
```
ChallengeResponseAuthentication no

```

To:
```
ChallengeResponseAuthentication yes

```

Next, add the following line to enable two authentication schemes; SSH keys and Google Authenticator (keyboard-interactive):
```
AuthenticationMethods "publickey,keyboard-interactive"

```

Before we reload the SSH server it is a good idea to check that we did not make any errors in the configuration. This is done with the following command:
```
sshd -t

```

If this does not flag any errors, reload SSH with the new configuration:
```
systemctl reload sshd.service

```

Everything should now be working. Now, when you log into to your server you will need to use your SSH keys and when you are prompted for the:
```
Verification code:

```

open the Authenticator app and enter the 6 digit code that is displaying for your server.

### Authy

[Authy][4] is a two-factor authentication service that, like Google, offers time-based codes. However, Authy does not require a phone as they provide desktop and tables clients. They also enable offline authentication and do not require a Google account.

You will need to install the Authy app from your app store, or the desktop client all of which are linked to from the Authy [download page][5].

After you have installed the app you will need an API key that will be used on the server. This process requires a few steps:

  1. Sign up for an account [here][6].
  2. Scroll down to the **Authy** section.
  3. Enable 2FA on the account.
  4. Return to the **Authy** section.
  5. Create a new Application for your server.
  6. Obtain the API key from the top of the `General Settings` page for the new Application. You need to click the eye symbol next to the `PRODUCTION API KEY` line to reveal the key. Shown here:



![][7]

Take a note of the API key somewhere secure.

Now, go back to your server and run the following commands as root:
```
curl -O 'https://raw.githubusercontent.com/authy/authy-ssh/master/authy-ssh'
bash authy-ssh install /usr/local/bin

```

Enter the API key when prompted. If you input it incorrectly you can always edit `/usr/local/bin/authy-ssh.conf` and add it again.

Authy is now installed. However, it will not start working until it is enabled for a user. The command to enable Authy has the form:
```
/usr/local/bin/authy-ssh enable <system-user> <your-email> <your-phone-country-code> <your-phone-number>

```

With some example details for **root** logins:
```
/usr/local/bin/authy-ssh enable root john@example.com 44 20822536476

```

If everything was successful you will see:
```
User was registered

```

You can test Authy now by running the command:
```
authy-ssh test

```

Finally, reload SSH to implement the new configuration:
```
systemctl reload sshd.service

```

Authy is now working and will be required for SSH logins.

Now, when you log in you will see the following prompt:
```
Authy Token (type 'sms' to request a SMS token):

```

You can either enter the code from the Authy app on your phone or desktop client. Or you can type `sms` and Authy will send you an SMS message with a login code.

Authy is uninstalled by running the following:
```
/usr/local/bin/authy-ssh uninstall

```

--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/ssh-2fa/

作者：[Elliot Cooper][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net
[1]:https://github.com/google/google-authenticator-libpam
[2]:https://plus.google.com/115609618223925128756
[3]:https://support.google.com/accounts/answer/1066447?hl=en
[4]:https://authy.com/
[5]:https://authy.com/download/
[6]:https://www.authy.com/signup
[7]:/images/guides/2FA/twilio-authy-api.png
