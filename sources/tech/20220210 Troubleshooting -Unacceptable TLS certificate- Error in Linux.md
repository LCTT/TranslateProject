[#]: subject: "Troubleshooting “Unacceptable TLS certificate” Error in Linux"
[#]: via: "https://itsfoss.com/unacceptable-tls-certificate-error-linux/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Troubleshooting “Unacceptable TLS certificate” Error in Linux
======

When it comes to SSL/TLS certificates, you may come across a variety of issues, some related to the browser or a problem in a website’s back-end.

One such error is “Unacceptable TLS certificate” in Linux.

Unfortunately, there’s no “one-solves-it-all’ answer to this. However, there are some potential solutions that you can try, and here, I plan to highlight those for you.

### When do you encounter this TLS Certificate issue?

![][1]

In my case, I noticed the issue when adding the Flathub repository via the terminal, a step that lets you access the massive collection of Flatpaks when [setting up Flatpak][2].

However, you can also expect to encounter this error when installing a Flatpak app or using a Flatpak ref file from a third-party repository via the terminal.

Some users noticed this issue when using their organization’s recommended VPN service for work on Linux.

So, how do you fix it? Why is this a problem?

Well, technically, it’s either of two things:

  * Your system does not accept the certificate (and tells that it’s invalid).
  * The certificate does not match the domain the user connects to.



If it’s the second, you will have to reach out to the website’s administrator and fix it from their end.

But if it’s the first, you have a couple of ways to deal with it.

### 1\. Fix “Unacceptable TLS certificate” when using Flatpak or adding GNOME Online Accounts

If you are trying to add Flathub remote or a new Flatpak application and notice the error in the terminal, you can simply type in:

```

    sudo apt install --reinstall ca-certificates

```

This should re-install the trusted CA certificates, in case there has been an issue with the list in some way.

![][3]

In my case, when trying to add the Flathub repository, I encountered the error, which was resolved by typing the above command in the terminal.

So, I think that any Flatpak-related issues with TLS certificates can be fixed using this method.

### 2\. Fix “Unacceptable TLS certificate” when using Work VPN

If you are using your organization’s VPN to access materials related to work, you might have to add the certificate to the list of trusted CAs in your Linux distro.

Do note that you need the VPN service or your organization’s administrator to share the .CRT version of the root certificate to get started.

Next, you will need to navigate your way to **/usr/local/share/ca-certificates** directory.

You can create a directory under it and use any name to identify your organization’s certificate. And, then add the .CRT file to that directory.

For instance, its usr/local/share/ca-certificates/organization/xyz.crt

Do note that you need root privileges to add certificates or make a directory under the **ca-certificates** directory.

Once you have added the necessary certificate, all you have to do is update the certificate support list by typing in:

```

    sudo update-ca-certificates

```

And, the certificate should be treated valid by your system whenever you try to connect to your company’s VPN.

### Wrapping Up

An unacceptable TLS certificate is not a common error, but you can find it in various use cases, such as connecting to GNOME Online accounts.

If the error cannot be resolved by two of these methods, it is possible that the domain/service you are connecting to has a configuration error. In that case, you will have to contact them to fix the issue.

Have you faced this error anytime? How did you fix it? Are you aware of other solutions to this problem (potentially, something that’s easy to follow)? Let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/unacceptable-tls-certificate-error-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/unacceptable-tls-certificate.png?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/flatpak-guide/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/tls-certificate-troubleshoot.png?resize=800%2C506&ssl=1
