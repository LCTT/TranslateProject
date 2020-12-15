[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Write in XML with the NetBeans text editor)
[#]: via: (https://opensource.com/article/20/12/netbeans)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Write in XML with the NetBeans text editor
======
NetBeans is a popular Java IDE, making it a handy text editor for
developers already using it.
![Coffee beans and a cup of coffee][1]

I’ve spent a considerable amount of time in NetBeans, a Java IDE (integrated development environment) maintained by the Apache Foundation. I find it’s got a good mix of automated abstraction and manual configuration that helps me keep my Java projects organized and optimized. Not all IDEs give much thought to text files, but XML is frequently used in Java projects, so XML support in NetBeans is an important feature. It occurred to me that NetBeans, in addition to being an excellent Java IDE, could make for a nice XML editor, with the added benefit of being contained in a familiar application I already use.

### Install

Prior to installing NetBeans, you must ensure you have Java itself installed. The easiest way to install Java is to download a package from [adoptOpenJDK.net][2]. This site provides installer packages for all platforms. I prefer to use the LTS (long-term support) release, but if you’re already a Java programmer, then you may have your own preference.

If you’re using Linux and BSD, you can probably install NetBeans from your distributions’ software repository or ports tree. Alternatively, you can install it as a Flatpak from [Flathub][3].

On Windows and Mac (and Linux, if the other methods aren’t to your liking), you can install NetBeans directly from [netbeans.org][4].

![Black NetBeans terminal with white and yellow XML code ][5]

### XML in NetBeans 

NetBeans supports XML natively, so there are no plugins to install or hidden options to enable. However, NetBeans is project-centric. It assumes, by design, that every file you create belongs to a Java project. This doesn’t have to be true, but every file you create does need to belong to a NetBeans project directory unless you open an existing one from an arbitrary place on your hard drive. You probably won’t be opening NetBeans just to make a quick note to yourself, but if your use case (like mine) is for projects big enough to have an IDE open all day anyway, then NetBeans makes sense.

When you create a new XML Document, you’re prompted to save it into a project directory. After naming your file, it opens as a tab in your NetBeans workspace. NetBeans is schema-aware, so you can set your schema from within an XML document. For example, [I love to write in Docbook][6], so I start my XML files with this declaration:


```
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;article xmlns="<http://docbook.org/ns/docbook>"
     xmlns:xlink="<http://www.w3.org/1999/xlink>"
     dtd="/usr/share/xml/docbook5/schema/dtd/5.0/docbook.dtd"
     version="5.0"
     xml:lang="en"&gt;
```

NetBeans recognizes this as a schema and namespace declaration and downloads the appropriate files.


```
Retrieving Location: <http://docbook.org/ns/docbook>
    Retrieved :    <https://docbook.org/ns/docbook>
    Saved at: /home/tux/.cache/netbeans/12.1/mavencachedirs/1391771919/retriever/docbook.org/ns/docbook.xml
```

Writing XML in NetBeans is a pleasure. It understands tags and how and when to close them. Tags are exempted from the spell checker. NetBeans also has a good syntax highlighting theme to make it easy for you to differentiate tag elements, attributes, and content. It provides code folding, so I can easily collapse blocks of text I don’t need to see at any given time. You can hide and reveal folded text by clicking on the **-** or **+** icons on the left of each block. Alternatively, you can use the keyboard shortcut **[ +Ctrl+ + ±+ ]{.keycombo}** or **[ +Ctrl+ ++++ ]{.keycombo}**.

When you right-click on your editing window, you get an XML-specific menu with options to check your XML syntax and to validate your XML against a schema, and even to apply an XSL transform on your work.

There are many more features in NetBeans that aren’t specific to editing XML but are still useful. For instance, you can split your editing window in NetBeans, so you have multiple files open side by side. Line numbers down the left side of the window make it easy for you to navigate, and you can also create bookmarks in your file and then use them to quickly jump between points. There’s auto-indentation, code completion, an outline view, and a great interface, especially to those already familiar with it as a code editor.

### Try NetBeans 

NetBeans isn’t the best choice for a general text editor. It’s big, it has lots of options for very specific languages, and not much for anything else. However, if you write in XML on a regular basis, or if you just use NetBeans anyway, then it works great as a handy text editor. Why open a separate application when you have everything you need in your IDE already? Give NetBeans as a text editor a try!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/netbeans

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://adoptopenjdk.net/
[3]: https://flathub.org/apps/details/org.apache.netbeans
[4]: https://netbeans.apache.org/download/index.html
[5]: https://opensource.com/sites/default/files/uploads/netbeans-xml-31days-netbeans-opensource.png (Black NetBeans terminal with white and yellow XML code )
[6]: https://opensource.com/article/17/9/docbook
