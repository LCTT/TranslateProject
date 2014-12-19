Translating-----geekpi

Creating your First App on Linux with Python and Flask
================================================================================
![](http://techarena51.com/wp-content/uploads/2014/12/python-logo.png)

Whether playing on Linux or working on Linux there is high chance you have come across a program written in python. Back in college I wish they thought us Python instead of Java like they do today, it’s fun to learn and useful in building practical applications like the yum package manager.

In this tutorial I will take you through how I built a simple application which displays useful information like [memory usage per process][1], CPU percentage etc using python and a micro framework called flask.

### Prerequisites ###

Python Basics, Lists, Classes, Functions, Modules.
HTML/CSS (basic)

You don’t need to be an advanced python programmer to follow this tutorial, But before you go further I recommend you read https://wiki.python.org/moin/BeginnersGuide/NonProgrammers

### Installing Python 3 on Linux ###

On most Linux distributions python is installed by default. This is how you can find out the python version on your system.

    [root@linux-vps ~]# python -V
    Python 2.7.5

We will be using python version 3.x to build our app. As per [Python.org][2] all improvements are now only available in this version which is not backward compatible with python 2.

**Caution**: Before your proceed I strongly recommend you try this tutorial out on a Virtual machine, since python is a core component of many Linux Distributions any accidents may cause permanent damage to your system.

This step is for RedHat based variants like CentOS (6&7), Debian based variants like Ubuntu,Mint and Rasbian can skip this step as you should have python version 3 installed by default. If not use apt-get instead of yum to install the relevant packages below.

    [leo@linux-vps] yum groupinstall 'Development Tools'
    [leo@linux-vps] yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel
    [leo@linux-vps] wget https://www.python.org/ftp/python/3.4.2/Python-3.4.2.tgz
    [leo@linux-vps] tar -xvzf Python-3.4.2.tgz
    [leo@linux-vps] cd Python-3.4.2
    [leo@linux-vps] ./configure
    [leo@linux-vps] make
    # make altinstall  is recommended as make install can overwrite the current python binary, 
    [leo@linux-vps]   make altinstall

After a successful, installation you should be able to access the python 3.4 shell with the command below.

    [leo@linux-vps]# python3.4
    Python 3.4.2 (default, Dec 12 2014, 08:01:15)
    [GCC 4.8.2 20140120 (Red Hat 4.8.2-16)] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> exit ()

### Installing packages in python with PIP ###

Python comes with it’s own package manager, similar to yum and apt-get. You will need to use it to download, install and uninstall packages. 

    [leo@linux-vps] pip3.4 install "packagename"
    
    [leo@linux-vps] pip3.4 list
    
    [leo@linux-vps] pip3.4 uninstall "packagename"

### Python Virtual Environment ###

In Python a virtual environment is a directory where your projects dependencies are installed. This is a good way to segregate projects with different dependencies. It also allows you to install packages without the need for sudo access.

    [leo@linux-vps] mkdir python3.4-flask
    [leo@linux-vps] cd python3.4-flask 
    [leo@linux-vps python3.4-flask] pyvenv-3.4 venv

To create the virtual environment you will need to use the “pyvenv-3.4” command. This will create a directory called “lib” inside the venv folder where the dependencies for this project will be installed. It will also create a bin folder which will contain pip and python executables for this virtual environment.

### Activating the Virtual Environment for our Linux system information project ###

     [leo@linux-vps python3.4-flask] source venv/bin/activate
     [leo@linux-vps python3.4-flask] which pip3.4
    ~/python3.4-flask/venv/bin/pip3.4
    [leo@linux-vps python3.4-flask] which python3.4
    ~/python3.4-flask/venv/bin/python3.4

### Installing flask with PIP ###

Lets go ahead and install out first module the flask framework which will take care of the routing and template rendering of our app.

    [leo@linux-vps python3.4-flask]pip3.4 install flask

### Creating your first app in flask. ###

Step 1:Create directories where your app will reside.

    [leo@linux-vps python3.4-flask] mkdir  app
     [leo@linux-vps python3.4-flask]mkdir app/static
     [leo@linux-vps python3.4-flask]mkdir app/templates

Inside the python3.4-flask folder create a folder called app which will contain two sub-folders “static” and “templates”. Our python script will reside inside the app folder, files like css/js inside the static folder and templates folder will contain our html templates.

Step 2:Create an initialization file inside the app folder.

    [leo@linux-vps python3.4-flask] vim app/_init_.py
    from flask import Flask
    
    app = Flask(__name__)
    from app import index

This file will create a new instance of Flask and load our python program stored in a file called index.py which we will create next.

    [leo@linux-vps python3.4-flask]vim app/index.py
    from app import app
    
    @app.route('/')
    def index():
     import subprocess
     cmd = subprocess.Popen(['ps_mem'],stdout=subprocess.PIPE,stderr=subprocess.PIPE)
     out,error = cmd.communicate()
     memory = out.splitlines()    
         
        return 

Routing in flask is handled by the route decorator. It is used to bind a URL to a function.

    @app.route('/')
    @app.route('/index') 

In order to run a shell command in python you can use the Popen class from Subprocess module.

    subprocess.Popen(['ps_mem'],stdout=subprocess.PIPE,stderr=subprocess.PIPE)

This class will take a list as an argument, the first item of the list will default to being executable while the next item will be considered the option. Here is another example 

    subprocess.Popen(['ls', ‘-l’],stdout=subprocess.PIPE,stderr=subprocess.PIPE)

stdout and stderr will store the output and error of this command respectively. You can then access this output via the communicate method of the Popen class.

    out,error = cmd.communicate()

To display the output in a better way via the html template, I have used the splitlines () method, 

    memory = out.splitlines()

More information on python subprocess module is available in the docs at the end of this tutorial.

Step 3: Create an html template where we can display the output of our command.

In order to do this we need to use the Jinja2 template engine in flask which will do the template rendering for us.

Your final index.py file should look as follows

    from flask import render_template
    from app import app
    
    def index():
     import subprocess
     cmd = subprocess.Popen(['ps_mem'],stdout=subprocess.PIPE,stderr=subprocess.PIPE)
     out,error = cmd.communicate()
     memory = out.splitlines()     
       
    return render_template('index.html', memory=memory)

Now create an index.html template inside the templates folder, flask will search for templates in this folder.

    [leo@linux-vps python3.4-flask]vim app/templates/index.html
    
    
    Memory usage per process
    
    {% for line in memory %}
        {{ line.decode('utf-8') }} 
    
       {% endfor %}
    
The Jinja2 template engine allows you to use the “{{ … }}” delimiter to print results and {% … %} for loops and value assignment. I used the “decode()” method for formatting purposes.

Step 4: Running the app.

    [leo@linux-vps python3.4-flask]vim run.py
    from app import app
    app.debug = True
    app.run(host='174.140.165.231', port=80)

The above code will run the app in debug mode. If you leave out the IP address and port it will default to localhost:5000.

    [leo@linux-vps python3.4-flask] chmod +x run.py
    [leo@linux-vps python3.4-flask] python3.4 run.py

![](http://techarena51.com/wp-content/uploads/2014/12/install-python3-flask.png)

I have added more code to the app so that it gives you cpu, I/O and load avg as well.

![](http://techarena51.com/wp-content/uploads/2014/12/install-python3-flask-on-linux.png)

You can access the code to this app [here][3].

This is a brief introduction to flask and I recommend you reading the tutorials and docs below for indepth information.

http://flask.pocoo.org/docs/0.10/quickstart/#

https://docs.python.org/3.4/library/subprocess.html#popen-constructor

http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world 

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/how-to-install-python-3-and-flask-on-linux/

作者：[Leo G][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:http://techarena51.com/index.php/linux-memory-usage/
[2]:https://wiki.python.org/moin/Python2orPython3
[3]:https://github.com/Leo-g/python-flask-cmd
