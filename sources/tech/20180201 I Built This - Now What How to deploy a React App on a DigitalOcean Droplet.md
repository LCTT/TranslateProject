I Built This - Now What? How to deploy a React App on a DigitalOcean Droplet.
============================================================
 
![](https://cdn-images-1.medium.com/max/1000/1*6K5vmzalJUxn44v3cm6wBw.jpeg)
Photo by [Thomas Kvistholt][1]

Most aspiring developers have uploaded static HTML sites before. The process isn’t too daunting, as you’re essentially just moving files from one computer to another, and then BAM! Website.

But those who have tackled learning React often pour hundreds or even thousands of hours into learning about components, props, and state, only to be left with the question “How do I host this?” Fear not, fellow developer. Deploying your latest masterpiece is a little more in-depth, but not overly difficult. Here’s how:

### Preparing For Production

There are a few things you’ll want to do to get your app ready for deployment.

#### Turn off service workers

If you’ve used something like create-react-app to bootstrap your project, you’ll want to turn off the built-in service worker if you haven’t specifically integrated it to work with your app. While usually harmless, it can cause some issues, so it’s best to just get rid of it up front. Find these lines in your `src/index.js` file and delete them:`registerServiceWorker();` `import registerServiceWorker from ‘register-service-worker’`

#### Get your server ready

To get the most bang for your buck, a production build will minify the code and remove extra white-space and comments so that it’s as fast to download as possible. It creates a new directory called `/build`, and we need to make sure we’re telling Express to use it. On your server page, add this line: `app.use( express.static( `${__dirname}/../build` ) );`

Next, you’ll need to make sure your routes know how to get to your index.html file. To do this, we need to create an endpoint and place it below all other endpoints in your server file. It should look like this:

```
const path = require('path')app.get('*', (req, res)=>{  res.sendFile(path.join(__dirname, '../build/index.html'));})
```

#### Create the production build

Now that Express knows to use the `/build` directory, it’s time to create it. Open up your terminal, make sure you’re in your project directory, and use the command `npm run build`

#### Keep your secrets safe

If you’re using API keys or a database connection string, hopefully you’ve already hidden them in a `.env` file. All the configuration that is different between deployed and local should go into this file as well. Tags cannot be proxied, so we have to hard code in the backend address when using the React dev server, but we want to use relative paths in production. Your resulting `.env` file might look something like this:

```
REACT_APP_LOGIN="http://localhost:3030/api/auth/login"REACT_APP_LOGOUT="http://localhost:3030/api/auth/logout"DOMAIN="user4234.auth0.com"ID="46NxlCzM0XDE7T2upOn2jlgvoS"SECRET="0xbTbFK2y3DIMp2TdOgK1MKQ2vH2WRg2rv6jVrMhSX0T39e5_Kd4lmsFz"SUCCESS_REDIRECT="http://localhost:3030/"FAILURE_REDIRECT="http://localhost:3030/api/auth/login"
```

```
AWS_ACCESS_KEY_ID=AKSFDI4KL343K55L3
AWS_SECRET_ACCESS_KEY=EkjfDzVrG1cw6QFDK4kjKFUa2yEDmPOVzN553kAANcy
```

```
CONNECTION_STRING="postgres://vuigx:k8Io13cePdUorndJAB2ijk_u0r4@stampy.db.elephantsql.com:5432/vuigx"NODE_ENV=development
```

#### Push your code

Test out your app locally by going to `[http://localhost:3030][2]` and replacing 3030 with your server port to make sure everything still runs smoothly. Remember to start your local server with node or nodemon so it’s up and running when you check it. Once everything looks good, we can push it to Github (or Bit Bucket, etc).

IMPORTANT! Before you do so, double check that your `.gitignore` file contains `.env` and `/build` so you’re not publishing sensitive information or needless files.

### Setting Up DigitalOcean

[DigitalOcean][8] is a leading hosting platform, and makes it relatively easy and cost-effective to deploy React sites. They utilize Droplets, which is the term they use for their servers. Before we create our Droplet, we still have a little work to do.

#### Creating SSH Keys

Servers are computers that have public IP addresses. Because of this, we need a way to tell the server who we are, so that we can do things we wouldn’t want anyone else doing, like making changes to our files. Your everyday password won’t be secure enough, and a password long and complex enough to protect your Droplet would be nearly impossible to remember. Instead, we’ll use an SSH key.

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/1000/1*qeGqHqXrV22_aBwFQ4WhaA.jpeg)
Photo by [Brenda Clarke][3]

