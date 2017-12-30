How to Use GNOME Shell Extensions [Complete Guide]
======
**Brief: This is a detailed guide showing you how to install GNOME Shell Extensions manually or easily via a browser. **

While discussing [how to install themes in Ubuntu 17.10][1], I briefly mentioned GNOME Shell Extension. It was used to enable user themes. Today, we'll have a detailed look at GNOME Shell Extensions in Ubuntu 17.10.

I may use the term GNOME Extensions instead of GNOME Shell Extensions but both have the same meaning here.

What are GNOME Shell Extensions? How to install GNOME Shell Extensions? And how to manage and remove GNOME Shell Extensions? I'll explain all these questions, one by one.

Before that, if you prefer video, I have demonstrated all these on [It's FOSS YouTube channel][2]. I highly recommend that you subscribe to it for more Linux videos.

## What is a GNOME Shell Extension?

A [GNOME Shell Extension][3] is basically a tiny piece of code that enhances the capability of GNOME desktop.

Think of it as an add-on in your browser. For example, you can install an add-on in your browser to disable ads. This add-on is developed by a third-party developer. Though your web browser doesn't provide it by default, installing this add-on enhances the capability of your web browser.

Similarly, GNOME Shell Extensions are like those third-party add-ons and plugins that you can install on top of GNOME. These extensions are created to perform specific tasks such as display weather condition, internet speed etc. Mostly, you can access them in the top panel.

![GNOME Shell Extension in action][5]

There are also GNOME Extensions that are not visible on the top panel. But they still tweak GNOME's behavior. For example, middle mouse button can be used to close an application with one such extension.

## Installing GNOME Shell Extensions

Now that you know what are GNOME Shell Extensions, let's see how to install them. There are three ways you can use GNOME Extensions:

  * Use a minimal set of extensions from Ubuntu (or your Linux distribution)
  * Find and install extensions in your web browser
  * Download and manually install extensions



Before you learn how to use GNOME Shell Extensions, you should install GNOME Tweak Tool. You can find it in the Software Center. Alternatively, you can use this command:
```
sudo apt install gnome-tweak-tool
```

At times, you would also need to know the version of GNOME Shell you are using. This helps in determining whether an extension is compatible with your system or not. You can use the command below to find it:
```
gnome-shell --version
```

### 1\. Use gnome-shell-extensions package [easiest and safest way]

Ubuntu (and several other Linux distributions such as Fedora) provide a package with a minimal set of GNOME extensions. You don't have to worry about the compatibility here as it is tested by your Linux distribution.

If you want a no-brainer, just get this package and you'll have 8-10 GNOME extensions installed.
```
sudo apt install gnome-shell-extensions
```

You'll have to reboot your system (or maybe just restart GNOME Shell, I don't remember it at this point). After that, start GNOME Tweaks and you'll find a few extensions installed. You can just toggle the button to start using an installed extension.

![Change GNOME Shell theme in Ubuntu 17.1][6]

### 2. Install GNOME Shell extensions from a web browser

GNOME project has an entire website dedicated to extensions. That's not it. You can find, install, and manage your extensions on this website itself. No need even for GNOME Tweaks tool.

[GNOME Shell Extensions Website][3]

But in order to install extensions a web browser, you need two things: a browser add-on and a native host connector in your system.

#### Step 1: Install browser add-on

When you visit the GNOME Shell Extensions website, you'll see a message like this:

> "To control GNOME Shell extensions using this site you must install GNOME Shell integration that consists of two parts: browser extension and native host messaging application."

![Installing GNOME Shell Extensions][7]

You can simply click on the suggested add-on link by your web browser. You can install them from the link below as well:

#### Step 2: Install native connector

Just installing browser add-on won't help you. You'll still see an error like:

> "Although GNOME Shell integration extension is running, native host connector is not detected. Refer documentation for instructions about installing connector"

![How to install GNOME Shell Extensions][8]

This is because you haven't installed the host connector yet. To do that, use this command:
```
sudo apt install chrome-gnome-shell
```

Don't worry about the 'chrome' prefix in the package name. It has nothing to do with Chrome. You don't have to install a separate package for Firefox or Opera here.

#### Step 3: Installing GNOME Shell Extensions in web browser

Once you have completed these two requirements, you are all set to roll. Now when you go to GNOME Shell Extension, you won't see any error message.

![GNOME Shell Extension][9]

