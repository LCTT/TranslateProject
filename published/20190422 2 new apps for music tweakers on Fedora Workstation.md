[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10841-1.html)
[#]: subject: (2 new apps for music tweakers on Fedora Workstation)
[#]: via: (https://fedoramagazine.org/2-new-apps-for-music-tweakers-on-fedora-workstation/)
[#]: author: (Justin W. Flory https://fedoramagazine.org/author/jflory7/)

2 个给使用 Fedora 工作站的音乐爱好者的新应用
======

![][1]

Linux 操作系统非常适合进行独特的自定义和调整，以使你的计算机更好地为你工作。例如，[i3 窗口管理器][2] 就让用户认识到了构成现代 Linux 桌面的各种组件和部分。

Fedora 上有两个音乐爱好者会感兴趣的新软件包：mpris-scrobbler 和 playerctl。mpris-scrobbler 可以在 Last.fm 和/或 ListenBrainz 等音乐跟踪服务上[跟踪你的音乐收听历史][3]。 playerctl 是一个命令行的[音乐播放器的控制器][4]。

### mpris-scrobbler：记录你的音乐收听趋势

mpris-scrobbler 是一个命令行应用程序，用于将音乐的播放历史记录提交给 [Last.fm][5]、[Libre.fm][6] 或 [ListenBrainz][7] 等服务。它监听 [MPRIS D-Bus 接口][8] 以检测正在播放的内容。它可以连接几个不同的音乐客户端，如 spotify 客户端、[vlc][9]、audacious、bmp、[cmus][10] 等。

![Last.fm last week in music report. Generated from user-submitted listening history.][11]

#### 安装和配置 mpris-scrobbler

mpris-scrobbler 在 Fedora 28 或更高版本以及 EPEL 7 存储库中可用。在终端中运行以下命令进行安装：

```
sudo dnf install mpris-scrobbler
```

安装完成后，使用 `systemctl` 启动并启用该服务。以下命令启动 mpris-scrobbler 并始终在系统重启后启动它：

```
systemctl --user enable --now mpris-scrobbler.service
```

####  提交播放信息给 ListenBrainz

这里将介绍如何将 mpris-scrobbler 与 ListenBrainz 帐户相关联。要使用 Last.fm 或 Libre.fm，请参阅其[上游文档][12]。

要将播放信息提交到 ListenBrainz 服务器，你需要有一个 ListenBrainz API 令牌。如果你有帐户，请从[个人资料设置页面][13]中获取该令牌。如果有了令牌，请运行此命令以使用 ListenBrainz API 令牌进行身份验证：

```
$ mpris-scrobbler-signon token listenbrainz
Token for listenbrainz.org:
```

最后，通过在 Fedora 上用你的音乐客户端播放一首歌来测试它。你播放的歌曲会出现在 ListenBrainz 个人资料页中。

![Basic statistics and play history from a user profile on ListenBrainz. The current track is playing on a Fedora Workstation laptop with mpris-scrobbler.][14]

### playerctl 可以控制音乐回放

`playerctl` 是一个命令行工具，它可以控制任何实现了 MPRIS D-Bus 接口的音乐播放器。你可以轻松地将其绑定到键盘快捷键或媒体热键上。以下是如何在命令行中安装、使用它，以及为 i3 窗口管理器创建键绑定的方法。

#### 安装和使用 playerctl

`playerctl` 在 Fedora 28 或更高版本中可用。在终端运行如下命令以安装：

```
sudo dnf install playerctl
```

现在已安装好，你可以立即使用它。在 Fedora 上打开你的音乐播放器。接下来，尝试用以下命令来控制终端的播放。

播放或暂停当前播放的曲目：

```
playerctl play-pause
```

如果你想跳过下一首曲目：

```
playerctl next
```

列出所有正在运行的播放器：

```
playerctl -l
```

仅使用 spotify 客户端播放或暂停当前播放的内容：

```
playerctl -p spotify play-pause
```

#### 在 i3wm 中创建 playerctl 键绑定

你是否使用窗口管理器，比如 [i3 窗口管理器][2]？尝试使用 `playerctl` 进行键绑定。你可以将不同的命令绑定到不同的快捷键，例如键盘上的播放/暂停按钮。参照下面的 [i3wm 配置摘录][15] 看看如何做：

```
# Media player controls
bindsym XF86AudioPlay exec "playerctl play-pause"
bindsym XF86AudioNext exec "playerctl next"
bindsym XF86AudioPrev exec "playerctl previous"
```

### 体验一下音乐播放器

想了解关于在 Fedora 上定制音乐聆听体验的更多信息吗？Fedora Magazine 为你提供服务。看看 Fedora 上这[五个很酷的音乐播放器][16]。

也可以通过使用 MusicBrainz Picard 对音乐库进行排序和组织，[为你的混乱的音乐库带来秩序][17]。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/2-new-apps-for-music-tweakers-on-fedora-workstation/

作者：[Justin W. Flory][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/jflory7/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/2-music-tweak-apps-816x345.jpg
[2]: https://fedoramagazine.org/getting-started-i3-window-manager/
[3]: https://github.com/mariusor/mpris-scrobbler
[4]: https://github.com/acrisci/playerctl
[5]: https://www.last.fm/
[6]: https://libre.fm/
[7]: https://listenbrainz.org/
[8]: https://specifications.freedesktop.org/mpris-spec/latest/
[9]: https://www.videolan.org/vlc/
[10]: https://cmus.github.io/
[11]: https://fedoramagazine.org/wp-content/uploads/2019/02/Screenshot_2019-04-13-jflory7%E2%80%99s-week-in-music2-1024x500.png
[12]: https://github.com/mariusor/mpris-scrobbler#authenticate-to-the-service
[13]: https://listenbrainz.org/profile/
[14]: https://fedoramagazine.org/wp-content/uploads/2019/04/Screenshot_2019-04-13-User-jflory-ListenBrainz.png
[15]: https://github.com/jwflory/swiss-army/blob/ba6ac0c71855e33e3caa1ee1fe51c05d2df0529d/roles/apps/i3wm/files/config#L207-L210
[16]: https://fedoramagazine.org/5-cool-music-player-apps/
[17]: https://fedoramagazine.org/picard-brings-order-music-library/
[18]: https://unsplash.com/photos/Qrspubmx6kE?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[19]: https://unsplash.com/search/photos/music?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
