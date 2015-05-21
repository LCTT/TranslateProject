translating---geekpi

How to compile and install wxWidgets on Ubuntu/Debian/Linux Mint
================================================================================
### wxWidgets ###

wxWidgets is an application development framework/library that allows developer to make cross platform GUI applications for Windows, Mac and Linux using the same codebase.

Its primarily written in C++ but has bindings for other languages as well like Python, Perl and Ruby.

In this tutorial I am going to show you how to compile and build wxwidgets 3.0+ on Debian based linux systems like Ubuntu and Linux Mint.

Compiling wxWidgets from source is not at all difficult as it might sound and takes only a few minutes to do.

The library can be compiled in different modes like static library or dynamic library.

### 1. Download wxWidgets ###

The first step would be to download the wxWidgets source files from [wxwidgets.org][1]

Once done, extract the files to a directory.

### 2. Setup build environment ###

To compile wxwidgets we would need some utility programs including the C++ compiler on Linux called g++. And all of it would be installed from the repositories using apt-get.

We also need the GTK development libraries which wxWidgets depend on.

    $ sudo apt-get install libgtk-3-dev build-essential checkinstall

> The utility called checkinstall would allow us to create an installation package for wxwidgets, so that later on it can un-installed easily using package managers

### 3. Compile wxWidgets ###

Get inside the directory where wxWidgets is extracted. In order to keep things clean, create a directory where the compilation would be done.

    $ mkdir gtk-build
    $ cd gtk-build/

Now run the configure and make commands one by one. Each one would take some time to finish.

    $ ../configure --disable-shared --enable-unicode
    $ make

The "--disable-shared" option instructs wxwidgets to builds static libraries instead of shared/dynamic ones.

After the make command finishes, the compilation is done successfully. Its time to install the wxWidgets files to the correct location.

More information about compile options can be found in install.txt and readme.txt files that can be found in /docs/gtk/ inside the wxwidgets directory.

### 4. Install with checkinstall ###

Now instead of using the "make install" command, we shall use the checkinstall command to create a deb package for wxwidgets. Run the following command

    $ sudo checkinstall

Checkinstall would ask few questions during the process and make sure to provide a version number when asked, otherwise it would fail.

Once the process is over, wxWidgets would be installed and also a deb file would be created in the same directory.

### 5. Track the installed files ###

If you wish to check where the files are installed, use the dpkg command followed by the name of the package provided during the checkinstall process.

    $ dpkg -L package_name
    /.
    /usr
    /usr/local
    /usr/local/lib
    /usr/local/lib/libwx_baseu-3.0.a
    /usr/local/lib/libwx_gtk3u_propgrid-3.0.a
    /usr/local/lib/libwx_gtk3u_html-3.0.a
    /usr/local/lib/libwxscintilla-3.0.a
    /usr/local/lib/libwx_gtk3u_ribbon-3.0.a
    /usr/local/lib/libwx_gtk3u_stc-3.0.a
    /usr/local/lib/libwx_gtk3u_qa-3.0.a
    /usr/local/lib/libwx_baseu_net-3.0.a
    /usr/local/lib/libwxtiff-3.0.a

### 6. Compile the samples ###

After compiling wxWidgets, its time to compile the sample programs to see it in action. In the same directory where we compiled wxwidgets, a new subdirectory called samples would have been created.

Just enter it and run the make command

    $ compile samples
    $ cd samples/
    $ make

After the make process finishes, get inside each sample sub directory and there should be an executable file that can be run right away to see the demo.

### 7. Compile your first program ###

After you are done with the demo programs, its time to write your own program and compile it. Again it is quite easy.

It is assumed that you are coding in C++ and for that you can use any good editor with syntax highlighting feature. For example gedit, kate, kwrite would do. Or you might want to try fully loaded IDEs like Geany, Codelite, Codeblocks etc.

However for your first program just use an ordinary text editor get it done quick.

Here it is

    #include <wx/wx.h>
    
    class Simple : public wxFrame
    {
    public:
        Simple(const wxString& title)
    		: wxFrame(NULL, wxID_ANY, title, wxDefaultPosition, wxSize(250, 150))
    	{
    		Centre();
    	}
    };
    
    class MyApp : public wxApp
    {
    public:
    	bool OnInit()
    	{
    		Simple *simple = new Simple(wxT("Simple"));
    		simple->Show(true);
    		return true;
    	}
    };
    
    wxIMPLEMENT_APP(MyApp);

Now save the program somewhere and compile it with the following commands

    # compile
    $ g++ basic.cpp `wx-config --cxxflags --libs std` -o program
    
    # run
    $ ./program

#### Compiling with non standard libraries ####

The wx-config command shown above provides only the standard libraries by default. If you are using the Aui classes for example, then you need to specify additional libraries for it

    $ g++ code.cpp `wx-config --cxxflags --libs std,aui` -o program

More information can be found [here][2].

### Resources ###

Download source and help files for wxWidgets
[https://www.wxwidgets.org/downloads/][3]

wxWidgets wiki page on compile instructions
[https://wiki.wxwidgets.org/Compiling_and_getting_started][4]

Notes on how to use the latest wxWidgets version (3.0+)
[https://wiki.wxwidgets.org/Updating_to_the_Latest_Version_of_wxWidgets][5]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/install-wxwidgets-ubuntu/

作者：[Silver Moon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117145272367995638274/posts
[1]:https://www.wxwidgets.org/downloads/
[2]:https://wiki.wxwidgets.org/Updating_to_the_Latest_Version_of_wxWidgets#The_wx-config_script
[3]:https://www.wxwidgets.org/downloads/
[4]:https://wiki.wxwidgets.org/Compiling_and_getting_started
[5]:https://wiki.wxwidgets.org/Updating_to_the_Latest_Version_of_wxWidgets
