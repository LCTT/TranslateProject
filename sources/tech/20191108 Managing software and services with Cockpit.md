[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managing software and services with Cockpit)
[#]: via: (https://fedoramagazine.org/managing-software-and-services-with-cockpit/)
[#]: author: (Shaun Assam https://fedoramagazine.org/author/sassam/)

Managing software and services with Cockpit
======

![][1]

The Cockpit series continues to focus on some of the tools users and administrators can use to perform everyday tasks within the web user-interface. So far we’ve covered [introducing the user-interface][2], [storage][3] and [network management][4], and [user accounts][5]. Hence, this article will highlight how Cockpit handles software and services.

The menu options for Applications and Software Updates are available through Cockpit’s PackageKit feature. To install it from the command-line, run:

```
sudo dnf install cockpit-packagekit
```

For [Fedora Silverblue][6], [Fedora CoreOS][7], and other ostree-based operating systems, install the _cockpit-ostree_ package and reboot the system:

```
sudo rpm-ostree install cockpit-ostree; sudo systemctl reboot
```

### Software updates

On the main screen, Cockpit notifies the user whether the system is updated, or if any updates are available. Click the **Updates Available** link on the main screen, or **Software Updates** in the menu options, to open the updates page.

#### RPM-based updates

The top of the screen displays general information such as the number of updates and the number of security-only updates. It also shows when the system was last checked for updates, and a button to perform the check. Likewise, this button is equivalent to the command **sudo dnf check-update**.

Below is the **Available Updates** section, which lists the packages requiring updates. Furthermore, each package displays the name, version, and best of all, the severity of the update. Clicking a package in the list provides additional information such as the CVE, the Bugzilla ID, and a brief description of the update. For details about the CVE and related bugs, click their respective links.

Also, one of the best features about Software Updates is the option to only install security updates. Distinguishing which updates to perform makes it simple for those who may not need, or want, the latest and greatest software installed. Of course, one can always use [Red Hat Enterprise Linux][8] or [CentOS][9] for machines requiring long-term support.

The example below demonstrates how Cockpit applies RPM-based updates.

![][10]

#### OSTree-based updates

The popular article [What is Silverblue][11] states:

> OSTree is used by rpm-ostree, a hybrid package/image based system… It atomically replicates a base OS and allows the user to “layer” the traditional RPM on top of the base OS if needed.

Because of this setup, Cockpit uses a snapshot-like layout for these operating systems. As seen in the demo below, the top of the screen displays the repository (_fedora_), the base OS image, and a button to **Check for Updates**.

Clicking the repository name (_fedora_ in the demo below) opens the **Change Repository** screen. From here one can **Add New Repository**, or click the pencil icon to edit an existing repository. Editing provides the option to delete the repository, or **Add Another Key**. To add a new repository, enter the name and URL. Also, select whether or not to **Use trusted GPG key**.

There are three categories that provide details of its respective image: Tree, Packages, and Signature. **Tree** displays basic information such as the operating system, version of the image, how long ago it was released, and the origin of the image. **Packages** displays a list of installed packages within that image. **Signature** verifies the integrity of the image such as the author, date, RSA key ID, and status.

The current, or running, image displays a green check-mark beside it. If something happens, or an update causes an issue, click the **Roll Back and Reboot** button. This restores the system to a previous image.

![][12]

### Applications

The **Applications** screen displays a list of add-ons available for Cockpit. This makes it easy to find and install the plugins required by the user. At the time of this article, some of the options include the 389 Directory Service, Fleet Commander, and Subscription Manager. The demo below shows a complete list of available Cockpit add-ons.

Also, each item displays the name, a brief description, and a button to install, or remove, the add-on. Furthermore, clicking the item displays more information (if available). To refresh the list, click the icon at the top-right corner.

![][13]

### Subscription Management

Subscription managers allow admins to attach subscriptions to the machine. Even more, subscriptions give admins control over user access to content and packages. One example of this is the famous [Red Hat subscription model][14]. This feature works in relation to the **subscription-manager** command

The Subscriptions add-on can be installed via Cockpit’s Applications menu option. It can also be installed from the command-line with:

```
sudo dnf install cockpit-subscriptions
```

To begin, click **Subscriptions** in the main menu. If the machine is currently unregistered, it opens the **Register System** screen. Next, select the URL. You can choose **Default**, which uses Red Hat’s subscription server, or enter a **Custom URL**. Enter the **Login**, **Password**, **Activation Key**, and **Organization** ID. Finally, to complete the process, click the **Register** button.

The main page for Subscriptions show if the machine is registered, the System Purpose, and a list of installed products.

![][15]

### Services

To start, click the **Services** menu option. Because Cockpit uses _[systemd][16]_, we get the options to view **System Services**, **Targets**, **Sockets**, **Timers**, and **Paths**. Cockpit also provides an intuitive interface to help users search and find the service they want to configure. Services can also be filtered by it’s state: **All**, **Enabled**, **Disabled**, or **Static**. Below this is the list of services. Each row displays the service name, description, state, and automatic startup behavior.

For example, let’s take _bluetooth.service_. Typing _bluetooth_ in the search bar automatically displays the service. Now, select the service to view the details of that service. The page displays the status and path of the service file. It also displays information in the service file such as the requirements and conflicts. Finally, at the bottom of the page, are the logs pertaining to that service.

Also, users can quickly start and stop the service by toggling the switch beside the service name. The three-dots to the right of that switch expands those options to **Enable**, **Disable**, **Mask/Unmask** the service

To learn more about _systemd_, check out the series in the Fedora Magazine starting with [What is an init system?][17]

![][18]

In the next article we’ll explore the security features available in Cockpit.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/managing-software-and-services-with-cockpit/

作者：[Shaun Assam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sassam/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/11/cockpit-sw-services-816x345.jpg
[2]: https://fedoramagazine.org/cockpit-and-the-evolution-of-the-web-user-interface/
[3]: https://fedoramagazine.org/performing-storage-management-tasks-in-cockpit/
[4]: https://fedoramagazine.org/managing-network-interfaces-and-firewalld-in-cockpit/
[5]: https://fedoramagazine.org/managing-user-accounts-with-cockpit/
[6]: https://silverblue.fedoraproject.org/
[7]: https://getfedora.org/en/coreos/
[8]: https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux?intcmp=701f2000001OEGhAAO
[9]: https://www.centos.org/
[10]: https://fedoramagazine.org/wp-content/uploads/2019/11/cockpit-software-updates-rpm.gif
[11]: https://fedoramagazine.org/what-is-silverblue/
[12]: https://fedoramagazine.org/wp-content/uploads/2019/11/cockpit-software-updates-ostree.gif
[13]: https://fedoramagazine.org/wp-content/uploads/2019/11/cockpit-applications.gif
[14]: https://www.redhat.com/en/about/value-of-subscription
[15]: https://fedoramagazine.org/wp-content/uploads/2019/11/cockpit-subscriptions.gif
[16]: https://fedoramagazine.org/series/systemd-series/
[17]: https://fedoramagazine.org/what-is-an-init-system/
[18]: https://fedoramagazine.org/wp-content/uploads/2019/11/cockpit-services.gif
