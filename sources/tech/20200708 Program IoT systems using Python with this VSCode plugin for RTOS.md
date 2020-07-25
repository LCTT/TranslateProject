[#]: collector: (lujun9972)
[#]: translator: (silentdawn-zz)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Program IoT systems using Python with this VSCode plugin for RTOS)
[#]: via: (https://opensource.com/article/20/7/python-rt-thread)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 VSCode RTOS 插件为物联网系统编写 Python 程序
======
RTOS 之类的实时嵌入式操作系统使嵌入式系统的编程更简单

![Parts, modules, containers for software][1]

物联网（ IoT ）无处不在，它意味着几乎所有的产品，从冰箱到口袋手表，都可以连网。为了实现这个目标，每个产品都需要拥有一个嵌入式计算机来运行网络栈，有些产品几乎是小的不可思议。这就是嵌入式软件出现的场景：现代科技打造的非常小的计算机，硬编码到硬件芯片，不需要任何板外处理器、内存或者存储盘。

就传统视角而言，这种场景意味着没有操作系统可用，但是因为种种 [原因][2]，开发者发现，类似于 RTOS 之类的实时嵌入式操作系统能让嵌入式系统的编程变得非常简单。

虽然RT-Thread 嵌入式操作系统致力于鼓励程序员新手进入物联网领域，但并非所有的人都具备使用 C 语言硬编码微芯片的能力。幸运的是，MicroPython 通过让开发者创建运行于嵌入式系统的 Python 代码的方式，逐渐填补了这个鸿沟。为了让整个过程更简单，RT-Thread 有一个可以用于 VSCode 和 [VSCodium][4] 的插件，为开发者提供了物联网方面的开发环境。其部分特性包括：

  * 方便的连接方式，可以很容易的通过串口、网络或者 USB 连接到开发板（如果你使用过 Arduino，肯定会很熟悉这个流程）。
  * 支持上传文件或目录到开发板。
  * 支持基于 MicroPython 的代码，而且具有智能的代码补充、语法检查功能。
  * 支持 MicroPython REPL 交互式环境。
  * 丰富的示例代码和演示程序。
  * 完整的工程同步功能。
  * 快速运行内存中的程序代码。
  * 函数运行的代码片段。
  * 支持主流的 MicroPython 开发板。
  * 支持 Linux 和 Windows 操作系统，并经过充分测试。



### Requirements

Before getting started, if you're using Windows, you must ensure that your default VSCode terminal is set to [PowerShell][5]. Launch VSCodium and start a terminal from the **Terminal** menu. In the terminal that appears at the bottom of your VSCodium window, select **PowerShell** from the drop-down menu in the top bar.

Whether you're [on Windows][6] or Linux, you must have Python 3 installed. (On Linux, it's probably already installed or available in your software repository.)

You should also install the general Python plugin for VSCode from Microsoft. To install it, click the **File** menu and find the **Preferences** submenu. Open the **Extensions** panel from the **Preferences** menu. In **Extensions**, search for Python, and install the Microsoft plugin.

![VSCodium Python plugin][7]

(Seth Kenlon, [CC BY-SA 4.0][8])

Finally, you must have [VSCodium][9] or [VSCode][10] installed.

### Install the plugin

Installing the MicroPython development plugin follows the same process as installing the Python plugin. Click the **File** menu, find the **Preferences** submenu, and select **Extensions**.

In **Extensions**, search for **MicroPython**, and install the RT-Thread plugin.

![MicroPython plugin for RT-Thread][11]

(Seth Kenlon, [CC BY-SA 4.0][8])

### Use the plugin

Your board must have access to a serial port, which it gets through your group permissions. You probably need to add yourself to this group, because it's not usually set by default. First, verify that you're not already a member of `dialout`:


```
$ groups
tux users
```

In this example, the user `tux` is only a member of `tux` and `users`, so it needs to be added to `dialout`:


```
`$ sudo usermod --append --groups dialout tux`
```

Log out or reboot to load your new group permissions.

### Create a MicroPython project

The first step in MicroPython development is to create a MicroPython project to write and run your code. To create a MicroPython project using the plugin, click the **Create MicroPython project** button in the bottom bar (on the left).

![Create MicroPython project][12]

(Seth Kenlon, [CC BY-SA 4.0][8])

This leads you through a few prompts, letting you choose either an empty project structure or a project containing example code.

### Connect your dev board

You can connect from VSCodium to your physical development board by clicking the **Connection** button in the lower-left corner of VSCodium. Select the device you want to connect to in the pop-up list of devices.

### Review sample code

The MicroPython plugin offers a lot of sample code and library files you can use and learn from. These are available from new icons, visible when the MicroPython plugin is active, in VSCodium's left button bar. The **Document** icon lists example code files, and the **Folder** icon lists example libraries.

![MicroPython examples][13]

(Seth Kenlon, [CC BY-SA 4.0][8])

### Run MicroPython files directly on your development board

You can debug a single file quickly and easily by running code on your board within VSCodium. The shortcut **Alt**+**Q** triggers a special plugin function to upload your current Python file to the memory of your connected development board. Alternatively, you can right-click on your current Python file and select **Run the MicroPython file directly on the device**.

![Running code on your device][14]

(Seth Kenlon, [CC BY-SA 4.0][8])

If you want to debug a small amount of code without loading files to your board, you can use the code-snippet function. To run selected code in the MicroPython REPL environment, select the snippet you want to run in the editor, and select **Execute the selected MicroPython code on the device** option from the right-click menu (or just press **Alt**+**Q** on your keyboard).

### Load files and folders to your dev board

If you want to load individual files or folders to your development board, there's a handy function for that. First, select the file or folder you want to upload in the project. Next, right-click on one of your selections and choose **Download the file/folder to the device**.

Note that if there are files or folders with the same name on the development board, the download overwrites the existing ones.

By entering the command `os.listdir()` in REPL, you can check whether the corresponding file or folder has been downloaded successfully. Similarly, you can also use the corresponding command to delete the file or folder in REPL.

To remove a file:


```
`os.remove('file_to_delete')`
```

To remove a folder:


```
`os.rmdir('folder_to_delete')`
```

### Project synchronization

Click the **Synchronization** button in the lower-left corner to start the project synchronization function. This feature synchronizes all directory files in the local project to the development board's filesystem. This feature is recommended to be used after the code is debugged, without the need to synchronize the project frequently during debugging.

After the project synchronization completes, the list of files in the device can be seen in the **Device Files List** column.

### Try it yourself

RT-Thread released the MicroPython plugin as an open source extension in hopes that it will be useful for new and experienced coders alike. It has many features and leverages others (like code completion and linting) from open source plugins. If you're interested in coding for embedded and IoT devices, there's no easier way to get started.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/python-rt-thread

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://opensource.com/article/20/6/open-source-rtos
[3]: https://www.rt-thread.io/
[4]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[5]: https://opensource.com/article/18/2/powershell-people
[6]: https://opensource.com/article/19/8/how-install-python-windows
[7]: https://opensource.com/sites/default/files/uploads/vscodium-python-plugin.jpg (VSCodium Python plugin)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: http://vscodium.com
[10]: https://github.com/microsoft/vscode
[11]: https://opensource.com/sites/default/files/uploads/vscodium-micropython.jpg (MicroPython plugin for RT-Thread)
[12]: https://opensource.com/sites/default/files/uploads/vscodium-micropython-create.jpg (Create MicroPython project)
[13]: https://opensource.com/sites/default/files/uploads/vscodium-micropython-examples.jpg (MicroPython examples)
[14]: https://opensource.com/sites/default/files/uploads/vscodium-micropython-run.jpg (Running code on your device)
