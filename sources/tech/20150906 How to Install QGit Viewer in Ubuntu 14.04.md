Translating----geekpi

How to Install QGit Viewer in Ubuntu 14.04
================================================================================
QGit is a free and Open Source GUI git viewer written on Qt and C++ by Marco Costalba. It is a better git viewer which provides us the ability to browse revisions history, view commits and patches applied to the files under a simple GUI environment. It utilizes git command line to process execute the commands and to display the output. It has some common features like to view revisions, diffs, files history, files annotation, archive tree. We can format and apply patch series with the selected commits, drag and drop commits between two instances and more with QGit Viewer. It allows us to create custom buttons with which we can add more buttons to execute a specific command when pressed using its builtin Action Builder.

Here are some easy steps on how we can compile and install QGit Viewer from its source code in Ubuntu 14.04 LTS "Trusty".

### 1. Installing QT4 Libraries ###

First of all, we'll need have QT4 Libraries installed in order to run QGit viewer in our ubuntu machine. As apt is the default package manager of ubuntu and QT4 packages is available in the official repository of ubutnu, we'll gonna install qt4-default using apt-get command as shown below.

    $ sudo apt-get install qt4-default

### 2. Downloading QGit Tarball ###

After installing Qt4 libraries, we'll gonna install git so that we can clone the Git repository of QGit Viewer for Qt 4 . To do so, we'll run the following apt-get command.

    $ sudo apt-get install git

Now, we'll clone the repository using git command as shown below.

    $ git clone git://repo.or.cz/qgit4/redivivus.git

    Cloning into 'redivivus'...
    remote: Counting objects: 7128, done.
    remote: Compressing objects: 100% (2671/2671), done.
    remote: Total 7128 (delta 5464), reused 5711 (delta 4438)
    Receiving objects: 100% (7128/7128), 2.39 MiB | 470.00 KiB/s, done.
    Resolving deltas: 100% (5464/5464), done.
    Checking connectivity... done.

### 3. Compiling QGit ###

After we have cloned the repository, we'll now enter into the directory named redivivus and create the makefile which we'll require to compile qgit viewer. So, to enter into the directory, we'll run the following command.

    $ cd redivivus

Next, we'll run the following command in order to generate a new Makefile from qmake project file ie qgit.pro.

    $ qmake qgit.pro

After the Makefile has been generated, we'll now finally compile the source codes of qgit and get the binary as output. To do so, first we'll need to install make and g++ package so that we can compile, as it is a program written in C++ .

    $ sudo apt-get install make g++

Now, we'll gonna compile the codes using make command.

    $ make

### 4. Installing QGit ###

As we have successfully compiled the source code of QGit viewer, now we'll surely wanna install it in our Ubuntu 14.04 machine so that we can execute it from our system. To do so, we'll run the following command.

    $ sudo make install

    cd src/ && make -f Makefile install
    make[1]: Entering directory `/home/arun/redivivus/src'
    make -f Makefile.Release install
    make[2]: Entering directory `/home/arun/redivivus/src'
    install -m 755 -p "../bin/qgit" "/usr/lib/x86_64-linux-gnu/qt4/bin/qgit"
    strip "/usr/lib/x86_64-linux-gnu/qt4/bin/qgit"
    make[2]: Leaving directory `/home/arun/redivivus/src'
    make[1]: Leaving directory `/home/arun/redivivus/src'

Next, we'll need to copy the built qgit binary file from bin directory to /usr/bin/ directory so that it will be available as global command.

    $ sudo cp bin/qgit /usr/bin/

### 5. Creating Desktop File ###

As we have successfully installed qgit in our Ubuntu box, we'll now go for create a desktop file so that QGit will be available under Menu or Launcher of our Desktop Environment. To do so, we'll need to create a new file named qgit.desktop under /usr/share/applications/ directory.

    $ sudo nano /usr/share/applications/qgit.desktop

Then, we'll need to paste the following lines into the file.

    [Desktop Entry]
    Name=qgit
    GenericName=git GUI viewer
    Exec=qgit
    Icon=qgit
    Type=Application
    Comment=git GUI viewer
    Terminal=false
    MimeType=inode/directory;
    Categories=Qt;Development;RevisionControl;

After done, we'll simply save the file and exit.

### 6. Running QGit Viewer ###

After QGit is installed successfully in our Ubuntu box, we can now run it from any launcher or application menu. In order to run QGit from the terminal, we'll need to run as follows.

    $ qgit

This will open the Qt4 Framework based QGit Viewer in GUI mode.

![QGit Viewer](http://blog.linoxide.com/wp-content/uploads/2015/07/qgit-viewer.png)

### Conclusion ###

QGit is really an awesome QT based git viewer. It is available on all three platforms Linux, Mac OSX and Microsoft Windows. It helps us to easily navigate to the history, revisions, branches and more from the available git repository. It reduces the need of running git command line for the common stuffs like viewing revisions, history, diff, etc as graphical interface of it makes easy to do tasks. The latest version of qgit is also available in the default repository of ubuntu which we can install using **apt-get install qgit** command. So, qgit makes our work pretty fast and easy to do with its simple GUI.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-qgit-viewer-ubuntu-14-04/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
