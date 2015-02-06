>    Vic

Linux FAQs with Answers--How to fix “Your profile could not be opened correctly” on Google Chrome
================================================================================
> **Question**: When I open Google Chrome web browser on my Linux box, I have several pop-up messages saying "Your profile could not be opened correctly." This error happens every time I open Google Chrome. How can I solve this error? 

When you see an error message saying "Your profile could not be opened correctly" on your Google Chrome web browser," that is because somehow your profile data on Google Chrome got corrupted. This can happen while you upgrade your Google Chrome browser manually on Linux.

![](https://farm8.staticflickr.com/7428/16238502737_27bdda6685_o.png)

Depending on exactly which file got corrupted, you can try one of these methods.

### Method One ###

Close all your Chrome browser windows/tabs.

Go to ~/.config/google-chrome/Default, and remove/rename "Web Data" file as below.

    $ cd ~/.config/google-chrome/Default
    $ rm "Web Data" 

Re-open Google Chrome browser.

### Method Two ###

Close all your Chrome browser windows/tabs.

Go to ~/.config/google-chrome/"Profile 1", and rename "History" file as below.

    $ cd ~/.config/google-chrome/"Profile 1"
    $ mv History History.bak 

Re-open Google Chrome browser.

### Method Three ###

If the problem still persists, you can remove the Default profile folder (~/.config/google-chrome/Default) altogether. Note that by doing so, you will lose all previously opened Google tabs, imported bookmarks, browsing history, sign-in data, etc.

Before removing it, first close all your Chrome browser windows/tabs.

    $ rm -rf ~/.config/google-chrome/Default

After restarting Google Chrome, the folder ~/.config/google-chrome/Default will automatically be re-generated.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/your-profile-could-not-be-opened-correctly-google-chrome.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
