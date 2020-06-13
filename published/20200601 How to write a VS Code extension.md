[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12310-1.html)
[#]: subject: (How to write a VS Code extension)
[#]: via: (https://opensource.com/article/20/6/vs-code-extension)
[#]: author: (Ashique Hussain Ansari https://opensource.com/users/uidoyen)

如何编写 VS Code 扩展
======

> 通过为流行的代码编辑器编写自己的扩展来添加缺失的功能。

![](https://img.linux.net.cn/data/attachment/album/202006/13/105415w5u1d0z5bdoneb82.jpg)

Visual Studio Code（VS Code）是微软为 Linux、Windows 和 macOS 创建的跨平台代码编辑器。遗憾的是，微软版本的 [VS Code][2] 是在 [Microsoft Software License][3] 下发布的，这不是一个开源的许可证。然而，它的源代码是开源的，在 MIT 许可证下由 [VSCodium][4] 项目发布。

VSCodium 和 VS Code一样，支持扩展、内嵌式 Git 控制、GitHub 集成、语法高亮、调试、智能代码补完、代码片段等。换句话说，对于大多数用户来说，使用 VS Code 和 VSCodium 没有什么区别，而且后者是完全开源的！

### 什么是 VS Code 扩展？

<ruby>扩展<rt>extension</rt></ruby>可以让你为 VS Code 或 VSCodium 添加功能。你可以在 GUI 中或从终端安装扩展。

你也可以构建自己的扩展。有几个你可能想学习如何构建扩展的原因：

1. **想要添加一些功能：** 如果缺失你想要的功能，你可以创建一个扩展来添加它。
2. **为了乐趣和学习：** 扩展 API 允许你探索 VSCodium 是如何工作的，这是一件有趣的事情。
3. **为了提高您的技能：** 创建扩展可以提高你的编程技能。
4. **为了成名：** 创建一个对他人有用的扩展可以提高你的公众形象。

### 安装工具

在你开始之前，你必须已经安装了 [Node.js][5]、[npm][6] 和 VS Code 或 [VSCodium][4]。

要生成一个扩展，你还需要以下工具：[Yeoman][7]，是一个开源的客户端脚手架工具，可以帮助你搭建新项目；以及 [vscode-generator-code][8]，是 VS Code 团队创建的 Yeoman 生成器。

### 构建一个扩展

在本教程中，你将构建一个扩展，它可以为应用程序初始化一个 Docker 镜像。

#### 生成一个扩展骨架

要在全局范围内安装并运行 Yeoman 生成器，请在命令提示符或终端中输入以下内容：

```
npm install -g yo generator-code
```

导航到要生成扩展的文件夹，键入以下命令，然后按回车：

```
yo code
```

根据提示，你必须回答一些关于你的扩展的问题：

* **你想创建什么类型的扩展？** 使用上下箭头选择其中一个选项。在本文中，我将只介绍第一个选项，`New Extension (TypeScript)`。
* **你的扩展名称是什么？** 输入你的扩展名称。我的叫 `initdockerapp`。（我相信你会有一个更好的名字。）
* **你的扩展的标识符是什么？** 请保持原样。
* **你的扩展的描述是什么？** 写一些关于你的扩展的内容（你可以现在填写或稍后编辑它）。
* **初始化 Git 仓库？** 这将初始化一个 Git 仓库，你可以稍后添加 `set-remote`。
* **使用哪个包管理器？** 你可以选择 `yarn` 或 `npm`；我使用 `npm`。

按回车键后，就会开始安装所需的依赖项。最后显示：

> "Your extension **initdockerapp** has been created!"

干的漂亮！

### 检查项目的结构

检查你生成的东西和项目结构。导航到新的文件夹，并在终端中键入 `cd initdockerapp`。

一旦你进入该目录，键入 `.code`。它将在你的编辑器中打开，看起来像这样。

![Project file structure in VSCodium][9]

（Hussain Ansari, [CC BY-SA 4.0][10]）

最需要注意的两个文件是 `src` 文件夹内的 `package.json` 和 `extension.ts`。

#### package.json

首先来看看 `package.json`，它应该是这样的。

```
{
        "name": "initdockerapp",
        "displayName": "initdockerapp",
        "description": "",
        "version": "0.0.1",
        "engines": {
                "vscode": "^1.44.0"
        },
        "categories": [
                "Other"
        ],
        "activationEvents": [
                "onCommand:initdockerapp.initialize"
        ],
        "main": "./out/extension.js",
        "contributes": {
                "commands": [
                        {
                                "command": "initdockerapp.initialize",
                                "title": "Initialize A Docker Application"
                        }
                ]
        },
        "scripts": {
                "vscode:prepublish": "npm run compile",
                "compile": "tsc -p ./",
                "lint": "eslint src --ext ts",
                "watch": "tsc -watch -p ./",
                "pretest": "npm run compile && npm run lint",
                "test": "node ./out/test/runTest.js"
        },
        "devDependencies": {
                "@types/vscode": "^1.44.0",
                "@types/glob": "^7.1.1",
                "@types/mocha": "^7.0.2",
                "@types/node": "^13.11.0",
                "eslint": "^6.8.0",
                "@typescript-eslint/parser": "^2.26.0",
                "@typescript-eslint/eslint-plugin": "^2.26.0",
                "glob": "^7.1.6",
                "mocha": "^7.1.1",
                "typescript": "^3.8.3",
                "vscode-test": "^1.3.0"
        }
}
{
        "name": "initdockerapp",
        "displayName": "initdockerapp",
        "description": "",
        "version": "0.0.1",
        "engines": {
                "vscode": "^1.44.0"
        },
        "categories": [
                "Other"
        ],
        "activationEvents": [
                "onCommand:initdockerapp.initialize"
        ],
        "main": "./out/extension.js",
        "contributes": {
                "commands": [
                        {
                                "command": "initdockerapp.initialize",
                                "title": "Initialize A Docker Application"
                        }
                ]
        },
        "scripts": {
                "vscode:prepublish": "npm run compile",
                "compile": "tsc -p ./",
                "lint": "eslint src --ext ts",
                "watch": "tsc -watch -p ./",
                "pretest": "npm run compile && npm run lint",
                "test": "node ./out/test/runTest.js"
        },
        "devDependencies": {
                "@types/vscode": "^1.44.0",
                "@types/glob": "^7.1.1",
                "@types/mocha": "^7.0.2",
                "@types/node": "^13.11.0",
                "eslint": "^6.8.0",
                "@typescript-eslint/parser": "^2.26.0",
                "@typescript-eslint/eslint-plugin": "^2.26.0",
                "glob": "^7.1.6",
                "mocha": "^7.1.1",
                "typescript": "^3.8.3",
                "vscode-test": "^1.3.0"
        }
}
```

如果你是 Node.js 开发者，其中一些可能看起来很熟悉，因为 `name`、`description`、`version` 和 `scripts` 是 Node.js 项目的常见部分。

有几个部分是非常重要的：

* `engines`：说明该扩展将支持哪个版本的 VS Code / VSCodium。
* `categories`：设置扩展类型；你可以从 `Languages`、`Snippets`、`Linters`、`Themes`、`Debuggers`、`Formatters`、`Keymaps` 和 `Other` 中选择。
* `contributes`：可用于与你的扩展一起运行的命令清单。
* `main`：扩展的入口点。
* `activationEvents`：指定激活事件发生的时间。具体来说，这决定了扩展何时会被加载到你的编辑器中。扩展是懒加载的，所以在激活事件触发之前，它们不会被激活。

#### src/extension.ts

接下来看看 `src/extension.ts`，它应该是这样的： 

```
// The module 'vscode' contains the VSCodium extensibility API
// Import the module and reference it with the alias vscode in your code below
import * as vscode from "vscode";
const fs = require("fs");
const path = require("path");

// this method is called when your extension is activated
// your extension is activated the very first time the command is executed
export function activate(context: vscode.ExtensionContext) {

        // Use the console to output diagnostic information (console.log) and errors (console.error)
        // This line of code will only be executed once when your extension is activated
        console.log('Congratulations, your extension "initdockerapp" is now active!');
       
        // The command has been defined in the package.json file
        // Now provide the implementation of the command with registerCommand
        // The commandId parameter must match the command field in package.json
        let disposable = vscode.commands.registerCommand('initdockerapp.initialize', () => {
                // The code you place here will be executed every time your command is executed

                let fileContent =`
                FROM node:alpine
                WORKDIR /usr/src/app

                COPY package.json .
                RUN npm install
               
                COPY . .
               
                EXPOSE 3000
                CMD ["npm", "start"]
                `;
               
                fs.writeFile(path.join(vscode.workspace.rootPath, "Dockerfile"), fileContent, (err:any) => {
                        if (err) {
                                return vscode.window.showErrorMessage("Failed to initialize docker file!");
                        }
                        vscode.window.showInformationMessage("Dockerfile has been created!");
                });
        });

        context.subscriptions.push(disposable);
}

// this method is called when your extension is deactivated
export function deactivate() {}
```

这是为你的扩展写代码的地方。已经有一些自动生成的代码了，我再来分析一下。

注意，`vscode.command.registerCommand` 里面的 `initdockerapp.initialize` 和 `package.json` 里面的命令是一样的。它需要两个参数。

1. 要注册的命令名称
2. 执行命令的功能

另一个需要注意的函数是 `fs.writeFile`，这是你写在 `vscode.command.registerCommand` 函数里面的。这将在你的项目根目录下创建一个 Dockerfile，并在其中附加代码来创建一个 Docker 镜像。

### 调试扩展

现在你已经写好了扩展，是时候调试它了。点击“Run”菜单，选择“Start Debugging”（或者直接按 `F5`）打开调试窗口。

在调试窗口里面点击“Add Folder”或“Clone Repository”按钮，打开该项目。

接下来，用 `Ctrl+Shift+P`（在 macOS 上，用 `Command` 键代替 `Ctrl`）打开命令面板，运行 `Initialize A Docker Application`。

* 第一次运行此命令时，自 VSCodium 启动后，激活函数尚未执行。因此，调用激活函数，并由激活 函数注册该命令。
* 如果命令已注册，那么它将被执行。

你会看到右下角有一条信息，上面写着：`Dockerfile has been created!`。这就创建了一个 Dockerfile，里面有一些预定义的代码，看起来是这样的：

![Running the new extension command][11]

（Hussain Ansari, [CC BY-SA 4.0][10]）

### 总结

有许多有用的 API 可以帮助你创建你想要构建的扩展。VS Code 扩展 API 还有许多其他强大的方法可以使用。

你可以在 VS Code 扩展 API 文档中了解更多关于 VS Code API 的信息。
 
--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/vs-code-extension

作者：[Ashique Hussain Ansari][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/uidoyen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://code.visualstudio.com/
[3]: https://code.visualstudio.com/license
[4]: https://vscodium.com/
[5]: https://nodejs.org/en/
[6]: https://www.npmjs.com/
[7]: https://yeoman.io/
[8]: https://github.com/Microsoft/vscode-generator-code
[9]: https://opensource.com/sites/default/files/uploads/vscode-tree.png (Project file structure in VSCodium)
[10]: https://creativecommons.org/licenses/by-sa/4.0/
[11]: https://opensource.com/sites/default/files/uploads/vscode-run-command.png (Running the new extension command)
