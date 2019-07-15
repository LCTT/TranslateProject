[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install Elasticsearch on MacOS)
[#]: via: (https://opensource.com/article/19/7/installing-elasticsearch-macos)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo/users/don-watkins)

How to install Elasticsearch on MacOS
======
Installing Elasticsearch is complex! Here's how to do it on a Mac.
![magnifying glass on computer screen][1]

[Elasticsearch][2] is an open source, full-text search engine developed in Java. Users upload datasets as JSON files. Then, Elasticsearch stores the original document before adding a searchable reference to the document in the cluster’s index.

Less than nine years after its creation, Elasticsearch is the most popular enterprise search engine. Elastic released its latest update—version 7.2.0 —on June 25, 2019.

[Kibana][3] is an open source data visualizer for Elasticsearch. This tool helps users create visualizations on top of content indexed in an Elasticsearch cluster.

[Sunbursts][4], [geospatial data maps][5], [relationship analyses][6], and dashboards with live data are just a few options. And thanks to Elasticsearch’s machine learning prowess, you can learn which properties might influence your data (like servers or IP addresses) and find abnormal patterns.

At [DevFest DC][7] last month, [Dr. Summer Rankin][8]—lead data scientist at Booz Allen Hamilton—uploaded a dataset of content from TED Talks to Elasticsearch, then used Kibana to quickly build a dashboard. Intrigued, I went to an Elasticsearch meetup days later.

Since this course was for newbies, we started at Square One: Installing Elastic and Kibana on our laptops. Without both packages installed, we couldn’t create our own visualizations from the dataset of Shakespeare texts we were using as a dummy JSON file.

Next, I will share step-by-step instructions for downloading, installing, and running Elasticsearch Version 7.1.1 on MacOS. This was the latest version when I attended the Elasticsearch meetup in mid-June 2019.

### Downloading Elasticsearch for MacOS

  1. Go to <https://www.elastic.co/downloads/elasticsearch>, which takes you to the webpage below:



![The Elasticsearch download page.][9]

  2. In the **Downloads** section, click **MacOS**, which downloads the Elasticsearch TAR file (for example, **elasticsearch-7.1.1-darwin-x86_64.tar**) into your **Downloads** folder.
  3. Double-click this file to unpack it into its own folder (for example, **elasticsearch-7.1.1**), which contains all of the files that were in the TAR.



**Tip**: If you want Elasticsearch to live in another folder, now is the time to move this folder.

### Running Elasticsearch from the MacOS command line

You can run Elasticsearch only using the command line if you prefer. Just follow this process:

  1. [Open a **Terminal** window][10].
  2. In the terminal window, enter your Elasticsearch folder. For example (if you moved the program, change **Downloads** to the correct path):



**$ cd ~Downloads/elasticsearch-1.1.0**

  3. Change to the Elasticsearch **bin** subfolder, and start the program. For example:



**$ cd bin $ ./elasticsearch**

Here’s some of the output that my command line terminal displayed when I launched Elasticsearch 1.1.0:

![Terminal output when running Elasticsearch.][11]

**NOTE**: Elasticsearch runs in the foreground by default, which can cause your computer to slow down. Press **Ctrl-C to** stop Elasticsearch from running.

### Running Elasticsearch using the GUI

If you prefer your point-and-click environment, you can run Elasticsearch like so:

  1. Open a new **Finder** window.
  2. Select **Downloads** in the left Finder sidebar (or, if you moved Elasticsearch to another folder, navigate to there).
  3. Open the folder called (for the sake of this example) **elasticsearch-7.1.1**. A selection of eight subfolders appears.



![The elasticsearch/bin menu.][12]

  4. Open the **bin** subfolder. As the screenshot above shows, this subfolder yields 20 assets.
  5. Click the first option, which is **elasticsearch**.



Note that you may get a security warning, as shown below:

![The security warning dialog box.][13]

 

In order to open the program in this case:

  1. Click **OK** in the warning dialog box.
  2. Open **System Preferences**.
  3. Click **Security &amp; Privacy**, which opens the window shown below:



![Where you can allow your computer to open the downloaded file.][14]

  4. Click **Open Anyway**, which opens the confirmation dialog box shown below:



![Security confirmation dialog box.][15]

  5. Click **Open**. A terminal window opens and launches Elasticsearch.



The launch process can take a while, so let it run. Eventually, it will finish, and you will see output similar to this at the end:

![Launching Elasticsearch in MacOS.][16]

### Learning more

Once you’ve installed Elasticsearch, it’s time to start exploring!

The tool’s [Elasticsearch: Getting Started][17] guide directs you based on your goals. Its introductory video walks through steps to launch a hosted cluster on [Elasticsearch Service][18], perform basic search queries, play with data through create, read, update, and delete (CRUD) REST APIs, and more.

This guide also offers links to documentation, dev console commands, training subscriptions, and a free trial of Elasticsearch Service. This trial lets you deploy Elastic and Kibana on AWS and GCP to support your Elastic clusters in the cloud.

In the follow-up to this article, we’ll walk through the steps you’ll take to install Kibana on MacOS. This process will take your Elasticsearch queries to the next level via diverse data visualizations. Stay tuned!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/installing-elasticsearch-macos

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_issue_bug_programming.png?itok=XPrh7fa0 (magnifying glass on computer screen)
[2]: https://www.getapp.com/it-management-software/a/qbox-dot-io-hosted-elasticsearch/
[3]: https://www.elastic.co/products/kibana
[4]: https://en.wikipedia.org/wiki/Pie_chart#Ring
[5]: https://en.wikipedia.org/wiki/Spatial_analysis
[6]: https://en.wikipedia.org/wiki/Correlation_and_dependence
[7]: https://www.devfestdc.org/
[8]: https://www.summerrankin.com/about
[9]: https://opensource.com/sites/default/files/uploads/wwa1f3_600px_0.png (The Elasticsearch download page.)
[10]: https://support.apple.com/en-ca/guide/terminal/welcome/mac
[11]: https://opensource.com/sites/default/files/uploads/io6t1a_600px.png (Terminal output when running Elasticsearch.)
[12]: https://opensource.com/sites/default/files/uploads/o43yku_600px.png (The elasticsearch/bin menu.)
[13]: https://opensource.com/sites/default/files/uploads/elasticsearch_security_warning_500px.jpg (The security warning dialog box.)
[14]: https://opensource.com/sites/default/files/uploads/the_general_tab_of_the_system_preferences_security_and_privacy_window.jpg (Where you can allow your computer to open the downloaded file.)
[15]: https://opensource.com/sites/default/files/uploads/confirmation_dialog_box.jpg (Security confirmation dialog box.)
[16]: https://opensource.com/sites/default/files/uploads/y5dvtu_600px.png (Launching Elasticsearch in MacOS.)
[17]: https://www.elastic.co/webinars/getting-started-elasticsearch?ultron=%5BB%5D-Elastic-US+CA-Exact&blade=adwords-s&Device=c&thor=elasticsearch&gclid=EAIaIQobChMImdbvlqOP4wIVjI-zCh3P_Q9mEAAYASABEgJuAvD_BwE
[18]: https://info.elastic.co/elasticsearch-service-gaw-v10-nav.html?ultron=%5BB%5D-Elastic-US+CA-Exact&blade=adwords-s&Device=c&thor=elasticsearch%20service&gclid=EAIaIQobChMI_MXHt-SZ4wIVJBh9Ch3wsQfPEAAYASAAEgJo9fD_BwE
