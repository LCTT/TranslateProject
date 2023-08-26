[#]: subject: "7 Things You Never Knew You Could Do in GNOME's Activity Search"
[#]: via: "https://itsfoss.com/gnome-search/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

7 Things You Never Knew You Could Do in GNOME's Activity Search
======

In an earlier article, I shared tips for [mastering search in the Nautilus file manager][1].

In this tutorial, I'll tell you many of the ignored search features in the GNOME Activity area.

If you are not aware of the technical term 'GNOME Activities', you can access it by clicking the Activities button in the top left corner in the GNOME desktop environment,

![Click on Activities to access it][2]

You can also press the Super key (Windows key) to get the same.

![GNOME Search Interface][3]

Yes. GNOME has quite a powerful built-in search feature and yet many people use it to search for applications and run them.

![Most people use the GNOME Activities to search and run apps][4]

But it has several more features that may come in handy and make you feel like a pro user.

Let's see them one by one.

### 1\. Desktop wide file search

This is similar to opening apps. When you start typing something in the search area, you can see things changing continually. If some file is matched with your query, you can open it using the default application, by clicking on the name of the file, or pressing Enter.

![File Search][5]

On the same interface, you can see that there is a small preview for each file. Also, each file listed here is associated with its absolute location.

If you look closely, you can also find the file manager icon here. Now, click on the file manager icon.

![File Manager Icon][6]

This will open the Nautilus file manager in search mode, where you can see all the files matched by the query.

![Nautilus File manager in search mode][7]

Similarly, if you press the icon of the app associated with the bulk search result, then that application, along with the suggested results, is opened.

💡

If you have GNOME Sushi installed, you can now preview these files in full mode before starting to work with them.

### 2\. Copy emojis and special characters

GNOME has an application called `gnome-characters`. This provides you with several emojis and related characters. If you don't have this application, you can install it using:

```

    sudo apt install gnome-characters

```

Once installed, this application has its own search provider. This means that you can search for any character name. You can see various suggestions as you type.

![Characters in Search Overview][8]

Once you find some character, press Enter so that the selected character will be copied to your clipboard. You can paste it using CTRL+V.

![Character Copied][9]

**Suggested Read 📖**

![][10]

### 3\. Calculate without opening calculator app

Use the GNOME Shell search as a quick calculator. If you have to do some simple math calculations, there is no need to open the calculator app for this.

Instead, do it in GNOME activity itself.

![Get Calculation Results][11]

You can copy the result to clipboard also.

### 4\. Get world clock

Want to know what time it is in another city? Why use some widgets and programs when GNOME shell can give you the time in a city by entering its name?

![World clock in GNOME Shell Search][12]

### 5\. Move between running terminal windows

Let's say you are running multiple terminal windows or multiple tabs in one terminal window with different active commands, like `top`, reading a file using `bat or less` etc.,

You can move to a particular terminal window, that is running a specific command by entering the command name in shell search.

![Get terminal window][13]

You can see that I am running `top` in one of my terminals and I can go directly into that. If it's different tabs, it will switch you to the particular tab running that particular command.

### 6\. Perform a web search

You can access the Firefox web search directly through the GNOME Shell. In order to make this work, you should need to open Firefox in the background.

![Firefox as a search provider in Settings][14]

Once Firefox runs, you can search for web results on the activities overview. Also, you can reorder the Firefox appearance as you like in the system settings.

![Firefox search results][15]

🚧

Unfortunately, on my Fedora 38 system, I couldn't get any search results from Firefox, even though it's a provider. And the one on Manjaro worked just as intended.

If you are using other distros, you can access web search results on shell search using Epiphany or GNOME Web browser. First, install Epiphany, either using your Package manager:

```

    sudo apt install epiphany

```

Or, from Flathub:

```

    flatpak install flathub org.gnome.Epiphany

```

Once installed, open the settings and go to the search features. You can see that, an entry for GNOME Web has been appeared there.

![GNOME Web in search settings][16]

Simply toggle on, if it's off. It will work even if GNOME Web is closed.

![Web results in search using GNOME Web][17]

💡

If a new app is installed that provides some kind of search function, it will be listed on the searches tab.

### 7\. Managing Search Appearance

It is possible to reorder the appearance, disable some results, etc. using system settings.

#### Access search settings in System Settings app

Open System settings and go to the search tab.

![Search Tab in Settings][18]

#### Reorder Search Results Appearance

Upon opening the searches, you can see all the available providers listed. On each of the item, you can see a handle to the left side and three dots menus on the right side.

![Buttons and Handles to arrange items][19]

Either drag one item with the left side handle and place it to the required space.

![Drag and drop to arrange order of Appearance][20]

Or, click on the three dot menu and select “Move Up” or “Move Down”.

![Move up or down using buttons][21]

This arranged settings will be the new order in which the searches will appear on GNOME shell search results.

#### Manage Individual File Locations

Tweak the locations searched by system apps like Files, Photos, Videos etc. by going to **Search Locations** on the searches tab.

![][22]

Now, toggle on or off for disabling existing locations. Or Add new locations by clicking on the Add button.

![Add Remove Locations][23]

#### Enable or disable a search provider from the search

If you are not using some of the search providers, you can free up some space on the search interface by disabling some unused search providers. For this, toggle off the particular provider using the toggle button on the right side of each item.

![Enable – Disable Toggle][24]

You can always turn it back on, by toggling the same button to on position.

#### Disable search altogether

Disable the in-app searches in GNOME Shell altogether by toggling off the **App Search** button.

![Disable Search in Overview][25]

Only Applications can be searched, and the search results will be hidden from view.

![Inside App search is disabled][26]

### Bonus Tip: Extensions to make search more effective

There are several GNOME extensions that will make your search more accessible and productive.

#### Quick web search

This extension, called Quick Web Search, will add a search option for DuckDuckGo. Whenever we search some terms on the shell search, a DuckDuckGo icon will appear. Click on it, to open it on your preferred browser.

![DuckDuckGo Search in Shell][27]

This works even if all the browser instances are closed. Also, you can change the search provider to Google and others by using the extension settings.

[Get Quick Web Search][28]

#### GNOME Fuzzy app search

It gives fuzzy application search results for Gnome Search. So even if you have misspelled or wrongly typed some names, it will try its best to match with a result.

![GNOME search using Fuzzy Search][29]

[Get GNOME Fuzzy App Search][30]

### Get more out of GNOME

As you can see, you probably never used all of these GNOME search features. Or perhaps never paid enough attention to them.

At It's FOSS we take pride and feel joy in sharing such lesser-known features with our readers.

Here are a few more such articles that a GNOME user may find interesting.

![][10]

![][10]

![][10]

![][10]

🗨 I hope you liked this collection of tips. Please leave your suggestion in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-search/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/nautilus-file-search/
[2]: https://itsfoss.com/content/images/2023/08/click-on-activities.png
[3]: https://itsfoss.com/content/images/2023/08/GNOME-Search-interface.png
[4]: https://itsfoss.com/content/images/2023/08/installed-apps-in-search.png
[5]: https://itsfoss.com/content/images/2023/08/file-search.png
[6]: https://itsfoss.com/content/images/2023/08/file-manager-icon-highlighted.png
[7]: https://itsfoss.com/content/images/2023/08/nautilus-file-manager-in-search-mode.png
[8]: https://itsfoss.com/content/images/2023/08/characters-in-search-overview.png
[9]: https://itsfoss.com/content/images/2023/08/character-copied-to-clipboard-message.png
[10]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[11]: https://itsfoss.com/content/images/2023/08/get-math-result.png
[12]: https://itsfoss.com/content/images/2023/08/get-time.png
[13]: https://itsfoss.com/content/images/2023/08/get-terminal.png
[14]: https://itsfoss.com/content/images/2023/08/firefox-as-a-search-provider-in-settings.png
[15]: https://itsfoss.com/content/images/2023/08/firefox-search.png
[16]: https://itsfoss.com/content/images/2023/08/GNOME-Web-in-search-settings.png
[17]: https://itsfoss.com/content/images/2023/08/gnome-web-results-in-search.png
[18]: https://itsfoss.com/content/images/2023/08/search-tab-in-settings.png
[19]: https://itsfoss.com/content/images/2023/08/button-to-arrage-items.png
[20]: https://itsfoss.com/content/images/2023/08/arrage-order-in-searches.gif
[21]: https://itsfoss.com/content/images/2023/08/move-up-and-down.gif
[22]: https://itsfoss.com/content/images/2023/08/search-locations.png
[23]: https://itsfoss.com/content/images/2023/08/Add-remove-locations.png
[24]: https://itsfoss.com/content/images/2023/08/enable-disable-toggle-button.png
[25]: https://itsfoss.com/content/images/2023/08/Disable-search-rsults.png
[26]: https://itsfoss.com/content/images/2023/08/no-in-app-searches.png
[27]: https://itsfoss.com/content/images/2023/08/ddg-web-search-plugin.png
[28]: https://extensions.gnome.org/extension/6051/quick-web-search/?ref=itsfoss.com
[29]: https://itsfoss.com/content/images/2023/08/no-result-in-misspell.png
[30]: https://extensions.gnome.org/extension/3956/gnome-fuzzy-app-search/?ref=itsfoss.com
