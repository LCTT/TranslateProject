ictlyh Translating
How to edit your documents collaboratively on Linux
================================================================================
> "Developed many years before by some high-strung, compulsive assistant, the Bulletin was simply a Word document that lived in a shared folder both Emily and I could access. Only one of us could open it at a time and add a new message, thought, or question to the itemized list. Then we'd print out the updated version and place it on the clipboard that sat on the shelf over my desk, removing the old ones as we went." ("The Devil Wears Prada" by Lauren Weisberger)

Even today such a "collaborative editing" is in use where only one person can open a shared file, make changes to it, and then inform others about what and when was modified.

ONLYOFFICE is an open source online office suite integrated with different management tools for documents, emails, events, tasks and client relations.

Using ONLYOFFICE office suite, a group of people can edit text, spreadsheet or presentation within a browser simultaneously. Leave comments directly in their document and interact with each other using the integrated chat. And, finally, save the document as a PDF file for further printing. As an added bonus, it gives the possibility to view the document history and restore the previous revision/version if needed.

In this tutorial, I will describe how to deploy your own online office suite using [ONLYOFFICE Free Edition][1], an ONLYOFFICE self-hosted version distributed under GNU AGPL v3.

### Installing ONLYOFFICE on Linux ###

ONLYOFFICE installation requires the presence of mono (version 4.0.0 or later), nodejs, libstdc++6, nginx and mysql-server in your Linux system. To simplify the installation process and avoid dependency errors, I install ONLYOFFICE using Docker. In this case there is only one dependency to be installed - [Docker][2]. 

Just to remind, Docker is an open-source project that automates the deployment of applications inside software containers. If Docker is not available on your Linux system, install it first by referring to Docker installation instructions for [Debian-based][3] or [Red-Hat based][4] systems.

Note that you will need Docker 1.4.1 or later. To check the installed Docker version, use the following command.

    $ docker version 

To try ONLYOFFICE inside a Docker container, simply execute the following commands:

    $ sudo docker run -i -t -d --name onlyoffice-document-server onlyoffice/documentserver
    $ sudo docker run -i -t -d -p 80:80 -p 443:443 --link onlyoffice-document-server:document_server onlyoffice/communityserver

These commands will download the [official ONLYOFFICE Docker image][5] with all dependencies needed for its correct work.

It's also possible to install [ONLYOFFICE Online Editors][6] separately on a Linux server, and easily integrate it into your website or cloud application via API provided. 

### Running a Self-Hosted Online Office ###

To open your online office, enter localhost (http://IP-Address/) in the address bar of your browser. The Welcome page will open:

![](https://farm9.staticflickr.com/8815/18116525656_795821c73b_c.jpg)

Enter a password and specify the email address you will use to access your office the next time. 

### Editing Your Documents Online ###

First, click the Documents link to open **the My Documents** folder. 

![](https://farm8.staticflickr.com/7781/17956640089_d3df0b18cd_c.jpg)

#### STEP 1. Select a Document to Edit ####

To create a new document right there, click on the **Create** button in the upper left corner, and choose the file type from the drop-down list. To edit a file stored on your hard disk drive, upload it to **Documents** clicking the **Upload** button next to **Create** button.

![](https://farm9.staticflickr.com/8836/17956640109_ed8be735df_c.jpg)

#### STEP 2. Share your Document ####

Use the **Share** button to the right side if you are in the **My Documents** folder, or follow **File >> Document Info ... >> Change Access Rights** if you are inside your document.

In the opened **Sharing Settings** window, click on the **People outside portal** link on the left, open the access to the document, and give full access to it by enabling the **Full Access** radio button.

Finally, choose a way to share the link to your document, send it via email or one of the available social networks: Google+, Facebook, or Twitter.

![](https://farm8.staticflickr.com/7766/17522306273_c8a9022c75_c.jpg)

#### STEP 3. Start the Collaborative Editing ####

To start co-editing the document, the invited person just needs to follow the provided link.

The text passages edited by your co-editors will be automatically marked with dashed lines of different colors.

![](https://farm8.staticflickr.com/7790/18139370292_7ef57aae8f_c.jpg)

As soon as one of your collaborators saves his/her changes, you will see a note appearing in the left upper corner of the top toolbar, indicating that there areupdates. 

![](https://farm8.staticflickr.com/7778/18143984831_3dd42a9672_c.jpg)

To save your changes and get updates, click on the **Save** icon. All the updates will then be highlighted.

![](https://farm8.staticflickr.com/7796/17955172970_e53460b8a6_c.jpg)

#### STEP 4. Interact with your Co-editors ####

To leave some comments, select a text passage with the mouse, right-click on it and, and choose the **Add comment** option from the context menu.

![](https://farm8.staticflickr.com/7771/17956640359_c4e2858dc8_c.jpg)

To interact with co-editors in real time, use the integrated chat instead. All the users who currently edit the document will be listed on the **Chat** panel. To open it, click on the **Chat** icon at the left-side bar. To start a discussion, enter your message into an appropriate field on the **Chat** panel.

![](https://farm8.staticflickr.com/7794/18116394026_d93b00e4f8_c.jpg)

### Useful Tips ###

As final notes, here are some useful tips for you to take full advantage of ONLYOFFICE.

#### Tip #1. Editing your Docs from Cloud Storage Services, Like ownCloud ####

If you store your documents in other web resources like Box, Dropbox, Google Drive, OneDrive, SharePoint or ownCloud, you can easily synchronize them with the ONLYOFFICE.

In the opened 'Documents' module, click one of the icons under the **Add the account** caption: Google, Box, DropBox, OneDrive, ownCloud or 'Add account', and enter the requested data.

#### Tip #2. Editing Your Docs on iPad ####

To add some changes to your document on the go, I use ONLYOFFICE Documents app for iPad. You can download and install it from [iTune][7], then you need to enter your ONLYOFFICE portal address, email and password to access your documents. The feature set is almost the same.

To evaluate ONLYOFFICE Online Editors features, you can use the [cloud version][8] for personal use. 

--------------------------------------------------------------------------------

via: http://xmodulo.com/edit-documents-collaboratively-linux.html

作者：[Tatiana Kochedykova][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/tatiana
[1]:http://www.onlyoffice.org/
[2]:http://xmodulo.com/recommend/dockerbook
[3]:http://xmodulo.com/manage-linux-containers-docker-ubuntu.html
[4]:http://xmodulo.com/docker-containers-centos-fedora.html
[5]:https://registry.hub.docker.com/u/onlyoffice/communityserver/
[6]:http://onlyoffice.org/sources#document
[7]:https://itunes.apple.com/us/app/onlyoffice-documents/id944896972
[8]:https://personal.onlyoffice.com/