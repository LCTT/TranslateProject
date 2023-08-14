[#]: subject: "Fedora Linux Flatpak cool apps to try for August"
[#]: via: "https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-august/"
[#]: author: "Eduard Lucena https://fedoramagazine.org/author/x3mboy/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Linux Flatpak cool apps to try for August
======

![][1]

Photo by [Joanna Kosinska][2] on [Unsplash][3] [Edited]

This article introduces projects available in Flathub with installation instructions.

[Flathub][4] is the place to get and distribute apps for all of Linux. It is powered by Flatpak, allowing Flathub apps to run on almost any Linux distribution.

Please read “[Getting started with Flatpak][5]“. In order to enable flathub as your flatpak provider, use the instructions on the [flatpak site][6].

### Authenticator

[Authenticator][7] is a simple app that allows you to generate Two-Factor authentication codes. It has a very simple and elegant interface with support for a a lot of algorithms and methods. Some of its features are:

  * Time-based/Counter-based/Steam methods support
  * SHA-1/SHA-256/SHA-512 algorithms support
  * QR code scanner using a camera or from a screenshot
  * Lock the application with a password
  * Backup/Restore from/into known applications like FreeOTP+, Aegis (encrypted / plain-text), andOTP, Google Authenticator



You can install “Authenticator” by clicking the install button on the site or manually using this command:

```

    flatpak install flathub com.belmoussaoui.Authenticator

```

### Secrets

[Secrets][8] is a password manager that integrates with GNOME. It’s easy to use and uses the KeyPass file format. Some of its features are:

  * Supported Encryption Algorithms:
    * AES 256-bit
    * Twofish 256-bit
    * ChaCha20 256-bit
  * Supported Derivation algorithms:
    * Argon2 KDBX4
    * Argon2id KDBX4
    * AES-KDF KDBX 3.1
  * Create or import KeePass safes
  * Add attachments to your encrypted database
  * Generate cryptographically strong passwords
  * Quickly search your favorite entries
  * Automatic database lock during inactivity
  * Support for two-factor authentication



You can install “Secrets” by clicking the install button on the site or manually using this command:

```

    flatpak install flathub org.gnome.World.Secrets

```

### Flatsweep

[Flatsweep][9] is a simple app to remove residual files after a flatpak is unistalled. It uses GTK4 and Libadwaita to provide a coherent user interface that integrates nicely with GNOME, but you can use it on any desktop environment.

You can install “Flatsweep” by clicking the install button on the site or manually using this command:

```

    flatpak install flathub io.github.giantpinkrobots.flatsweep

```

### Solanum

Solanum is a time tracking app that uses the [pomodoro technique][10]. It uses GTK4 and it’s interface integrates nicely with GNOME.

You can install “Solanum” by clicking the install button on the site or manually using this command:

```

    flatpak install flathub org.gnome.Solanum

```

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-linux-flatpak-cool-apps-to-try-for-august/

作者：[Eduard Lucena][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/x3mboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/08/flatpak_cool_app_august-816x345.jpg
[2]: https://unsplash.com/@joannakosinska?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/photos/mjC9apK53a8?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://flathub.org
[5]: https://fedoramagazine.org/getting-started-flatpak/
[6]: https://flatpak.org/setup/Fedora
[7]: https://flathub.org/apps/com.belmoussaoui.Authenticator
[8]: https://flathub.org/apps/org.gnome.World.Secrets
[9]: https://flathub.org/apps/io.github.giantpinkrobots.flatsweep
[10]: https://en.wikipedia.org/wiki/Pomodoro_Technique
