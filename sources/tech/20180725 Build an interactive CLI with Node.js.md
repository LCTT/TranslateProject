Build an interactive CLI with Node.js
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_keyboard_coding.png?itok=E0Vvam7A)

Node.js can be very useful when it comes to building command-line interfaces (CLIs). In this post, I'll teach you how to use [Node.js][1] to build a CLI that asks some questions and creates a file based on the answers.

### Get started

Let's start by creating a brand new [npm][2] package. (Npm is the JavaScript package manager.)
```
mkdir my-script

cd my-script

npm init

```

Npm will ask some questions. After that, we need to install some packages.
```
npm install --save chalk figlet inquirer shelljs

```

Here's what these packages do:

  * **Chalk:** Terminal string styling done right
  * **Figlet:** A program for making large letters out of ordinary text
  * **Inquirer:** A collection of common interactive command-line user interfaces
  * **ShellJS:** Portable Unix shell commands for Node.js



### Make an index.js file

Now we'll create an `index.js` file with the following content:
```
#!/usr/bin/env node



const inquirer = require("inquirer");

const chalk = require("chalk");

const figlet = require("figlet");

const shell = require("shelljs");

```

### Plan the CLI

It's always good to plan what a CLI needs to do before writing any code. This CLI will do just one thing: **create a file**.

The CLI will ask two questions—what is the filename and what is the extension?—then create the file, and show a success message with the created file path.
```
// index.js



const run = async () => {

  // show script introduction

  // ask questions

  // create the file

  // show success message

};



run();

```

The first function is the script introduction. Let's use `chalk` and `figlet` to get the job done.
```
const init = () => {

  console.log(

    chalk.green(

      figlet.textSync("Node JS CLI", {

        font: "Ghost",

        horizontalLayout: "default",

        verticalLayout: "default"

      })

    )

  );

}



const run = async () => {

  // show script introduction

  init();



  // ask questions

  // create the file

  // show success message

};



run();

```

Second, we'll write a function that asks the questions.
```
const askQuestions = () => {

  const questions = [

    {

      name: "FILENAME",

      type: "input",

      message: "What is the name of the file without extension?"

    },

    {

      type: "list",

      name: "EXTENSION",

      message: "What is the file extension?",

      choices: [".rb", ".js", ".php", ".css"],

      filter: function(val) {

        return val.split(".")[1];

      }

    }

  ];

  return inquirer.prompt(questions);

};



// ...



const run = async () => {

  // show script introduction

  init();



  // ask questions

  const answers = await askQuestions();

  const { FILENAME, EXTENSION } = answers;



  // create the file

  // show success message

};

```

Notice the constants FILENAME and EXTENSIONS that came from `inquirer`.

The next step will create the file.
```
const createFile = (filename, extension) => {

  const filePath = `${process.cwd()}/${filename}.${extension}`

  shell.touch(filePath);

  return filePath;

};



// ...



const run = async () => {

  // show script introduction

  init();



  // ask questions

  const answers = await askQuestions();

  const { FILENAME, EXTENSION } = answers;



  // create the file

  const filePath = createFile(FILENAME, EXTENSION);



  // show success message

};

```

And last but not least, we'll show the success message along with the file path.
```
const success = (filepath) => {

  console.log(

    chalk.white.bgGreen.bold(`Done! File created at ${filepath}`)

  );

};



// ...



const run = async () => {

  // show script introduction

  init();



  // ask questions

  const answers = await askQuestions();

  const { FILENAME, EXTENSION } = answers;



  // create the file

  const filePath = createFile(FILENAME, EXTENSION);



  // show success message

  success(filePath);

};

```

Let's test the script by running `node index.js`. Here's what we get:

### The full code

Here is the final code:
```
#!/usr/bin/env node



const inquirer = require("inquirer");

const chalk = require("chalk");

const figlet = require("figlet");

const shell = require("shelljs");



const init = () => {

  console.log(

    chalk.green(

      figlet.textSync("Node JS CLI", {

        font: "Ghost",

        horizontalLayout: "default",

        verticalLayout: "default"

      })

    )

  );

};



const askQuestions = () => {

  const questions = [

    {

      name: "FILENAME",

      type: "input",

      message: "What is the name of the file without extension?"

    },

    {

      type: "list",

      name: "EXTENSION",

      message: "What is the file extension?",

      choices: [".rb", ".js", ".php", ".css"],

      filter: function(val) {

        return val.split(".")[1];

      }

    }

  ];

  return inquirer.prompt(questions);

};



const createFile = (filename, extension) => {

  const filePath = `${process.cwd()}/${filename}.${extension}`

  shell.touch(filePath);

  return filePath;

};



const success = filepath => {

  console.log(

    chalk.white.bgGreen.bold(`Done! File created at ${filepath}`)

  );

};



const run = async () => {

  // show script introduction

  init();



  // ask questions

  const answers = await askQuestions();

  const { FILENAME, EXTENSION } = answers;



  // create the file

  const filePath = createFile(FILENAME, EXTENSION);



  // show success message

  success(filePath);

};



run();

```

### Use the script anywhere

To execute this script anywhere, add a `bin` section in your `package.json` file and run `npm link`.
```
{

  "name": "creator",

  "version": "1.0.0",

  "description": "",

  "main": "index.js",

  "scripts": {

    "test": "echo \"Error: no test specified\" && exit 1",

    "start": "node index.js"

  },

  "author": "",

  "license": "ISC",

  "dependencies": {

    "chalk": "^2.4.1",

    "figlet": "^1.2.0",

    "inquirer": "^6.0.0",

    "shelljs": "^0.8.2"

  },

  "bin": {

    "creator": "./index.js"

  }

}

```

Running `npm link` makes this script available anywhere.

That's what happens when you run this command:
```
/usr/bin/creator -> /usr/lib/node_modules/creator/index.js

/usr/lib/node_modules/creator -> /home/hugo/code/creator

```

It links the `index.js` file as an executable. This is only possible because of the first line of the CLI script: `#!/usr/bin/env node`.

Now we can run this script by calling:
```
$ creator

```

### Wrapping up

As you can see, Node.js makes it very easy to build nice command-line tools! If you want to go even further, check this other packages:

  * [meow][3] – a simple command-line helper
  * [yargs][4] – a command-line opt-string parser
  * [pkg][5] – package your Node.js project into an executable



Tell us about your experience building a CLI in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/node-js-interactive-cli

作者：[Hugo Dias][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/hugodias
[1]:https://nodejs.org/en/
[2]:https://www.npmjs.com/
[3]:https://github.com/sindresorhus/meow
[4]:https://github.com/yargs/yargs
[5]:https://github.com/zeit/pkg
