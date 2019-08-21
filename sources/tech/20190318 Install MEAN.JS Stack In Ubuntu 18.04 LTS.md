[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Install MEAN.JS Stack In Ubuntu 18.04 LTS)
[#]: via: (https://www.ostechnix.com/install-mean-js-stack-ubuntu/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Install MEAN.JS Stack In Ubuntu 18.04 LTS
======

![Install MEAN.JS Stack][1]

**MEAN.JS** is an Open-Source, full-Stack JavaScript solution for building fast, and robust web applications. **MEAN.JS** stack consists of **MongoDB** (NoSQL database), **ExpressJs** (NodeJS server-side application web framework), **AngularJS** (Client-side web application framework), and **Node.js** (JavaScript run-time, popular for being a web server platform). In this tutorial, we will be discussing how to install MEAN.JS stack in Ubuntu. This guide was tested in Ubuntu 18.04 LTS server. However, it should work on other Ubuntu versions and Ubuntu variants.

### Install MongoDB

**MongoDB** is a free, cross-platform, open source, NoSQL document-oriented database. To install MongoDB on your Ubuntu system, refer the following guide:

  * [**Install MongoDB Community Edition In Linux**][2]



### Install Node.js

**NodeJS** is an open source, cross-platform, and lightweight JavaScript run-time environment that can be used to build scalable network applications.

To install NodeJS on your system, refer the following guide:

  * [**How To Install NodeJS On Linux**][3]



After installing, MongoDB, and Node.js, we need to install the other required components such as **Yarn** , **Grunt** , and **Gulp** for MEAN.js stack.

### Install Yarn package manager

Yarn is a package manager used by MEAN.JS stack to manage front-end packages.

To install Bower, run the following command:

```
$ npm install -g yarn
```

### Install Grunt Task Runner

Grunt Task Runner is used to to automate the development process.

To install Grunt, run:

```
$ npm install -g grunt-cli
```

To verify if Yarn and Grunt have been installed, run:

```
$ npm list -g --depth=0 /home/sk/.nvm/versions/node/v11.11.0/lib ├── [email protected] ├── [email protected] └── [email protected]
```

### Install Gulp Task Runner (Optional)

This is optional. You can use Gulp instead of Grunt. To install Gulp Task Runner, run the following command:

```
$ npm install -g gulp
```

We have installed all required prerequisites. Now, let us deploy MEAN.JS stack.

### Download and Install MEAN.JS Stack

Install Git if it is not installed already:

```
$ sudo apt-get install git
```

Next, git clone the MEAN.JS repository with command:

```
$ git clone https://github.com/meanjs/mean.git meanjs
```

**Sample output:**

```
Cloning into 'meanjs'... 
remote: Counting objects: 8596, done. 
remote: Compressing objects: 100% (12/12), done. 
remote: Total 8596 (delta 3), reused 0 (delta 0), pack-reused 8584 Receiving objects: 100% (8596/8596), 2.62 MiB | 140.00 KiB/s, done. 
Resolving deltas: 100% (4322/4322), done. 
Checking connectivity... done.
```

The above command will clone the latest version of the MEAN.JS repository to **meanjs** folder in your current working directory.

Go to the meanjs folder:

```
$ cd meanjs/
```

Run the following command to install the Node.js dependencies required for testing and running our application:

```
$ npm install
```

This will take some time. Please be patient.

* * *

**Troubleshooting:**

When I run the above command in Ubuntu 18.04 LTS, I get the following error:

```
Downloading binary from https://github.com/sass/node-sass/releases/download/v4.5.3/linux-x64-67_binding.node 
Cannot download "https://github.com/sass/node-sass/releases/download/v4.5.3/linux-x64-67_binding.node":

HTTP error 404 Not Found

[....]
```

If you ever get these type of common errors like “node-sass and gulp-sass”, do the following:

First uninstall the project and global gulp-sass modules using the following commands:

```
$ npm uninstall gulp-sass 
$ npm uninstall -g gulp-sass
```

Next uninstall the global node-sass module:

```
$ npm uninstall -g node-sass
```

Install the global node-sass first. Then install the gulp-sass module at the local project level.

```
$ npm install -g node-sass 
$ npm install gulp-sass
```

Now try the npm install again from the project folder using command:

```
$ npm install
```

Now all dependencies will start to install without any issues.

* * *

Once all dependencies are installed, run the following command to install all the front-end modules needed for the application:

```
$ yarn --allow-root --config.interactive=false install
```

Or,

```
$ yarn --allow-root install
```

You will see the following message at the end if the installation is successful.

```
[...]
> meanjs@0.6.0 snyk-protect /home/sk/meanjs
> snyk protect

Successfully applied Snyk patches

Done in 99.47s.
```

### Test MEAN.JS

MEAN.JS stack has been installed. We can now able to start a sample application using command:

```
$ npm start
```

After a few seconds, you will see a message like below. This means MEAN.JS stack is working!

```
[...]
MEAN.JS - Development Environment

Environment: development
Server: http://0.0.0.0:3000
Database: mongodb://localhost/mean-dev
App version: 0.6.0
MEAN.JS version: 0.6.0
```

![][4]

To verify, open up the browser and navigate to **<http://localhost:3000>** or **<http://IP-Address:3000/>**. You should see a screen something like below.

![][5]

Mean stack test page

Congratulations! MEAN.JS stack is ready to start building web applications.

For further details, I recommend you to refer **[MEAN.JS stack official documentation][6]**.

* * *

Want to setup MEAN.JS stack in CentOS, RHEL, Scientific Linux? Check the following link for more details.

  * **[Install MEAN.JS Stack in CentOS 7][7]**



* * *

And, that’s all for now, folks. Hope this tutorial will help you to setup MEAN.JS stack.

If you find this tutorial useful, please share it on your social, professional networks and support OSTechNix.

More good stuffs to come. Stay tuned!

Cheers!

**Resources:**

  * **[MEAN.JS website][8]**
  * [**MEAN.JS GitHub Repository**][9]





--------------------------------------------------------------------------------

via: https://www.ostechnix.com/install-mean-js-stack-ubuntu/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.ostechnix.com/install-mongodb-linux/
[3]: https://www.ostechnix.com/install-node-js-linux/
[4]: http://www.ostechnix.com/wp-content/uploads/2016/03/meanjs.png
[5]: http://www.ostechnix.com/wp-content/uploads/2016/03/mean-stack-test-page.png
[6]: http://meanjs.org/docs.html
[7]: http://www.ostechnix.com/install-mean-js-stack-centos-7/
[8]: http://meanjs.org/
[9]: https://github.com/meanjs/mean
