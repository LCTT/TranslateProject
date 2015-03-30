How to secure SSH login with one-time passwords on Linux
================================================================================
As someone says, security is a not a product, but a process. While SSH protocol itself is cryptographically secure by design, someone can wreak havoc on your SSH service if it is not administered properly, be it weak passwords, compromised keys or outdated SSH client.

As far as SSH authentication is concerned, [public key authentication][1] is in general considered more secure than password authentication. However, key authentication is actually not desirable or even less secure if you are logging in from a public or shared computer, where things like stealth keylogger or memory scraper can always a possibility. If you cannot trust the local computer, it is better to use something else. This is when "one-time passwords" come in handy. As the name implies, each one-time password is for single-use only. Such disposable passwords can be safely used in untrusted environments as they cannot be re-used even when they are stolen.

One way to generate disposable passwords is [Google Authenticator][2]. In this tutorial, I am going to demonstrate another way to create one-time passwords for SSH login: [OTPW][3], a one-time password login package. Unlike Google Authenticator, you do not rely on any third party for one-time password generation and verification.

### What is OTPW? ###

OTPW consists of one-time password generator and PAM-integrated verification routines. In OTPW, one-time passwords are generated apriori with the generator, and carried by a user securely (e.g., printed in a paper sheet). Cryptographic hash of the generated passwords are then stored in the SSH server host. When a user logs in with a one-time password, OTPW's PAM module verifies the password, and invalidates it to prevent re-use.

### Step One: Install and Configure OTPW on Linux ###

#### Debian, Ubuntu or Linux Mint ####

Install OTPW packages with apt-get.

    $ sudo apt-get install libpam-otpw otpw-bin

Open a PAM configuration file for SSH (/etc/pam.d/sshd) with a text editor, and comment out the following line (to disable password authentication).

    #@include common-auth

and add the following two lines (to enable one-time password authentication):

    auth       required     pam_otpw.so
    session    optional     pam_otpw.so

![](https://farm8.staticflickr.com/7599/16775121360_d1f93feefa_b.jpg)

#### Fedora or CentOS/RHEL ####

OTPW is not available as a prebuilt package on Red Hat based systems. So let's install OTPW by building it from the source.

First, install prerequites:

    $ sudo yum git gcc pam-devel
    $ git clone https://www.cl.cam.ac.uk/~mgk25/git/otpw
    $ cd otpw

Open Makefile with a text editor, and edit a line that starts with "PAMLIB=" as follows.

On 64-bit system:

    PAMLIB=/usr/lib64/security

On 32-bit system:

    PAMLIB=/usr/lib/security

Compile and install it. Note that installation will automatically restart an SSH server. So be ready to be disconnected if you are on an SSH connection.

    $ make
    $ sudo make install

Now you need to update SELinux policy since /usr/sbin/sshd tries to write to user's home directory, which is not allowed by default SELinux policy. The following commands will do. If you are not using SELinux, skip this step.

    $ sudo grep sshd /var/log/audit/audit.log | audit2allow -M mypol
    $ sudo semodule -i mypol.pp

Next, open a PAM configuration file for SSH (/etc/pam.d/sshd) with a text editor, and comment out the following line (to disable password authentication).

    #auth       substack     password-auth

and add the following two lines (to enable one-time password authentication):

    auth       required     pam_otpw.so
    session    optional     pam_otpw.so

#### Step Two: Configure SSH Server for One-time Passwords ####

The next step is to configure an SSH server to accept one-time passwords.

Open /etc/ssh/sshd_config with a text editor, and set the following three parameters. Make sure that you do not add these lines more than once, because that will cause an SSH server to fail.

    UsePrivilegeSeparation yes
    ChallengeResponseAuthentication yes
    UsePAM yes

You also need to disable default password authentication. Optionally, enable public key authentication, so that you can fall back to key-based authentication in case you do not have one-time passwords.

    PubkeyAuthentication yes
    PasswordAuthentication no

Now restart SSH server.

Debian, Ubuntu or Linux Mint:

    $ sudo service ssh restart

Fedora or CentOS/RHEL 7:

    $ sudo systemctl restart sshd

#### Step Three: Generate One-time Passwords with OTPW ####

As mentioned earlier, you need to create one-time passwords beforehand, and have them stored on the remote SSH server host. For this, run otpw-gen tool as the user you will be logging in as.

    $ cd ~
    $ otpw-gen > temporary_password.txt

![](https://farm9.staticflickr.com/8751/16961258882_c49cfe03fb_b.jpg)

It will ask you to set a prefix password. When you later log in, you need to type this prefix password AND one-time password. Essentially the prefix password is another layer of protection. Even if the password sheet falls into the wrong hands, the prefix password forces them to brute-force.

Once the prefix password is set, the command will generate 280 one-time passwords, and store them in the output text file (e.g., temporary_password.txt). Each password (length of 8 characters by default) is preceded by a three-digit index number. You are supposed to print the file in a sheet and carry it with you.

![](https://farm8.staticflickr.com/7281/16962594055_c2696d5ae1_b.jpg)

You will also see ~/.otpw file created, where cryptographic hashs of these passwords are stored. The first three digits in each line indicate the index number of the password that will be used for SSH login.

    $ more ~/.otpw

----------

    OTPW1
    280 3 12 8
    191ai+:ENwmMqwn
    218tYRZc%PIY27a
    241ve8ns%NsHFmf
    055W4/YCauQJkr:
    102ZnJ4VWLFrk5N
    2273Xww55hteJ8Y
    1509d4b5=A64jBT
    168FWBXY%ztm9j%
    000rWUSdBYr%8UE
    037NvyryzcI+YRX
    122rEwA3GXvOk=z

### Test One-time Passwords for SSH Login ###

Now let's login to an SSH server in a usual way:

    $ ssh user@remote_host

If OTPW is successfully set up, you will see a slightly different password prompt:

    Password 191:

Now open up your password sheet, and look for index number "191" in the sheet.

    023 kBvp tq/G  079 jKEw /HRM  135 oW/c /UeB  191 fOO+ PeiD  247 vAnZ EgUt

According to sheet above, the one-time password for number "191" is "fOO+PeiD". You need to prepend your prefix password to it. For example, if your prefix password is "000", the actual one-time password you need to type is "000fOO+PeiD".

Once you successfully log in, the password used is automatically invalidated. If you check ~/.otpw, you will notice that the first line is replaced with "---------------", meaning that password "191" has been voided.

    OTPW1
    280 3 12 8
    ---------------
    218tYRZc%PIY27a
    241ve8ns%NsHFmf
    055W4/YCauQJkr:
    102ZnJ4VWLFrk5N
    2273Xww55hteJ8Y
    1509d4b5=A64jBT
    168FWBXY%ztm9j%
    000rWUSdBYr%8UE
    037NvyryzcI+YRX
    122rEwA3GXvOk=z

### Conclusion ###

In this tutorial, I demonstrated how to set up one-time password login for SSH using OTPW package. You may realized that a print sheet can be considered a less fancy version of security token in two-factor authentication. Yet, it is simpler and you do not rely on any third-party for its implementation. Whatever mechanism you are using to create disposable passwords, they can be helpful when you need to log in to an SSH server from an untrusted public computer. Feel free to share your experience or opinion on this topic.

--------------------------------------------------------------------------------

via: http://xmodulo.com/secure-ssh-login-one-time-passwords-linux.html

作者：[Dan Nanni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-force-ssh-login-via-public-key-authentication.html
[2]:http://xmodulo.com/two-factor-authentication-ssh-login-linux.html
[3]:http://www.cl.cam.ac.uk/~mgk25/otpw.html