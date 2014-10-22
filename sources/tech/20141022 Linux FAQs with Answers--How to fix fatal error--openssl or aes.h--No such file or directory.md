Linux FAQs with Answers--How to fix “fatal error: openssl/aes.h: No such file or directory”
================================================================================
> **Question**: I am trying to compile a program on Linux, but the compilation fails with an error saying: "fatal error: openssl/aes.h: No such file or directory". How can I install the requested header file and solve this problem on [insert your Linux distro]? 

    fatal error: openssl/aes.h: No such file or directory

If you encounter this error during compilation, this is because of the following: The program you are trying to build is using OpenSSL, but necessary development files (libraries and header files) required to link with OpenSSL are missing on your Linux platform.

To fix this problem, you have to install **OpenSSL development package**, which is available in standard repositories of all modern Linux distributions.

To install OpenSSL development package on Debian, Ubuntu or their derivatives:

    $ sudo apt-get install libssl-dev

To install OpenSSL development package on Fedora, CentOS or RHEL:

    $ sudo yum install openssl-devel

After installing the package, try recompiling the program.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-fatal-error-openssl.html

作者：[作者名][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出