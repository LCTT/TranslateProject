[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 approaches to secrets management for Flatpak applications)
[#]: via: (https://opensource.com/article/19/11/secrets-management-flatpak-applications)
[#]: author: (Daiki Ueno https://opensource.com/users/ueno)

3 approaches to secrets management for Flatpak applications
======
Flatpak secrets management is getting an upgrade. Here's what's coming.
![A top secret file.][1]

[Flatpak][2] enables desktop applications to run in isolated sandboxes, which significantly improves security as it prevents applications from affecting one another and impacting the host system. In practice, however, typical applications still need to access services and user data that are shared among other applications and the host. This situation has been improved [by hardening permissions around the portal mechanism][3], though there was a long-standing issue: How to manage user secrets.

In this article, we present our approach to managing user secrets for Flatpak applications. While most applications can transparently take advantage of the proposed mechanism, some applications need code modification. The migration steps are also presented.

### How secrets are managed on the Linux desktop

On a modern Linux desktop, most of the secrets—passwords, tokens, and so on, with their associated attributes—are centrally managed by the daemon process **gnome-keyring-daemon**. Applications access this daemon through [the Secret Service API][4], which is exposed through D-Bus. This process is done under the hood if the application is using a client library like **libsecret**. 

**Note:** For the same purpose, there is a library called **libgnome-keyring**, which is now obsolete. Note that, despite the name, **libgnome-keyring** is a separate project from **gnome-keyring**, which is NOT obsolete and still maintains the central role of secrets management.

On the daemon side, the secrets are stored on the filesystem and encrypted. Other than that, the daemon is nothing but a normal storage service, meaning that any application can store data on arbitrary "paths" that other applications can also see. While this model is sufficient as long as we trust all applications, it negates one of Flatpak’s security goals: [Increase the security of desktop systems by isolating applications from one another][5].

Therefore, when installing a Flatpak application that uses the Secret Service API, the user is asked to grant the necessary permissions to the application. In the example below, you can see that the application requires access to the Secret Service API (**org.freedesktop.secrets**). If the user doesn’t want to allow this application to access the service, their only option is to forfeit installation:


```
$ flatpak install org.gnome.Epiphany
…
org.gnome.Epiphany permissions:
        ipc                     network         pulseaudio      wayland
        x11                     dri             file access [1] dbus access [2]
        system dbus access [3]

        [1] xdg-download, xdg-run/dconf, ~/.config/dconf:ro
        [2] ca.desrt.dconf, org.freedesktop.Notifications, org.freedesktop.secrets
        [3] org.freedesktop.GeoClue2
Proceed with these changes to the Default system installation? [Y/n]:
```

This is clearly an undesirable outcome.

### The local storage approach

The basic idea to tackle this problem is to store the secrets on the application side, rather than the host side (**gnome-keyring-daemon**). This practice is analogous to [the recent work on GSettings][6], where applications store the settings data in a local file instead of in a [**dconf**][7] service running on the host.

When it comes to secrets, however, there is a bootstrapping problem: The application has to encrypt secrets when storing them in a local file, but it doesn’t know the encryption key yet. To provision the application with an encryption key, we rely on the [Flatpak portal][8] mechanism, which sits between the application and the host to let the two communicate through a restricted interface.

We also added [a new portal][9] that allows applications to retrieve encryption keys. First, the application sends a request to the portal (the request contains a Unix file descriptor where the encryption key is written). Then, the portal delegates the request to the back-end implementation in **gnome-keyring-daemon**, which sends a unique encryption key for the sandboxed application through the file descriptor.

With the received encryption key, the application encrypts the secrets and stores them in the application data directory (**~/.var/app/$APPID/data/keyrings**), which is **bind**-mounted and accessible from both the host and the sandbox.

### The libsecret API

The **libsecret** project provides two different sets of APIs. One is [the simple API][10], and the other is [the complete API][11]. The former provides simpler, stateless operations for retrieving and storing secrets, while the latter provides a more complete, object-oriented API that maps the D-Bus interface to the C API.

Local storage is only supported in the simple API. If your applications are already using the simple API, then they will automatically use local storage when running under Flatpak. Otherwise, to enable local storage, the applications need to be ported to the simple API. See [the migration patch in Epiphany][12] as an example.

Having a distinction between the two API sets also makes it possible for the applications to opt-out from using local storage. For example, if your application is a password manager that needs full access to user keyrings, you can bypass local storage by using the complete API.

### The keyring format

Although ideally, we should be able to use the same keyring format for both local storage and **gnome-keyring-daemon**, we realized that the keyring format used by **gnome-keyring-daemon** has limitations. Secrets, including associated attributes, are encrypted as a single chunk, meaning that they can consume an unnecessary amount of locked memory. Also, attributes are hashed without a key, meaning that it is possible to guess which secrets are stored in the file.

Therefore, instead of implementing this format in two places, we decided to define a new version of the keyring file format, with the following characteristics: Secrets are encrypted individually and attribute hashes are now a [message authentication code (MAC)][13] over the attributes.

This new format is based on [the][14] [GVariant serialization format][14], except for the header, and this change allows us to reuse most of the code for encoding, decoding, and lookup.

### What's next for Flatpak secrets management

The necessary patches are (currently) only available in the Git repositories of the relevant components (**xdg-desktop-portal**, **gnome-keyring**, and **libsecret**). They will be included in the next releases leading up to GNOME 3.36.

If you are a developer, there is still room for improvement in this area. Here is where your help would be greatly appreciated:

  * **Session keyrings:** The Secret Service API supports "session" keyrings, which only last for the duration of the user session. The local storage backend doesn’t support this feature yet. This code could be implemented using the session keyring in the Linux kernel.

  * **Management and backup application:** Application secrets are now stored in multiple locations, and not just the host keyrings. It would be useful if there were a tool to manage application secrets and make backups. This process should be possible by enhancing GNOME’s Seahorse to look at application secrets.

  * **Online accounts portal:** These days, it is common for web applications to be integrated with web-based access delegation protocols such as OAuth 2.0. These protocols are supported by **gnome-online-accounts**, which in turn uses **gnome-keyring-daemon** for storing the tokens. A portal interface for online accounts would be useful for restricting access per application.

  * **Wider adoption of the new keyring format:** While the new format has several advantages, it is currently only used by **libsecret** on the application side. It would be beneficial if **gnome-keyring-daemon** on the host side also used the same format.

  * **Hardening the reinstall process:** By default, the application’s keyring file (**~/.var/app/$APPID/data/keyrings**) persists after uninstall, along with other data. This persistence is vulnerable in case the application ID is reused by an untrusted publisher. Currently, we recommend using the **\--delete-data** option to ensure that such application data is removed. This procedure could be improved if a publisher’s ID was associated with the application.




### Summary

This article presented a mechanism to provision Flatpak applications with user secrets. This mechanism was designed based on the following principles:

  * Minimize the host interface.
  * Let applications interact with the host through a Flatpak portal.
  * Store the application data in a common data format.



Although the mechanism is transparent, as long as you use **libsecret**, the mechanism is only enabled through **libsecret**’s simple API. For a smoother transition, we suggest migrating applications to this API. More information about the project’s background and the design rationale is available in the GUADEC presentation ([slides][15], [recording][16]).

Fragmentation is a longstanding Achilles heel for the Linux desktop. In a world of myriad...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/secrets-management-flatpak-applications

作者：[Daiki Ueno][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ueno
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/topsecret_folder_file_security.jpg?itok=y0P2GC5K (A top secret file.)
[2]: https://opensource.com/article/19/10/how-build-flatpak-packaging
[3]: https://blog.tingping.se/2019/10/06/hardening-flatpak-permissions.html
[4]: https://specifications.freedesktop.org/secret-service/
[5]: http://docs.flatpak.org/en/latest/sandbox-permissions.html#sandbox-permissions
[6]: https://blogs.gnome.org/mclasen/2019/07/12/settings-in-a-sandbox-world/
[7]: https://wiki.gnome.org/Projects/dconf
[8]: https://flatpak.github.io/xdg-desktop-portal/portal-docs.html
[9]: https://github.com/flatpak/xdg-desktop-portal/pull/359
[10]: https://developer.gnome.org/libsecret/unstable/simple.html
[11]: https://developer.gnome.org/libsecret/unstable/complete.html
[12]: https://gitlab.gnome.org/GNOME/epiphany/commit/ed514f3ef43b323c51fb539274bef9dce0907ff2
[13]: https://en.wikipedia.org/wiki/Message_authentication_code
[14]: https://people.gnome.org/~desrt/gvariant-serialisation.pdf
[15]: https://people.gnome.org/~dueno/libsecret-guadec.pdf
[16]: https://guadec.ubicast.tv/videos/desktop-secrets-management-for-the-future/
