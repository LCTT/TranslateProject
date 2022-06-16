[#]: subject: "How I use LibreOffice keyboard shortcuts"
[#]: via: "https://opensource.com/article/22/6/libreoffice-keyboard-shortcuts"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I use LibreOffice keyboard shortcuts
======
Keyboard shortcuts keep me focused on the content that I'm meant to deliver, and not its appearance.

![Programming keyboard.][1]

Image by: Opensource.com

I have used word processing software for as long as I can remember. When word processors moved from direct formatting to leveraging styles to change how text appears on the page, that was a big boost to my writing.

LibreOffice provides a wide variety of styles that you can use to create all kinds of content. LibreOffice applies paragraph styles to blocks of text, such as body text, lists, and code samples. Character styles are similar, except that these styles apply to inline words or other short text inside a paragraph. Use the **View -> Styles** menu, or use the **F11** keyboard shortcut, to bring up the Styles selector.

![Image of LibreOffice styles][2]

Using styles makes writing longer documents much easier. Consider this example: I write a lot of workbooks and training material as part of my consulting practice. A single workbook might be 40 or 60 pages long, depending on the topic, and can include a variety of content such as body text, tables, and lists. Some of my technical training material may also include source code examples.

I have a standard training set that I offer clients, but I do custom training programs too. When working on a custom program, I might start by importing text from another workbook, and working from there. Depending on the client, I might also adjust the font and other style elements to match the client's style preferences.  For other materials, I might need to add source code examples.

To enter sample source code using direct formatting, I need to set the font and adjust the margins for each code block in the workbook. If I later decide that my workbook should use a different font for body text or source code samples, I would need to go back and change everything. For a workbook that includes more than a few code samples, this could require several hours to hunt down every source code example and adjust the font and margins to match the new preferred format.

However, by using styles, I can update the definition once to use a different font for the Text Body style, and LibreOffice Writer updates my document everywhere that uses the Text Body style. Similarly, I can adjust the font and margins for the Preformatted Text style, and LibreOffice Writer applies that new style to every source code example with the Preformatted Text style. This is the same for other blocks of text, including titles, source code, lists, and page headers and footers.

I recently had the bright idea to update the LibreOffice keyboard shortcuts to streamline my writing process. I've redefined **Ctrl**+**B** to set character style Strong Emphasis, **Ctrl**+**I** to set character style Emphasis, and **Ctrl**+**Space** to set No Character Style. This makes my writing much easier, as I don't have to pause my writing so I can highlight some text and select a new style. Instead, I can use my new **Ctrl**+**I** keyboard shortcut to set the Emphasis character style, which is essentially italics text. Anything I type after that uses the Emphasis style, until I press **Ctrl**+**Space** to reset the character style back to the default No Character Style.

![Image of LibreOffice character styles][3]

If you want to set this yourself, use **Tools > Customize,** then click on the Keyboard tab to modify your keyboard shortcuts.

![Image of LibreOffice keyboard customizations][4]

LibreOffice makes technical writing much easier with styles. And by leveraging keyboard shortcuts, I've streamlined how I write, keeping me focused on the content that I'm meant to deliver, and not its appearance. I might change the formatting later, but the styles remain the same.

Image by: (Jim Hall, CC BY-SA 40)

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/libreoffice-keyboard-shortcuts

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/programming_keyboard_coding.png
[2]: https://opensource.com/sites/default/files/2022-06/libreofficestyles.png
[3]: https://opensource.com/sites/default/files/2022-06/libreofficecharstyles.png
[4]: https://opensource.com/sites/default/files/2022-06/libreofficekeyboardcustom.png
