How To Update Wifi Network Password From Terminal In Arch Linux
============================================================
 ![Update Wifi Network Password From Terminal In Arch Linux](https://www.ostechnix.com/wp-content/plugins/lazy-load/images/1x1.trans.gif) 

After changing the Wifi Network password in my Router, My Arch Linux test machine lost the Internet connection. So I wanted to update the new password from Terminal because my Arch Linux test box doesn’t have graphical desktop environment. Changing old wifi password to new password is pretty easy in GUI mode. I will simply open the network manager and update the new password to the wifi in few seconds. However, I am not aware of updating the wifi network password from command line in Arch Linux. So, I started to dig into Google and find a perfect solution from the Arch Linux forum. In case you ever been in the same situation, read on. It’s not that difficult.


### Update Wifi Network Password From Terminal

After changing the password in Router, I ran _wifi-menu_ command to update the new password. But It kept throwing the following error.

```
sudo wifi-menu
```

It displayed the list of available wifi networks.

[
 ![sksk_001](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_001-1.png) 
][2]

My wifi network name is Murugs9376. Then, I selected my network and hit OK button. Instead of asking the new password (I thought it was going to ask me if the password has been changed.), It showed the following error.

```
Interface 'wlp9s0' is controlled by netctl-auto
WPA association/authentication failed for interface 'wlp9s0'
```

[
 ![sksk_002](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_002-1.png) 
][3]

I don’t have much experience in Arch based distributions. So I went thorough the Arch linux forum hoping for the solution. Thankfully, someone has posted the same problem and got the workaround from one of the fellow Arch user. Following is the solution to update the wifi network password from Terminal in Arch based distributions.

The network profiles is stored in the /etc/netctl/ folder. For example, here is my Arch Linux test box wifi network profile details.

```
ls /etc/netctl/

Sample Output:

examples    ostechnix         'wlp9s0-Chendhan Cell Service'  wlp9s0-Pratheesh
hooks       wlp9s0            wlp9s0-Murugu9376
interfaces  wlp9s0-AndroidAP  wlp9s0-none
```

[
 ![sksk_003](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_003-1.png) 
][4]

All I need to update the new password is to delete the my wifi network profile (Ex. wlp9s0-Murugs9376) and re-run the _wifi-menu_ command to new password.

So, first let us delete the wifi profile using command:

```
sudo rm /etc/netctl/wlp9s0-Murugu9376
```

After deleting the profile, run wifi-menu command to update the new password.

```
sudo wifi-menu
```

Select the wifi-network and press ENTER.

[
 ![sksk_004](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_004-1.png) 
][5]

Enter a name for the profile.

[
 ![sksk_005](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_005-1.png) 
][6]

Finally, Enter the security key to the network profile and hit ENTER key.

[
 ![sksk_006](http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_006-1.png) 
][7]

That’s it. Now, we have updated the password to the wifi network. As you can see, updating password from Terminal in Arch Linux is no big deal. Anyone could do it in a matter of seconds.

If you find this guide useful, please share it on your social networks and support us.

Cheers!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/update-wifi-network-password-terminal-arch-linux/

作者：[ SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://ostechnix.tradepub.com/free/w_pacb38/prgm.cgi?a=1
[2]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_001-1.png
[3]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_002-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_003-1.png
[5]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_004-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_005-1.png
[7]:http://www.ostechnix.com/wp-content/uploads/2016/11/sk@sk_006-1.png
