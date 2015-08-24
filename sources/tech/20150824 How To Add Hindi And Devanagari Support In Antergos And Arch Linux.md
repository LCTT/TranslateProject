How To Add Hindi And Devanagari Support In Antergos And Arch Linux
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Indian-languages.jpg)

You might be knowing by now that I have been trying my hands on [Antergos Linux][1] lately. One of the first few things I noticed after installing [Antergos][2] was that **Hindi scripts were not displayed properly** in the default chromium browser.

This is a strange thing that I never encountered before in my desktop Linux experience ever. First, I thought maybe it could be a browser problem so I went on to install Firefox only to see the same story repeated. Firefox also could not display Hindi properly. Unlike Chromium that displayed nothing, Firefox did display something but it was not readable.

![No hindi support in Arch Linux based Antergos](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Hindi_Support_Antergos_Arch_linux_1.jpeg)

Hindi display in Chromium 

![No hindi support in Arch Linux based Antergos](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Hindi_Support_Antergos_Arch_linux_2.jpeg)

Hindi display in Firefox 

Strange? So no Hindi support in Arch based Antergos Linux by default? I did not verify, but I presume that it would be the same for other Indian languages etc that are also based on Devanagari script.

I this quick tutorial, I am going to show you how to add Devanagari support so that Hindi and other Indian languages are displayed properly.

### Add Indian language support in Antergos and Arch Linux ###

Open a terminal and use the following command:

    sudo yaourt -S ttf-indic-otf

Enter the password. And it will provide rendering support for Indian languages.

Restarting Firefox displayed Hindi correctly immediately, but it took a restart to display Hindi. For that reason, I advise that you **restart your system** after installing the Indian fonts.

![Adding Hindi display support in Arch based Antergos Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Hindi_Support_Antergos_Arch_linux_4.jpeg)

I hope tis quick helped you to read Hindi, Sanskrit, Tamil, Telugu, Malayalam, Bangla and other Indian languages in Antergos and other Arch based Linux distros such as Manjaro Linux.

--------------------------------------------------------------------------------

via: http://itsfoss.com/display-hindi-arch-antergos/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://antergos.com/
[2]:http://itsfoss.com/tag/antergos/