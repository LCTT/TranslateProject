[#]: subject: "Manage CentOS Stream with Foreman"
[#]: via: "https://opensource.com/article/21/9/centos-stream-foreman"
[#]: author: "Melanie Corr https://opensource.com/users/melanie-corr"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Manage CentOS Stream with Foreman
======
This example provides a glimpse into the many options you have to manage
and provision CentOS Stream content in Foreman.
![Puzzle pieces coming together to form a computer screen][1]

In December 2021, CentOS 8 will reach end of life and be replaced by CentOS Stream. One of the major changes between previous iterations of CentOS and CentOS Stream is the lack of minor versions. Centos Stream has adopted a continuous release cycle. From the beginning of this year, developers in the Foreman community started to see the benefits of earlier bug detection and patching that CentOS Stream offers as a result of the continuous releases. We no longer have to wait for the next release to take advantage of the latest changes and bugfixes. [A veteran Linux community enthusiast][2] noted that this move also brings RHEL developers closer than ever to the FOSS community.

However, if you are an administrator of hundreds or thousands of servers, you might want to exercise control over when new packages are added to particular servers. If you are looking for a free open source tool that helps you ensure stability of production servers, while at the same time allowing you to safely pull in the latest changes from Centos Stream for development and testing, this is where Foreman can help. With Foreman, you can manage your Centos Stream content at all stages of the lifecycle environment.

### What is Foreman?

Foreman is a complete lifecycle management tool for physical and virtual servers. With Foreman, system administrators have the power to easily automate repetitive tasks, quickly deploy applications, and proactively manage servers on-premise or in the cloud. Foreman provides enterprise-level solutions for provisioning management, configuration management, and monitoring. Thanks to its plugin architecture, Foreman can be extended in a myriad of ways. Using the Katello plugin, you can use Foreman as a complete content management tool to manage CentOS Stream, among many other content types.

With Foreman and Katello, you can define exactly which packages you want each environment to contain. For example, a Production environment might use packages that have been verified as stable, while a Developer environment might require the latest and greatest package versions available. You can also promote the content views across lifecycle environments. Let's take a look at how Foreman accomplishes this.

We reference the web UI in this article, but Foreman also has a robust CLI and API. The Katello plugin provides a workflow and web UI for the Pulp project, which you can read about more in [this article][3]. We also supply a simple workflow here, but Foreman and the Katello project offer many different configuration options to suit your specific needs.

This article assumes that Foreman and Katello are already installed. For more information about how to do that, see the [Katello installation manual][4].

### Create a Product

The first step is to create a product in Foreman. The product functions as an internal label to store the CentOS Stream repositories.

  1. In the Foreman web UI, navigate to **Content** &gt;**Products**, and click **Create Product**.
  2. In the **Name** field, enter a name for the product. Foreman automatically completes the **Label** field based on what you have entered for **Name, **and this can't be changed later.



### Add the CentOS Stream repositories to the Product

Now that you have a product, you can use the URLs for the AppStream and BaseOS repositories and add them to your new product.

  1. In the Foreman web UI, navigate to **Content** &gt; **Products**, select the product you want to use, and then click **New Repository**.
  2. In the **Name** field, enter a name for the repository; for example, **Centos8StreamBaseOS**. Foreman automatically completes the **Label** field based on what you have entered for **Name**.
  3. From the **Type** list, select the type of repository, and then select **Yum**.
  4. In the **URL** field, enter the URL of the CentOS Stream Baseos repository to use as a source: <http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/>
  5. Select the **Download Policy** list. The default is **On Demand** \- this means that Katello will only download metadata. If you want to download all the packages, change to **Immediate**, which downloads all the packages, which might run into 20-30 GB.
  6. Ensure that the **Mirror on Sync** check box is selected. This option ensures that content that is no longer part of the upstream repository is removed during synchronization.
  7. Click **Save**.



Repeat these steps to add the AppStream repositories with URLs, for example, <http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/>. Ensure that you use the closest official CentOS mirror instead.

To perform an immediate synchronization, in your product window, click **Sync Now**. The initial synchronization can take some time. You can watch the synchronization status from **Content &gt; Sync Status.**

After the synchronization completes, you can view the new CentOS Stream operating system in **Hosts &gt; Operating System**. Feel free to edit the name and description to suit your requirements.

If you plan to use configuration management software like Ansible or Puppet, Foreman automatically creates an operating system report. You can turn this option off in **Administe &gt; Settings &gt; Ignore facts for operating system**. It is a good idea to rename the operating system to match the name in the configuration management software. For example, for Puppet, this would be _CentOS 8_.

### Define your infrastructure's Lifecycle Environment

The application life cycle is a concept central to Foreman's content management functions. The application life cycle defines how a particular system and its software look at a specific stage. For example, an application life cycle might be simple; you might only have a _development_ stage and _production_ stage. Foreman provides methods to customize each application life cycle stage in a controlled manner to suit your specifications.

At this point, you must create your lifecycle environment paths:

  1. In the Foreman web UI, navigate to **Content** &gt;**Lifecycle Environments**.
  2. Click **New Environment Path** to start a new application life cycle.
  3. In the **Name** field, enter a name for your environment.
  4. In the **Description** field, enter a description for your environment.
  5. Click **Save**.
  6. Add as many environment paths as you need. For example, you can create _dev_, _test,_ _stage,_ and _production_ environments. To add these environments, click **Add New Environment**, complete the **Name** and **Description** fields, and select the prior environment from the **Prior Environment** list so that you chain them together in the sequence you expect to use.



### Create and publish a Content View

In Foreman, a Content View is a snapshot of your repositories at a particular point in time. Content Views provide the mechanism for isolating package versions in a state that you want to preserve. Content Views have a lot of configurable features that you can use for further refinement. For the purposes of this tutorial, let's keep things simple.

  1. In the Foreman web UI, navigate to **Content** &gt; **Content Views** and click **Create New View**.
  2. In the **Name** field, enter a name for the view. Foreman automatically completes the **Label** field from the name you enter.
  3. In the **Description** field, enter a description of the view.
  4. Click **Save** to create the Content View.
  5. In your new Content View, click **Yum Content &gt; Add Repositories** in the **Repository Selection** area, click **Add.** For both the BaseOS and Appstream repositories, select packages you want to include, then click **Add Repositories**.
  6. Click **Publish New Version** and in the **Description** field, enter information about the version to log changes.
  7. Click **Save**.



When you click **Publish New Version**, you create a snapshot of all the content that you have synchronized. This means that every server you subscribe to this Content View will have access only to the package versions in the Content View associated with this lifecycle environment.

Every new Content View and subsequent versions are published first to the Library environment, where you can then promote to additional environments.

### Promote content across lifecycle environments

If you have tested new packages and are satisfied that everything is stable, you can promote your Content View to another lifecycle environment.

  1. Navigate to **Content** &gt; **Content Views** and select the Content View that you want to promote.
  2. Click the **Versions** tab for the Content View.
  3. Select the version you want to promote, and in the **Actions** column, click **Promote**.
  4. Select the environment where you want to promote the Content View and click **Promote Version**.
  5. Click the **Promote** button again. This time select the lifecycle environment, for example, **Test**, and click **Promote Version**.
  6. Finally, click on the **Promote** button again. For example, select the **Production** environment and click **Promote Version**.



The servers that are assigned to that particular environment can now pull from an updated set of packages.

### Create an Activation Key

To register a CentOS Stream server to the content you have defined in a particular lifecycle, you must create an activation key. The activation key is a secure method of sharing credentials with a server. This uses a tool called **subscription-manager** to subscribe the CentOS Stream server to the content.

When you have created the activation key, add the CentOS Stream subscription to the activation key.

  1. In the Foreman web UI, navigate to **Content &gt; Activation keys** and click **Create Activation Key**.
  2. In the **Name** field, enter the name of the activation key.
  3. In the **Description** field, enter a description for the activation key.
  4. From the **Environment** list, select the environment to use.
  5. From the **Content View** list, select the Content View you created just now.
  6. Click **Save**.



### Create a CentOS Stream Host from Foreman managed content

Everything is now set up. With the content you have created contained in a content view, and promoted across lifecycles, you can now provision hosts with exactly the content you want to use and subscribe to the updates you want them to receive.

To create a host in Foreman, navigate to **Hosts &gt; Create Host**.

  1. In the **Name** field, enter a name for the host.
  2. Click the **Organization** and **Location** tabs to ensure that the provisioning context is automatically set to the current context.
  3. From the **Deploy On** list, select **Bare Metal**.
  4. Click the **Operating System** tab.
  5. From the **Architectures** list, select **x86_64**.
  6. From the **Operating System** list, select **CentOS_Stream 8.**
  7. Check the **Build Mode** box.
  8. For **Media Selection**, select **Synced Content** to use the CentOS Stream content you synced previously.
  9. From the **Synced** **Content** list, ensure that CentOS Stream is selected.
  10. From the **Partition Table** list, for this demo, select **Kickstart** default, but there are many available options.
  11. In the **Root Password** field, enter a root password for your new host.
  12. Click the **Interface** tab, and click **Edit,** and add a **Mac address.**
  13. Click the **Parameters** tab, and ensure that a parameter exists that provides an activation key. If not, add an activation key.
  14. Click **Submit** to save the host entry.



Now the new host is in build mode, which means when you turn it on, it will begin installing the operating system.

If you navigate to **Hosts &gt; Content Hosts,** you can see the full details of the subscriptions, lifecycle environment, and content view that your host is subscribed to.

This example is only a small glimpse into the many options you have to manage and provision CentOS Stream content in Foreman. If you want more detailed information about how you can manage CentOS Stream versions, control the content that your servers have access to, and control and protect the stability of your infrastructure, check out the [Foreman Content Management][5] documentation. With all CentOS Stream content under your control, you can create and register Centos Streams that consume only the content that you specify. For more detailed information on provisioning, see the [Foreman Provisioning][6] documentation. If you have any questions, feedback, or suggestions, you can find the Foreman community at <https://community.theforeman.org/>

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/centos-stream-foreman

作者：[Melanie Corr][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/melanie-corr
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/puzzle_computer_solve_fix_tool.png?itok=U0pH1uwj (Puzzle pieces coming together to form a computer screen)
[2]: https://twitter.com/Det_Conan_Kudo/status/1337366036023218177?s=20
[3]: https://opensource.com/article/20/8/manage-repositories-pulp
[4]: https://docs.theforeman.org/3.0/Installing_Server_on_Red_Hat/index-katello.html
[5]: https://docs.theforeman.org/master/Content_Management_Guide/index-foreman.html
[6]: https://docs.theforeman.org/master/Provisioning_Guide/index-foreman.html
