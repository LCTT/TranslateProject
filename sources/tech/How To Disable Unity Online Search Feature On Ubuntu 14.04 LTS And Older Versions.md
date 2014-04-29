+ translating     ----------by tenght

How To Disable Unity Online Search Feature On Ubuntu 14.04 LTS And Older Versions
================================================================================
Whenever, you start typing in Unity Dash to search for an application or a file in your computer, your search terms will be automatically sent to third parties such as Amazon, and the third parties will display the relevant results (mostly ads) depending upon your search terms. If you don’t like this feature and feel this is really annoying to you, you can disable it.

For example, when I type Terminal in the Unity Dash, It displays the Terminal application, and other third party junks(which I don’t want always) from the web.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/Menu_019.png)

As you see in the above screenshot, Unity displays the built-in **Terminal** application, reference links, weather links and other third party suggestions such as movies etc. This is very annoying and looks bad on Unity Dash. Also, it displays too many search results, and confuse me.

If you don’t need this feature like me, enter the following command in your Terminal:

    wget -q -O - https://fixubuntu.com/fixubuntu.sh | bash

The contents of the script is given below:

    #!/bin/bash

    GS="/usr/bin/gsettings"
    CCUL="com.canonical.Unity.lenses"

    # Figure out the version of Ubuntu that you're running
    V=`/usr/bin/lsb_release -rs`
    # The privacy problems started with 12.10, so earlier versions should do nothing
    if awk "BEGIN {exit !($V < 12.10 || $V >= 14.10)}"; then
      echo "Good news! This version of Ubuntu is not known to invade your privacy."
    else
    
      # Check Canonical schema is present. Take first match, ignoring case.
      SCHEMA="`$GS list-schemas | grep -i $CCUL | head -1`"
      if [ -z "$SCHEMA" ]
        then
        printf "Error: could not find Canonical schema %s.\n" "$CCUL" 1>&2
        exit 1
      else
        CCUL="$SCHEMA"
      fi
    
      # Turn off "Remote Search", so search terms in Dash don't get sent to the internet
      $GS set $CCUL remote-content-search none
    
      # If you're using earlier than 13.10, uninstall unity-lens-shopping
      if [ $V \< 13.10 ]; then
        sudo apt-get remove -y unity-lens-shopping
    
      # If you're using a later version, disable remote scopes
      else
        $GS set $CCUL disabled-scopes \
          "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope',
          'more_suggestions-populartracks.scope', 'music-musicstore.scope',
          'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope',
          'more_suggestions-skimlinks.scope']"
      fi;
    
      # Block connections to Ubuntu's ad server, just in case
      if ! grep -q "127.0.0.1 productsearch.ubuntu.com" /etc/hosts; then
        echo -e "\n127.0.0.1 productsearch.ubuntu.com" | sudo tee -a /etc/hosts >/dev/null
      fi
    
      echo "All done. Enjoy your privacy."
    fi

Again, I entered Terminal on Unity dash. Now the unity displays only the Terminal application, not the other unwanted junks, and now Unity Dash looks good.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/Menu_020.png)

All done. Enjoy your privacy.

Cheers!

**Update**: This trick is only for Unity desktop. If you use other DE’s such as Gnome, LXDE or XFCE, you don’t have to do this. Also, this online search feature will not be included in Ubuntu 14.10 and upcoming versions.

Source & Reference: [Fixubuntu][1]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/disable-unity-online-search-feature-ubuntu-14-04-lts-older-versions/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://fixubuntu.com/