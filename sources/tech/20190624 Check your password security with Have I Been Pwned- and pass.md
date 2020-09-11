[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Check your password security with Have I Been Pwned? and pass)
[#]: via: (https://opensource.com/article/19/6/check-passwords)
[#]: author: (Brian "bex" Exelbierd https://opensource.com/users/bexelbie/users/jason-baker/users/admin/users/mtsouk)

Check your password security with Have I Been Pwned? and pass
======
Periodically checking for password compromise is an excellent way to
help ward off most attackers in most threat models.
![Password lock][1]

Password security involves a broad set of practices, and not all of them are appropriate or possible for everyone. Therefore, the best strategy is to develop a threat model by thinking through your most significant risks—who and what you are protecting against—then model your security approach on the activities that are most effective against those specific threats. The Electronic Frontier Foundation (EFF) has a [great series on threat modeling][2] that I encourage everyone to read.

In my threat model, I am very concerned about the security of my passwords against (among other things) [dictionary attacks][3], in which an attacker uses a list of likely or known passwords to try to break into a system. One way to stop dictionary attacks is to have your service provider rate-limit or deny login attempts after a certain number of failures. Another way is not to use passwords in the "known passwords" dataset.

### Check password security with HIBP

[Troy Hunt][4] created [Have I Been Pwned?][5] (HIBP) to notify people when their information is found in leaked data dumps and breaches. If you haven't already registered, you should, as the mere act of registering exposes nothing. Troy has built a collection of over 550 million real-world passwords from this data. These are passwords that real people used and were exposed by data that was stolen or accidentally made public.

The site _does not_ publish the plaintext password list, but it doesn't have to. By definition, this data is already out there. If you've ever reused a password or used a "common" password, then you are at risk because someone is building a dictionary of these passwords to try right now.

Recently, Firefox and HIBP announced they are [teaming up][6] to make breach searches easier. And the National Institutes of Standards and Technology (NIST) recommends that you [check passwords][7] against those known to be compromised and change them if they are found. HIBP supports this via a password-checking feature that is exposed via an API, so it is easy to use.

Now, it would be a bad idea to send the website a full list of your passwords. While I trust [HaveIBeenPwned.com][5], it could be compromised one day. Instead, the site uses a process called [k-Anonymity][8] that allows you to check your passwords without exposing them. This is a three-step process. First, let's review the steps, and then we can use the **pass-pwned** plugin to do it for us:

  1. Create a hash value of your password. A hash value is just a way of turning arbitrary data—your password—into a fixed data representation—the hash value. A cryptographic hash function is collision-resistant, meaning it creates a unique hash value for every input. The algorithm used for the hash is a one-way transformation, which makes it hard to know the input value if you only have the hash value. For example, using the SHA-1 algorithm that HIBP uses, the password **hunter2** becomes **F3BBBD66A63D4BF1747940578EC3D0103530E21D**.
  2. Send the first five characters (**F3BBB** in our example) to the site, and the site will send back a list of all the hash values that start with those five characters. This way, the site can't know which hash values you are interested in. The k-Anonymity process ensures there is so much statistical noise that it is hard for a compromised site to determine which password you inquired about. For example, our query returns a list of 527 potential matches from HIBP.
  3. Search through the list of results to see if your hash is there. If it is, your password has been compromised. If it isn't, the password isn't in a publicly known data breach. HIBP returns a bonus in its data: a count of how many times the password has been seen in data breaches. Astoundingly, **hunter2** has been seen 17,043 times!



### Check password security with pass

I use [**pass**][9], a [GNU Privacy Guard][10]-based password manager. It has many extensions, which are available on the [**pass** website][11] and as a separately maintained [awesome-style list][12]. One of these extensions is [**pass-pwned**][13], which will check your passwords with HIBP. Both **pass** and **pass-pwned** are packaged for Fedora 29, 30, and Rawhide. You can install the extension with:


```
`sudo dnf install pass pass-pwned`
```

or you can follow the manual instructions on their respective websites.

If you're just getting started with **pass**, read [Managing passwords the open source way][14] for a great overview.

The following will quickly set up **pass** and check a stored password. This example assumes you already have a GPG key.


```
# Setup a pass password store
$ pass init &lt;GPG key email&gt;

# Add the password, "hunter2" to the store
$ pass insert awesome-site.com

# Install the pass-pwned extension
# Download the bash script from the upstream and then review it
$ mkdir ~/.password-store/.extensions
$ wget <https://raw.githubusercontent.com/alzeih/pass-pwned/master/pwned.bash> -O ~/.password-store/.extensions/pwned.bash
$ vim ~/.password-store/.extensions/pwned.bash

# If everything is OK, set it executable and enable pass extensions
$ chmod u+x ~/.password-store/.extensions/pwned.bash
$ echo 'export PASSWORD_STORE_ENABLE_EXTENSIONS="true"' &gt;&gt; ~/.bash_profile
$ source ~/.bash_profile

# Check the password
$ pass pwned awesome-site.com
Password found in haveibeenpwned 17043 times

# Change this password to something randomly generated and verify it
$ pass generate -i awesoem-site.com
The generated password for awesome-site.com is:
&lt;REDACTED&gt;
$ pass pwned awesome-site.com
Password not found in haveibeenpwned
```

Congratulations, your password is now more secure than it was before! You can also [use wildcards to check multiple passwords][15] at once.

Periodically checking for password compromise is an excellent way to help ward off most attackers in most threat models. If your password management system doesn't make it this easy, you may want to upgrade to something like **pass**.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/check-passwords

作者：[Brian "bex" Exelbierd][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bexelbie/users/jason-baker/users/admin/users/mtsouk
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/password.jpg?itok=ec6z6YgZ (Password lock)
[2]: https://ssd.eff.org/en/module/your-security-plan
[3]: https://en.wikipedia.org/wiki/Dictionary_attack
[4]: https://www.troyhunt.com/
[5]: https://haveibeenpwned.com/
[6]: https://www.troyhunt.com/were-baking-have-i-been-pwned-into-firefox-and-1password/
[7]: https://pages.nist.gov/800-63-FAQ/#q-b5
[8]: https://blog.cloudflare.com/validating-leaked-passwords-with-k-anonymity/
[9]: https://www.passwordstore.org/
[10]: https://gnupg.org/
[11]: https://www.passwordstore.org/#extensions
[12]: https://github.com/tijn/awesome-password-store
[13]: https://github.com/alzeih/pass-pwned
[14]: https://opensource.com/life/14/7/managing-passwords-open-source-way
[15]: https://github.com/alzeih/pass-pwned/issues/3
