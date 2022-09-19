[#]: subject: "Fix the apt-key deprecation error in Linux"
[#]: via: "https://opensource.com/article/22/9/deprecated-linux-apt-key"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fix the apt-key deprecation error in Linux
======
Follow these steps and you can run apt update with no warnings or errors related to deprecated key configurations.

This morning, after returning home from a mini vacation, I decided to run `apt update` and `apt upgrade` from the command line just to see whether there had been any updates while I was offline. After issuing the update command, something didn't seem quite right; I was seeing messages along the lines of:

```
W: https://updates.example.com/desktop/apt/dists/xenial/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
```

True, it's just a warning, but still there's that scary word, deprecation, which usually means it's going away soon. So I thought I should take a look. Based on what I found, I thought my experience would be worth sharing.

It turns out that I have older configurations for some repositories, artifacts of installation processes from "back in the day," that needed adjustment. Taking my prompt from the warning message, I ran `man apt-key` at the command line, which provided several interesting bits of information. Near the beginning of the man page:

```
apt-key is used to manage the list of keys used by apt to authenticate packages. Packages which have been authenticated using these keys are considered trusted.
Use of apt-key is deprecated, except for the use of apt-key del in maintainer scripts to remove existing keys from the main keyring. If such usage of apt-key is desired, the additional installation of the GNU Privacy Guard suite (packaged in gnupg) is required.
apt-key(8) will last be available in Debian 11 and Ubuntu 22.04.
```

Last available in "Debian 11 and Ubuntu 22.04" is pretty much *right now* for me. Time to fix this!

### Fixing the apt-key deprecation error

Further on in the man page, there's the deprecation section mentioned in the warning from apt update:

```
DEPRECATION
Except for using apt-key del in maintainer scripts, the use of apt-key is deprecated. This section shows how to replace the existing use of apt-key.
If your existing use of apt-key add looks like this:

wget -qO- https://myrepo.example/myrepo.asc | sudo apt-key add -

Then you can directly replace this with (though note the recommendation below):

wget -qO- https://myrepo.example/myrepo.asc | sudo tee /etc/apt/trusted.gpg.d/myrepo.asc

Make sure to use the "asc" extension for ASCII armored keys and the "gpg" extension for the binary OpenPGP format (also known as "GPG key public ring"). The binary OpenPGP format works for all apt versions, while the ASCII armored format works for apt version >= 1.4.

Recommended: Instead of placing keys into the /etc/apt/trusted.gpg.d directory, you can place them anywhere on your filesystem by using the Signed-By option in your sources.list and pointing to the filename of the key. See sources.list(5) for details. Since APT 2.4, /etc/apt/keyrings is provided as the recommended location for keys not managed by packages. When using a deb822-style sources.list, and with apt version >= 2.4, the Signed-By option can also be used to include the full ASCII armored keyring directly in the sources.list without an additional file.
```

If you, like me, have keys from non-repository stuff added with `apt-key`, then here are the steps to transition:

1. Determine which keys are in `apt-key keyring /etc/apt/trusted.gpg`
2. Remove them
3. Find and install replacements in `/etc/apt/trusted.gpg.d/` or in `/etc/apt/keyrings/`

### 1. Finding old keys

The command `apt-key list` shows the keys in `/etc/apt/trusted.gpg` :

```
$ sudo apt-key list
[sudo] password: 
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
/etc/apt/trusted.gpg
--------------------
pub   rsa4096 2017-04-05 [SC]
      DBE4 6B52 81D0 C816 F630  E889 D980 A174 57F6 FB86
uid           [ unknown] Example <support@example.com>
sub   rsa4096 2017-04-05 [E]

pub   rsa4096 2016-04-12 [SC]
      EB4C 1BFD 4F04 2F6D DDCC  EC91 7721 F63B D38B 4796
uid           [ unknown] Google Inc. (Linux Packages Signing Authority) <linux-packages-keymaster@google.com>
sub   rsa4096 2021-10-26 [S] [expires: 2024-10-25]
[...]
```

Also shown afterward are the keys held in files in the `/etc/apt/trusted.gpg.d` folder.

**[[ Related read How to import your existing SSH keys into your GPG key ]][2]**

### 2. Removing old keys

The group of quartets of hex digits, for example `DBEA 6B52...FB86`, is the identifier required to delete the unwanted keys:

```
$ sudo apt-key del "DBEA 6B52 81D0 C816 F630  E889 D980 A174 57F6 FB86"
```

This gets rid of the Example key. That's literally just an example, and in reality you'd get rid of keys that actually exist. For instance, I ran the same command for each of the real keys on my system, including keys for Google, Signal, and Ascensio. Keys on your system will vary, depending on what you have installed.

### 3. Adding keys

Getting the replacement keys is dependent on the application. For example, Open Whisper offers its key and an explanation of what to do to install it, which I decided not to follow as it puts the key in `/usr/share/keyrings`. Instead, I did this:

```
$ wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
$ sudo mv signal-desktop-keyring.gpg /etc/apt/trusted.gpg.d/
$ sudo chown root:root /etc/apt/trusted.gpg.d/signal-desktop-keyring.gpg
$ sudo chmod ugo+r /etc/apt/trusted.gpg.d/signal-desktop-keyring.gpg
$ sudo chmod go-w /etc/apt/trusted.gpg.d/signal-desktop-keyring.gpg
```

Ascencio also offers instructions for installing OnlyOffice that include dealing with the GPG key. Again I modified their instructions to suit my needs:

```
$ gpg --no-default-keyring --keyring gnupg-ring:~/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
$ sudo mv onlyoffice.gpg /etc/apt/trusted.gpg.d/
$ sudo chown root:root /etc/apt/trusted.gpg.d/onlyoffice.gpg
$ sudo chmod ugo+r /etc/apt/trusted.gpg.d/onlyoffice.gpg
$ sudo chmod go-w /etc/apt/trusted.gpg.d/onlyoffice.gpg
```

As for the Google key, it is managed (correctly, it appears) through the `.deb` package, and so a simple reinstall with `dpkg -i` was all that was needed. Finally, I ended up with this:

```
$ ls -l /etc/apt/trusted.gpg.d
total 24
-rw-r--r-- 1 root root 7821 Sep  2 10:55 google-chrome.gpg
-rw-r--r-- 1 root root 2279 Sep  2 08:27 onlyoffice.gpg
-rw-r--r-- 1 root root 2223 Sep  2 08:02 signal-desktop-keyring.gpg
-rw-r--r-- 1 root root 2794 Mar 26  2021 ubuntu-keyring-2012-cdimage.gpg
-rw-r--r-- 1 root root 1733 Mar 26  2021 ubuntu-keyring-2018-archive.gpg
```

### Expired keys

The last problem key I had was from an outdated installation of QGIS. The key had expired, and I'd set it up to be managed by `apt-key`. I ended up following their instructions to the letter, both for installing a new key in `/etc/apt/keryings` and their suggested format for the `/etc/apt/sources.list.d/qgis.sources` installation configuration.

**[[ Download the Linux cheat sheets for apt or dnf ]][3]**

### Linux system maintenance

Now you can run `apt update` with no warnings or errors related to deprecated key configurations. We `apt` users just need to remember to adjust any old installation instructions that depend on `apt-key`. Instead of using `apt-key`, you must instead install a key to `/etc/apt/trusted.gpg.d/` or `/etc/apt/keyrings/`, using `gpg` as needed.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/deprecated-linux-apt-key

作者：[Chris Hermansen][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/mistake_bug_fix_find_error.png
[2]: https://opensource.com/article/19/4/gpg-subkeys-ssh-multiples
[3]: https://opensource.com/downloads/apt-cheat-sheet
