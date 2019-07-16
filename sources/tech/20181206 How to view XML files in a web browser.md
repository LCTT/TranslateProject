[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to view XML files in a web browser)
[#]: via: (https://opensource.com/article/18/12/xml-browser)
[#]: author: (Greg Pittman https://opensource.com/users/greg-p)

How to view XML files in a web browser
======
Turn XML files into something more useful.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh)

Once you learn that HTML is a form of XML, you might wonder what would happen if you tried to view an XML file in a browser. The results are quite disappointing—Firefox shows you a banner at the top of the page that says, "This XML file does not appear to have any style information associated with it. The document tree is shown below." The document tree looks like the file would look in an editor:
![](https://opensource.com/sites/default/files/uploads/xml_menu.png)
This is the beginning of the **menu.xml** file for the online manual that comes with [Scribus][1], to which I'm a contributor. Although you see blue text, they are not clickable links. I wanted to be able to view this in a regular browser, since sometimes I need to go back and forth from the canvas in Scribus to the manual to figure out how to do something (maybe to see if I need to edit the manual to straighten out some misinformation or to add some missing information).

The way to help a browser know what to do with these XML tags is by using XSLT—Extensible Stylesheet Language Transformations. In a broad sense, you could use XSLT to transform XML to a variety of outputs, or even HTML to XML. Here I want to use it to present the XML tags to a browser as suitable HTML.

One slight modification needs to happen to the XML file:

![](https://opensource.com/sites/default/files/uploads/xml_modified-menu.png)

Adding this second line to the file tells the browser to look for a file named **scribus-manual.xsl** for the style information. The more important part is to create this XSL file. Here is the complete listing of **scribus-manual.xsl** for the Scribus manual:

```
<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
    <title>Scribus Online Manual</title>
<style type="text/css">
h2,h3,h4 { text-indent: 50px;}
ul { margin-left: 100px;}
</style>
<table border="0" cellspacing="0" cellpadding="0" width="100%"
bgcolor="#183867" >
        <tr>
                <td align="left"><img src="images/docheader1.png" width="222"
height="87"/></td>
                <td align="right"><img src="images/docheader2.png" width="318"
height="87"/></td>
        </tr>
</table>

    <body bgcolor="#ffffff">

      <xsl:for-each select="menu">
        <xsl:for-each select="area">
          <h3><a href="{@file}" ><xsl:value-of select = "@text" /></a></h3>
          <xsl:for-each select="submenuitem">
            <h4><a href="{@file}" ><xsl:value-of select = "@text" /></a></h4>
                <xsl:for-each select="submenuitem">
                  <p><ul>
                    <li><a href="{@file}" ><xsl:value-of select = "@text" /></a></li>
                  </ul></p>
                </xsl:for-each>
          </xsl:for-each>
        <xsl:for-each select="area">
          <h3><a href="{@file}" ><xsl:value-of select = "@text" /></a></h3>
        </xsl:for-each>
        </xsl:for-each>
      </xsl:for-each>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
```

This looks a lot more like HTML, and you can see it contains a number of HTML tags. After some preliminary tags and some particulars about displaying H2, H3, and H4 tags, you see a Table tag. This adds a graphical heading at the top of the page and uses some images already in the documentation files.

After this, you get into the process of dissecting the various **submenuitem** tags, trying to create the nested listing structure as it appears in Scribus when you view the manual. One feature I did not try to duplicate is the ability to collapse and expand **submenuitem** areas. As you can imagine, it takes some time to sort through the number of nested lists you need to create, but when I finished, here is how it looked:

![](https://opensource.com/sites/default/files/uploads/xml_scribusmenuinbrowser.png)

This minimal editing to **menu.xml** does not interfere with Scribus' ability to show the manual in its own browser. I put this modified **menu.xml** file and the **scribus-manual.xsl** in the English documentation folder for 1.5.x versions of Scribus, so anyone using these versions can simply point their browser to the **menu.xml** file and it should show up just like you see above.

A much bigger chore I took on a few years ago was to create a version of the ICD10 (International Classification of Diseases, version 10) when it came out. Many changes were made from the previous version (ICD9) to 10. These are important since these codes must be used for diagnostic purposes in medical practice. You can easily download XML files from the US [Centers for Medicare and Medicaid][2] website since it is public information, but—just as with the Scribus manual—these files are hard to use.

Here is the beginning of the tabular listing of diseases:

![](https://opensource.com/sites/default/files/uploads/xml_tabular_begin.png)

One of the features I created was the color coding used in the listing shown here:

![](https://opensource.com/sites/default/files/uploads/xml_tabular_body.png)

As with **menu.xml** , the only editing I did in this **Tabular.xml** file was to add **<?xml-stylesheet type="text/xsl" href="tabular.xsl"? >** as the second line of the file. I started this project with the 2014 version, and I was quite pleased to find that the original **tabular.xsl** stylesheet worked perfectly when the 2016 version came out, which is the last one I worked on. The** Tabular.xml** file is 8.4MB, quite large for a plaintext file. It takes a few seconds to load into a browser, but once it's loaded, navigation is fast.

While you may not often have to deal with an XML file in this way, if you do, I hope this article shows that your file can easily be turned into something much more usable.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/12/xml-browser

作者：[Greg Pittman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://www.scribus.net/
[2]: https://www.cms.gov/
