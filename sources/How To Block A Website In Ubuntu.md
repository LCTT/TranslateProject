How To Block A Website In Ubuntu
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/block-websites.jpg)

Dear **ubuntu** geeks,

In this tutorial I will teach you how to block unwanted websites in Ubuntu Linux by editing the **/etc/hosts** file which is used to handle DNS and internet on Linux based systems.

I like very much this method because I don’t need to rely on third party applications and it is extremely easy to use. All you need to do is to make a simple change in the **/etc/hosts** file.

Make sure to have superuser access on the machine you are using this method, because the **/etc/hosts** file is owned by the root user and so it cannot not be edited by everyone.

What do you need to edit the **/etc/hosts** file?

root permissions and a text editor.

For this tutorial I will use my favourite text editor, vim. Ok guys, open a new terminal (**CTRL+ALT+T**) and run the following command to open the /etc/hosts file for editing.

    vim /etc/hosts

Then add the following line.

    127.0.0.1   domain.com

Replace the domain.com with the website you want to block and after you have finished the editing process, save the file and quit.

Now it is time to test if the method has worked or not. Try to access the website you blocked.

My cousin is addicted to the facebook social network so every time he find my laptop, he opens it and goes to facebook.com to chat with his friends.

What should I do?

I edit the **/etc/hosts** file and act like the website he is trying to reach is down.

You can also use this method to protect kids from adult content on the internet such as porn and horror movies.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/block-website-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出