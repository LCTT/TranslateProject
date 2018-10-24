Improve login security with challenge-response authentication
======

![](https://fedoramagazine.org/wp-content/uploads/2018/10/challenge-response-816x345.png)

### Introduction

Today, Fedora offers multiple ways to improve the secure authentication of our user accounts. Of course it has the familiar user name and password to login. It also offers additional authentication options such as biometric, fingerprint, smart card, one-time password, and even challenge-response authentication.

Each authentication method has clear pros and cons. That, in itself, could be a topic for a rather lengthy article. Fedora Magazine has covered a few of these options previously:


+ [Using the YubiKey4 with Fedora][1]
+ [Fedora 28: Better smart card support in OpenSSH][2]


One of the most secure methods in modern Fedora releases is offline hardware challenge-response. It’s also one of the easiest to deploy. Here’s how.

### Challenge-response authentication

Technically, when you provide a password, you’re responding to a user name challenge. The offline challenge response covered here requires your user name first. Next, Fedora challenges you to provide an encrypted physical hardware token. The token responds to the challenge with another encrypted key it stores via the Pluggable Authentication Modules (PAM) framework. Finally, Fedora prompts you for the password. This prevents someone from just using a found hardware token, or just using a user name and password without the correct encrypted key.

This means that in addition to your user name and password, you must have previously registered one or more encrypted hardware tokens with the OS. And you have to provide that physical hardware token to be able to authenticate with your user name.

Some challenge-response methods, like one time passwords (OTP), take an encrypted code key on the hardware token, and pass that key across the network to a remote authentication server. The server then tells Fedora’s PAM framework if it’s is a valid token for that user name. This is great if the authentication server(s) are on the local network. The downside is if the network connection is down or you’re working remote without a network connection, you can’t use this remote authentication method. You could be locked out of the system until you can connect through the network to the server.

Sometimes a workplace requires use of Yubikey One Time Passwords (OTP) configuration. However, on home or personal systems you may prefer a local challenge-response configuration. Everything is local, and the method requires no remote network calls. The following process works on Fedora 27, 28, and 29.

### Preparation

#### Hardware token keys

First you need a secure hardware token key. Specifically, this process requires a Yubikey 4, Yubikey NEO, or a recently released Yubikey 5 series device which also supports FIDO2. You should purchase two of them to provide a backup in case one becomes lost or damaged. You can use these keys on numerous workstations. The simpler FIDO or FIDO U2F only versions don’t work for this process, but are great for online services that use FIDO.

#### Backup, backup, and backup

Next, make a backup of all your important data. You may want to test the configuration in a Fedora 27/28/29 cloned VM to make sure you understand the process before setting up your personal workstation.

#### Updating and installing

Now make sure Fedora is up to date. Then install the required Fedora Yubikey packages via these dnf commands:

```
$ sudo dnf upgrade
$ sudo dnf install ykclient* ykpers* pam_yubico*
$ cd
```

If you’re in a VM environment, such as Virtual Box, make sure the Yubikey device is inserted in a USB port, and enable USB access to the Yubikey in the VM control.

### Configuring Yubikey

Verify that your user account has access to the USB Yubikey:

```
$ ykinfo -v
version: 3.5.0
```

If the YubiKey is not detected, the following error message appears:

```
Yubikey core error: no yubikey present
```

Next, initialize each of your new Yubikeys with the following ykpersonalize command. This sets up the Yubikey configuration slot 2 with a Challenge Response using the HMAC-SHA1 algorithm, even with less than 64 characters. If you have already setup your Yubikeys for challenge-response, you don’t need to run ykpersonalize again.

```
ykpersonalize -2 -ochal-resp -ochal-hmac -ohmac-lt64 -oserial-api-visible
```

Some users leave the YubiKey in their workstation while using it, and even use challenge-response for virtual machines. However, for more security you may prefer to manually trigger the Yubikey to respond to challenge.

To add that manual challenge button trigger, add the -ochal-btn-trig flag. This flag causes the Yubikey to flash the yubikey LED on a request. It waits for you to press the button on the hardware key area within 15 seconds to produce the response key.

```
$ ykpersonalize -2 -ochal-resp -ochal-hmac -ohmac-lt64 -ochal-btn-trig -oserial-api-visible
```

Do this for each of your new hardware keys, only once per key. Once you have programmed your keys, store the Yubikey configuration to ~/.yubico with the following command:

```
$ ykpamcfg -2 -v
debug: util.c:222 (check_firmware_version): YubiKey Firmware version: 4.3.4

Sending 63 bytes HMAC challenge to slot 2
Sending 63 bytes HMAC challenge to slot 2
Stored initial challenge and expected response in '/home/chuckfinley/.yubico/challenge-9992567'.
```

If you are setting up multiple keys for backup purposes, configure all the keys the same, and store each key’s challenge-response using the ykpamcfg utility. If you run the command ykpersonalize on an existing registered key, you must store the configuration again.

### Configuring /etc/pam.d/sudo

Now to verify this configuration worked, **in the same terminal window** you’ll setup sudo to require the use of the Yubikey challenge-response. Insert the following line into the /etc/pam.d/sudo file:

```
auth required pam_yubico.so mode=challenge-response
```

Insert the above auth line into the file above the auth include system-auth line. Then save the file and exit the editor. In a default Fedora 29 setup, /etc/pam.d/sudo should now look like this:

```
#%PAM-1.0
auth required pam_yubico.so mode=challenge-response
auth include system-auth
account include system-auth
password include system-auth
session optional pam_keyinit.so revoke
session required pam_limits.so
session include system-auth
```

**Keep this original terminal window open** , and test by opening another new terminal window. In the new terminal window type:

```
$ sudo echo testing
```

You should notice the LED blinking on the key. Tap the Yubikey button and you should see a prompt for your sudo password. After you enter your password, you should see “testing” echoed in the terminal screen.

Now test to ensure a correct failure. Start another terminal window and remove the Yubikey from the USB port. Verify that sudo no longer works without the Yubikey with this command:

```
$ sudo echo testing fail
```

You should immediately be prompted for the sudo password. Even if you enter the password, it should fail.

### Configuring Gnome Desktop Manager

Once your testing is complete, now you can add challenge-response support for the graphical login. Re-insert your Yubikey into the USB port. Next you’ll add the following line to the /etc/pam.d/gdm-password file:

```
auth required pam_yubico.so mode=challenge-response
```

Open a terminal window, and issue the following command. You can use another editor if desired:

```
$ sudo vi /etc/pam.d/gdm-password
```

You should see the yubikey LED blinking. Press the yubikey button, then enter the password at the prompt.

Modify the /etc/pam.d/gdm-password file to add the new auth line above the existing line auth substack password-auth. The top of the file should now look like this:

```
auth [success=done ignore=ignore default=bad] pam_selinux_permit.so
auth required pam_yubico.so mode=challenge-response
auth substack password-auth
auth optional pam_gnome_keyring.so
auth include postlogin

account required pam_nologin.so
```

Save the changes and exit the editor. If you use vi, the key sequence is to hit the **Esc** key, then type wq! at the prompt to save and exit.

### Conclusion

Now log out of GNOME. With the Yubikey inserted into the USB port, click on your user name in the graphical login. The Yubikey LED begins to flash. Touch the button, and you will be prompted for your password.

If you lose the Yubikey, you can still use the secondary backup Yubikey in addition to your set password. You can also add additional Yubikey configurations to your user account.

If someone gains access to your password, they still can’t login without your physical hardware Yubikey. Congratulations! You’ve now dramatically increased the security of your workstation login.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/login-challenge-response-authentication/

作者：[nabooengineer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/nabooengineer/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/using-the-yubikey4-with-fedora/
[2]: https://fedoramagazine.org/fedora-28-better-smart-card-support-openssh/

