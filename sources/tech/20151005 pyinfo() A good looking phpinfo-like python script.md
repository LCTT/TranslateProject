translation by strugglingyouth
pyinfo() A good looking phpinfo-like python script
================================================================================
Being a native php guy, I'm used to having phpinfo(), giving me easy access to php.ini settings and loaded modules etc. So ofcourse I wanted to call the not existing pyinfo() function, to no avail. My fingers quickly pressed CTRL-E to google for a implementation of it, someone must've ported it already?

Yes, someone did. But oh my was it ugly. Preposterous! Since I cannot stand ugly layouts *cough*, I just had to build my own. So I used the code I found and cleaned up the layout to make it better. The official python website isnt that bad layout-wise, so why not steal their colors and background images? Yes that sounds like a plan to me.

[Gits Here][1] | [Download here][2] | [Example here][3]

Mind you, I only ran it on a python 2.6.4 server, so anything else is at your own risk (but it should be no problem to port it to any other version). To get it working, just import the file and call pyinfo() while catching the function's return value. Print that on the screen. Huzzah!

For those who did not get that and are using [mod_wsgi][4], run it using something like this (replace that path ofcourse):
```
def application(environ, start_response):
    import sys
    path = 'YOUR_WWW_ROOT_DIRECTORY'
    if path not in sys.path:
        sys.path.append(path)
    from pyinfo import pyinfo
    output = pyinfo()
    start_response('200 OK', [('Content-type', 'text/html')])
    return [output]
```
---

via：http://bran.name/articles/pyinfo-a-good-looking-phpinfo-like-python-script/

作者：[Bran van der Meer][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，
[Linux中国](https://linux.cn/) 荣誉推出


[a]:http://bran.name/resume/
[1]:https://gist.github.com/951825#file_pyinfo.py
[2]:http://bran.name/dump/pyinfo.zip
[3]:http://bran.name/dump/pyinfo/index.py
[4]:http://code.google.com/p/modwsgi/
