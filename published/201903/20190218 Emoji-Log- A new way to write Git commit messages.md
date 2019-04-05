[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10627-1.html)
[#]: subject: (Emoji-Log: A new way to write Git commit messages)
[#]: via: (https://opensource.com/article/19/2/emoji-log-git-commit-messages)
[#]: author: (Ahmad Awais https://opensource.com/users/mrahmadawais)

Emoji-Log：编写 Git 提交信息的新方法
======

> 使用 Emoji-Log 为你的提交添加上下文。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/emoji_tech_keyboard.jpg?itok=ncBNKZFl)

我是一名全职的开源开发人员，我喜欢称自己为“开源者”。我从事开源软件工作已经超过十年，并[构建了数以百计的][1]开源软件应用程序。

同时我也是“<ruby>避免重复工作<rt>Don't Repeat Yourself</rt></ruby>”（DRY）哲学的忠实粉丝，并且我相信编写更好的 Git 提交消息是 DRY 的一个重要组成部分。它们具有足够的上下文关联，可以作为你开源软件的变更日志。我编写的众多工作流之一是 [Emoji-Log][2]，它是一个简单易用的开源 Git 提交日志标准。它通过使用表情符号来创建更好的 Git 提交消息，从而改善了开发人员的体验（DX）。

我使用 Emoji-Log 构建了 [VSCode Tips & Tricks 仓库][3] 和我的 🦄 [紫色 VSCode 主题仓库][4]，以及一个看起来很漂亮的[自动变更日志][5]。

### Emoji-Log 的哲学

我喜欢（很多）表情符号，我很喜欢它们。编程、代码、极客/书呆子、开源……所有这一切本质上都很枯燥，有时甚至很无聊。表情符号帮助我添加颜色和情感。想要将感受添加到这个 2D 的、平板的、基于文本的代码世界并没有错。

相比于[数百个表情符号][6]，我学会的更好办法是让类别较小和普遍性。以下是指导使用 Emoji-Log 编写提交信息的原则：

  1. **必要的**
    * Git 提交信息是必要的。
    * 像下订单一样编写提交信息。
      * 例如，使用 ✅ **Add** 而不是 ❌ **Added**
      * 例如，使用 ✅ **Create** 而不是 ❌ **Creating**
  2. **规则**
    * 少数类别易于记忆。
    * 不多也不少
      * 例如  **📦 NEW** 、 **👌 IMPROVE** 、 **🐛 FIX** 、 **📖 DOC** 、 **🚀 RELEASE** 、 **✅ TEST**
  3. **行为**
    * 让 Git 的提交基于你所采取的操作
    * 使用像 [VSCode][7] 这样的编辑器来提交带有提交信息的正确文件。

### 编写提交信息

仅使用以下 Git 提交信息。简单而小巧的占地面积是 Emoji-Log 的核心。

  1. **📦 NEW: 必要的信息**
    * 当你添加一些全新的东西时使用。
      * 例如 **📦 NEW: 添加 Git 忽略的文件**
  2. **👌 IMPROVE: 必要的信息**
    * 用于改进/增强代码段，如重构等。
      * 例如 **👌 IMPROVE: 远程 IP API 函数**
  3. **🐛 FIX: 必要的信息**
    * 修复 bug 时使用，不用解释了吧？
      * 例如 **🐛 FIX: Case converter**
  4. **📖 DOC: 必要的信息**
    * 添加文档时使用，比如 README.md 甚至是内联文档。
      * 例如 **📖 DOC: API 接口教程**
  5. **🚀 RELEASE: 必要的信息**
    * 发布新版本时使用。例如， **🚀 RELEASE: Version 2.0.0**
  6. **✅ TEST: 必要的信息**
    * 发布新版本时使用。
      * 例如 **✅ TEST: 模拟用户登录/注销**

就这些了，不多不少。

### Emoji-Log 函数

为了快速构建原型，我写了以下函数，你可以将它们添加到 `.bashrc` 或者 `.zshrc` 文件中以快速使用 Emoji-Log。

```
#.# Better Git Logs.

### Using EMOJI-LOG (https://github.com/ahmadawais/Emoji-Log).

# Git Commit, Add all and Push — in one step.

function gcap() {
    git add . && git commit -m "$*" && git push
}

# NEW.
function gnew() {
    gcap "📦 NEW: $@"
}

# IMPROVE.
function gimp() {
    gcap "👌 IMPROVE: $@"
}

# FIX.
function gfix() {
    gcap "🐛 FIX: $@"
}

# RELEASE.
function grlz() {
    gcap "🚀 RELEASE: $@"
}

# DOC.
function gdoc() {
    gcap "📖 DOC: $@"
}

# TEST.
function gtst() {
    gcap "✅ TEST: $@"
}
```

要为 [fish shell][8] 安装这些函数，运行以下命令：

```
function gcap; git add .; and git commit -m "$argv"; and git push; end;
function gnew; gcap "📦 NEW: $argv"; end
function gimp; gcap "👌 IMPROVE: $argv"; end;
function gfix; gcap "🐛 FIX: $argv"; end;
function grlz; gcap "🚀 RELEASE: $argv"; end;
function gdoc; gcap "📖 DOC: $argv"; end;
function gtst; gcap "✅ TEST: $argv"; end;
funcsave gcap
funcsave gnew
funcsave gimp
funcsave gfix
funcsave grlz
funcsave gdoc
funcsave gtst
```

如果你愿意，可以将这些别名直接粘贴到 `~/.gitconfig` 文件：

```
# Git Commit, Add all and Push — in one step.
cap = "!f() { git add .; git commit -m \"$@\"; git push; }; f"

# NEW.
new = "!f() { git cap \"📦 NEW: $@\"; }; f"
# IMPROVE.
imp = "!f() { git cap \"👌 IMPROVE: $@\"; }; f"
# FIX.
fix = "!f() { git cap \"🐛 FIX: $@\"; }; f"
# RELEASE.
rlz = "!f() { git cap \"🚀 RELEASE: $@\"; }; f"
# DOC.
doc = "!f() { git cap \"📖 DOC: $@\"; }; f"
# TEST.
tst = "!f() { git cap \"✅ TEST: $@\"; }; f"
```

### Emoji-Log 例子

这里列出了一些使用 Emoji-Log 的仓库：

- [Create-guten-block toolkit](https://github.com/ahmadawais/create-guten-block/commits/)
- [VSCode Shades of Purple theme](https://github.com/ahmadawais/shades-of-purple-vscode/commits/)
- [Ahmad Awais' GitHub repos](https://github.com/ahmadawais)  （我的最新的仓库）
- [CaptainCore CLI](https://github.com/CaptainCore/captaincore-cli/commits/) （WordPress 管理工具）
- [CaptainCore GUI](https://github.com/CaptainCore/captaincore-gui/commits/) （WordPress 插件）

你呢？如果你的仓库使用 Emoji-Log，请将这个 [Emoji-Log 徽章](https://on.ahmda.ws/rOMZ/c)放到你的 README 中，并给我发送一个[拉取请求](https://github.com/ahmadawais/Emoji-Log/pulls)，以让我可以将你的仓库列在这里。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/emoji-log-git-commit-messages

作者：[Ahmad Awais][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mrahmadawais
[b]: https://github.com/lujun9972
[1]: https://github.com/ahmadawais
[2]: https://github.com/ahmadawais/Emoji-Log/
[3]: https://github.com/ahmadawais/VSCode-Tips-Tricks
[4]: https://github.com/ahmadawais/shades-of-purple-vscode/commits/master
[5]: https://github.com/ahmadawais/shades-of-purple-vscode/blob/master/CHANGELOG.md
[6]: https://gitmoji.carloscuesta.me/
[7]: https://VSCode.pro
[8]: https://en.wikipedia.org/wiki/Friendly_interactive_shell