To create your SSH key, enter this command in your terminal: `ssh-keygen -t rsa`

This starts the process of SSH key generation. First, you’ll be asked to specify where to save the new key. Unless you already have a key you need to keep, you can keep the default location and simply press enter to continue.

As an added layer of security in case someone gets ahold of your computer, you’ll have to enter a password to secure your key. Your terminal will not show your keystrokes as you type this password, but it is keeping track of it. Once you hit enter, you’ll have to type it in once more to confirm. If successful, you should now see something like this:

```
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/username/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in demo_rsa.
Your public key has been saved in demo_rsa.pub.
The key fingerprint is:
cc:28:30:44:01:41:98:cf:ae:b6:65:2a:f2:32:57:b5 user@user.local
The key's randomart image is:
+--[ RSA 2048]----+
|=*+.             |
|o.               |
| oo              |
|  oo  .+         |
| .  ....S        |
|  . ..E          |
| . +             |
|*.=              |
|+Bo              |
+-----------------+
```

#### What happened?

Two files have been created on your computer — `id_rsa` and `id_rsa.pub`. The `id_rsa` file is your private key and is used to verify your signature when you use the `id_rsa.pub` file, or public key. We need to give our public key to DigitalOcean. To get it, enter `cat ~/.ssh/id_rsa.pub`. You should now be looking at a long string of characters, which is the contents of your `id_rsa.pub` file. It looks something like this:

```
ssh-rsaAABC3NzaC1yc2EAAAADAQABAAABAQDR5ehyadT9unUcxftJOitl5yOXgSi2Wj/s6ZBudUS5Cex56LrndfP5Uxb8+Qpx1D7gYNFacTIcrNDFjdmsjdDEIcz0WTV+mvMRU1G9kKQC01YeMDlwYCopuENaas5+cZ7DP/qiqqTt5QDuxFgJRTNEDGEebjyr9wYk+mveV/acBjgaUCI4sahij98BAGQPvNS1xvZcLlhYssJSZrSoRyWOHZ/hXkLtq9CvTaqkpaIeqvvmNxQNtzKu7ZwaYWLydEKCKTAe4ndObEfXexQHOOKwwDSyesjaNc6modkZZC+anGLlfwml4IUwGv10nogVg9DTNQQLSPVmnEN3Z User@Computer.local
```

Now  _that’s_  a password! Copy the string manually, or use the command `pbcopy < ~/.ssh/id_rsa.pub` to have the terminal copy it for you.

#### Adding your SSH Key to DigitalOcean

Login to your DigitalOcean account or sign up if you haven’t already. Go to your [Security Settings][9] and click on Add SSH. Paste in the key you copied and give it a name. You can name it whatever you like, but it’s good idea to reference the computer the key is saved on, especially if you use multiple computers regularly.

#### Creating a Droplet

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/1000/1*dN9vn7lxBjtK72iV3CZZXw.jpeg)
Photo by [M. Maddo][4]

With the key in place, we can finally create our Droplet. To get started, click Create Droplet. You’ll be asked to choose an OS, but for our purposes, the default Ubuntu will work just fine.

You’ll need to select which size Droplet you want to use. In many cases, the smallest Droplet will do. However, review the available options and choose the one that will work best for your project.

Next, select a data center for your Droplet. Choose a location central to your expected visitor base. New features are rolled out by DigitalOcean in different data centers at different times, but unless you know you want to use a special feature that’s only available in specific locations, this won’t matter.

If you want to add additional services to your Droplet such as backups or private networking, you have that option here. Be aware, there is an associated cost for these services.

Finally, make sure your SSH key is selected and give your Droplet a name. It is possible to host multiple projects on a single Droplet, so you may not want to give it a project-specific name. Submit your settings by clicking the Create button at the bottom of the page.

#### Connecting to your Droplet

With our Droplet created, we can now connect to it via SSH. Copy the IP address for your Droplet and go back to your terminal. Enter ssh followed by root@youripaddress, where youripaddress is the IP address for your Droplet. It should look something like this: `ssh root@123.45.67.8`. This tells your computer that you want to connect to your IP address as the root user. Alternatively, you can [set up user accounts][10] if you don’t want to login as root, but it’s not necessary.

