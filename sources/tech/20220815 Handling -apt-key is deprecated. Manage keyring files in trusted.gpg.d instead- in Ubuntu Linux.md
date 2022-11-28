[#]: subject: "Handling “apt-key is deprecated. Manage keyring files in trusted.gpg.d instead” in Ubuntu Linux"
[#]: via: "https://itsfoss.com/apt-key-deprecated/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Handling “apt-key is deprecated. Manage keyring files in trusted.gpg.d instead” in Ubuntu Linux
======

Installing a package from an [external repository in Ubuntu][1] consists of three steps:

* Adding the repository’s GPG key to the system
* Adding the external repository to the system
* Installing the package from this external repository

But lately, you would notice a message about ‘apt-key being deprecated’ when you try installing packages from third-party repositories.

Take the [installation of Spotify on Ubuntu][2] for example. When I add the GPG key to the system, it complains.

```
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
[sudo] password for abhishek: 
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
OK
```

It’s a warning, not an error. It doesn’t stop the process. The GPG key is added to your system and you can continue adding the external repository.

However, it will create further warnings (again, not errors). In the example here, if I continue adding the external repository, it shows me this message.

```
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
W: http://repository.spotify.com/dists/stable/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.
```

It doesn’t stop the installation of the package, though. In the example, I was able to install the spotify-client package afterward.

If it’s not an error, do you need to be worried about it? Probably not. Not now, at least. However, it would be better to understand future changes coming to this external repo mechanism.

### Understanding the apt-key deprecation and trusted.gpg issue

There are two parts to this message:

* apt-key is deprecated
* Manage keyring files in trusted.gpg.d

I’ll come to both points in a moment.

When you add the keys (.gpg or .asc) of a repository, your system trusts the packages (signed with that key) coming from the repository. If you don’t add the key of a repository, your system won’t allow installing packages from it.

For a long time, the apt-key command line tool has been used for managing the repository keys to Debian and other distros using apt package management. You can add, list, update, and remove the keys with this command.

#### Problem with the way apt-key works

It works by adding the keys to the /etc/apt/trusted.gpg file. The apt package manager trusts the keys inside this file.

Sounds good, right? However, it was discovered to be a potential security issue. Your system trusts those keys completely, not just for the packages you added them for.

Imagine that you added keys to repository A to get package AA and to repo B to get package BB. Your system will gladly accept package BB signed by the key of repo A. It cannot relate the keys to their respective packages.

Now, it’s easier said than done because there are other factors in play like apt policy and preferences but it opens an attack surface.

This is the reason why apt-key is being deprecated. That’s the first part of the warning message.

#### Ubuntu wants you to separate GPG keys

Coming to the second part of the warning message; “Manage keyring files in trusted.gpg.d”.

Ubuntu doesn’t want you to add all the signature keys in the single /etc/apt/trusted.gpg file. It suggests using a separate file that are located in the /etc/apt/trusted.gpg.d directory.

It’s the same mechanism it uses for the sources list where external repository sources are listed in their own file under /etc/apt/sources.list.d instead of keeping everything under the /etc/apt/sources.list file. It makes managing the external repos a bit easier.

This means that instead of using the apt-key in this fashion:

```
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
```

You should use it like this:

```
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/spotify.gpg
```

Which is basically adding the key to its dedicated file under /etc/apt/trusted.d directory. Ubuntu won’t complain anymore.

Although this doesn’t fix the original concern of cross-signing the packages. The [proper way][3] to fix is to add the key location to the sources list file of the repository. I’ll discuss both methods in the next section.

### Solution 1: Adding the GPG keys to the system to keep Ubuntu happy (relatively easier but not proper way)

Unfortunately, there is no easy way around this. You’ll have to use the command line and you should figure out correct parameters. There is no ‘run this and you are done’ thing here.

The idea here is to add the GPG key under its dedicated file in /etc/apt/trusted.gpg.d.

There are couple of scenarios here.

#### You have already added the key in /etc/apt/trusted.gpg file

In this case, list the keys with this command:

```
sudo apt-key list
```

There should be a way to identify the repository. You should have its name or developers name.

In my case, I am handling the Spotify repository:

```
[email protected]:~$ sudo apt-key list
[sudo] password for abhishek: 
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
/etc/apt/trusted.gpg
--------------------
pub   rsa4096 2021-10-27 [SC] [expires: 2023-01-20]
      F9A2 1197 6ED6 62F0 0E59  361E 5E3C 45D7 B312 C643
uid           [ unknown] Spotify Public Repository Signing Key <[email protected]>
```

Copy the last 8 characters of the second line under pub. In my case, it is `B312 C643`. You’ll have to remove the space between the numbers and use it like this:

```
sudo apt-key export B312C643 | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/spotify.gpg
```

The output file could be named anything but it is better to use a name that is associated with the package or repository.

The `gpg --dearmour` part is important because the mechanism expects you to have the keys in binary format.

#### You haven’t added the external keys yet

Well, in that case, get the keys and add it to your trsuted.gpg.d directory.

If only it was that simple. The keys can be in several file formats like .asc, .gpg etc. And then those keys can be [armored][4].

An armored GPG file is encrypted but shows random text instead of being in binary format. An armored GPG key starts with:

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
```

But your GPG key should not be ‘armored’. It should be in binary format (if you try to read it, it shows gibberish).

```
ay`�����?o;���Lh����҇�^j?�,4�@8�Xh�]�j�F��Q��W�ă|,%C�n��nG�t���׺���b%/Ka����i���
```

This is why it is important to use `sudo gpg --dearmour` while handling the keys. If the added keys are not in the binary format, you’ll start seeing this message in the output of apt update command:

```
The key(s) in the keyring /etc/apt/trusted.gpg.d/spotify.gpg are ignored as the file has an unsupported filetype.
```

You may also [use the file command][5] to check if the key is armored or not.

```
file repo-key.gpg
```

and if the output is like ‘PGP public key block’, it is armored file and needs to be converted to binary.

```
[email protected]:~$ file /etc/apt/trusted.gpg.d/spotify.gpg 
/etc/apt/trusted.gpg.d/spotify.gpg: PGP public key block Public-Key (old)
```

So, the steps here involve:

* Downloading the keys and checking if it is armored or not
* If the file is armored, it needs to be dearmored in binary format
* And then the dearmored key is added to its own file under /etc/apt/trusted.gpg.d directory

You may combine all in one single command like this given that you know that it is an armored key.

```
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/spotify.gpg
```

As I mentioned earlier, this is relatively easier but not the proper way. What’s the proper way? Let’s discuss that.

### Solution 2: Adding the GPG keys to the system to the proper way

This is similar to what you have seen in the previous section but it has one more step of adding the key’s location to the repository’s sources list file.

* Downloading the keys and checking if it is armored or not
* If the file is armored, it needs to be dearmored in binary format
* And then the dearmored key is added to its own file under /usr/share/keyrings directory
* The location of the key file is added to the sources list file of the repository

In the same example, let’s add the key of the Spotify repository in /usr/share/keyrings directory.

```
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/spotify.gpg
```

Now, comes the next part. Normally, the content of the sources list file are like this:

```
deb URL_of_the_repo stable non-free
```

You should edit it and add the location of the key file like this:

```
deb [signed-by=/usr/share/keyrings/key-file.gpg] URL_of_the_repo stable non-free
```

This way, you are linking the package to a specific key. Now, this key cannot be used to download any other package. No more cross-signing.

In the Spotify example, I modified the command this way so that the sources list also contains the signed by information.

```
echo "deb [signed-by=/usr/share/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
```

### What next?

As you can see, there is no easy-to-use mechanism in place to replace the apt-key command. It requires a lot of manual effort and it should not be like this.

Since it is the transitioning phase, the ‘apt-key is deprecated’ message is a warning but things could be more strict in future versions of Ubuntu.

For now, even if you ignore this warning, you can continue using the external repository.

In my opinion, the onus lies on the external repository provider. They should be the one providing the correct way of adding their repository.

I see that [Brave browser provides the correct, moder][6][n][7][instructions][8] but many others, like Spotify, don’t do it. The change should come from developer’s side. The user should not be fiddling around the warning and error messages.

It’s not one of my best articles as it has too many moving points and it leaves a lot of things for you figure out. I have a feeling that the article may not clear all things. If that’s the case, please leave your questions and suggestions in the comment section and I’ll try explaining it further.

--------------------------------------------------------------------------------

via: https://itsfoss.com/apt-key-deprecated/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/adding-external-repositories-ubuntu/
[2]: https://itsfoss.com/install-spotify-ubuntu-linux/
[3]: https://wiki.debian.org/DebianRepository/UseThirdParty
[4]: https://www.techopedia.com/definition/23150/ascii-armor
[5]: https://linuxhandbook.com/file-command/
[6]: https://brave.com/linux/
[7]: https://brave.com/linux/
[8]: https://brave.com/linux/
