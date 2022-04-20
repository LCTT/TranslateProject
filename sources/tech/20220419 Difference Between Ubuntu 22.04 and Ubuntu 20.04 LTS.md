[#]: subject: "Difference Between Ubuntu 22.04 and Ubuntu 20.04 LTS"
[#]: via: "https://www.debugpoint.com/2022/04/difference-ubuntu-22-04-20-04/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Difference Between Ubuntu 22.04 and Ubuntu 20.04 LTS
======
A LIST OF 10 SIGNIFICANT FEATURE DIFFERENCES BETWEEN UBUNTU 20.04 AND
UBUNTU 22.04 LTS FOR FOLKS TRANSITIONING FROM LTS TO LTS.
If you are a [Ubuntu 20.04 LTS Focal Fossa][1] user and plan to upgrade or install the latest [Ubuntu 22.04 LTS “Jammy Jellyfish”][2], this guide is for you. The primary aspect is there are significant and structural changes between these two LTS versions which is somewhat rare in terms of LTS releases. In one go, a lot changed if you compare both the LTS releases.

So, with that in mind, in this guide, we give you ten pointers that address the fundamental changes from an average user perspective and give you a heads up before you try the new Jammy Jellyfish.

### Ubuntu 22.04 LTS vs Ubuntu 20.04 LTS – Feature Difference

#### 1\. Logo, Colors and Plymouth

The first visual change that you notice is the base accent colour of Ubuntu changes to more “Orange” compared to two earlier “brown-orange”. Also, Canonical changed the Ubuntu official logo from this release onwards, and it is visible right from the Plymouth animation while booting. The new logo may look a little strange while you look at it for the first time, but it grows into you, eventually. I feel it’s a distinct logo in its way.

![New Ubuntu logo and Plymouth][3]

#### 2\. Installation

The default Ubuntu installer did not see any additional changes. We hoped that the new [Flutter based installer][4] would land, but it didn’t. With that said, the steps to installation remain the same. The only difference you may notice is the accent colour and cosmetic changes on the dialogue boxes and controls. Functionality wise, there is no change in the installation steps.

![Colour differences between two LTS Versions][5]

#### 3\. Lock and Login Screen, Desktop First look and Wallpaper

Furthermore, the lock and login screen colour gradient changes with more fine and borderless controls for the password box. The apparent difference is the stunning Jammy Jellyfish default wallpaper when you first log in. The desktop “Home” shortcut is renamed as Home than that of your username, and the Trash shortcut now goes to the left dock with a separator in the new Ubuntu 22.04 LTS.

In addition to that, the top bar didn’t change much. However, the system tray menu is little organised with more spacing and separators. There are mainly the changes coming from the [GNOME 42][6] changes.

The Calendar menu remained almost the same between both the LTS versions.

![Ubuntu 20.04 Vs Ubuntu 22.04 – Login Screen][7]

![Ubuntu 20.04 Vs Ubuntu 22.04 – Lock Screen][8]

![Difference between Ubuntu 20.04 and Ubuntu 22.04 – default look][9]

#### 4\. Desktop Layouts and GNOME Version Upgrades

The significant difference that users would see visually is the GNOME version change – GNOME 3.36 vs the GNOME 42. This is the significant difference that all users migrating to current LTS would face. The Ubuntu 22.04 LTS with GNOME 42 brings a horizontal workspace view alongside the horizontal application view. So, it would be a little weird to feel first time migrating from vertical to horizontal gestures. But you get used to it within a day or two.

If you use touch-based Laptops or screens, then the GNOME 42 gestures would give you some fluid feel with a bit of learning. Here’s how the desktop, applications and workspace view looks side by side.

![Activities View Difference – Ubuntu 20.04 and 22.04][10]

![Application View Difference – Ubuntu 20.04 and 22.04][11]

#### 5\. New Appearance Style with Accent Color

Moreover, one particular change which I would like to highlight here is new settings for light and dark modes. Earlier Ubuntu had three options for desktop looks – light, dark and a mixed one – Standard. This is completely changed and replaced by the GNOME 42’s built-in light and dark mode. In addition to that, a new Accent colour option is introduced (which is not part of vanilla GNOME 42) that enables you to change the colour across the desktop based on a selection of palettes.

However, you can not choose the custom accent colour yet, like KDE Plasma 🥰. Most of these changes come with the recent libadwaita and GTK4 port of GNOME Shell and native applications.

When you apply the dark mode in Ubuntu 22.04 – it applies automatically to all the supported applications. This is one of the fundamental differences with the Ubuntu 20.04 LTS.

![Accent Color and other changes][12]

![How Accent colour change impact looks in Ubuntu 22.04 LTS][13]

#### 6\. File Manager

The Files file manager version changes from 3.36.x to 42 in this release. The difference you see is the more compact design, well-defined spacing between controls and texts, and the top bar widgets style, thanks to GTK4 and underlying bug fixes. The address bar in Files is a little different, with a separator between directories, and the hamburger menu is at the end. Although, these minor changes would not impact much, and you may not feel much difference between the two LTS releases.

![Files Difference – Ubuntu 20.04 vs 22.04][14]

#### 7\. Screenshot Workflow difference between Ubuntu 22.04 and 20.04

Another notable change that requires a little learning for migrating users is how screenshots are captured. It changes completely. Earlier, you hit print-screen from the keyboard to take a screenshot and save the image file automatically in your Pictures folder. The workflow is different now with GNOME 42’s built-in screenshot and screen-recorder tool.

[][15]

SEE ALSO:   Ubuntu Budgie 22.04 LTS - New Features and Release Details

So, when you try to take a screenshot in Ubuntu 22.04 LTS, you see a screen below which gives you all the options, such as a screenshot of an area, an entire desktop or a specific window. Moreover, you have the option to show the cursor in a screenshot or want to record the screen. And when you hit the capture button, the tool saves the image file in the Pictures folder and in your clipboard.

![New Screenshot tool in Ubuntu 22.04 LTS][16]

Overall, an additional step change for your earlier workflow.

You get a new context menu, “Take a screenshot”, on the top bar right-click menu of all the application windows.

![Take Screenshot option in top bar menu][17]

#### 8\. Firefox Web Browser as Snap in Ubuntu 22.04

In addition to the above changes, the Firefox is now a snap version in Ubuntu 22.04 LTS if you compare it with the prior LTS version. The Firefox 97 in Ubuntu 20.04 was a deb package. So, if you are an average user, you may not see much difference.

However, Firefox Snap runs in a sandbox mode, which means users may face trouble while installing GNOME Extensions and may feel slow performance due to Snap in the same hardware used by Ubuntu 20.04 LTS.

I think it would be interesting to see how this significant snap migration of the most used applications of Ubuntu plays out in the coming days.

#### 9\. Difference in Settings Window between Ubuntu 22.04 and 20.04

Furthermore, a new panel is introduced in Settings, i.e. Multitasking. The Multitasking panel gives you options to tweak the hot corners and active screen edges. In addition to that, you can now specify the fixed number of workspace you want with the option to remove the empty workspace automatically. Other than that, if you use multiple displays, you have now options to show workspaces in the primary display or all displays.

![New Multitasking Panel in Settings][18]

#### 10\. Flavours and Application Updates

In addition to the above differences, the Software application changes bring different responsive looks and adapt to any form factor. The Software also brings a more different home page with the arrangement of applications as per categories and editor choice section.

Furthermore, the details page of any software shows essential information in a distinguishable manner with details such as total download size, ratings, safe marker and image carousels.

![GNOME Software – Home page difference][19]

![GNOME Software – Details page difference][20]

Finally, the under the hood differences between these two releases are spread across the packages, official desktop environment flavours and bug fixes. Here’s a quick summary of important packages.

**20.04** | **22.04**
---|---
GCC 10.3 | GCC 11.2
Hplip 3.20.3 | Hplip 3.21.12
LibreOffice 6.4.7 | LibreOffice 7.3.2
[not introduced] | Pipewire 0.3.48
Python3 3.8.2 | Python3 3.10.1
Samba 4.13 | Samba 4.15
Systemd 245.4 | Systemd 249.11

### Summary

To conclude the difference between Ubuntu 20.04 LTS and Ubuntu 22.04, I am compelled to say; that it is one of the biggest LTS releases from Ubuntu in terms of visual and feature changes.

I hope this guide showing the difference between Ubuntu 20.04 LTS and Ubuntu 22.04 gives you and many users a starting point on what to expect on their journey of Ubuntu 22.04 LTS and beyond.

Cheers.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][21], [Twitter][22], [YouTube][23], and [Facebook][24] and never miss an update!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/difference-ubuntu-22-04-20-04/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2021/08/ubuntu-20-04-3-release/
[2]: https://www.debugpoint.com/2022/01/ubuntu-22-04-lts/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/01/New-Ubuntu-logo-and-playmouth.jpg
[4]: https://github.com/canonical/ubuntu-desktop-installer
[5]: https://www.debugpoint.com/wp-content/uploads/2022/04/Colour-differences-between-two-LTS-Versions.jpg
[6]: https://www.debugpoint.com/2022/03/gnome-42-release/
[7]: https://www.debugpoint.com/wp-content/uploads/2022/04/Ubuntu-20.04-Vs-Ubuntu-22.04-Lock-and-Login-Screen-1024x431.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/04/Ubuntu-20.04-Vs-Ubuntu-22.04-Lock-Screen-1024x408.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/04/Difference-between-Ubuntu-20.04-and-Ubuntu-22.04-default-look-1024x421.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/04/Activities-View-Difference-Ubuntu-20.04-and-22.04-1024x425.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/04/Application-View-Difference-Ubuntu-20.04-and-22.04-1024x420.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/04/Accent-Color-and-other-changes-1024x417.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/04/How-Accent-colour-change-impact-looks-in-Ubuntu-22.04-LTS.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2022/04/Files-Difference-Ubuntu-20.04-vs-22.04-1024x359.jpg
[15]: https://www.debugpoint.com/2022/04/ubuntu-budgie-22-04-lts/
[16]: https://www.debugpoint.com/wp-content/uploads/2022/04/New-Screenshot-tool-in-Ubuntu-22.04-LTS.jpg
[17]: https://www.debugpoint.com/wp-content/uploads/2022/04/Take-Screenshot-option-in-top-bar-menu.jpg
[18]: https://www.debugpoint.com/wp-content/uploads/2022/04/New-Multitasking-Panel-in-Settings.jpg
[19]: https://www.debugpoint.com/wp-content/uploads/2022/04/GNOME-Software-Home-page-difference-1024x416.jpg
[20]: https://www.debugpoint.com/wp-content/uploads/2022/04/GNOME-Software-Details-page-difference-1024x417.jpg
[21]: https://t.me/debugpoint
[22]: https://twitter.com/DebugPoint
[23]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[24]: https://facebook.com/DebugPoint