#### Installing Node


![](https://cdn-images-1.medium.com/max/1000/1*3mKtwxfRWi8zxHs4EGcUMw.png)

To run React, we’ll need an updated version of Node. First we want to run `apt-get update && apt-get dist-upgrade` to update the Linux software list. Next, enter `apt-get install nodejs -y`, `apt-get install npm -y`, and `npm i -g n` to install Nodejs and npm.

Your React app dependencies might require a specific version of Node, so check the version that your project is using by running `node -v` in your projects directory. You’ll probably want to do this in a different terminal tab so you don’t have to log in through SSH again.

Once you know what version you need, go back to your SSH connection and run `n 6.11.2`, replacing 6.11.2 with your specific version number. This ensures your Droplet’s version of Node matches your project and minimizes potential issues.

### Install your app to the Droplet

All the groundwork has been laid, and it’s finally time to install our React app! While still connected through SSH, make sure you’re in your home directory. You can enter `cd ~` to take you there if you’re not sure.

To get the files to your Droplet, you’re going to clone them from your Github repo. Grab the HTTP clone link from Github and in your terminal enter `git clone [https://github.com/username/my-react-project.git][5]`. Just like with your local project, cd into your project folder using `cd my-react-project` and then run `npm install`.

#### Don’t ignore your ignored files

Remember that we told Git to ignore the `.env` file, so it won’t be included in the code we just pulled down. We need to add it manually now. `touch .env`will create an empty `.env` file that we can then open in the nano editor using `nano .env`. Copy the contents of your local `.env` file and paste them into the nano editor.

We also told Git to ignore the build directory. That’s because we were just testing the production build, but now we’re going to build it again on our Droplet. Use `npm run build` to run this process again. If you get an error, check to make sure you have all of your dependencies listed in your `package.json` file. If there are any missing, npm install those packages.

#### Start it up!

Run your server with `node server/index.js` (or whatever your server file is named) to make sure everything is working. If it throws an error, check again for any missing dependencies that might not have been caught in the build process. If everything starts up, you should now be able to go to ipaddress:serverport to see your site: `123.45.67.8:3232`. If your server is running on port 80, this is a default port and you can just use the IP address without specifying a port number: `123.45.67.8`


![](https://cdn-images-1.medium.com/max/1000/1*Hvs_Dqclz-uajcjmsgH4gA.jpeg)
Photo by [John Baker][6] on [Unsplash][7]

You now have a space on the internet to call your own! If you have purchased a domain name you’d like to use in place of the IP address, you can follow [DigitalOcean’s instructions][11] on how to set this up.

#### Keep it running

Your site is live, but once you close the terminal, your server will stop. This is a problem, so we’ll want to install some more software that will tell the server not to stop once the connection is terminated. There are some options for this, but let’s use Program Manager 2 for the sake of this article.

Kill your server if you haven’t already and run `npm install -g pm2`. Once installed, we can tell it to run our server using `pm2 start server/index.js`

### Updating your code

At some point, you’ll probably want to update your project, but luckily uploading changes is quick and easy. Once you push your code to Github, ssh into your Droplet and cd into your project directory. Because we cloned from Github initially, we don’t need to provide any links this time. You can pull down the new code simply by running `git pull`.

To incorporate frontend changes, you will need to run the build process again with `npm run build`. If you’ve made changes to the server file, restart PM2 by running `pm2 restart all`. That’s it! Your updates should be live now.

--------------------------------------------------------------------------------

via: https://medium.freecodecamp.org/i-built-this-now-what-how-to-deploy-a-react-app-on-a-digitalocean-droplet-662de0fe3f48

作者：[Andrea Stringham ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.freecodecamp.org/@astringham
[1]:https://unsplash.com/photos/oZPwn40zCK4?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[2]:http://localhost:3030/
[3]:https://www.flickr.com/photos/37753256@N08/
[4]:https://www.flickr.com/photos/14141796@N05/
[5]:https://github.com/username/my-react-project.git
[6]:https://unsplash.com/photos/3To9V42K0Ag?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[7]:https://unsplash.com/search/photos/key?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]:https://www.digitalocean.com/
[9]:https://cloud.digitalocean.com/settings/security
[10]:https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-14-04
[11]:https://www.digitalocean.com/community/tutorials/how-to-point-to-digitalocean-nameservers-from-common-domain-registrars