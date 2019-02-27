[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Firefox and org-protocol URL Capture)
[#]: via: (http://www.mediaonfire.com/blog/2017_07_21_org_protocol_firefox.html)
[#]: author: (Andreas Viklund http://andreasviklund.com/)

Firefox and org-protocol URL Capture
======

### Introduction

As an Emacs guy, I attempt to force all my workflow into [org-mode][1] – for me life is better in text.

I tend to prefer to store bookmarks in [org-mode][1] todo lists, and [org-protocol][2] allows external processes to interact with some of [org-mode's][1] features. Setup, though, is an hassle. There are plenty of tutorials out there ([search][3]), and there are Firefox [extensions][4], but overall I've not had great luck with them.

I therefore decided to put my current setup in this blog post as another data point for those trying to get it all working.

### Setup your Emacs Org Mode Configuration

Enable org-protocol:

```
(require 'org-protocol)
```

Add a capture template - here's mine:

```
(setq org-capture-templates
      (quote (...
              ("w" "org-protocol" entry (file "~/org/refile.org")
               "* TODO Review %a\n%U\n%:initial\n" :immediate-finish)
               ...)))
```

The [capture templates][5] section in the [org-mode][1] manual will help.

Add the default template to use:

```
(setq org-protocol-default-template-key "w")
```

Eval those additions so they're active in your current Emacs session.

### A Quick Test

Before going further, it's a good idea to test your configuration:

```
emacsclient -n "org-protocol:///capture?url=http%3a%2f%2fduckduckgo%2ecom&title=DuckDuckGo"
```

This should pop open a capture window based on the template you added. Until this works, no point in going forward. If it doesn't work, go back through the configuration above and ensure that you've eval'd the code blocks.

If you have an old version of [org-mode][1] (older than 7, I believe), the format is different: the urlencoded form is replaced by slashes as separators of the url and title. A quick search will show you the difference.

### Firefox Protocol

Now to setup Firefox. Browse to about:config. Right-click on the list of configuration items, choose New -> Boolean, and enter network.protocol-handler.expose.org-protocol for the name and toggle the value to true.

Some tutorials indicate this step is optional – YMMV.

### Add Desktop File

Most of the tutorials include this:

Add ~/.local/share/applications/org-protocol.desktop:

```
[Desktop Entry]
Name=org-protocol
Exec=/path/to/emacsclient -n %u
Type=Application
Terminal=false
Categories=System;
MimeType=x-scheme-handler/org-protocol;
```

Then run your updater. For i3 I use (same as for gnome):

```
update-desktop-database ~/.local/share/applications/
```

KDE has a different method… again some of the tutorials for getting org-protocol working can help.

### Setup Capture Button in Firefox

Create a bookmark (I create it in the toolbar) with the following "Location":

```
javascript:location.href="org-protocol:///capture?url="+encodeURIComponent(location.href)+"&title="+encodeURIComponent(document.title||"[untitled page]")
```

After you save it, should you edit the bookmark, expect to see any spaces replaced by '%20' – the url encoding for a "space".

Now when you click the bookmark, you should get a window opened in an Emacs frame, any random frame, showing your template.



--------------------------------------------------------------------------------

via: http://www.mediaonfire.com/blog/2017_07_21_org_protocol_firefox.html

作者：[Andreas Viklund][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://andreasviklund.com/
[b]: https://github.com/lujun9972
[1]: http://orgmode.org/
[2]: http://orgmode.org/worg/org-contrib/org-protocol.html
[3]: https://duckduckgo.com/?q=org-protocol+firefox&t=ffab&ia=qa
[4]: https://addons.mozilla.org/en-US/firefox/search/?q=org-protocol&cat=1,0&appver=53.0&platform=linux
[5]: http://orgmode.org/manual/Capture-templates.html
