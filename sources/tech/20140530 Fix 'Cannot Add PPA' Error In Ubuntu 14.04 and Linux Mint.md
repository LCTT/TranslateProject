Fix “Cannot Add PPA” Error In Ubuntu 14.04 & Linux Mint
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/05/PPA_Error_Ubuntu.jpeg)

A regular reader of It’s FOSS, Chetan Jain contacted me today with this question: How can I fix “Cannot add PPA” error in Ubuntu 14.04. Chetan was trying to install [TLP (power management tool to reduce overheting)][1] and encountered this error:

    chetan@Inspiron-3521:~$ sudo add-apt-repository ppa:linrunner/tlp
    Cannot add PPA: ‘ppa:linrunner/tlp’.
    Please check that the PPA name or format is correct.

If you encounter similar error while adding a PPA in Ubuntu or Mint, don’t worry. It’s one of the (less) common issue with PPA and can be solved easily.

### Fix Cannot add PPA error in Ubuntu and Linux Mint ###

There can be mainly two reasons behind this kind of error. Either the CA certificates on your system are broken or there is a proxy set up in your network.

Let’s first try to reinstall the CA certificates:

    sudo apt-get install --reinstall ca-certificates

If the above command doesn’t work, perhaps there is proxy settings involved. To pass proxy settings to sudo, use it with E option in the following manner:

     sudo -E add-apt-repository ppa:linrunner/tlp

This will get the PPA working. Chetan’s issue was solved with the second solution. I hope this quick tip help you as well to get rid of the PPA error. Any questions or suggestions are always welcomed.

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-add-ppa-error-ubuntu-1404-linux-mint/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/solve-overheating-issue-battery-life-ubuntu-1304/