[#]: subject: "Send desktop notifications and reminders from Linux terminal"
[#]: via: "https://opensource.com/article/22/1/linux-desktop-notifications"
[#]: author: "Tomasz Waraksa https://opensource.com/users/tomasz"
[#]: collector: "lujun9972"
[#]: translator: "mcfd"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14826-1.html"

如何从 Linux 终端发送桌面通知与提醒
======

> 这篇教程演示如何使用脚本命令来发送自己的桌面通知与提醒。

![](https://img.linux.net.cn/data/attachment/album/202207/14/145103vawkhy6w506thy6h.jpg)

有时候，来自脚本的视觉回馈是很有用的。例如，当一个脚本或计划任务完成时，一个长期运行的构建任务失败时，或者当脚本执行中出现了紧急问题时。桌面应用程序可以通过弹出通知来做到这一点，但脚本也可以做到这一点！你可以使用脚本命令来给自己发送桌面通知与提醒。

![Example notification][2]

下面的代码是在 Linux 上编写和测试的。它也可以在 macOS 上运行，只需花点功夫。请参见最后一节 [提示与技巧][3]。

### 从 Linux 终端发送通知

要从 Linux 终端发送通知，请使用 [notify-send][4] 命令。运行 `which notify-send` 命令来查看它是否在于你的系统中。如果没有，请使用包管理器来安装它。 

在 Fedora 上，输入：

```
$ sudo dnf install notify-send
```

在基于 Debian 的发行版上，输入： 

```
$ sudo apt install notify-send
```

几个简单的通知示例：

```
$ notify-send "Dinner ready!"
$ notify-send "Tip of the Day" "How about a nap?"
```

你可以用紧急程度、自定义图标等选项来自定义通知。过 `man notify-send` 了解更多。你也可以在通知正文中使用一小组 HTML 标记，以使消息有一个棒的视觉感受。最重要的是，URL 被呈现为可点击的。例如： 

```
$ notify-send -u critical \
  "Build failed!" \
  "There were <b>123</b> errors. Click here to see the results: http://buildserver/latest"
```

![Build fail notification][5]

发送的通知会被桌面环境接收，并像其他通知一样显示。它们将具有相同的外观、交互和行为。

### 将 notify-send 与 at 结合使用

计划任务通常被用来定期安排命令。`at` 命令安排在一个指定的时间执行一条命令。如果你像这样运行它，它会以交互模式启动，你可以在其中输入要在指定时间执行的命令： 

```
$ at 12:00
```

这对脚本来说并不有用。幸运的是 `at` 接受来自标准输入的参数，所以我们可以这样使用它：

```
$ echo "npm run build" | at now + 1 minute
$ echo "backup-db" | at 13:00
```

有许多指定时间的方法。 从绝对时间，如 `10:00`，到相对时间，如 `now + 2 hours` ，再特殊时间，如`noon` 或 `midnight`。我们可以把它和 `notify-send` 结合起来，在未来的某个时间向自己发送提醒。例如： 

```
$ echo "notify-send 'Stop it and go home now?' 'Enough work for today.' -u critical" | at now
```

![Stop for the day notification][6]

### 提醒的命令

现在，建立一个自定义的 Bash 命令来给自己发送提醒信息。像这样简单且人性化的命令：

```
$ remind "I'm still here" now
$ remind "Time to wake up!" in 5 minutes
$ remind "Dinner" in 1 hour
$ remind "Take a break" at noon
$ remind "It's Friday pints time!" at 17:00
```

这比 Alexa 更好！该怎样做？ 

请看下面的代码。它定义了一个名为 `remind` 的函数，它支持上述语法。实际工作是在最后两行完成的。其余的部分负责显示帮助信息、参数校验等，这与任何大型应用程序中有用的代码与必要的白噪声的比例大致相同。

把代码保存在某个地方，例如，在 `~/bin/remind` 文件中，并在你的 `.bashrc` 配置文件写入该函数，以便在你登录时加载它：

```
$ source ~/bin/remind
```

重新打开终端，然后输入 `remind` 来查看语法。尽情享受吧！

```
#!/usr/bin/env bash
function remind () {
  local COUNT="$#"
  local COMMAND="$1"
  local MESSAGE="$1"
  local OP="$2"
  shift 2
  local WHEN="$@"
  # Display help if no parameters or help command
  if [[ $COUNT -eq 0 || "$COMMAND" == "help" || "$COMMAND" == "--help" || "$COMMAND" == "-h" ]]; then
    echo "COMMAND"
    echo "    remind &lt;message&gt; &lt;time&gt;"
    echo "    remind &lt;command&gt;"
    echo
    echo "DESCRIPTION"
    echo "    Displays notification at specified time"
    echo
    echo "EXAMPLES"
    echo '    remind "Hi there" now'
    echo '    remind "Time to wake up" in 5 minutes'
    echo '    remind "Dinner" in 1 hour'
    echo '    remind "Take a break" at noon'
    echo '    remind "Are you ready?" at 13:00'
    echo '    remind list'
    echo '    remind clear'
    echo '    remind help'
    echo
    return
  fi
  # Check presence of AT command
  if ! which at &gt;/dev/null; then
    echo "remind: AT utility is required but not installed on your system. Install it with your package manager of choice, for example 'sudo apt install at'."
    return
  fi
  # Run commands: list, clear
  if [[ $COUNT -eq 1 ]]; then
    if [[ "$COMMAND" == "list" ]]; then
      at -l
    elif [[ "$COMMAND" == "clear" ]]; then
      at -r $(atq | cut -f1)
    else
      echo "remind: unknown command $COMMAND. Type 'remind' without any parameters to see syntax."
    fi
    return
  fi
  # Determine time of notification
  if [[ "$OP" == "in" ]]; then
    local TIME="now + $WHEN"
  elif [[ "$OP" == "at" ]]; then
    local TIME="$WHEN"
  elif [[ "$OP" == "now" ]]; then
    local TIME="now"
  else
    echo "remind: invalid time operator $OP"
    return
  fi
  # Schedule the notification
  echo "notify-send '$MESSAGE' 'Reminder' -u critical" | at $TIME 2&gt;/dev/null
  echo "Notification scheduled at $TIME"
}

```

### 简单的提醒

通过这几个简单的开源命令，你可以将你自己的脚本、应用程序和任务与你的桌面结合起来。试一试吧！

* * *

（文内图片来自 Tomasz Waraksa, CC BY-SA 4.0）

本文经作者许可改编自 [原文][7]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/linux-desktop-notifications

作者：[Tomasz Waraksa][a]
选题：[lujun9972][b]
译者：[mcfd](https://github.com/mcfd)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tomasz
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/sites/default/files/buyeggs.png (Example notification)
[3]: https://opensource.com/article/22/1/linux-desktop-notifications/#script-notifications-on-macOS
[4]: https://manpages.ubuntu.com/manpages/xenial/man1/notify-send.1.html
[5]: https://opensource.com/sites/default/files/buildfail.png (Build fail notification)
[6]: https://opensource.com/sites/default/files/stop-it.png (Stop for the day notification)
[7]: https://letsdebug.it/post/30-linux-desktop-notifications/
