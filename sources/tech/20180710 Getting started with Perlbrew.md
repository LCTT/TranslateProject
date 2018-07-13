Getting started with Perlbrew
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o)

What's better than having Perl installed on your system? Having multiple Perls installed on your system! With [Perlbrew][1] you can do just that. But why—apart from surrounding yourself in Perl—would you want to do that?

The short answer is that different versions of Perl are… different. Application A may depend on behavior deprecated in a newer release, while Application B needs new features that weren't available last year. If you have multiple versions of Perl installed, each script can use the version that best suits it. This also comes in handy if you're a developer—you can test your application against multiple versions of Perl so that, no matter what your users are running, you know it works.

### Install Perlbrew

The other benefit is that Perlbrew installs to the user's home directory. That means each user can manage their Perl versions (and the associated CPAN packages) without having to involve the system administrators. Self-service means quicker installation for the users and gives sysadmins more time to work on the hard problems.

The first step is to install Perlbrew on your system. Many Linux distributions have it in the package repo already, so you're just a `dnf install perlbrew` (or whatever is the appropriate command for your distribution) away. You can also install the `App::perlbrew` module from CPAN with `cpan App::perlbrew`. Or you can download and run the installation script at [install.perlbrew.pl][2].

To begin using Perlbrew, run `perlbrew init`.

### Install a new Perl version

Let's say you want to try the latest development release (5.27.11 as of this writing). First, you need to install the package:
```
perlbrew install 5.27.11

```

### Switch Perl version

Now that you have a new version installed, you can use it for just that shell:
```
perlbrew use 5.27.11

```

Or you can make it the default Perl version for your account (assuming you set up your profile as instructed by the output of `perlbrew init`):
```
perlbrew switch 5.27.11

```

### Run a single script

You can run a single command against a specific version of Perl, too:
```
perlberew exec 5.27.11 myscript.pl

```

Or you can run a command against all your installed versions. This is particularly handy if you want to run tests against a variety of versions. In this case, specify Perl as the version:
```
.plperlbrew exec perl myscriptpl

```

### Install CPAN modules

If you want to install CPAN modules, the `cpanm` package is an easy-to-use interface that works well with Perlbrew. Install it with:
```
perlbrew install-cpamn

```

You can then install CPAN modules with the `cpanm` command:
```
cpanm CGI::simple

```

### But wait, there's more!

This article covers basic Perlbrew usage. There are many more features and options available. Look at the output of `perlbrew help` as a starting point, or check out the [App::perlbrew documentation][3]. What other features do you love in Perlbrew? Let us know in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/perlbrew

作者：[Ben Cotton][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bcotton
[1]:https://perlbrew.pl/
[2]:https://raw.githubusercontent.com/gugod/App-perlbrew/master/perlbrew-install
[3]:https://metacpan.org/pod/App::perlbrew