A good thing to do would be to sort the extensions by your GNOME Shell version. It is not mandatory though. What happens here is that a developer creates an extension for the present GNOME version. In one year, there will be two more GNOME releases. But the developer didn't have time to test or update his/her extension.

As a result, you wouldn't know if that extension is compatible with your system or not. It's possible that the extension works fine even in the newer GNOME Shell version despite that the extension is years old. It is also possible that the extension doesn't work in the newer GNOME Shell.

You can search for an extension as well. Let's say you want to install a weather extension. Just search for it and go for one of the search results.

When you visit the extension page, you'll see a toggle button.

![Installing GNOME Shell Extension ][10]

Click on it and you'll be prompted if you want to install this extension:

![Install GNOME Shell Extensions via web browser][11]

Obviously, go for Install here. Once it's installed, you'll see that the toggle button is now on and there is a setting option available next to it. You can configure the extension using the setting option. You can also disable the extension from here.

![Configuring installed GNOME Shell Extensions][12]

You can also configure the settings of an extension that you installed via the web browser in GNOME Tweaks tool:

![GNOME Tweaks to handle GNOME Shell Extensions][13]

You can see all your installed extensions on the website under [installed extensions section][14]. You can also delete the extensions that you installed via web browser here

![Manage your installed GNOME Shell Extensions][15]

One major advantage of using the GNOME Extensions website is that you can see if there is an update available for an extension. You won't get it in GNOME Tweaks or system update.

### 3. Install GNOME Shell Extensions manually

It's not that you have to be always online to install GNOME Shell extensions. You can download the files and install it later, without needing internet.

Go to GNOME Extensions website and download the extension with the latest version.

![Download GNOME Shell Extension][16]

Extract the downloaded file. Copy the folder to **~/.local/share/gnome-shell/extensions** directory. Go to your Home directory and press Crl+H to show hidden folders. Locate .local folder here and from there, you can find your path till extensions directory.

Once you have the files copied in the correct directory, go inside it and open metadata.json file. Look for the value of uuid.

Make sure that the name of the extension's folder is same as the value of uuid in the metadata.json file. If not, rename the directory to the value of this uuid.

![Manually install GNOME Shell extension][17]

Almost there! Now restart GNOME Shell. Press Alt+F2 and enter r to restart GNOME Shell.

![Restart GNOME Shell][18]

Restart GNOME Tweaks tool as well. You should see the manually installed GNOME extension in the Tweak tool now. You can configure or enable the newly installed extension here.

And that's all you need to know about installing GNOME Shell Extensions.

## Remove GNOME Shell Extensions

It is totally understandable that you might want to remove an installed GNOME Shell Extension.

If you installed it via a web browser, you can go to the [installed extensions section on GNOME website][14] and remove it from there (as shown in an earlier picture).

If you installed it manually, you can remove it by deleting the extension files from ~/.local/share/gnome-shell/extensions directory.

## Bonus Tip: Get notified of GNOME Shell Extensions updates

By now you have realized that there is no way to know if an update is available for a GNOME Shell extension except for visiting the GNOME extension website.

Luckily for you, there is a GNOME Shell Extension that notifies you if there is an update available for an installed extension. You can get it from the link below:

[Extension Update Notifier][19]

### How do you manage GNOME Shell Extensions?

I find it rather weird that you cannot update the extensions via the system updates. It's as if GNOME Shell extensions are not even part of the system.

If you are looking for some recommendation, read this article about [best GNOME extensions][20]. At the same time, share your experience with GNOME Shell extensions. Do you often use them? If yes, which ones are your favorite?

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-shell-extensions/

作者：[Abhishek Prakash][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/install-themes-ubuntu/
[2]:https://www.youtube.com/c/itsfoss?sub_confirmation=1
[3]:https://extensions.gnome.org/
[5]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-weather.jpeg
[6]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/enableuser-themes-extension-gnome.jpeg
[7]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-1.jpeg
[8]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-2.jpeg
[9]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-3.jpeg
[10]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-4.jpeg
[11]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-5.jpeg
[12]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-6.jpeg
[13]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-7-800x572.jpeg
[14]:https://extensions.gnome.org/local/
[15]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-8.jpeg
[16]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-9-800x456.jpeg
[17]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/gnome-shell-extension-installation-10-800x450.jpg
[18]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2017/11/restart-gnome-shell-800x299.jpeg
[19]:https://extensions.gnome.org/extension/1166/extension-update-notifier/
[20]:https://itsfoss.com/best-gnome-extensions/
