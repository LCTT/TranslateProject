[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is End of Life in Ubuntu? Everything You Should Know About it)
[#]: via: (https://itsfoss.com/end-of-life-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

What is End of Life in Ubuntu? Everything You Should Know About it
======

If you have been following It’s FOSS for some time, you might have noticed that I publish news articles like Ubuntu XYZ version has reached end of life (EoL).

This end of life is one of those essential concepts that every Ubuntu user should be aware of.

This is why I decided to write this detailed guide to explain what does an Ubuntu release reaching end of life means, why it matters to you and how to check when your Ubuntu install has reaches end of life.

### What is end of life in Ubuntu?

![][1]

First thing first, end of life is not really an Ubuntu-specific concept. It is a generic term widely used in the software industry.

The end of life of a software means the software has reached the end of its predefined support period. Beyond this date, the software won’t get any feature, maintenance or security updates.

You may continue using the software past its end of life date but at your own risk. If there are security vulnerability, your system and data will be at risk.

Compare it to the use by date or the expiry date on a food item. You may consume the yogurt one day after its use by date but can you eat it after a week or a month?

#### Why end of life?

Software is not a living being then why they have an end of life? Why doesn’t Ubuntu just keep on supporting one version forever?

It is to maintain a balance between stability and features. You want new features in your system but you don’t want it to break your system. Software compatibility is complex and testing takes time.

So what Ubuntu does is to give you a release and takes the responsibility of maintaining it by providing security and other updates for a certain time period.

Ubuntu team and volunteers also work on the new release in parallel to add new features to the future release.

#### Support life cycle of Ubuntu releases

Ubuntu has two new version releases every year. These releases can be categorized into:

  * Regular release with 9 months of support period
  * Long-term support (LTS) release with 5 years of support period



A new LTS version is released every two years while the regular releases come every six months.

This table should give you a better understanding:

Ubuntu Version | Release | End of Life
---|---|---
Ubuntu 18.04 (LTS) | April, 2018 | April, 2023 (5 years)
Ubuntu 18.10 | October, 2018 | July, 2019 (9 months)
Ubuntu 19.04 | April, 2019 | January, 2020 (9 months)
Ubuntu 19.10 | October, 2019 | July, 2020 (9 months)
Ubuntu 20.04 (LTS) | April, 2020 | April, 2025 (5 years)
Ubuntu 20.10 | October, 2020 | July, 2021 (9 months)

The long-term support release focus on providing stability for a longer period. You probably know that Linux distributions like Ubuntu are also responsible for providing applications to you. These distributions have thousands of applications/packages in their repositories.

The LTS versions often hold on to software versions as they cannot test every new version of so many software in the five years of support period.

When Ubuntu releases a new LTS version, it also updates a number of software to a newer version. For example, Ubuntu 18.04 LTS has PHP 7.2 whereas Ubuntu 20.04 LTS has PHP 7.4 available.

The regular release are short-live, but they bring new features (like newer versions of software like file managers, desktop environments, newer kernels etc).

Personally, I think of these regular releases as a stepping platform for the next LTS releases. For examples, the features introduced in Ubuntu 18.10, 19.04, 19.10 will eventually be added in Ubuntu 20.04 (but not in 18.04).

#### How to check how long your Ubuntu system will be supported?

The simplest way to check the end of life support in Ubuntu is using this command in the terminal:

```
hwe-support-status --verbose
```

It will show an output that mentions the support period of your Ubuntu version.

```
You are not running a system with a Hardware Enablement Stack. Your system is supported until April 2025.
```

The [Hardware Enablement Stack in Ubuntu][2] allows you to receive the latest generic Linux kernel supported by Ubuntu. The important part is the support status date.

If you want a detailed overview of how many software packages you have got and how long those packages will be supported, you can use the ubuntu-security-status command:

```
ubuntu-security-status
```

**In older versions of Ubuntu, the same command is known as ubuntu-support-status.** For both commands, the output is nearly identical:

```
[email protected]:~$ ubuntu-security-status
2242 packages installed, of which:
1695 receive package updates with LTS until 4/2025
 510 could receive security updates with ESM Apps until 4/2030
  30 packages are from third parties
   7 packages are no longer available for download

Packages from third parties are not provided by the official Ubuntu
archive, for example packages from Personal Package Archives in
Launchpad.
For more information on the packages, run 'ubuntu-security-status
--thirdparty'.

Packages that are not available for download may be left over from a
previous release of Ubuntu, may have been installed directly from a
.deb file, or are from a source which has been disabled.
For more information on the packages, run 'ubuntu-security-status
--unavailable'.

Enable Extended Security Maintenance (ESM Apps) to get 0 security
updates (so far) and enable coverage of 510 packages.

This machine is not attached to an Ubuntu Advantage subscription.
See https://ubuntu.com/advantage
```

As you can see in the above output, my system will majorly get supported till April 2025. Ubuntu can provide maintenance support for 510 packages till April 2030 but you’ll have to purchase the ESM.

The ESM is more useful to mission-critical business infrastructure where upgrading to a newer version of the OS will impact the business. For desktop users, upgrading to a newer version is easier and more sensible thing to do.

#### What happens when your Ubuntu install reaches end of life? What if you continue using Ubuntu even after its end of life?

When your Ubuntu install reaches end of life, it stops getting system updates including any security updates. There won’t be updates for installed software as well.

Without the security updates your system will become vulnerable to hacking attacks (if you connect to internet). Suppose a vulnerability gets discovered in one of the software you use or even in Linux kernel. You don’t get the update so this vulnerability is not patched and some malicious hackers take advantage of it to steal your data.

Eventually, you’ll not be able to use the Ubuntu repositories. If you try to install a new application, you’ll see ‘[unable to locate package error][3]‘.

So, basically, you won’t be able to install new software and your system will be at risk. Not a pretty scenario.

The worst part is that if you wait way too long, you won’t be able to upgrade to the newer version. For example, a system running 17.04 can no longer update to 17.10 because even 17.10 is not supported anymore. A [fresh new Ubuntu installation][4] is the only suggested option in such case.

#### What should you do when your Ubuntu install reaches end of life?

Ubuntu doesn’t just abandon you after your system reaches end of life. It notifies you either in terminal or on the desktop that your system is no longer supported.

![Ubuntu No Longer Supported][5]

It even provides a mechanism to [upgrade your current Ubuntu version to the newer version][6]. Most of the software you have currently installed and your pictures, videos and other documents remain as it is. Making a backup of your important data on an external disk is still recommended.

![Upgrade to Ubuntu 20.04 From 18.04][7]

The rule of thumb is:

  * if you are using an LTS release, you should upgrade when the next LTS version is available.
  * if you are using a regular release, you should upgrade whenever the next version is available.



#### Still confused?

I wrote this article because this is one of the most common confusion for It’s FOSS readers. I hope it clears the air and you have a better understanding of Ubuntu release cycle.

If you still have doubts, please feel free to ask your question in the comment section. I’ll be happy to answer your queries.

--------------------------------------------------------------------------------

via: https://itsfoss.com/end-of-life-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/end-of-life-ubuntu.png?ssl=1
[2]: https://itsfoss.com/ubuntu-hwe-kernel/
[3]: https://itsfoss.com/unable-to-locate-package-error-ubuntu/
[4]: https://itsfoss.com/install-ubuntu/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/ubuntu-no-longer-supported.png?ssl=1
[6]: https://itsfoss.com/upgrade-ubuntu-version/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/upgrade-ubuntu-20-04-from-18-04.jpg?ssl=1
