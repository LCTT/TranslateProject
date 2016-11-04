GHLandy Translating


# Generate a strong password from the command line

 ![generate-a-strong-password-from-the-command-line](https://www.rosehosting.com/blog/wp-content/uploads/2016/10/generate-a-strong-password-from-the-command-line.jpg) 

Having a strong password is the most important thing you can do to protect your account or server and to keep your data secure. Common thinking is that a strong password should be comprised of at least 14 characters, including lowercase and uppercase alphabetic characters, numbers and symbols and should never be based on a dictionary word. Using a long password is much more secure that using a short one, the longer the password the harder it is to guess. In this post, we will take a look at a several different ways to generate a strong password using the Linux command line.

### Generate a strong password with openssl

This method uses the openssl rand function and it will generate 14 characters random string:

```
openssl rand -base64 14
```

### Generate a strong password with urandom

In this method we will filter the `/dev/urandom` output with `tr` to delete unwanted characters and print the first 14 characters:

```
< /dev/urandom tr -dc A-Za-z0-9 | head -c14; echo
```

### Generate a strong password with pwgen

`pwgen`is a tool that generates random, meaningless but pronounceable passwords.
To install `pwgen` run:

```
sudo apt-get install pwgen
```

Once the installation is complete, use the following command to generate a random string of 14 characters:

```
pwgen 14 1
```

You can also use some of the following flags:
<small style="transition: height 0.15s ease-out, width 0.15s ease-out; font-size: 14.45px;"></small>

```
  -c or --capitalize
        Include at least one capital letter in the password
  -A or --no-capitalize
        Don't include capital letters in the password
  -n or --numerals
        Include at least one number in the password
  -0 or --no-numerals
        Don't include numbers in the password
  -y or --symbols
        Include at least one special symbol in the password
  -s or --secure
        Generate completely random passwords
  -B or --ambiguous
        Don't include ambiguous characters in the password
  -h or --help
        Print a help message
  -H or --sha1=path/to/file[#seed]
        Use sha1 hash of given file as a (not so) random generator
  -C
        Print the generated passwords in columns
  -1
        Don't print the generated passwords in columns
  -v or --no-vowels
        Do not use any vowels so as to avoid accidental nasty words

```

### Generate a strong password with gpg

We can also use the `gpg` tool to generate a strong 14 characters password:

```
gpg --gen-random --armor 1 14
```

* * *

Of course, there are many other ways to generate a strong password. For example, you can add the following bash shell function to your `~/.bashrc` file:

```
genpasswd() { 
    strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 14 | tr -d '\n'; echo
}
```

and when you need to generate a strong random password just type `genpasswd`



--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/generate-password-linux-command-line/

作者：[RoseHosting][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:www.rosehosting.com
