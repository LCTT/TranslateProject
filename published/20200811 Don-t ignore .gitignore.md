[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12524-1.html)
[#]: subject: (Don't ignore .gitignore)
[#]: via: (https://opensource.com/article/20/8/dont-ignore-gitignore)
[#]: author: (Rajeev Bera https://opensource.com/users/acompiler)

不要忽视 .gitignore
======

> 使用 .gitignore 文件是提高代码和 Git 仓库质量的最佳实践之一。

![](https://img.linux.net.cn/data/attachment/album/202008/16/211643mahzp0zthbh0z55w.jpg)

我注意到很多开发者没有使用 `.gitignore` 文件，尽管使用 `.gitignore` 文件来指定你不希望 Git 在版本控制中跟踪的文件是[最佳实践][2]之一。`.gitignore` 可以提高代码质量，所以你不应该忽略版本库中的 [.gitignore][3]。

### 什么是 .gitignore？

Git 仓库中的文件可以是：

  1. **未跟踪的**：未被暂存或提交的变更。
  2. **跟踪的**：已暂存或提交的变更。
  3. **忽略的**：你让 Git 忽略的文件。

有些文件你希望 Git 忽略，不要在你的版本库中跟踪它，这些文件包括许多自动生成的或特定于平台的文件，以及其他本地配置文件，如：

  1. 含有敏感信息的文件
  2. 编译出的代码，如 `.dll` 或 `.class`。
  3. 系统文件，如 `.DS_Store` 或 `Thumbs.db`。
  4. 含有临时信息的文件，如日志、缓存等。
  5. 生成的文件，如 `dist` 文件夹。

如果你不想让 Git 跟踪版本库中的某些文件，不过这不能通过 [Git 命令][4]做到。（虽然你可以用 `git rm` 命令停止跟踪一个文件，比如 `git rm --cached`。）相反，你需要使用 `.gitignore` 文件，这是一个告诉 Git 不要跟踪哪些文件的文本文件。

创建 `.gitignore` 文件很简单，只需创建一个文本文件并命名为 `.gitignore`。记得在文件名的开头有一个点（`.`）。就这样就完成了。

### 编写 .gitignore 文件的规则

根据[文档][3]，“`.gitignore` 文件中的每一行都指定了一个模式。”

在此上下文中，“模式”可以指一个特定的文件名，或者指文件名的某些部分结合上通配符。换句话说，`example.txt` 是匹配名为 `example.txt` 的文件的有效模式，而 `ex*txt` 是匹配名为 `example.txt` 以及 `export.txt` 的文件的有效模式。

以下是一些帮助你正确设置 `.gitignore` 文件的基本规则：

  1. 任何以哈希（`#`）开头的行都是注释。
  2. `\` 字符可以转义特殊字符。
  3. `/` 字符表示该规则只适用于位于同一文件夹中的文件和文件夹。
  4. 星号（`*`）表示任意数量的字符（零个或更多）。
  5. 两个星号（`**`）表示任意数量的子目录。
  6. 一个问号（`?`）代替零个或一个字符。
  7. 一个感叹号（`!`）会反转特定的规则（即包括了任何被前一个模式排除的文件）。
  8. 空行会被忽略，所以你可以用它们来增加空间，使你的文件更容易阅读。
  9. 在末尾添加 `/` 会忽略整个目录路径。

### 本地与全局 .gitignore 文件的比较

有两种类型的 `.gitignore` 文件：

  * **本地**：放在 Git 仓库的根目录下，只在该仓库中工作，并且必须提交到该仓库中。
  * **全局**：放在你的主目录根目录下，影响你在你的机器上使用的每个仓库，不需要提交。

很多开发者在项目仓库中使用本地的 `.gitignore` 文件，但很少有人使用全局的 `.gitignore` 文件。使用全局文件最显著的优势是，你不需要提交就可以使用它，而且做一个改动会影响你所有的版本库。

### Git 忽略的优势

除了确保特定的文件不被 Git 追踪之外，使用 `.gitignore` 文件还有其他好处。

  1. 通过忽略不需要的文件，它可以帮助你保持代码库的干净。
  2. 它可以控制代码库的大小，这在你正在做一个大项目的时候特别有用。
  3. 你的每一次提交、推送和拉取请求都将是干净的。

### 结束语

Git 很强大，但归根结底，它只是一个计算机程序而已。使用最佳实践并保持你的代码仓库稳定是一个团队的努力，其中要做到一件事就是使用 `.gitignore` 文件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/dont-ignore-gitignore

作者：[Rajeev Bera][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/acompiler
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/20/7/git-repos-best-practices
[3]: https://git-scm.com/docs/gitignore
[4]: https://acompiler.com/git-commands/
