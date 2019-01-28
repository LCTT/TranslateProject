[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mind map yourself using FreeMind and Fedora)
[#]: via: (https://fedoramagazine.org/mind-map-yourself-using-freemind-and-fedora/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

Mind map yourself using FreeMind and Fedora
======
![](https://fedoramagazine.org/wp-content/uploads/2019/01/freemind-816x345.jpg)

A mind map of yourself sounds a little far-fetched at first. Is this process about neural pathways? Or telepathic communication? Not at all. Instead, a mind map of yourself is a way to describe yourself to others visually. It also shows connections among the characteristics you use to describe yourself. It’s a useful way to share information with others in a clever but also controllable way. You can use any mind map application for this purpose. This article shows you how to get started using [FreeMind][1], available in Fedora.

### Get the application

The FreeMind application has been around a while. While the UI is a bit dated and could use a refresh, it’s a powerful app that offers many options for building mind maps. And of course it’s 100% open source. There are other mind mapping apps available for Fedora and Linux users, as well. Check out [this previous article that covers several mind map options][2].

Install FreeMind from the Fedora repositories using the Software app if you’re running Fedora Workstation. Or use this [sudo][3] command in a terminal:

```
$ sudo dnf install freemind
```

You can launch the app from the GNOME Shell Overview in Fedora Workstation. Or use the application start service your desktop environment provides. FreeMind shows you a new, blank map by default:

![][4]
FreeMind initial (blank) mind map

A map consists of linked items or descriptions — nodes. When you think of something related to a node you want to capture, simply create a new node connected to it.

### Mapping yourself

Click in the initial node. Replace it with your name by editing the text and hitting **Enter**. You’ve just started your mind map.

What would you think of if you had to fully describe yourself to someone? There are probably many things to cover. How do you spend your time? What do you enjoy? What do you dislike? What do you value? Do you have a family? All of this can be captured in nodes.

To add a node connection, select the existing node, and hit **Insert** , or use the “light bulb” icon for a new child node. To add another node at the same level as the new child, use **Enter**.

Don’t worry if you make a mistake. You can use the **Delete** key to remove an unwanted node. There’s no rules about content. Short nodes are best, though. They allow your mind to move quickly when creating the map. Concise nodes also let viewers scan and understand the map easily later.

This example uses nodes to explore each of these major categories:

![][5]
Personal mind map, first level

You could do another round of iteration for each of these areas. Let your mind freely connect ideas to generate the map. Don’t worry about “getting it right.” It’s better to get everything out of your head and onto the display. Here’s what a next-level map might look like.

![][6]
Personal mind map, second level

You could expand on any of these nodes in the same way. Notice how much information you can quickly understand about John Q. Public in the example.

### How to use your personal mind map

This is a great way to have team or project members introduce themselves to each other. You can apply all sorts of formatting and color to the map to give it personality. These are fun to do on paper, of course. But having one on your Fedora system means you can always fix mistakes, or even make changes as you change.

Have fun exploring your personal mind map!



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/mind-map-yourself-using-freemind-and-fedora/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: http://freemind.sourceforge.net/wiki/index.php/Main_Page
[2]: https://fedoramagazine.org/three-mind-mapping-tools-fedora/
[3]: https://fedoramagazine.org/howto-use-sudo/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/01/Screenshot-from-2019-01-19-15-17-04-1024x736.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/01/Screenshot-from-2019-01-19-15-32-38-1024x736.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/01/Screenshot-from-2019-01-19-15-38-00-1024x736.png
