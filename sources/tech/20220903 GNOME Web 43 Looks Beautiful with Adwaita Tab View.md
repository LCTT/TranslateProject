[#]: subject: "GNOME Web 43 Looks Beautiful with Adwaita Tab View"
[#]: via: "https://www.debugpoint.com/gnome-web-43-tab-view/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GNOME Web 43 Looks Beautiful with Adwaita Tab View
======
GNOME Web 43 Tab View looks awesome and its going to change your workflow.

Our beloved GNOME Web (Epiphany) becoming more and more intuitive in every passing day – thanks to the developers.

Recently, it has been ported to GTK4, libadwaita which brings the nice looks overall and some cool new features. All of these changes arriving on [GNOME 43][1] release due in a few weeks.

### GNOME Web 43 Tab View

In my opinion, the most cool feature of GNOME Web 43 is the Tab view. Here’s how it looks.

![GNOME Web 43 Tab View][2]

Cool, isn’t it? Here are the key features.

The GNOME Web 43 tab view brings small and **responsive preview of all the open tabs** in a single page. It’s a different view in GNOME Web 43 and do not get confused with the default recent page view.

A **new toolbar button** at the top bar of GNOME Web kicks off this view. Its a **toggle** button, that means – to turn off this view, simply click again.

Next, the tab view is **responsive** in nature. That means, as you keep on adding tabs, the tab views **resizes** itself by calculating available space from the size of parent Web dialog.

Since the GNOME Web 43 tab view is completely different page of the Web, it has two additional controls.

First is a **search button** at the left top section of Tab view which enables you to search the *titles*of the open tabs. Its dynamic and search result arrives in the same page.

Secondly, a new Tab button at the bottom helps you to **create a new tab** from Web’s Tab view page itself. That means, you don’t need to go to the horizontal tab view to create a tab.

Also, if you press escape in this view, you go back to the main view. Finally a total tab count at the top section – gives you a hint of how many tabs you have opened.

### Video

Here’s a nice video which I prepared to show you how cool it is.

![][3]

So, in summary, here’s what you get in GNOME Web 43 tab view:

* Tab view is a new page with responsive preview of your open tabs.
* Search and create tab option.
* Drag and drop feature to re-order the tab thumbnails.
* All the tab context menu features (such as Pin tab, reload tab, etc.) available in this tab view.
* Awesome keyboard shortcuts to browse the tabs (such as CTRL+Page Up and Down to go up and back).
* Tab preview image is dynamic, that means as your page loads, tab view refreshes by itself!

### Implementation

This feature is courtesy of libadwaita library. It was available since libadwaita v1.0, but implemented now. You can read the documentation [here][4].

```
final class Adw.TabView : Gtk.Widget {
/* No available fields */
}

AdwTabView*
adw_tab_view_new (
  void
)
```

*The main TabView class and constructor to create Tabview*

As of writing this post, this feature is NOT yet merged (MR!1190) to Epiphany main branch for GNOME 43. Above screenshots and feature highlights are from the development version of Web 43.

### What about Files, Terminal and Text editor?

I know what you are thinking.

What if the same feature arrives in Files or in GNOME Terminal? Wouldn’t it be cool?

Yes, there is a strong possibility. Because the feature is actually part of Libadwaita and Web is the first native app that implements it.

If GNOME devs want, Files and other native apps can inherit this feature via libadwaita. However, I haven’t came across any draft/roadmap to implement this for other apps, yet.

### Wrapping up

So, that about this cool new GNOME Web 43 tab view feature. Finally, Web is becoming a viable alternative web browser other than Firefox.

What do you think about the above feature? Do let me know in the comment box.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/gnome-web-43-tab-view/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/gnome-43/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/09/GNOME-Web-43-Tab-View.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/09/GNOME-43-Web-Tav-View.mp4
[4]: https://gnome.pages.gitlab.gnome.org/libadwaita/doc/1-latest/ctor.TabView.new.html
