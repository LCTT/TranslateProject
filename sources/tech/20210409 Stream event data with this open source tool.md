[#]: subject: (Stream event data with this open source tool)
[#]: via: (https://opensource.com/article/21/4/event-streaming-rudderstack)
[#]: author: (Amey Varangaonkar https://opensource.com/users/ameypv)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Stream event data with this open source tool
======
Route real-time events from web, mobile, and server-side app sources to
help build your customer data lake on your data warehouse.
![Net catching 1s and 0s or data in the clouds][1]

In my [previous article][2], I introduced [RudderStack][3], an open source, warehouse-first customer data pipeline. In this article, I demonstrate how easy Rudderstack makes it to set up and use event streams.

An event stream is a pipeline between a source you define and a destination of your choice. Rudderstack provides you with SDKs and plugins to help you ingest event data from your website, mobile apps, and server-side sources — including JavaScript, Gatsby, Android, iOS, Unity, ReactNative, Node.js, and many more. Similarly, Rudderstack's **Event Stream** module features over 80 destination and warehouse integrations, including Firebase, Google Analytics, Salesforce, Zendesk, Snowflake, BigQuery, RedShift, and more, making it easy to send event data to downstream tools that can use it as well as build a customer data lake on a data warehouse for analytical use cases.

This tutorial shows how to track and route events using RudderStack.

### How to set up an event stream

Before you get started, make sure you understand these terms used in this tutorial:

  * **Source**: A source refers to a tool or a platform from which RudderStack ingests your event data. Your website, mobile app, or your back-end server are common examples of sources.
  * **Destination**: A destination refers to a tool that receives your event data from RudderStack. These destination tools can then use this data for your activation use cases. Tools like Google Analytics, Salesforce, and HubSpot are common examples of destinations.



The steps for setting up an event stream in RudderStack open source are:

  1. Instrumenting an event stream source
  2. Configuring a warehouse destination
  3. Configuring a tool destination
  4. Sending events to verify the event stream



### Step 1: Instrument an event stream source

To set up an event stream source in RudderStack:

  1. Log into your [RudderStack dashboard][4]. If you don't have a RudderStack account, please sign up. You can use the RudderStack open source control plane to [set up your event streams][5].

RudderStack's hosted control plane is an option to manage your event stream configurations. It is completely free, requires no setup, and has some more advanced features than the open source control plane.

  2. Once you've logged into RudderStack, you should see the following dashboard:

![RudderStack dashboard][6]

(Gavin Johnson, [CC BY-SA 4.0][7])

**Note:** Make sure to save the **Data Plane URL**. It is required in your RudderStack JavaScript SDK snippet to track events from your website.

  3. To instrument the source, click **Add Source**. Optionally, you can also select the **Directory** option on the left navigation bar, and select **Event Streams** under **Sources**. This tutorial will set up a simple **JavaScript** source that allows you to track events from your website.

![RudderStack event streams dashboard][8]

(Gavin Johnson, [CC BY-SA 4.0][7])

  4. Assign a name to your source, and click **Next**.

![RudderStack Source Name][9]

(Gavin Johnson, [CC BY-SA 4.0][7])

  5. That's it! Your event source is now configured.

![RudderStack source write key][10]

(Gavin Johnson, [CC BY-SA 4.0][7])

**Note:** Save the source **Write Key**. Your RudderStack JavaScript SDK snippet requires it to track events from your website.




Now you need to install the RudderStack JavaScript SDK on your website. To do this, you need to place either the minified or non-minified version of the snippet with your **Data Plane URL** and source **Write Key** in your website's `<head>` section. Consult the docs for information on how to [install and use the RudderStack JavaScript SDK][11].

### Step 2: Configure a warehouse destination

**Important**: Before you configure your data warehouse as a destination in RudderStack, you need to set up a new project in your warehouse and create a RudderStack user role with the relevant permissions. The docs provide [detailed, step-by-step instructions][12] on how to do this for the warehouse of your choice.

This tutorial sets up a Google BigQuery warehouse destination. You don't have to configure a warehouse destination, but I recommend it. The docs provide [instructions on setting up][13] a Google BigQuery project and a service account with the required permissions.

Then configure BigQuery as a warehouse destination in RudderStack by following these steps:

  1. On the left navigation bar, click on **Directory**, and then click on **Google BigQuery** from the list of destinations:

![RudderStack destination options][14]

(Gavin Johnson, [CC BY-SA 4.0][7])

  2. Assign a name to your destination, and click on **Next**.




![RudderStack naming the destination][15]

(Gavin Johnson, [CC BY-SA 4.0][7])

  3. Choose which source you want to use to send the events to your destination. Select the source that you created in the previous section. Then, click on **Next**.



![RudderStack selecting data source][16]

(Gavin Johnson, [CC BY-SA 4.0][7])

  4. Specify the required connection credentials. For this destination, enter the **BigQuery Project ID** and the **staging bucket name**; information on [how to get this information][17] is in the docs.



![RudderStack connection credentials][18]

(Gavin Johnson, [CC BY-SA 4.0][7])

  5. Copy the contents of the private JSON file you created, as [the docs][19] explain.



That's it! You have configured your BigQuery warehouse as a destination in RudderStack. Once you start sending events from your source (a website in this case), RudderStack will automatically route them into your BigQuery and build your identity graph there as well.

### Step 3: Configure a tool destination

Once you've added a source, follow these steps to configure a destination in the RudderStack dashboard:

  1. To add a new destination, click on the **Add Destination** button as shown:

![RudderStack adding the destination][20]

(Gavin Johnson, [CC BY-SA 4.0][7])

**Note:** If you have configured a destination before, use the **Connect Destinations** option to connect it to any source.

  2. RudderStack supports over 80 destinations to which you can send your event data. Choose your preferred destination platform from the list. This example configures **Google Analytics** as a destination.




![RudderStack selecting destination platform][21]

(Gavin Johnson, [CC BY-SA 4.0][7])

  3. Add a name to your destination, and click **Next**.



![RudderStack naming the destination][22]

(Gavin Johnson, [CC BY-SA 4.0][7])

  4. Next, choose the preferred source. If you're following along with this tutorial, choose the source you configured above.



![RudderStack choosing source][23]

(Gavin Johnson, [CC BY-SA 4.0][7])

  5. In this step, you must add the relevant **Connection Settings**. Enter the **Tracking ID** for this destination (Google Analytics). You can also configure other optional settings per your requirements. Once you've added the required settings, click **Next**.

![RudderStack connection settings][24]

(Gavin Johnson, [CC BY-SA 4.0][7])

**Note**: RudderStack also gives you the option of transforming the events before sending them to your destination. Read more about [user transformations][25] in RudderStack in the docs.

  6. That's it! The destination is now configured. You should now see it connected to your source.




![RudderStack connection configured][26]

(Gavin Johnson, [CC BY-SA 4.0][7])

### Step 4: Send test events to verify the event stream

This tutorial set up a JavaScript source to track events from your website. Once you have placed the JavaScript code snippet in your website's `<head>` section, RudderStack will automatically track and collect user events from the website in real time.

However, to quickly test if your event stream is set up correctly, you can send some test events. To do so, follow these steps:

**Note**: Before you get started, you will need to clone the [rudder-server][27] repo and have a RudderStack server installed in your environment. Follow [this tutorial][28] to set up a RudderStack server.

  1. Make sure you have set up a source and destination by following the steps in the previous sections and have your **Data Plane URL** and source **Write Key** available.

  2. Start the RudderStack server.

  3. The **rudder-server** repo includes a shell script that generates test events. Get the source **Write Key** from step 2, and run the following command:


```
`./scripts/generate-event <YOUR_WRITE_KEY> <YOUR_DATA_PLANE_URL>/v1/batch`
```




![RudderStack event testing code][29]

(Gavin Johnson, [CC BY-SA 4.0][7])

  4. To check if the test events are delivered, go to your Google Analytics dashboard, navigate to **Realtime** under Reports, and click **Events**.

**Note**: Make sure you check the events associated with the same Tracking ID you provided while instrumenting the destination.




You should now be able to see the test event received in Google Analytics and BigQuery.

![RudderStack event test][30]

(Gavin Johnson, [CC BY-SA 4.0][7])

If you come across any issues while setting up or configuring RudderStack open source, join our [Slack][31] and start a conversation in our #open-source channel. We will be happy to help.

If you want to try RudderStack but don't want to host your own, sign up for our free, hosted offering, [RudderStack Cloud Free][32]. Explore our open source repos on [GitHub][33], subscribe to [our blog][34], and follow us on our socials: [Twitter][35], [LinkedIn][36], [dev.to][37], [Medium][38], and [YouTube][39].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/event-streaming-rudderstack

作者：[Amey Varangaonkar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ameypv
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_analytics_cloud.png?itok=eE4uIoaB (Net catching 1s and 0s or data in the clouds)
[2]: https://opensource.com/article/21/3/rudderstack-customer-data-platform
[3]: https://rudderstack.com/
[4]: https://app.rudderstack.com/
[5]: https://docs.rudderstack.com/how-to-guides/rudderstack-config-generator
[6]: https://opensource.com/sites/default/files/uploads/rudderstack_dashboard.png (RudderStack dashboard)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/rudderstack_eventstreamsdash.png (RudderStack event streams dashboard)
[9]: https://opensource.com/sites/default/files/uploads/rudderstack_namesource.png (RudderStack Source Name)
[10]: https://opensource.com/sites/default/files/uploads/rudderstack_writekey.png (RudderStack Source Name)
[11]: https://docs.rudderstack.com/rudderstack-sdk-integration-guides/rudderstack-javascript-sdk
[12]: https://docs.rudderstack.com/data-warehouse-integrations
[13]: https://docs.rudderstack.com/data-warehouse-integrations/google-bigquery
[14]: https://opensource.com/sites/default/files/uploads/rudderstack_destinations.png (RudderStack destination options)
[15]: https://opensource.com/sites/default/files/uploads/rudderstack_namedestination.png (RudderStack naming the destination)
[16]: https://opensource.com/sites/default/files/uploads/rudderstack_adddestination.png (RudderStack selecting data source)
[17]: https://docs.rudderstack.com/data-warehouse-integrations/google-bigquery#setting-up-google-bigquery
[18]: https://opensource.com/sites/default/files/uploads/rudderstack_connectioncredentials.png (RudderStack connection credentials)
[19]: https://docs.rudderstack.com/data-warehouse-integrations/google-bigquery#setting-up-the-service-account-for-rudderstack
[20]: https://opensource.com/sites/default/files/uploads/rudderstack_addnewdestination.png (RudderStack adding the destination)
[21]: https://opensource.com/sites/default/files/uploads/rudderstack_googleanalyticsdestination.png (RudderStack selecting destination platform)
[22]: https://opensource.com/sites/default/files/uploads/rudderstack_namenewdestination.png (RudderStack naming the destination)
[23]: https://opensource.com/sites/default/files/uploads/rudderstack_choosepreferredsource.png (RudderStack choosing source)
[24]: https://opensource.com/sites/default/files/uploads/rudderstack_connectionsettings.png (RudderStack connection settings)
[25]: https://docs.rudderstack.com/adding-a-new-user-transformation-in-rudderstack
[26]: https://opensource.com/sites/default/files/uploads/rudderstack_destinationconfigured.png (RudderStack connection configured)
[27]: https://github.com/rudderlabs/rudder-server
[28]: https://docs.rudderstack.com/installing-and-setting-up-rudderstack/docker
[29]: https://opensource.com/sites/default/files/uploads/rudderstack_testevents.jpg (RudderStack event testing code)
[30]: https://opensource.com/sites/default/files/uploads/rudderstack_testeventoutput.png (RudderStack event test)
[31]: https://resources.rudderstack.com/join-rudderstack-slack
[32]: https://app.rudderlabs.com/signup?type=freetrial
[33]: https://github.com/rudderlabs
[34]: https://rudderstack.com/blog/
[35]: https://twitter.com/RudderStack
[36]: https://www.linkedin.com/company/rudderlabs/
[37]: https://dev.to/rudderstack
[38]: https://rudderstack.medium.com/
[39]: https://www.youtube.com/channel/UCgV-B77bV_-LOmKYHw8jvBw
