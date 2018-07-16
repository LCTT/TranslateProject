让 Ubuntu 上的 Unity 在线搜索功能见鬼去吧！
================================================================================
无论何时，你开始在 Unity Dash 搜索计算机中的应用程序或文件时，你的检索词将被自动发送给第三方，如亚马逊，并且第三方将依据您的搜索词显示相关结果（主要是广告）。如果你不喜欢这个功能，感觉真的打扰到你，你可以禁用它。

例如，当我在 Unity Dash 中输入 “Terminal” 时，将显示 “Terminal” 应用和 web 上其他第三方的东东（我要发狂了！我不想要这些！）。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/Menu_019.png)

正如上面的截图所见，Unity显示内置的 **Terminal** 应用、引用链接、天气链接和其他第三方的推荐，如电影等。这是非常恼人的并且在 Unity Dash 上看起来很糟。同时，它显示了太多的搜索结果，并使我迷惑。

如果你像我一样不需要这个功能，在你的终端输入以下命令：

    wget -q -O - https://fixubuntu.com/fixubuntu.sh | bash

上述脚本的内容如下：

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

再次，我进入到 Unity dash 的终端。现在 Unity 只显示终端应用，而不是无用的垃圾，现在 Unity Dash 看起来还不错。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/04/Menu_020.png)

全部搞定，让那些杂乱的东西再也不要回来了。

欢呼~!

**更新**:这一招只适用Unity desktop。如果你使用其他的比如GNOME，LXDE或Xfce，你不用这么做。同时，这个在线搜索功能将不会包含在Ubuntu 14.10和即将推出的版本中。

Source & Reference: [Fixubuntu][1]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/disable-unity-online-search-feature-ubuntu-14-04-lts-older-versions/

译者：[tenght](https://github.com/tenght) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://fixubuntu.com/
