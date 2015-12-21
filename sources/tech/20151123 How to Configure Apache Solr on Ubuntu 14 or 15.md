taichirain 翻译中

How to Configure Apache Solr on Ubuntu 14 / 15
================================================================================
Hello and welcome to our today's article on Apache Solr. The brief description about Apache Solr is that it is an Open Source most famous search platform with Apache Lucene at the back end for Web sites that enables you to easily create search engines which searches websites, databases and files. It can index and search multiple sites and return recommendations for related contents based on the searched text.

Solr works with HTTP Extensible Markup Language (XML) that offers application program interfaces (APIs) for Javascript Object Notation, Python, and Ruby. According to the Apache Lucene Project, Solr offers capabilities that have made it popular with administrators including it many featuring like:

- Full Text Search
- Faceted Navigation
- Snippet generation/highting
- Spell Suggestion/Auto complete
- Custom document ranking/ordering

#### Prerequisites: ####

On a fresh Linux Ubuntu 14/15 with minimal packages installed, you only have to take care of few prerequisites in order to install Apache Solr.

### 1)System Update ###

Login to your Ubuntu server with a non-root sudo user that will be used to perform all the steps to install and use Solr.

After successful login, issue the following command to update your system with latest updates and patches.

    $ sudo apt-get update

### 2) JRE Setup ###

The Solr setup needs Java Runtime Environment to be installed on the system as its basic requirement because solr and tomcat both are the Java based applications. So, we need to install and configure its home environment with latest Java.

To install the latest version on Oracle Java 8, we need to install Python Software Properties using the below command.

    $ sudo apt-get install python-software-properties

Upon completion, run the setup its the repository for the latest version of Java 8.

    $ sudo add-apt-repository ppa:webupd8team/java

Now you are able to install the latest version of Oracle Java 8 with 'wget' by issuing the below commands to update the packages source list and then to install Java.

    $ sudo apt-get update

----------

    $ sudo apt-get install oracle-java8-installer

Accept the Oracle Binary Code License Agreement for the Java SE Platform Products and JavaFX as you will be asked during the Java installation and configuration process by a click on the 'OK' button.

When the installation process complete, run the below command to test the successful installation of Java and check its version.

    kash@solr:~$ java -version
    java version "1.8.0_66"
    Java(TM) SE Runtime Environment (build 1.8.0_66-b17)
    Java HotSpot(TM) 64-Bit Server VM (build 25.66-b17, mixed mode)

The output indicates that we have successfully fulfilled the basic requirement of Solr by installing the Java. Now move to the next step to install Solr.

### Installing Solr ###

Installing Solr on Ubuntu can be done by using two different ways but in this article we prefer to install its latest package from the source.

To install Solr from its source, download its available package with latest version from there Official [Web Page][1], copy the link address and get it using 'wget' command.

    $ wget http://www.us.apache.org/dist/lucene/solr/5.3.1/solr-5.3.1.tgz

Run the command below to extract the archived service into '/bin' folder.

    $ tar -xzf solr-5.3.1.tgz solr-5.3.1/bin/install_solr_service.sh --strip-components=2

Then run the script to start Solr service that will creates a new 'solr' user and then installs solr as a service.

    $ sudo bash ./install_solr_service.sh solr-5.3.1.tgz

![Solr Installation](http://blog.linoxide.com/wp-content/uploads/2015/11/12.png)

To check the status of Solr service, you use the below command.

    $ service solr status

![Solr Status](http://blog.linoxide.com/wp-content/uploads/2015/11/22.png)

### Creating Solr Collection: ###

Now we can create multiple collections using Solr user. To do so just run the below command by mentioning the name of the collection you want to create and by specifying its configuration set as shown.

    $ sudo su - solr -c "/opt/solr/bin/solr create -c myfirstcollection -n data_driven_schema_configs"

![creating collection](http://blog.linoxide.com/wp-content/uploads/2015/11/32.png)

We have successfully created the new core instance directory for our our first collection where we can add new data in it. To view its default schema file in directory '/opt/solr/server/solr/configsets/data_driven_schema_configs/conf' .

### Using Solr Web ###

Apache Solr can be accessible on the default port of Solr that 8983. Open your favorite browser and navigate to http://your_server_ip:8983/solr or http://your-domain.com:8983/solr. Make sure that the port is allowed in your firewall.

    http://172.25.10.171:8983/solr/

![Solr Web Access](http://blog.linoxide.com/wp-content/uploads/2015/11/42.png)

From the Solr Web Console click on the 'Core Admin' button from the left bar, then you will see your first collection that we created earlier using CLI. While you can also create new cores by pointing on the 'Add Core' button.

![Adding Core](http://blog.linoxide.com/wp-content/uploads/2015/11/52.png)

You can also add the document and query from the document as shown in below image by selecting your particular collection and pointing the document. Add the data in the specified format as shown in the box.

    {
    "number": 1,
    "Name": "George Washington",
    "birth_year": 1989,
    "Starting_Job": 2002,
    "End_Job": "2009-04-30",
    "Qualification": "Graduation",
    "skills": "Linux and Virtualization"
    }

After adding the document click on the 'Submit Document' button.

![adding Document](http://blog.linoxide.com/wp-content/uploads/2015/11/62.png)

### Conclusion ###

You are now able to insert and query data using the Solr web interface after its successful installation on Ubuntu. Now add more collections and insert you own data and documents that you wish to put and manage through Solr. We hope you have got this article much helpful and enjoyed reading this.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/configure-apache-solr-ubuntu-14-15/

作者：[Kashif][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
[1]:http://lucene.apache.org/solr/
