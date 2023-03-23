[#]: subject: "Get started with an open source customer data platform"
[#]: via: "https://opensource.com/article/21/3/rudderstack-customer-data-platform"
[#]: author: "Amey Varangaonkar https://opensource.com/users/ameypv"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Get started with an open source customer data platform
======
As an open source alternative to Segment, RudderStack collects and routes event stream (or clickstream) data and automatically builds your customer data lake on your data warehouse.

![Person standing in front of a giant computer screen with numbers, data][1]

Image by: Opensource.com

[RudderStack][2] is an open source, warehouse-first customer data pipeline. It collects and routes event stream (or clickstream) data and automatically builds your customer data lake on your data warehouse.

RudderStack is commonly known as the open source alternative to the customer data platform (CDP), [Segment][3]. It provides a more secure, flexible, and cost-effective solution in comparison. You get all the CDP functionality with added security and full ownership of your customer data.

Warehouse-first tools like RudderStack are architected to build functional data lakes in the user's data warehouse. The benefits are improved data control, increased flexibility in tool use, and (frequently) lower costs. Since it's open source, you can see how complicated processes—like building your identity graph—are done without relying on a vendor's black box.

### Getting the RudderStack workspace token

Before you get started, you will need the RudderStack workspace token from your RudderStack dashboard. To get it:

1. Go to the [RudderStack dashboard][4].
2. Log in using your credentials (or sign up for an account, if you don't already have one).

   ![RudderStack login screen][7]

3. Once you've logged in, you should see the workspace token on your RudderStack dashboard.

   ![RudderStack workspace token][8]

### Installing RudderStack

Setting up a RudderStack open source instance is straightforward. You have two installation options:

1. On your Kubernetes cluster, using RudderStack's Helm charts
2. On your Docker container, using the `docker-compose` command

This tutorial explains how to use both options but assumes that you already have [Git installed on your system][9].

#### Deploying with Kubernetes

You can deploy RudderStack on your Kubernetes cluster using the [Helm][10] package manager.

*If you plan to use RudderStack in production, we strongly recommend using this method.* This is because the Docker images are updated with bug fixes more frequently than the GitHub repository (which follows a monthly release cycle).

Before you can deploy RudderStack on Kubernetes, make sure you have the following prerequisites in place:

* [Install and connect kubectl][11] to your Kubernetes cluster.
* [Install Helm][12] on your system, either through the Helm installer scripts or its package manager.
* Finally, get the workspace token from the RudderStack dashboard by following the steps in the Getting the RudderStack workspace token section.

Once you've completed all the prerequisites, deploy RudderStack on your default Kubernetes cluster:

1. Find the Helm chart required to deploy RudderStack in this [repo][13].
2. Install the Helm chart with a release name of your choice (my-release, in this example) from the root directory of the repo in the previous step:
   ```
   $ helm install \
   my-release ./ --set \
   rudderWorkspaceToken="<your workspace token from RudderStack dashboard>"
   ```

This deploys RudderStack on your default Kubernetes cluster configured with kubectl using the workspace token you obtained from the RudderStack dashboard.

For more details on the configurable parameters in the RudderStack Helm chart or updating the versions of the images used, consult the [documentation][14].

#### Deploying with Docker

Docker is the easiest and fastest way to set up your open source RudderStack instance.

First, get the workspace token from the RudderStack dashboard by following the steps above.

Once you have the RudderStack workspace token:

1. Download the [rudder-docker.yml][15] docker-compose file required for the installation.
2. Replace `<your_workspace_token>` in this file with your RudderStack workspace token.
3. Set up RudderStack on your Docker container by running:
   ```
   docker-compose -f rudder-docker.yml up
   ```

Now RudderStack should be up and running on your Docker instance.

### Verifying the installation

You can verify your RudderStack installation by sending test events using the bundled shell script:

1. Clone the GitHub repository:
   ```
   git clone https://github.com/rudderlabs/rudder-server.git
   ```
2. In this tutorial, you will verify RudderStack by sending test events to Google Analytics. Make sure you have a Google Analytics account and keep the tracking ID handy. Also, note that the Google Analytics account needs to have a `Web` property.
3. In the [RudderStack hosted control plane][16]:
   * Add a source on the RudderStack dashboard by following the [Adding a source and destination in RudderStack][17] guide. You can use either of RudderStack's event stream software development kits (SDKs) for sending events from your app. This example sets up the [JavaScript SDK][18] as a source on the dashboard. Note: You aren't actually installing the RudderStack JavaScript SDK on your site in this step; you are just creating the source in RudderStack.
   * Configure a Google Analytics destination on the RudderStack dashboard using the instructions in the guide mentioned previously. Use the Google Analytics tracking ID you kept from step 2 of this section:

   ![Google Analytics tracking ID][27]

4. As mentioned before, RudderStack bundles a shell script that generates test events. Get the **Source write key** from the RudderStack dashboard:

   ![RudderStack source write key][28]

5. Next, run:
   ```
   ./scripts/generate-event <YOUR_WRITE_KEY> https://hosted.rudderlabs.com/v1/batch
   ```
6. Finally, log into your Google Analytics account and verify that the events were delivered. In your Google Analytics account, navigate to *RealTime** -> **Events**. The RealTime view is important because some dashboards can take one to two days to refresh.

### Optional: Setting up the open source control plane

RudderStack's core architecture contains two major components: the data plane and the control plane. The data plane, [rudder-server][29], delivers your event data, and the RudderStack hosted control plane manages the configuration of your sources and destinations.

However, if you want to manage the source and destination configurations locally, you can set an open source control plane in your environment using the RudderStack Config Generator. (You must have [Node.js][30] installed on your system to use it.)

Here are the steps to set up the control plane:

1. Install and set up RudderStack on the platform of your choice by following the instructions above.
2. Run the following commands in this order:
   ```
   cd utils/config-gen
   npm install
   npm start
   ```

You should now be able to access the open source control plane at `http://localhost:3000` by default. If your setup is successful, you will see the user interface.

![RudderStack open source control plane][31]

To export the existing workspace configuration from the RudderStack-hosted control plane and have RudderStack use it, consult the [docs][32].

### RudderStack and open source

The core of RudderStack is in the [rudder-server][33] repository. It is open source, licensed under [AGPL-3.0][34]. A majority of the destination integrations live in the [rudder-transformer][35] repository. They are open source as well, licensed under the [MIT License][36]. The SDKs and instrumentation repositories, several tool and utility repositories, and even some [dbt][37] model repositories for use-cases like customer journey analysis and sessionization for the data residing in your data warehouse are open source, licensed under the MIT License, and available in the [GitHub repository][38].

You can use RudderStack's open source offering, rudder-server, on your platform of choice. There are setup guides for [Docker][39], [Kubernetes][40], [native installation][41], and [developer machines][42].

RudderStack open source offers:

1. RudderStack event stream
2. 15+ SDKs and source integrations to ingest event data
3. 80+ destination and warehouse integrations
4. Slack community support

#### RudderStack Cloud

RudderStack also offers a managed option, [RudderStack Cloud][43]. It is fast, reliable, and highly scalable with a multi-node architecture and sophisticated error-handling mechanism. You can hit peak event volume without worrying about downtime, loss of events, or latency.

Image By: (RudderStack, CC BY-SA 4.0)

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/rudderstack-customer-data-platform

作者：[Amey Varangaonkar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ameypv
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/data_metrics_analytics_desktop_laptop.png
[2]: https://rudderstack.com/
[3]: https://segment.com/
[4]: https://app.rudderstack.com/
[7]: https://opensource.com/sites/default/files/uploads/rudderstack_login.png
[8]: https://opensource.com/sites/default/files/uploads/rudderstack_workspace-token.png
[9]: https://opensource.com/life/16/7/stumbling-git
[10]: https://helm.sh/
[11]: https://kubernetes.io/docs/tasks/tools/install-kubectl/
[12]: https://helm.sh/docs/intro/install/
[13]: https://github.com/rudderlabs/rudderstack-helm
[14]: https://docs.rudderstack.com/installing-and-setting-up-rudderstack/kubernetes
[15]: https://raw.githubusercontent.com/rudderlabs/rudder-server/master/rudder-docker.yml
[16]: https://app.rudderstack.com/
[17]: https://docs.rudderstack.com/get-started/adding-source-and-destination-rudderstack
[18]: https://docs.rudderstack.com/rudderstack-sdk-integration-guides/rudderstack-javascript-sdk
[20]: https://docs.rudderstack.com/get-started/adding-source-and-destination-rudderstack
[21]: https://docs.rudderstack.com/rudderstack-sdk-integration-guides/rudderstack-javascript-sdk
[24]: https://docs.rudderstack.com/get-started/adding-source-and-destination-rudderstack
[25]: https://docs.rudderstack.com/rudderstack-sdk-integration-guides/rudderstack-javascript-sdk
[27]: https://opensource.com/sites/default/files/uploads/googleanalyticstrackingid.png
[28]: https://opensource.com/sites/default/files/uploads/rudderstack_sourcewritekey.png
[29]: https://github.com/rudderlabs/rudder-server
[30]: https://nodejs.org/en/download/
[31]: https://opensource.com/sites/default/files/uploads/rudderstack_controlplane.png
[32]: https://docs.rudderstack.com/how-to-guides/rudderstack-config-generator
[33]: https://github.com/rudderlabs/rudder-server
[34]: https://www.gnu.org/licenses/agpl-3.0-standalone.html
[35]: https://github.com/rudderlabs/rudder-transformer
[36]: https://opensource.org/licenses/MIT
[37]: https://www.getdbt.com/
[38]: https://github.com/rudderlabs
[39]: https://docs.rudderstack.com/get-started/installing-and-setting-up-rudderstack/docker
[40]: https://docs.rudderstack.com/get-started/installing-and-setting-up-rudderstack/kubernetes
[41]: https://docs.rudderstack.com/get-started/installing-and-setting-up-rudderstack/native-installation
[42]: https://docs.rudderstack.com/get-started/installing-and-setting-up-rudderstack/developer-machine-setup
[43]: https://resources.rudderstack.com/rudderstack-cloud
