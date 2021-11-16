[#]: subject: "How I build command-line apps in JavaScript"
[#]: via: "https://opensource.com/article/21/11/javascript-command-line-apps"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13989-1.html"

如何用 JavaScript 构建命令行应用
======

> 为你的用户提供选项是任何应用的一个重要功能，而 Commander.js 使它变得容易做到。你最喜欢的 JavaScript 命令行构建器是什么？

![](https://img.linux.net.cn/data/attachment/album/202111/16/114501u11upndpphhu2uhh.jpg)

JavaScript 是一种为 Web 开发的语言，但它的用处已经远远超出了互联网的范畴。由于 Node.js 和 Electron 这样的项目，JavaScript 既是一种通用的脚本语言，也是一种浏览器组件。有专门设计的 JavaScript 库来构建命令行界面。是的，你可以在你的终端中运行 JavaScript。

现在，当你在终端中输入一个命令时，一般都有 [选项][2]，也叫 _开关_ 或 _标志_，你可以用来修改命令的运行方式。这是由 [POSIX 规范][3] 定义的一个有用的惯例，所以作为一个程序员，知道如何检测和解析这些选项是很有帮助的。要从 JavaScript 获得此功能，使用旨在简化构建命令行界面的库很有用。我最喜欢的是 [Commander.js][4]。它很简单，很灵活，而且很直观。

### 安装 node

要使用 Commander.js 库，你必须安装 Node.js。在 Linux 上，你可以用你的包管理器安装 Node。例如，在 Fedora、CentOS、Mageia 和其他系统上：

```
$ sudo dnf install nodejs
```

在 Windows 和 macOS 上，你可以 [从 nodejs.org 网站下载安装程序][5]。

### 安装 Commander.js

要安装 Commander.js，请使用 `npm` 命令：

```
$ npm install commander
```

### 在你的 JavaScript 代码中添加一个库

在 JavaScript 中，你可以使用 `require` 关键字在你的代码中包含（或者导入，如果你习惯于 Python）一个库。创建一个名为 `example.js` 的文件，并在你喜欢的文本编辑器中打开它。在顶部添加这一行，以包括 Commander.js 库：

```
const { program } = require('commander');
```

### JavaScript 中的选项解析

要解析选项，你必须做的第一件事是定义你的应用可以接受的有效选项。Commander.js 库可以让你定义短选项和长选项，同时还有一个有用的信息来澄清每个选项的目的。

```
program
  .description('A sample application to parse options')
  .option('-a, --alpha', 'Alpha')
  .option('-b, --beta <VALUE>', 'Specify a VALUE', 'Foo');
```

第一个选项，我称之为 `--alpha`（简写 `-a`），是一个布尔型开关：它要么存在，要么不存在。它不需要任何参数。第二个选项，我称之为 `--beta`（简写 `-b`），接受一个参数，甚至在你没有提供任何参数的情况下指定一个默认值。

### 访问命令行数据

当你定义了有效的选项，你就可以使用长的选项名称来引用这些值：

```
program.parse();

const options = program.opts();
console.log('Options detected:');

if (options.alpha) console.log('alpha');
 
const beta = !options.beta ? 'no' : options.beta;
console.log('beta is: %s', beta);
```

### 运行应用

试着用 `node` 命令来运行它，首先不使用选项：

```
$ node ./example.js 
Options detected: 
beta is: Foo
```

在用户没有覆盖的情况下，`beta` 的默认值被使用。

再次运行它，这次使用选项：

```
$ node ./example.js --beta hello --alpha
Options detected: 
alpha
beta is: hello
```

这次，测试脚本成功检测到了选项 `--alpha`，以及用户提供的 `--beta` 选项的值。

### 选项解析

下面是完整的演示代码供你参考：

```
const { program } = require('commander');

program
  .description('A sample application to parse options')
  .option('-a, --alpha', 'Alpha')
    .option('-b, --beta <VALUE>', 'Specify a VALUE', 'Foo');

program.parse();

const options = program.opts();
console.log('Options detected:');

console.log(typeof options);

if (options.alpha) console.log(' * alpha');
const beta = !options.beta ? 'no' : options.beta;
console.log(' * beta is: %s', beta);
```

在该项目的 [Git 仓库][4] 中还有更多例子。

对任何应用来说，包括用户的选项都是一个重要的功能，而 Commander.js 使它很容易做到。除了 Commander.js，还有其他库，但我觉得这个库使用起来很方便快捷。你最喜欢的 JavaScript 命令行构建器是什么？

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/javascript-command-line-apps

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_javascript.jpg?itok=60evKmGl (Javascript code close-up with neon graphic overlay)
[2]: https://opensource.com/article/21/8/linux-terminal
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://github.com/tj/commander.js
[5]: https://nodejs.org/en/download
