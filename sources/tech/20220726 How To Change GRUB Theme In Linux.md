[#]: subject: "How To Change GRUB Theme In Linux"
[#]: via: "https://ostechnix.com/change-grub-theme-in-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Change GRUB Theme In Linux
======
Install And Apply Modern, Beautiful GRUB Themes In Linux

**GRUB**, stands for **GR**and **U**nified **B**ootloader, is default boot loader for most Linux operating systems. GRUB boot loader is the first program that runs when the computer starts. As you may noticed, the default theme of the GRUB menu is bland. It's just a black background with white characters on it. Some of you may not like the default GRUB theme. In this tutorial, I will demonstrate how to **change GRUB theme** or apply gorgeous themes in-order to make your GRUB menu more beautiful and elegant in Linux.

A few years ago, we published a guide that explained how to **[configure GRUB2 bootloader settings][1]** in Ubuntu. In that article, we showed you how to change the GRUB background.

But, changing background is not the real customization. In this guide, we are going to change not only the wallpaper but also the fonts, theme and the overall design of GRUB.

**Disclaimer:** Installing GRUB themes may break you system. I strongly recommend you to try and test a theme in a VM and see if it works without any issues. And then install the theme in the actual system.

### Introduction

There are many Community-developed GRUB themes available on Internet. However, they are all scattered across different websites. So finding a good GRUB theme might be little difficult and time-consuming.

One of the notable contributor for GRUB themes is **Pling** website. But the majority of the themes in Pling are either very basic or outdated.

Fortunately, I've come across a project called **"Gorgeous GRUB"**, a place for finding various elegant GRUB themes. Trust me, the author has put a good effort to collect these themes and you will definitely like one of them.

### Gorgeous GRUB - A Place To Find Decent GRUB Themes

**Gorgeous GRUB** is a collection of decent GRUB community themes created by various users. The developer of this project has hand-picked beautiful GRUB themes from **Pling**, **/r/unixporn** and many other forums and put them all together to make it easy for the users to browse them.

As stated already, so many themes in Pling are just crappy and outdated. The author of Gorgeous GRUB repository dug through the entire GRUB section of Pling, and a few other forums and put together all good GRUB theme in one place.

FYI, these aren't some low-quality, poorly made themes. They had a fair amount of effort put into them, with custom backgrounds, fonts, and colours.

Please note that Gorgeous GRUB isn't an application to install your favorite GRUB theme. It is just a curated list of decent working GRUB themes.

This project is hosted in GitHub. If you've any cool GRUB theme, you can add it to the Gorgeous GRUB theme list as well.

### How To Change GRUB Theme

Applying or changing GRUB themes is not that difficult.

Go to the **[Gorgeous GRUB GitHub page][2]** and click on the title of any theme you want to apply. And then you will be taken to the theme's actual home page. Some themes are hosted in **Pling** and some are hosted in **GitHub**. We will see how to install GRUB themes from Pling and GitHub.

First, let use see how to apply **Descent** theme, which is hosted in Pling.

#### 1. Install GRUB Theme From Pling

If the themes are hosted in Pling site, follow these instructions.

From the theme home page, click the **Files** tab. You will find this tab right under the image preview. Click on the file link to download it.

![Download GRUB Theme From Pling][3]

Go to the download location and extract the archive file.

```
$ tar xzf 173860-20150926\ descent.tar.gz
```

The contents of the archive will be extracted to a directory called **"descent"** in the current working directory.

Copy the "descent" directory to `/boot/grub/themes/` directory using the following command.

```
$ sudo cp -r descent/ /boot/grub/themes/
```

If the "themes" directory is not available, just create it.

```
$ sudo mkdir /boot/grub/themes
```

And assign proper ownership to the "themes" directory.

```
$ sudo chown $USER /boot/grub/themes/
```

And then copy the contents of the "descent" directory to "themes" directory as shown above.

You should now have a folder in the themes directory named after the theme.

```
$ ls /boot/grub/themes/
descent
```

And that theme folder (i.e. descent) should include the `theme.txt` and any other relevant files (e.g. background image, customization files) that theme came with.

```
$ ls /boot/grub/themes/descent/
background1280x800.png    descent_score_14.pf2  menu_ne.png  menu_s.png         progresshigh_c.png  scrollframe_c.png   scroll_thumb_n.png
background_original.jpg   descent_score_18.pf2  menu_n.png   menu_sw.png        progresshigh_e.png  scrollframe_n.png   scroll_thumb_s.png
copyright                 menu_c.png            menu_nw.png  menu_w.png         progresshigh_w.png  scrollframe_s.png   select_os.png
descent_logo_bold_18.pf2  menu_e.png            menu_se.png  progressbar_c.png  readme              scroll_thumb_c.png  theme.txt
```

After copying the downloaded theme to `/boot/grub/themes/` directory, edit `/etc/default/grub` file.

Before any changes, please backup the grub file, just in case:

```
$ sudo cp /etc/default/grub /etc/default/grub.bak
```

Now edit the file with your preferred editor:

```
$ sudo nano /etc/default/grub
```

Find the `GRUB_THEME=` line and add the path to the `theme.txt` of the theme you want to use. And also, uncomment the `GRUB_GFXMODE=` line and enter the background image resolution. Usually, the filename of background image contains its resolution (e.g. background1280x800.png).

```
[...]
GRUB_THEME=/boot/grub/themes/descent/theme.txt
GRUB_GFXMODE=1280x800
[...]
```

![Enter Theme Txt File Path And Background Image Resolution][4]

Again, if those lines does not exist, simply add them. Press **CTRL+O** and **CTRL+X** to save the changes and close the file.

Now, apply the changes to the GRUB using command:

```
$ sudo update-grub
```

**Sample output:**

```
Sourcing file `/etc/default/grub'
Sourcing file `/etc/default/grub.d/init-select.cfg'
Generating grub configuration file ...
Found theme: /boot/grub/themes/descent/theme.txt
Found linux image: /boot/vmlinuz-5.15.0-41-generic
Found initrd image: /boot/initrd.img-5.15.0-41-generic
Found linux image: /boot/vmlinuz-5.15.0-39-generic
Found initrd image: /boot/initrd.img-5.15.0-39-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
Warning: os-prober will not be executed to detect other bootable partitions.
Systems on them will not be added to the GRUB boot configuration.
Check GRUB_DISABLE_OS_PROBER documentation entry.
done
```

![Update GRUB][5]

If you're on RPM-based systems (E.g. Fedora), run the following command to update GRUB:

```
$ sudo grub2-mkconfig -o /boot/grub2/grub.cfg instead
```

Reboot your system. You will be pleased with the updated GRUB theme. If the GRUB menu doesn't appear, power on the system and immediately hit the ESC key until the boot menu appears.

This is the default GRUB menu in my Ubuntu 22.04 LTS desktop.

![Ubuntu Default Grub Menu][6]

And here is the updated GRUB menu with Descent theme.

![Updated GRUB Menu With Descent Theme][7]

Cool, yeah?

##### 1.1. Remove GRUB Theme

To remove a theme, simply delete the theme folder:

```
$ sudo rm -fr /boot/grub/themes/descent/
```

And then edit `/etc/default/grub` file:

```
$ sudo nano /etc/default/grub
```

Remove the following lines:

```
[...]
GRUB_THEME=/boot/grub/themes/descent/theme.txt
GRUB_GFXMODE=1280x800
[...]
```

Save the file and close it.

Finally, apply the changes to the GRUB and reboot your system:

```
$ sudo update-grub
```

```
$ sudo reboot
```

#### 2. Install GRUB Themes From GitHub

If a GRUB theme is hosted in GitHub, it will probably has the installer and uninstaller scripts. Let us take **[Modern GRUB Themes][8]** as an example. It is hosted in GitHub.

Git clone the project's GitHub repository:

```
$ git clone https://github.com/vinceliuice/grub2-themes.git
```

Go to the project's folder:

```
$ cd grub2-themes/
```

Run the installer script:

```
$ sudo ./install.sh
```

Select your preferred GRUB theme background (E.g. tela).

![Choose GRUB Theme Background][9]

Select icon style:

![Choose Icon Style][10]

Select your display resolution.

![Choose Display Resolution][11]

Now the chosen GRUB theme will be installed and applied.

```
Checking for the existence of themes directory... 
  
 Installing tela color 1080p theme... 
  
 Setting tela as default... 
  
 Updating grub config...
 
Sourcing file `/etc/default/grub'
Sourcing file `/etc/default/grub.d/init-select.cfg'
Generating grub configuration file ...
Found theme: /usr/share/grub/themes/tela/theme.txt
Found linux image: /boot/vmlinuz-5.15.0-41-generic
Found initrd image: /boot/initrd.img-5.15.0-41-generic
Found linux image: /boot/vmlinuz-5.15.0-39-generic
Found initrd image: /boot/initrd.img-5.15.0-39-generic
Found memtest86+ image: /boot/memtest86+.elf
Found memtest86+ image: /boot/memtest86+.bin
Warning: os-prober will not be executed to detect other bootable partitions.
Systems on them will not be added to the GRUB boot configuration.
Check GRUB_DISABLE_OS_PROBER documentation entry.
done
  
 * All done! 
  
 * At the next restart of your computer you will see your new Grub theme: 'tela'
```

![Install Tela Modern Grub Theme][12]

Reboot your system to see the changes.

![Tela GRUB Theme][13]

This is one of the pretty GRUB theme ever I've seen.

You can also explicitly give the name of the theme with screen resolution like below.

```
$ sudo ./install.sh -t whitesur -s 1080p
```

This will apply a theme called "Whitesur" with 1080p screen resolution. You can mention other resolutions, for example 2k, 4k, ultrawide, ultrawide2k. If you don't mention the resolution, 1080p will be applied by default.

Install Tela theme to `/boot/grub/themes` folder:

```
$ sudo ./install.sh -b -t whitesur
```

Reboot your system to see the changes.

![Whitesur GRUB Theme][14]

##### 2.1. Remove GRUB Themes

To remove an installed theme, go to the project's cloned directory:

```
$ cd grub2-themes/
```

And, run:

```
$ sudo ./install.sh -r -t tela
```

Replace "tela" with the name of your installed theme.

Please note that the installation instructions for each theme might be different. Refer the project's respective GitHub page carefully and install the theme accordingly.

### Conclusion

Some people prefer to use stylized Linux distributions. They feel good and took pride in beautifying their Linux distributions. If you're one of them, you can look into the Gorgeous GRUB project to beautify your GRUB menu.

Got to the Gorgeous GRUB theme site, pick your favorite theme from the list and follow the instructions provided in the respective project's home page to install and apply the GRUB theme.

**Resource:**

* [Gorgeous GRUB GitHub Repository][15]

--------------------------------------------------------------------------------

via: https://ostechnix.com/change-grub-theme-in-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/configure-grub-2-boot-loader-settings-ubuntu-16-04/
[2]: https://github.com/jacksaur/Gorgeous-GRUB
[3]: https://ostechnix.com/wp-content/uploads/2022/07/Download-GRUB-Theme-From-Pling.png
[4]: https://ostechnix.com/wp-content/uploads/2022/07/Enter-Theme-Txt-File-Path-And-Background-Image-Resolution.png
[5]: https://ostechnix.com/wp-content/uploads/2022/07/Update-GRUB.png
[6]: https://ostechnix.com/wp-content/uploads/2022/07/Ubuntu-Default-Grub-Menu.png
[7]: https://ostechnix.com/wp-content/uploads/2022/07/Updated-GRUB-Menu.png
[8]: https://github.com/vinceliuice/grub2-themes
[9]: https://ostechnix.com/wp-content/uploads/2022/07/Choose-GRUB-Theme-Background.png
[10]: https://ostechnix.com/wp-content/uploads/2022/07/Choose-Icon-Style.png
[11]: https://ostechnix.com/wp-content/uploads/2022/07/Choose-Display-Resolution.png
[12]: https://ostechnix.com/wp-content/uploads/2022/07/Install-Tela-Modern-Grub-Theme.png
[13]: https://ostechnix.com/wp-content/uploads/2022/07/Tela-GRUB-Theme.png
[14]: https://ostechnix.com/wp-content/uploads/2022/07/Whitesur-GRUB-Theme-1.png
[15]: https://github.com/jacksaur/Gorgeous-GRUB
