How To Test A Package Without Installing It In Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2018/06/nix-720x340.png)
For some reason, you might want to test a package before installing it in your Linux system. If so, you’re lucky! Today, I will show you how to do it in Linux using **Nix** package manager. One of the notable feature of Nix package manager is it allows the users to test the packages without having to install them first. This can be helpful when you want to use a particular application temporarily.

### Test A Package Without Installing It In Linux

Make sure you have installed Nix package manager first. If you haven’t installed it yet, refer the following guide.

For instance, let us say you want to test your C++ code. You don’t have to install GCC. Just run the following command:
```
$ nix-shell -p gcc

```

This command builds or downloads gcc package and its dependencies, then drops you into a Bash shell where the **gcc** command is present, all without affecting your normal environment.
```
 LANGUAGE = (unset),
LC_ALL = (unset),
LANG = "en_US.UTF-8"
are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").
download-using-manifests.pl: perl: warning: Setting locale failed.
download-using-manifests.pl: perl: warning: Please check that your locale settings:
download-using-manifests.pl: LANGUAGE = (unset),
download-using-manifests.pl: LC_ALL = (unset),
download-using-manifests.pl: LANG = "en_US.UTF-8"
download-using-manifests.pl: are supported and installed on your system.
download-using-manifests.pl: perl: warning: Falling back to the standard locale ("C").
download-from-binary-cache.pl: perl: warning: Setting locale failed.
download-from-binary-cache.pl: perl: warning: Please check that your locale settings:
download-from-binary-cache.pl: LANGUAGE = (unset),
download-from-binary-cache.pl: LC_ALL = (unset),
download-from-binary-cache.pl: LANG = "en_US.UTF-8"

[...]

fetching path ‘/nix/store/6mk1s81va81dl4jfbhww86cwkl4gyf4j-stdenv’...
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
LANGUAGE = (unset),
LC_ALL = (unset),
LANG = "en_US.UTF-8"
are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").

*** Downloading ‘https://cache.nixos.org/nar/0aznfg1g17a8jdzvnp3pqszs9rq2wiwf2rcgczyg5b3k6d0iricl.nar.xz’ to ‘/nix/store/6mk1s81va81dl4jfbhww86cwkl4gyf4j-stdenv’...
% Total % Received % Xferd Average Speed Time Time Time Current
Dload Upload Total Spent Left Speed
100 8324 100 8324 0 0 6353 0 0:00:01 0:00:01 --:--:-- 6373

[nix-shell:~]$

```

Check the GCC version:
```
[nix-shell:~]$ gcc -v
Using built-in specs.
COLLECT_GCC=/nix/store/dyj2k6ch35r1ips4vr97md2i0yvl4r5c-gcc-5.4.0/bin/gcc
COLLECT_LTO_WRAPPER=/nix/store/dyj2k6ch35r1ips4vr97md2i0yvl4r5c-gcc-5.4.0/libexec/gcc/x86_64-unknown-linux-gnu/5.4.0/lto-wrapper
Target: x86_64-unknown-linux-gnu
Configured with:
Thread model: posix
gcc version 5.4.0 (GCC)

```

Now, go ahead and test the code. Once you are done, type **exit** to return back to your console.
```
[nix-shell:~]$ exit
exit

```

Once you are exit from the nix-shell, you can’t use GCC.

Here is another example.
```
$ nix-shell -p hello

```

This builds or downloads GNU Hello and its dependencies, then drops you into a Bash shell where the **hello** command is present, all without affecting your normal environment:
```
[nix-shell:~]$ hello
Hello, world!

```

Type exit to return back to the console.
```
[nix-shell:~]$ exit

```

Now test if hello program is available or not.
```
$ hello
hello: command not found

```

For more details about Nix package manager, refer the following guide.

Hope this helps! More good stuffs to come. Stay tuned!!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-test-a-package-without-installing-it-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
