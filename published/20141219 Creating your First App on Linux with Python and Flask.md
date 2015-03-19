在Linux上使用Python和Flask创建你的第一个应用
================================================================================
![](http://techarena51.com/wp-content/uploads/2014/12/python-logo.png)

无论你在linux上娱乐还是工作，这对你而言都是一个使用python来编程的很好的机会。回到大学我希望他们教我的是Python而不是Java，这学起来很有趣且在实际的应用如yum包管理器中很有用。

本篇教程中我会带你使用python和一个称为flask的微型框架来构建一个简单的应用，来显示诸如[每个进程的内存使用][1]，CPU百分比之类有用的信息。

### 前置需求 ###

Python基础、列表、类、函数、模块。HTML/CSS (基础)。

学习这篇教程你不必是一个python高级开发者，但是首先我建议你阅读 https://wiki.python.org/moin/BeginnersGuide/NonProgrammers 。

### 在Linux上安装Python 3 ###

在大多数Linux发行版上Python是默认安装的。下面的你命令可以让你看到安装的版本。

    [root@linux-vps ~]# python -V
    Python 2.7.5

我们会使用3.x的版本来构建我们的app。根据[Python.org][2]所说，现在只对这个版本进行改进，而且不向后兼容Python 2。

**注意**: 在开始之前，我强烈建议你在虚拟机中尝试这个教程，因为Python是许多Linux发行版的核心组件，任何意外都可能会损坏你的系统。

以下步骤是基于红帽的版本如CentOS（6和7），基于Debian的版本如UbuntuMint和Resbian可以跳过这步，Pythonn 3应该默认已经安装了。如果没有安装，请用apt-get而不是yum来安装下面相应的包。

    [leo@linux-vps] yum groupinstall 'Development Tools'
    [leo@linux-vps] yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel
    [leo@linux-vps] wget https://www.python.org/ftp/python/3.4.2/Python-3.4.2.tgz
    [leo@linux-vps] tar -xvzf Python-3.4.2.tgz
    [leo@linux-vps] cd Python-3.4.2
    [leo@linux-vps] ./configure
    [leo@linux-vps] make
    # 推荐使用 make altinstall 以覆盖当前的 python 库
    [leo@linux-vps]   make altinstall

成功安装后，你应该可以用下面的命令进入Python3.4的shell了。

    [leo@linux-vps]# python3.4
    Python 3.4.2 (default, Dec 12 2014, 08:01:15)
    [GCC 4.8.2 20140120 (Red Hat 4.8.2-16)] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> exit ()

### 使用pip来安装包 ###

Python有它自己的包管理去，与yum和apt-get相似。你将需要它来下载、安装和卸载包。

    [leo@linux-vps] pip3.4 install "packagename"    
    [leo@linux-vps] pip3.4 list
    [leo@linux-vps] pip3.4 uninstall "packagename"

### Python虚拟环境 ###

在Python中虚拟环境是一个放置你的项目的依赖环境的目录。这是一个将带有不同的依赖环境的项目隔离的好办法。它可以让你不用sudo命令就能安装包。

    [leo@linux-vps] mkdir python3.4-flask
    [leo@linux-vps] cd python3.4-flask 
    [leo@linux-vps python3.4-flask] pyvenv-3.4 venv

要创建虚拟环境你需要使用“pyvenv-3.4”命令。上述命令会在venv文件夹的内部创建一个名为lib的目录，这里会安装项目所依赖的包。这里同样会创建一个bin文件夹容纳该环境下的pip和python可执行文件。

### 为我们的Linux系统信息项目激活虚拟环境 ###

     [leo@linux-vps python3.4-flask] source venv/bin/activate
     [leo@linux-vps python3.4-flask] which pip3.4
    ~/python3.4-flask/venv/bin/pip3.4
    [leo@linux-vps python3.4-flask] which python3.4
    ~/python3.4-flask/venv/bin/python3.4

### 使用pip安装flask ###

让我们继续安装第一个模块flask框架，它可以处理访问路由和渲染显示我们app的模板。

    [leo@linux-vps python3.4-flask]pip3.4 install flask

### 在flask中创建第一个应用 ###

####第一步：创建你app的目录

     [leo@linux-vps python3.4-flask] mkdir  app
     [leo@linux-vps python3.4-flask] mkdir app/static
     [leo@linux-vps python3.4-flask] mkdir app/templates

在python3.4-flask文件夹中创建一个名为app的文件夹，它包含了两个子文件夹“static”和“templates”。我们的Python脚本会放在app文件夹，像css/js这类文件会在static文件夹，template文件夹会包含我们的html模板。

####第二步：在app文件夹内部创建一个初始化文件

    [leo@linux-vps python3.4-flask] vim app/_init_.py
    from flask import Flask
    
    app = Flask(__name__)
    from app import index

这个文件会创建一个Flask的新的实例，并加载我们存储在index.py文件中的python程序——这个文件我们之后会创建。

    [leo@linux-vps python3.4-flask]vim app/index.py
    from app import app
    
    @app.route('/')
    def index():
     import subprocess
     cmd = subprocess.Popen(['ps_mem'],stdout=subprocess.PIPE,stderr=subprocess.PIPE)
     out,error = cmd.communicate()
     memory = out.splitlines()    
         
        return 

flask中的访问路由通过“路由装饰器”处理。它用于将一个 URL 绑定到函数。

    @app.route('/')
    @app.route('/index') 

要在python中运行shell命令，你可以使用Subprocess模块中的Popen类。

    subprocess.Popen(['ps_mem'],stdout=subprocess.PIPE,stderr=subprocess.PIPE)

这个类会使用一个列表作为参数，列表的第一项默认是可执行的程序，下一项会是参数，这里是个另外一个例子。

    subprocess.Popen(['ls', ‘-l’],stdout=subprocess.PIPE,stderr=subprocess.PIPE)

stdout和stderr会相应地存储命令的输出和错误。你可以使用Popen的communicate方法来访问输出。

    out,error = cmd.communicate()

要更好地用html模板显示输出，我会使用splitlines()方法，

    memory = out.splitlines()

关于subprocess模块更多的信息会在教程的最后给出。

####第三步：创建一个html模板来显示我们命令的输出。

要做到这个我们使用flask中的Jinja2模板引擎来为我们渲染。

最后你的index.py文件应该看起来像这样：

    from flask import render_template
    from app import app
    
    def index():
     import subprocess
     cmd = subprocess.Popen(['ps_mem'],stdout=subprocess.PIPE,stderr=subprocess.PIPE)
     out,error = cmd.communicate()
     memory = out.splitlines()     
       
    return render_template('index.html', memory=memory)

现在在你的模板目录下创建一个index.html模板，flask会自动搜索这个目录下的模板。

    [leo@linux-vps python3.4-flask]vim app/templates/index.html
    
    
    Memory usage per process
    
    {% for line in memory %}
        {{ line.decode('utf-8') }} 
    
       {% endfor %}
    
Jinja2模板引擎允许你使用“{{ … }}”分隔符来输出结果，{% … %}来做循环和赋值。我使用“decode()”方法来格式化。

####第四步：运行app

    [leo@linux-vps python3.4-flask]vim run.py
    from app import app
    app.debug = True
    app.run(host='174.140.165.231', port=80)

上面的代码会在debug模式下运行app。如果你不指定 IP 地址和端口，默认则是localhost:5000。

    [leo@linux-vps python3.4-flask] chmod +x run.py
    [leo@linux-vps python3.4-flask] python3.4 run.py

![](http://techarena51.com/wp-content/uploads/2014/12/install-python3-flask.png)

我已经加了更多的代码来显示CPU、I/O和平均负载。

![](http://techarena51.com/wp-content/uploads/2014/12/install-python3-flask-on-linux.png)

你可以在[这里][3]浏览完整的代码。

这是一个对flask的简短教程，我建议你阅读下面的教程和文档来更深入地了解。

http://flask.pocoo.org/docs/0.10/quickstart/

https://docs.python.org/3.4/library/subprocess.html#popen-constructor

http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world 

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/how-to-install-python-3-and-flask-on-linux/

作者：[Leo G][a]
译者：[geekpi](https://github.com/gekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:http://techarena51.com/index.php/linux-memory-usage/
[2]:https://wiki.python.org/moin/Python2orPython3
[3]:https://github.com/Leo-g/python-flask-cmd
