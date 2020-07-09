[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Program IoT systems using Python with this VSCode plugin for RTOS)
[#]: via: (https://opensource.com/article/20/7/python-rt-thread)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Program IoT systems using Python with this VSCode plugin for RTOS
======
A real-time embedded OS like RTOS makes programming embedded systems
easier.
![Parts, modules, containers for software][1]

The pervasiveness of the Internet of Things (IoT) means nearly every product, from refrigerators to pocket watches, can connect to a network. For that to happen, all these products must have an embedded computer running a networking stack, and some of these products are almost impossibly small. That's where embedded software comes in: modern technology provides a tiny computer, hard-coded into a hardware chip, without any need for offboard CPU, RAM, or hard drive.

Traditionally, that meant there was no operating system (OS), but [for many reasons][2], developers find a real-time embedded OS like [RT-Thread][3] makes programming embedded systems much easier.

The RT-Thread embedded operating system aims to encourage new programmers to get into IoT, but not everyone can hard-code a microchip in C. Luckily, MicroPython is filling that niche by enabling developers to create software in Python that runs on embedded systems. To make it even easier, RT-Thread has a plugin for VSCode and [VSCodium][4] that provides a development environment developers can use to get started with IoT. Some of its features include:

  * A convenient connection mode, so you can easily connect to your development board over a serial port, over the network, or over USB (if you've used an Arduino, you'll be familiar with the workflow)
  * Support for uploading files or folders to your development board
  * Support for MicroPython-based code, with intelligent code completion and linting (syntax checking)
  * Support for the MicroPython REPL interactive environment
  * Many code examples and demo programs
  * Full project synchronization
  * Fast-running code files stored in memory
  * Code snippets to run functions
  * Support for several major MicroPython development boards
  * Support for and tested on Linux and Windows



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
