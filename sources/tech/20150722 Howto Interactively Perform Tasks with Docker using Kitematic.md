Howto Interactively Perform Tasks with Docker using Kitematic
================================================================================
In this article, we'll learn about the installating Kitematic in Windows Operating System and deploying a Hello World Nginx Web Server. Kitematic is a free and open source software which is a modern designed GUI software that allows us to interactively perform tasks with docker. Kitematic has a beautiful design and pretty good interface. It is pretty fast and easy to setup our containers out of the box without needing to enter commands for it, we can deploy our apps it in just a click with its GUI inteface. Kitematic has Docker Hub Intergration which allows us to search any required image, pull and deploy our apps with it. It also has a beautiful feature to switch to CUI mode simultaneously. Currently, it includes some features like automatically map ports, visually change environment variables, configuring volumes, streamline logs and many more.

So. here are the easy 3 steps on how we can install Kitematic and deploy Hello World Nginx Web Server in Windows.

### 1. Download Kitematic ###

First of all, we'll need to download the latest release of Kitematic available for windows operating system from the github repository ie [https://github.com/kitematic/kitematic/releases][1] . Here, we download its executable EXE file using a download manager or a web browser. After we finish downloading, we'll need to double-click the executable application file.

![Running Kitematic](http://blog.linoxide.com/wp-content/uploads/2015/06/running-kitematic.png)

After double clicking the application file, we'll be asked by a security issue we'll simply click OK as shown below.

![Security Warning](http://blog.linoxide.com/wp-content/uploads/2015/06/security-warning.png)

### 2. Installing Kitematic ###

After the executable installer has been downloaded, we'll now gonna install Kitematic in our Windows Operating System. The installer will now begin to download and install the necessary dependencies virtual box and docker to run Kitematic. If you already virtualbox installed in your system, it will upgrade it to the latest version. The installer should finish in few minutes but that depends on how fast your internet and system is. If you don't have a virtual box installed already, it may ask you for installing the virtual box network driver. It is suggested to install that as it is useful for the virtual box networking.

![Installing Kitematic](http://blog.linoxide.com/wp-content/uploads/2015/06/installing-kitematic.png)

After the required dependencies Docker and Virtual box are installed and are running, we'll be asked to login to the Docker Hub. If we don't have an account or don't wanna login now, we can click **SKIP FOR NOW** to continue further.

![Login Docker Hub](http://blog.linoxide.com/wp-content/uploads/2015/06/login-docker-hub.jpg)

If you don't have an account, you can simply click on Sign Up link in the App and create an account in Docker Hub.

After its done, our first interface of Kitematic App will load. Here, below is how it looks. We can search for the available docker images there as shown below.

![Kitematic App Launched](http://blog.linoxide.com/wp-content/uploads/2015/07/kitematic-app-launched.jpg)

### 3. Deploying Nginx Hello World Container ###

Now, as our Kitematic has been successfully installed, we'll now go for the deployment of containers. To run a container, we can simply search for the image in the search area. Then click on Create to deploy the container. Here in this tutorial, we'll go for deploying a small Nginx Web Server having Hello World homepage. To do so, we'll search for Hello World Nginx in the search area. Then, after we see the container information, we'll click on Create to deploy the container.

![Hello World Nginx Run](http://blog.linoxide.com/wp-content/uploads/2015/06/hello-world-nginx-run.jpg)

Once the download of the image has been completed, it will get deployed. We can see the logs of the commands fired by the Kitematic to deploy that container. We can also see the web page preview right from the Kitematic interface. Now, we can check our Hello World page from our web browser by clicking on the preview.

![Nginx Hello World Browser](http://blog.linoxide.com/wp-content/uploads/2015/07/nginx-hello-world-browser.jpg)

If we wanna switch to command line interface and manage docker with it, there is a button called Docker CLI which will open a Powershell were we can execute docker commands.

![Docker CLI PowerShell](http://blog.linoxide.com/wp-content/uploads/2015/07/docker-cli-powershell.png)

Now, if we wanna configure our container and perform stuffs like changing the container name, assigning environment variables, assign ports, configure container's storage and other advanced features, we can do that from Settings tab of the container.

![Kitematic Container Settings](http://blog.linoxide.com/wp-content/uploads/2015/07/kitematic-container-settings.png)

### Conclusion ###

Finally we've successfully installed Kitematic and deployed a hello world nginx web server in Windows Operating System. It is always recommended to download and install the latest release of Kitematic as many advanced features are to be embedded. As docker works in 64 bit platform, Kitematic is also currently built for 64-bit platform of operating system. It only works on the Windows 7 and greater versions of Windows. Here, in this tutorial, we deployed an Nginx web server like wise we can deploy any docker container from its image using Kitematic with few clicks only. Kitematic is already available for Mac OS X and Windows whereas a version for Linux is still under development and will be out very soon. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/interactively-docker-kitematic/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://github.com/kitematic/kitematic/releases