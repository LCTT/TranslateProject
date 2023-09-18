[#]: subject: "Contribute at Passkey Auth, Fedora CoreOS and IoT Test Week"
[#]: via: "https://fedoramagazine.org/contribute-at-passkey-auth-fedora-coreos-and-iot-test-week/"
[#]: author: "Sumantro Mukherjee https://fedoramagazine.org/author/sumantrom/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Contribute at Passkey Auth, Fedora CoreOS and IoT Test Week
======

![test days][1]

Fedora test days are events where anyone can help make certain that changes in Fedora Linux work well in an upcoming release. Fedora community members often participate, and the public is welcome at these events. If you’ve never contributed to Fedora Linux before, this is a perfect way to get started.

There are several test periods in the upcoming weeks.

  * **Thursday 21 September and Friday 22 September** , is to test **Passkey Auth**.
  * **Sunday 24 September through Sunday 01 October,** is to test **Fedora IoT Edition**.
  * **Monday 25 September through Monday October 02** , focuses on testing** Fedora CoreOS **.



### Passkey Auth

Passwordless authentication methods to log into Linux systems became a hot topic in the past few years. Various organizations started to mandate more secure methods of authentication, including governments and regulated industries. FIDO2 tokens, and smartcards, represent two passwordless authentication methods mandated by the US government in their Zero Trust architecture.

FreeIPA, and SSSD in Fedora 39, enable the capability to log-in to a desktop or a console terminal with a FIDO2-compatible device, for centrally managed users enrolled in Active Directory. This is supported by the libfido2 library. Additionally, for FreeIPA, once the user is authenticated with the FIDO2-compatible device, a Kerberos ticket may be issued .

As a part of this [changeset][2] , we will be having [test days][3] on **Thursday 21 September and Friday 22 September. **The idea is to run through test cases and submit results [here][4].

### Fedora IoT

For [this test week][5], the focus is all-around; test all the bits that come in a Fedora IoT release as well as validate different hardware. This includes:

  * Basic installation to different media
  * Installing in a VM
  * rpm-ostree upgrades, layering, rebasing
  * Basic container manipulation with Podman.



We welcome all different types of hardware, but have a specific [list of target hardware][6] for convenience. This test week will occur **Sunday 24 September through Sunday 01 October**.

### Fedora 39 CoreOS Test Week

The Fedora 39 CoreOS Test Week focuses on testing FCOS based on Fedora 39. The FCOS **next** stream is already rebased on Fedora 38 content, which will be coming soon to **testing** and **stable**. To prepare for the content being promoted to other streams the Fedora CoreOS and QA teams have organized test days from **Monday, 25** **September** **through** **2 October**. Refer to the [wiki page][5] for links to the test cases and materials you’ll need to participate. The FCOS and QA team will meet and communicate with the community in async over multiple matrix/element channels. The announcements will be made 48 hours prior to the start of test week. Stay tuned to official Fedora channels for more info.

### How do test days work?

Test days or weeks are an event where anyone can help make certain that changes in Fedora work well in an upcoming release. Fedora community members [often participate][7], and the public is welcome at these events. Test days are the perfect way to start contributing if you not in the past.

The only requirement to get started is the ability to download test materials (which include some large files) and then read and follow directions step by step.

Detailed information about all the test days are on the wiki page links provided above. If you are available on or around the days of the events, please do some testing and report your results.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/contribute-at-passkey-auth-fedora-coreos-and-iot-test-week/

作者：[Sumantro Mukherjee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sumantrom/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/03/Test_Days-816x345.jpg
[2]: https://fedoraproject.org/wiki/Changes/Passkey_authentication_centrally_managed_users
[3]: https://fedoraproject.org/wiki/Test_Day:2023-09-21_Passkey_authentication_centrally_managed_users
[4]: https://testdays.fedoraproject.org/events/168
[5]: http://fedoraproject.org/wiki/Test_Day:2023-09-24_Fedora_39_IoT_Edition
[6]: https://docs.fedoraproject.org/en-US/iot/reference-platforms/
[7]: https://fedoramagazine.org/?s=test+days
