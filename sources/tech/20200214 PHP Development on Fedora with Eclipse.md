[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (PHP Development on Fedora with Eclipse)
[#]: via: (https://fedoramagazine.org/php-development-on-fedora-with-eclipse/)
[#]: author: (Mehdi Haghgoo https://fedoramagazine.org/author/powergame/)

PHP Development on Fedora with Eclipse
======

![][1]

[Eclipse][2] is a full-featured free and open source IDE developed by the Eclipse Foundation. It has been around since 2001. You can write anything from C/C++ and Java to PHP, Python, HTML, JavaScript, Kotlin, and more in this IDE.

### Installation

The software is available from Fedora’s official repository. To install it, invoke:

```
sudo dnf install eclipse
```

This will install the base IDE and Eclipse platform, which enables you to develop Java applications. In order to add PHP development support to the IDE, run this command:

```
sudo dnf install eclipse-pdt
```

This will install PHP development tools like PHP project wizard, PHP server configurations, composer support, etc.

### Features

This IDE has many features that make PHP development easier. For example, it has a comprehensive project wizard (where you can configure many options for your new projects). It also has built-in features like composer support, debugging support, a browser,a terminal, and more.

### Sample project

Now that the IDE is installed, let’s create a simple PHP project. Go to _File →New → Project_. From the resulting dialog, select _PHP project_. Enter a name for your project. There are some other options you might want to change, like changing the project’s default location, enabling JavaScript, and changing PHP version. See the following screenshot.

![Create A New PHP Project in Eclipse][3]

You can click the _Finish_ button to create the project or press _Next_ to configure other options like adding include and build paths. You don’t need to change those in most cases.

Once the project is created, right click on the project folder and select _New → PHP File_ to add a new PHP file to the project. For this tutorial I named it _index.php_, the conventionally-recognized default file in every PHP project.

![][4]

Then add the your code to the new file.

![Demo PHP code][5]

In the example above, I used CSS, JavaScript, and PHP tags on the same page mainly to show that the IDE is capable of supporting all of them together.

Once your page is ready, you can see the result output by moving the file to your web server document root or by creating a development PHP server in the project directory.

Thanks to the built-in terminal in Eclipse, we can launch a PHP development server right from within the IDE. Simply click the terminal icon on the toolbar (![Terminal Icon][6]) and click _OK_. In the new terminal, change to the project directory and run the following command:

```
php -S localhost:8080 -t . index.php
```

![Terminal output][7]

Now, open a browser and head over to <http://localhost:8080>. If everything has been done correctly per instructions and your code is error-free, you will see the output of your PHP script in the browser.

![PHP output in Fedora][8]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/php-development-on-fedora-with-eclipse/

作者：[Mehdi Haghgoo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/php-eclipse-816x346.png
[2]: https://projects.eclipse.org/projects/eclipse
[3]: https://fedoramagazine.org/wp-content/uploads/2020/02/Screenshot-from-2020-02-07-01-58-39.png
[4]: https://fedoramagazine.org/wp-content/uploads/2020/02/Screenshot-from-2020-02-07-02-02-05-1024x576.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/02/code-1024x916.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/02/Screenshot-from-2020-02-07-03-50-05.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/02/terminal-1024x239.png
[8]: https://fedoramagazine.org/wp-content/uploads/2020/02/output.png
