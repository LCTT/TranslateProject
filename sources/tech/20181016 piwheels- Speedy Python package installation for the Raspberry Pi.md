piwheels: Speedy Python package installation for the Raspberry Pi
======
https://opensource.com/article/18/10/piwheels-python-raspberrypi

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rainbow-pinwheel-piwheel-diversity-inclusion.png?itok=di41Wd3V)

One of the great things about the Python programming language is [PyPI][1], the Python Package Index, where third-party libraries are hosted, available for anyone to install and gain access to pre-existing functionality without starting from scratch. These libraries are handy utilities, written by members of the community, that aren't found within the Python standard library. But they work in much the same way—you import them into your code and have access to functions and classes you didn't write yourself.

### The cross-platform problem

Many of the 150,000+ libraries hosted on PyPI are written in Python, but that's not the only option—you can write Python libraries in C, C++, or anything with Python bindings. The usual benefit of writing a library in C or C++ is speed. The NumPy project is a good example: NumPy provides highly powerful mathematical functionality for dealing with matrix operations. It is highly optimized code that allows users to write in Python but have access to speedy mathematics operations.

The problem comes when trying to distribute libraries for others to use cross-platform. The standard is to create built distributions called Python wheels. While pure Python libraries are automatically compatible cross-platform, those implemented in C/C++ must be built separately for each operating system, Python version, and system architecture. So, if a library wanted to support Windows, MacOS, and Linux, for both 32-bit and 64-bit computers, and for Python 2.7, 3.4, 3.5, and 3.6, that would require 24 different versions! Some packages do this, but others rely on users building the package from the source code, which can take a long time and can often be complex.

### Raspberry Pi and Arm

While the Raspberry Pi runs Linux, it's not the same architecture as your regular PC—it's Arm, rather than Intel. That means the Linux wheels don't work, and Raspberry Pi users had to build from source—until the piwheels project came to fruition last year. [Piwheels][2] is an open source project that aims to build Raspberry Pi platform wheels for every package on PyPI.

![](https://opensource.com/sites/default/files/uploads/pi3b.jpg)

Packages are natively compiled on Raspberry Pi 3 hardware and hosted in a data center provided by UK-based [Mythic Beasts][3], which provides cloud Pis as part of its hosting service. The piwheels website hosts the wheels in a [pip][4]-compatible web server configuration so Raspberry Pi users can use them easily. Raspbian Stretch even comes preconfigured to use piwheels.org as an additional index to PyPI by default.

### The piwheels stack

The piwheels project runs (almost) entirely on Raspberry Pi hardware:

  * **Master**
    * A Raspberry Pi web server hosts the wheel files and distributes jobs to the builder Pis.
  * **Database server**
    * All package information is stored in a [Postgres database][5].
    * The master logs build attempts and downloads.
  * **Builders**
    * Builder Pis are given build jobs to attempt, and they communicate with the database.
    * The backlog of packages on PyPI was completed using around 20 Raspberry Pis.
    * A smaller number of Pis is required to keep up with new releases. Currently, there are three with Raspbian Jessie (Python 3.4) and two with Raspbian Stretch (Python 3.5).



The database server was originally a Raspberry Pi but was moved to another server when the database got too large.

![](https://opensource.com/sites/default/files/uploads/piwheels-stack.png)

### Time saved

Around 500,000 packages are downloaded from piwheels.org every month.

Every time a package is built by piwheels or downloaded by a user, its status information (including build duration) is recorded in a database. Therefore, it's possible to calculate how much time has been saved with pre-compiled packages.

In the 10 months that the service has been running, over 25 years of build time has been saved.

### Great for projects

Raspberry Pi project tutorials requiring Python libraries often include warnings like "this step takes a few hours"—but that's no longer true, thanks to piwheels. Piwheels makes it easy for makers and developers to dive straight into their project and not get bogged down waiting for software to install. Amazing libraries are just a **pip install** away; no need to wait for compilation.

Piwheels has wheels for NumPy, SciPy, OpenCV, Keras, and even [Tensorflow][6], Google's machine learning framework. These libraries are great for [home projects][7], including image and facial recognition with the [camera module][8]. For inspiration, take a look at the Raspberry Pi category on [PyImageSearch][9] (which is one of my [favorite Raspberry Pi blogs][10]) to follow.

![](https://opensource.com/sites/default/files/uploads/camera_0.jpg)

Read more about piwheels on the project's [blog][11] and the [Raspberry Pi blog][12], see the [source code on GitHub][13], and check out the [piwheels website][2]. If you want to contribute to the project, check the [missing packages tag][14] and see if you can successfully build one of them.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/piwheels-python-raspberrypi

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://pypi.org/
[2]: https://www.piwheels.org/
[3]: https://www.mythic-beasts.com/order/rpi
[4]: https://en.wikipedia.org/wiki/Pip_(package_manager)
[5]: https://opensource.com/article/17/10/set-postgres-database-your-raspberry-pi
[6]: https://www.tensorflow.org/
[7]: https://opensource.com/article/17/4/5-projects-raspberry-pi-home
[8]: https://opensource.com/life/15/6/raspberry-pi-camera-projects
[9]: https://www.pyimagesearch.com/category/raspberry-pi/
[10]: https://opensource.com/article/18/8/top-10-raspberry-pi-blogs-follow
[11]: https://blog.piwheels.org/
[12]: https://www.raspberrypi.org/blog/piwheels/
[13]: https://github.com/bennuttall/piwheels
[14]: https://github.com/bennuttall/piwheels/issues?q=is%3Aissue+is%3Aopen+label%3A%22missing+package%22
