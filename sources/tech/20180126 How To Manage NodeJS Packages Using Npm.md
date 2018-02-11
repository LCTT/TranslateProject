How To Manage NodeJS Packages Using Npm
======

![](https://www.ostechnix.com/wp-content/uploads/2018/01/npm-720x340.png)

A while ago, we have published a guide to [**manage Python packages using PIP**][1]. Today, we are going to discuss how to manage NodeJS packages using Npm. NPM is the largest software registry that contains over 600,000 packages. Everyday, developers across the world shares and downloads packages through npm. In this guide, I will explain the the basics of working with npm, such as installing packages(locally and globally), installing certain version of a package, updating, removing and managing NodeJS packages and so on.

### Manage NodeJS Packages Using Npm

##### Installing NPM

Since npm is written in NodeJS, we need to install NodeJS in order to use npm. To install NodeJS on different Linux distributions, refer the following link.

Once installed, ensure that NodeJS and NPM have been properly installed. There are couple ways to do this.

To check where node has been installed:
```
$ which node
/home/sk/.nvm/versions/node/v9.4.0/bin/node
```

Check its version:
```
$ node -v
v9.4.0
```

Log in to Node REPL session:
```
$ node
> .help
.break Sometimes you get stuck, this gets you out
.clear Alias for .break
.editor Enter editor mode
.exit Exit the repl
.help Print this help message
.load Load JS from a file into the REPL session
.save Save all evaluated commands in this REPL session to a file
> .exit
```

Check where npm installed:
```
$ which npm
/home/sk/.nvm/versions/node/v9.4.0/bin/npm
```

And the version:
```
$ npm -v
5.6.0
```

Great! Node and NPM have been installed and are working! As you may have noticed, I have installed NodeJS and NPM in my $HOME directory to avoid permission issues while installing modules globally. This is the recommended method by NodeJS team.

Well, let us go ahead to see managing NodeJS modules (or packages) using npm.

##### Installing NodeJS modules

NodeJS modules can either be installed locally or globally(system wide). Now I am going to show how to install a package locally.

**Install packages locally**

To manage packages locally, we normally use **package.json** file.

First, let us create our project directory.
```
$ mkdir demo
```
```
$ cd demo
```

Create a package.json file inside your project's directory. To do so, run:
```
$ npm init
```

Enter the details of your package such as name, version, author, github page etc., or just hit ENTER key to accept the default values and type **YES** to confirm.
```
This utility will walk you through creating a package.json file.
It only covers the most common items, and tries to guess sensible defaults.

See `npm help json` for definitive documentation on these fields
and exactly what they do.

Use `npm install <pkg>` afterwards to install a package and
save it as a dependency in the package.json file.

Press ^C at any time to quit.
package name: (demo)
version: (1.0.0)
description: demo nodejs app
entry point: (index.js)
test command:
git repository:
keywords:
author:
license: (ISC)
About to write to /home/sk/demo/package.json:

{
 "name": "demo",
 "version": "1.0.0",
 "description": "demo nodejs app",
 "main": "index.js",
 "scripts": {
 "test": "echo \"Error: no test specified\" && exit 1"
 },
 "author": "",
 "license": "ISC"
}

Is this ok? (yes) yes
```

The above command initializes your project and create package.json file.

You can also do this non-interactively using command:
```
npm init --y
```

This will create a package.json file quickly with default values without the user interaction.

Now let us install package named [**commander**][2].
```
$ npm install commander
```

Sample output:
```
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN demo@1.0.0 No repository field.

+ commander@2.13.0
added 1 package in 2.519s
```

This will create a directory named **" node_modules"** (if it doesn't exist already) in the project's root directory and download the packages in it.

Let us check the package.json file.
```
$ cat package.json
{
 "name": "demo",
 "version": "1.0.0",
 "description": "demo nodejs app",
 "main": "index.js",
 "scripts": {
 "test": "echo \"Error: no test specified\" && exit 1"
 },
 "author": "",
 "license": "ISC",
 **"dependencies": {**
**"commander": "^2.13.0"**
 }
}
```

You will see the dependencies have been added. The caret ( **^** ) at the front of the version number indicates that when installing, npm will pull the highest version of the package it can find.
```
$ ls node_modules/
commander
```

The advantage of package.json file is if you had the package.json file in your project's directory, you can just type "npm install", then npm will look into the dependencies that listed in the file and download all of them. You can even share it with other developers or push into your GitHub repository, so when they type "npm install", they will get all the same packages that you have.

You may also noticed another json file named **package-lock.json**. This file ensures that the dependencies remain the same on all systems the project is installed on.

To use the installed package in your program, create a file **index.js** (or any name of you choice) in the project's directory with the actual code, and then run it using command:
```
$ node index.js
```

**Install packages globally**

If you want to use a package as a command line tool, then it is better to install it globally. This way, it works no matter which directory is your current directory.
```
$ npm install async -g
+ async@2.6.0
added 2 packages in 4.695s
```

Or,
```
$ npm install async --global
```

To install a specific version of a package, we do:
```
$ npm install async@2.6.0 --global
```

##### Updating NodeJS modules

To update the local packages, go the the project's directory where the package.json is located and run:
```
$ npm update
```

Then, run the following command to ensure all packages were updated.
```
$ npm outdated
```

If there is no update, then it returns nothing.

To find out which global packages need to be updated, run:
```
$ npm outdated -g --depth=0
```

If there is no output, then all packages are updated.

To update the a single global package, run:
```
$ npm update -g <package-name>
```

To update all global packages, run:
```
$ npm update -g <package>
```

##### Listing NodeJS modules

To list the local packages, go the project's directory and run:
```
$ npm list
demo@1.0.0 /home/sk/demo
└── commander@2.13.0
```

As you see, I have installed "commander" package in local mode.

To list global packages, run this command from any location:
```
$ npm list -g
```

Sample output:
```
/home/sk/.nvm/versions/node/v9.4.0/lib
├─┬ async@2.6.0
│ └── lodash@4.17.4
└─┬ npm@5.6.0
 ├── abbrev@1.1.1
 ├── ansi-regex@3.0.0
 ├── ansicolors@0.3.2
 ├── ansistyles@0.1.3
 ├── aproba@1.2.0
 ├── archy@1.0.0
[...]
```

This command will list all modules and their dependencies.

To list only the top level modules, use -depth=0 option:
```
$ npm list -g --depth=0
/home/sk/.nvm/versions/node/v9.4.0/lib
├── async@2.6.0
└── npm@5.6.0
```

##### Searching NodeJS modules

To search for a module, use "npm search" command:
```
npm search <search-string>
```

Example:
```
$ npm search request
```

This command will display all modules that contains the search string "request".

##### Removing NodeJS modules

To remove a local package, go to the project's directory and run following command to remove the package from your **node_modules** directory:
```
$ npm uninstall <package-name>
```

To remove it from the dependencies in **package.json** file, use the **save** flag like below:
```
$ npm uninstall --save <package-name>

```

To remove the globally installed packages, run:
```
$ npm uninstall -g <package>
```

##### Cleaning NPM cache

By default, NPM keeps the copy of a installed package in the cache folder named npm in your $HOME directory when installing it. So, you can install it next time without having to download again.

To view the cached modules:
```
$ ls ~/.npm
```

The cache folder gets flooded with all old packages over time. It is better to clean the cache from time to time.

As of npm@5, the npm cache self-heals from corruption issues and data extracted from the cache is guaranteed to be valid. If you want to make sure everything is consistent, run:
```
$ npm cache verify
```

To clear the entire cache, run:
```
$ npm cache clean --force
```

##### Viewing NPM configuration

To view the npm configuration, type:
```
$ npm config list
```

Or,
```
$ npm config ls
```

Sample output:
```
; cli configs
metrics-registry = "https://registry.npmjs.org/"
scope = ""
user-agent = "npm/5.6.0 node/v9.4.0 linux x64"

; node bin location = /home/sk/.nvm/versions/node/v9.4.0/bin/node
; cwd = /home/sk
; HOME = /home/sk
; "npm config ls -l" to show all defaults.
```

To display the current global location:
```
$ npm config get prefix
/home/sk/.nvm/versions/node/v9.4.0
```

And, that's all for now. What we have just covered here is just the basics. NPM is a vast topic. For more details, head over to the the [**NPM Getting Started**][3] guide.

Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/manage-nodejs-packages-using-npm/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/manage-python-packages-using-pip/
[2]:https://www.npmjs.com/package/commander
[3]:https://docs.npmjs.com/getting-started/
