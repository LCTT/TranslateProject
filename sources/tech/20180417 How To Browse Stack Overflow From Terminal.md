[translating by Dotcra]

How To Browse Stack Overflow From Terminal
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/how2-720x340.png)
A while ago, we have written about [**SoCLI**][1], a python script to search and browse Stack Overflow website from command line. Today, we will discuss about a similar tool named **“how2”**. It is a command line utility to browse Stack Overflow from Terminal. You can query in the plain English as the way you do in [**Google search**][2] and it uses Google and Stackoverflow APIs to search for the given queries. It is free and open source utility written using NodeJS.

### Browse Stack Overflow From Terminal Using how2

Since how2 is a NodeJS package, we can install it using Npm package manager. If you haven’t installed Npm and NodeJS already, refer the following guide.

After installing Npm and NodeJS, run the following command to install how2 utility.
```
$ npm install -g how2

```

Now let us see how to browse Stack Overflow uisng this program. The typical usage to search through Stack Overflow site using “how2” utility is:
```
$ how2 <search-query>

```

For example, I am going to search for how to create tgz archive.
```
$ how2 create archive tgz

```

Oops! I get the following error.
```
/home/sk/.nvm/versions/node/v9.11.1/lib/node_modules/how2/node_modules/devnull/transports/transport.js:59
Transport.prototype.__proto__ = EventEmitter.prototype;
 ^

 TypeError: Cannot read property 'prototype' of undefined
 at Object.<anonymous> (/home/sk/.nvm/versions/node/v9.11.1/lib/node_modules/how2/node_modules/devnull/transports/transport.js:59:46)
 at Module._compile (internal/modules/cjs/loader.js:654:30)
 at Object.Module._extensions..js (internal/modules/cjs/loader.js:665:10)
 at Module.load (internal/modules/cjs/loader.js:566:32)
 at tryModuleLoad (internal/modules/cjs/loader.js:506:12)
 at Function.Module._load (internal/modules/cjs/loader.js:498:3)
 at Module.require (internal/modules/cjs/loader.js:598:17)
 at require (internal/modules/cjs/helpers.js:11:18)
 at Object.<anonymous> (/home/sk/.nvm/versions/node/v9.11.1/lib/node_modules/how2/node_modules/devnull/transports/stream.js:8:17)
 at Module._compile (internal/modules/cjs/loader.js:654:30)

```

I may be a bug. I hope it gets fixed in the future versions. However, I find a workaround posted [**here**][3].

To fix this error temporarily, you need to edit the **transport.js** file using command:
```
$ vi /home/sk/.nvm/versions/node/v9.11.1/lib/node_modules/how2/node_modules/devnull/transports/transport.js

```

The actual path of this file will be displayed in your error output. Replace the above file path with your own. Then find the following line:
```
var EventEmitter = process.EventEmitter;

```

and replace it with following line:
```
var EventEmitter = require('events');

```

Press ESC and type **:wq** to save and quit the file.

Now search again the query.
```
$ how2 create archive tgz

```

Here is the sample output from my Ubuntu system.

[![][4]][5]

If the answer you’re looking for is not displayed in the above output, press **SPACE BAR** key to start the interactive search where you can go through all suggested questions and answers from the Stack Overflow site.

[![][4]][6]

Use UP/DOWN arrows to move between the results. Once you got the right answer/question, hit SPACE BAR or ENTER key to open it in the Terminal.

[![][4]][7]

To go back and exit, press **ESC**.

**Search answers for specific language**

If you don’t specify a language it **defaults to Bash** unix command line and give you immediately the most likely answer as above. You can also narrow the results to a specific language, for example perl, python, c, Java etc.

For instance, to search for queries related to “Python” language only using **-l** flag as shown below.
```
$ how2 -l python linked list

```

[![][4]][8]

To get a quick help, type:
```
$ how2 -h

```

### Conclusion

The how2 utility is a basic command line program to quickly search for questions and answers from Stack Overflow without leaving your Terminal and it does this job pretty well. However, it is just CLI browser for Stack overflow. For some advanced features such as searching most voted questions, searching queries using multiple tags, colored interface, submitting a new question and viewing questions stats etc., **SoCLI** is good to go.

And, that’s all for now. Hope this was useful. I will be soon here with another useful guide. Until then, stay tuned with OSTechNix!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-browse-stack-overflow-from-terminal/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/search-browse-stack-overflow-website-commandline/
[2]:https://www.ostechnix.com/google-search-navigator-enhance-keyboard-navigation-in-google-search/
[3]:https://github.com/santinic/how2/issues/79
[4]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]:http://www.ostechnix.com/wp-content/uploads/2018/04/stack-overflow-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/04/stack-overflow-2.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/04/stack-overflow-3.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/04/stack-overflow-4.png
