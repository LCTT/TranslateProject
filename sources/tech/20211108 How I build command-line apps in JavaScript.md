[#]: subject: "How I build command-line apps in JavaScript"
[#]: via: "https://opensource.com/article/21/11/javascript-command-line-apps"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I build command-line apps in JavaScript
======
Including options for your users is an important feature for any
application, and Commander.js makes it easy to do. What's your favorite
JavaScript command-line builder? Take our poll.
![Javascript code close-up with neon graphic overlay][1]

JavaScript is a language developed for the web, but its usefulness has gone far beyond just the Internet. Thanks to projects like Node.js and Electron, JavaScript is as much a general-purpose scripting language as a browser component. There are JavaScript libraries specially designed to build command-line interfaces. Yes, you can run JavaScript in your terminal.

Now, when you enter a command into your terminal, there are generally [options][2], also called _switches_ or _flags_, that you can use to modify how the command runs. This is a useful convention defined by the [POSIX specification][3], so as a programmer, it's helpful to know how to detect and parse the options. To get this functionality from JavaScript, it's useful to use a library designed to make it easy to build command-line interfaces. My favorite is [Commander.js][4]. It's easy, it's flexible, and it's intuitive.

### Installing node

To use the Commander.js library, you must have Node.js installed. On Linux, you can install Node using your package manager. For example, on Fedora, CentOS, Mageia, and others:


```
`$ sudo dnf install nodejs`
```

On Windows and macOS, you can [download installers from the nodejs.org website][5].

### Installing Commander.js

To install Commander.js, use the `npm` command:


```
`$ npm install commander`
```

### Adding a library to your JavaScript code

In JavaScript, you can use the `require` keyword to include (or import, if you're used to Python) a library into your code. Create a file called `example.js` and open it in your favorite text editor. Add this line to the top to include the Commander.js library:


```
`const { program } = require('commander');`
```

### Option parsing in JavaScript

The first thing you must do to parse options is to define the valid options your application can accept. The Commander.js library lets you define both short and long options, along with a helpful message to clarify the purpose of each.


```


program
  .description('A sample application to parse options')
  .option('-a, --alpha', 'Alpha')
  .option('-b, --beta &lt;VALUE&gt;', 'Specify a VALUE', 'Foo');

```

The first option, which I've called `--alpha` (`-a` for short), is a Boolean switch: It either exists or it doesn't. It takes no arguments. The second option, which I've called `--beta` (`-b` for short), accepts an argument and even specifies a default value when you've provided nothing.

### Accessing the command-line data

Once you've defined valid options, you can reference the values using the long option name:


```


program.parse();

const options = program.opts();
console.log('Options detected:');

if (options.alpha) console.log('alpha');
 
const beta = !options.beta ? 'no' : options.beta;
console.log('beta is: %s', beta);

```

### Run the application

Try running it with the `node` command, first with no options:


```


$ node ./example.js 
Options detected: 
beta is: Foo

```

The default value for `beta `gets used in the absence of an override from the user.

Run it again, this time using the options:


```


$ node ./example.js --beta hello --alpha
Options detected: 
alpha
beta is: hello

```

This time, the test script successfully detected the option `--alpha`, and the `--beta` option with the value provided by the user.

### Option parsing

Here's the full demonstration code for your reference:


```


const { program } = require('commander');

program
  .description('A sample application to parse options')
  .option('-a, --alpha', 'Alpha')
    .option('-b, --beta &lt;VALUE&gt;', 'Specify a VALUE', 'Foo');

program.parse();

const options = program.opts();
console.log('Options detected:');

console.log(typeof options);

if (options.alpha) console.log(' * alpha');
const beta = !options.beta ? 'no' : options.beta;
console.log(' * beta is: %s', beta);

```

There are further examples in the project's [Git repository][4].

Including options for your users is an important feature for any application, and Commander.js makes it easy to do. There are other libraries aside from Commander.js, but I find this one easy and quick to use. What's your favorite JavaScript command-line builder?

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/javascript-command-line-apps

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_javascript.jpg?itok=60evKmGl (Javascript code close-up with neon graphic overlay)
[2]: https://opensource.com/article/21/8/linux-terminal
[3]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[4]: https://github.com/tj/commander.js
[5]: https://nodejs.org/en/download
