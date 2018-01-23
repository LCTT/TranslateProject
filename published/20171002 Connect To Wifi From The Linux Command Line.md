通过 Linux 命令行连接 Wifi
======

目标：仅使用命令行工具来配置 WiFi

发行版：适用主流的那些发行版

要求：安装了无线网卡的 Linux 并且拥有 root 权限。

难度：简单

约定：

*   `#` - 需要使用 root 权限来执行指定命令，可以直接使用 root 用户来执行，也可以使用 `sudo` 命令
*   `$` - 可以使用普通用户来执行指定命令


### 简介

许多人喜欢用图形化的工具来管理电脑，但也有很多人不喜欢这样做。如果你比较喜欢命令行工具，管理 WiFi 会是件很痛苦的事情。然而，事情本不该如此。

wpa_supplicant 可以作为命令行工具来用。使用一个简单的配置文件就可以很容易设置号 WiFi。

### 扫描网络

若你已经知道了网络的信息，就可以跳过这一步。如果不了解的话，则这是一个找出网络信息的好方法。

wpa_supplicant 中有一个工具叫做 `wpa_cli`，它提供了一个命令行接口来管理你的 WiFi 连接。事实上你可以用它来设置任何东西，但是设置一个配置文件看起来要更容易一些。

使用 root 权限运行 `wpa_cli`，然后扫描网络。

```
# wpa_cli
> scan
```

扫描过程要花上一点时间，并且会显示所在区域的那些网络。记住你想要连接的那个网络。然后输入 `quit` 退出。

### 生成配置块并且加密你的密码

还有更方便的工具可以用来设置配置文件。它接受网络名称和密码作为参数，然后生成一个包含该网路配置块（其中的密码被加密处理了）的配置文件。

```
# wpa_passphrase networkname password > /etc/wpa_supplicant/wpa_supplicant.conf
```

### 裁剪你的配置

现在你已经有了一个配置文件了，这个配置文件就是 `/etc/wpa_supplicant/wpa_supplicant.conf`。其中的内容并不多，只有一个网络块，其中有网络名称和密码，不过你可以在此基础上对它进行修改。

用喜欢的编辑器打开该文件，首先删掉说明密码的那行注释。然后，将下面行加到配置最上方。

```
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=wheel
```

这一行只是让 `wheel` 组中的用户可以管理 wpa_supplicant。这会方便很多。

其他的内容则添加到网络块中。

如果你要连接到一个隐藏网络，你可以添加下面行来通知 wpa_supplicant 先扫描该网络。

```
scan_ssid=1
```

下一步，设置协议以及密钥管理方面的配置。下面这些是 WPA2 相关的配置。

```
proto=RSN
key_mgmt=WPA-PSK
```

`group` 和 `pairwise` 配置告诉 wpa_supplicant 你是否使用了 CCMP、TKIP，或者两者都用到了。为了安全考虑，你应该只用 CCMP。

```
group=CCMP
pairwise=CCMP
```

最后，设置网络优先级。越高的值越会优先连接。

```
priority=10
```

![Complete WPA_Supplicant Settings][1]

保存配置然后重启 wpa_supplicant 来让改动生效。

### 结语

当然，该方法并不是用于即时配置无线网络的最好方法，但对于定期连接的网络来说，这种方法非常有效。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/connect-to-wifi-from-the-linux-command-line

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org
[1]:https://linuxconfig.org/images/wpa-cli-config.jpg
