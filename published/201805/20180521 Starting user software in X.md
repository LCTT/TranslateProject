如何在 X 中启动用户软件
======

目前有很多方法可以在开启用户会话时启动软件。

这是一篇试图将所有方法聚集在一起的文章。某些部分可能不精确或不正确，但这是一个开始，如果我收到更正，我很乐意保持更新。

### x11-common

```
man xsession
```

  * 由显示管理器启动，如  `/usr/share/lightdm/lightdm.conf.d/01_debian.conf` 或 `/etc/gdm3/Xsession`。
  * Debian 特定。
  * 在 `/etc/X11/Xsession.d/` 中运行脚本。
  * `/etc/X11/Xsession.d/40x11-common_xsessionrc` 引用 `~/.xsessionrc` ，它能比设置环境变量能做的多一点，因为它在 X 会话启动时运行。
  * 最后，它启动会话管理器（`gnome-session`、`xfce4-session` 等等）。

### systemd --user

  * <https://wiki.archlinux.org/index.php/Systemd/User>
  * 由 `pam_systemd` 启动，所以在环境变量中可能没有设置 `DISPLAY` 变量。
  * 管理单元：
    * `/usr/lib/systemd/user/` 由已安装的软件包提供的单元。
    * `~/.local/share/systemd/user/` 由安装在家目录的软件包提供的单元。
    * `/etc/systemd/user/` 由系统管理员提供的系统范围的用户的单元。
    * `~/.config/systemd/user/` ，用户自己放置的单元。
  * 当设置 X 会话和 `DISPLAY` 变量时，启动 systemd 用户单元的技巧是从 `.desktop` 自启动文件调用 `systemctl start`。

### dbus  激活

  * <https://dbus.freedesktop.org/doc/system-activation.txt>
  * 进行 dbus 请求的用户进程可以触发启动服务器程序。
  * 对于系统调试，有没有一种方法可以监控哪些服务正在启动 dbus ？

### X 会话管理器

  * <https://en.wikipedia.org/wiki/X_session_manager>
  * 由 `x11-common` 的 `Xsession.d` 运行。
  * 运行 freedesktop 自动启动的 `.desktop` 文件。
  * 运行桌面环境特定的软件。

### xdg 自动启动

  * <https://specifications.freedesktop.org/autostart-spec/autostart-spec-latest.html>
  * 由会话管理器运行。
  * 如果存在 `/etc/xdg/autostart/foo.desktop` 和 `~/.config/autostart/foo.desktop` ，那么只会使用 `~/.config/autostart/foo.desktop`，因为 `~/.config/autostart/` 比 `/etc/xdg/autostart/` 更重要。
  * 是顺序的还是并行？

### 其他启动注意事项

#### ~/.Xauthority

要连接到 X 服务器，客户端需要从 `~/.Xauthority` 发送一个令牌，这证明他们可以读取用户的隐私数据。

`~/.Xauthority` 包含显示管理器生成的一个令牌，并在启动时传递给 X。

要查看它的内容，请使用 `xauth -i -f ~/.Xauthority list`。

--------------------------------------------------------------------------------

via: http://www.enricozini.org/blog/2018/debian/starting-user-software/

作者：[Enrico Zini][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.enricozini.org/
