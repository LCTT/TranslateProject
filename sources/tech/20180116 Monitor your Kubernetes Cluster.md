Monitor your Kubernetes Cluster
======
This article originally appeared on [Kevin Monroe's blog][1]

Keeping an eye on logs and metrics is a necessary evil for cluster admins. The benefits are clear: metrics help you set reasonable performance goals, while log analysis can uncover issues that impact your workloads. The hard part, however, is getting a slew of applications to work together in a useful monitoring solution.

In this post, I'll cover monitoring a Kubernetes cluster with [Graylog][2] (for logging) and [Prometheus][3] (for metrics). Of course that's not just wiring 3 things together. In fact, it'll end up looking like this:

![][4]

As you know, Kubernetes isn't just one thing -- it's a system of masters, workers, networking bits, etc(d). Similarly, Graylog comes with a supporting cast (apache2, mongodb, etc), as does Prometheus (telegraf, grafana, etc). Connecting the dots in a deployment like this may seem daunting, but the right tools can make all the difference.

I'll walk through this using [conjure-up][5] and the [Canonical Distribution of Kubernetes][6] (CDK). I find the conjure-up interface really helpful for deploying big software, but I know some of you hate GUIs and TUIs and probably other UIs too. For those folks, I'll do the same deployment again from the command line.

Before we jump in, note that Graylog and Prometheus will be deployed alongside Kubernetes and not in the cluster itself. Things like the Kubernetes Dashboard and Heapster are excellent sources of information from within a running cluster, but my objective is to provide a mechanism for log/metric analysis whether the cluster is running or not.

### The Walk Through

First things first, install conjure-up if you don't already have it. On Linux, that's simply:
```
sudo snap install conjure-up --classic
```

There's also a brew package for macOS users:
```
brew install conjure-up
```

You'll need at least version 2.5.2 to take advantage of the recent CDK spell additions, so be sure to `sudo snap refresh conjure-up` or `brew update && brew upgrade conjure-up` if you have an older version installed.

Once installed, run it:
```
conjure-up
```

![][7]

You'll be presented with a list of various spells. Select CDK and press `Enter`.

![][8]

At this point, you'll see additional components that are available for the CDK spell. We're interested in Graylog and Prometheus, so check both of those and hit `Continue`.

You'll be guided through various cloud choices to determine where you want your cluster to live. After that, you'll see options for post-deployment steps, followed by a review screen that lets you see what is about to be deployed:

![][9]

In addition to the typical K8s-related applications (etcd, flannel, load-balancer, master, and workers), you'll see additional applications related to our logging and metric selections.

The Graylog stack includes the following:

  * apache2: reverse proxy for the graylog web interface
  * elasticsearch: document database for the logs
  * filebeat: forwards logs from K8s master/workers to graylog
  * graylog: provides an api for log collection and an interface for analysis
  * mongodb: database for graylog metadata



The Prometheus stack includes the following:

  * grafana: web interface for metric-related dashboards
  * prometheus: metric collector and time series database
  * telegraf: sends host metrics to prometheus



You can fine tune the deployment from this review screen, but the defaults will suite our needs. Click `Deploy all Remaining Applications` to get things going.

The deployment will take a few minutes to settle as machines are brought online and applications are configured in your cloud. Once complete, conjure-up will show a summary screen that includes links to various interesting endpoints for you to browse:

![][10]

#### Exploring Logs

Now that Graylog has been deployed and configured, let's take a look at some of the data we're gathering. By default, the filebeat application will send both syslog and container log events to graylog (that's `/var/log/*.log` and `/var/log/containers/*.log` from the kubernetes master and workers).

Grab the apache2 address and graylog admin password as follows:
```
juju status --format yaml apache2/0 | grep public-address
 public-address: <your-apache2-ip>
juju run-action --wait graylog/0 show-admin-password
 admin-password: <your-graylog-password>
```

Browse to `http://<your-apache2-ip>` and login with admin as the username and <your-graylog-password> as the password. **Note:** if the interface is not immediately available, please wait as the reverse proxy configuration may take up to 5 minutes to complete.

Once logged in, head to the `Sources` tab to get an overview of the logs collected from our K8s master and workers:

![][11]

Drill into those logs by clicking the `System / Inputs` tab and selecting `Show received messages` for the filebeat input:

![][12]

From here, you may want to play around with various filters or setup Graylog dashboards to help identify the events that are most important to you. Check out the [Graylog Dashboard][13] docs for details on customizing your view.

#### Exploring Metrics

Our deployment exposes two types of metrics through our grafana dashboards: system metrics include things like cpu/memory/disk utilization for the K8s master and worker machines, and cluster metrics include container-level data scraped from the K8s cAdvisor endpoints.

Grab the grafana address and admin password as follows:
```
juju status --format yaml grafana/0 | grep public-address
 public-address: <your-grafana-ip>
juju run-action --wait grafana/0 get-admin-password
 password: <your-grafana-password>
```

Browse to `http://<your-grafana-ip>:3000` and login with admin as the username and <your-grafana-password> as the password. Once logged in, check out the cluster metric dashboard by clicking the `Home` drop-down box and selecting `Kubernetes Metrics (via Prometheus)`:

![][14]

We can also check out the system metrics of our K8s host machines by switching the drop-down box to `Node Metrics (via Telegraf) `

![][15]


### The Other Way

As alluded to in the intro, I prefer the wizard-y feel of conjure-up to guide me through complex software deployments like Kubernetes. Now that we've seen the conjure-up way, some of you may want to see a command line approach to achieve the same results. Still others may have deployed CDK previously and want to extend it with the Graylog/Prometheus components described above. Regardless of why you've read this far, I've got you covered.

The tool that underpins conjure-up is [Juju][16]. Everything that the CDK spell did behind the scenes can be done on the command line with Juju. Let's step through how that works.

**Starting From Scratch**

If you're on Linux, install Juju like this:
```
sudo snap install juju --classic
```

For macOS, Juju is available from brew:
```
brew install juju
```

Now setup a controller for your preferred cloud. You may be prompted for any required cloud credentials:
```
juju bootstrap
```

We then need to deploy the base CDK bundle:
```
juju deploy canonical-kubernetes
```

**Starting From CDK**

With our Kubernetes cluster deployed, we need to add all the applications required for Graylog and Prometheus:
```
## deploy graylog-related applications
juju deploy xenial/apache2
juju deploy xenial/elasticsearch
juju deploy xenial/filebeat
juju deploy xenial/graylog
juju deploy xenial/mongodb
```
```
## deploy prometheus-related applications
juju deploy xenial/grafana
juju deploy xenial/prometheus
juju deploy xenial/telegraf
```

Now that the software is deployed, connect them together so they can communicate:
```
## relate graylog applications
juju relate apache2:reverseproxy graylog:website
juju relate graylog:elasticsearch elasticsearch:client
juju relate graylog:mongodb mongodb:database
juju relate filebeat:beats-host kubernetes-master:juju-info
juju relate filebeat:beats-host kubernetes-worker:jujuu-info
```
```
## relate prometheus applications
juju relate prometheus:grafana-source grafana:grafana-source
juju relate telegraf:prometheus-client prometheus:target
juju relate kubernetes-master:juju-info telegraf:juju-info
juju relate kubernetes-worker:juju-info telegraf:juju-info
```

At this point, all the applications can communicate with each other, but we have a bit more configuration to do (e.g., setting up the apache2 reverse proxy, telling prometheus how to scrape k8s, importing our grafana dashboards, etc):
```
## configure graylog applications
juju config apache2 enable_modules="headers proxy_html proxy_http"
juju config apache2 vhost_http_template="$(base64 <vhost-tmpl>)"
juju config elasticsearch firewall_enabled="false"
juju config filebeat \
 logpath="/var/log/*.log /var/log/containers/*.log"
juju config filebeat logstash_hosts="<graylog-ip>:5044"
juju config graylog elasticsearch_cluster_name="<es-cluster>"
```
```
## configure prometheus applications
juju config prometheus scrape-jobs="<scraper-yaml>"
juju run-action --wait grafana/0 import-dashboard \
 dashboard="$(base64 <dashboard-json>)"
```

Some of the above steps need values specific to your deployment. You can get these in the same way that conjure-up does:

  * <vhost-tmpl>: fetch our sample [template][17] from github
  * <graylog-ip>: `juju run --unit graylog/0 'unit-get private-address'`
  * <es-cluster>: `juju config elasticsearch cluster-name`
  * <scraper-yaml>: fetch our sample [scraper][18] from github; [substitute][19]appropriate values for `[K8S_PASSWORD][20]` and `[K8S_API_ENDPOINT][21]`
  * <dashboard-json>: fetch our [host][22] and [k8s][23] dashboards from github



Finally, you'll want to expose the apache2 and grafana applications to make their web interfaces accessible:
```
## expose relevant endpoints
juju expose apache2
juju expose grafana
```

Now that we have everything deployed, related, configured, and exposed, you can login and poke around using the same steps from the **Exploring Logs** and **Exploring Metrics** sections above.

### The Wrap Up

My goal here was to show you how to deploy a Kubernetes cluster with rich monitoring capabilities for logs and metrics. Whether you prefer a guided approach or command line steps, I hope it's clear that monitoring complex deployments doesn't have to be a pipe dream. The trick is to figure out how all the moving parts work, make them work together repeatably, and then break/fix/repeat for a while until everyone can use it.

This is where tools like conjure-up and Juju really shine. Leveraging the expertise of contributors to this ecosystem makes it easy to manage big software. Start with a solid set of apps, customize as needed, and get back to work!

Give these bits a try and let me know how it goes. You can find enthusiasts like me on Freenode IRC in **#conjure-up** and **#juju**. Thanks for reading!

### About the author

Kevin joined Canonical in 2014 with his focus set on modeling complex software. He found his niche on the Juju Big Software team where his mission is to capture operational knowledge of Big Data and Machine Learning applications into repeatable (and reliable!) solutions.

--------------------------------------------------------------------------------

via: https://insights.ubuntu.com/2018/01/16/monitor-your-kubernetes-cluster/

作者：[Kevin Monroe][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://insights.ubuntu.com/author/kwmonroe/
[1]:https://medium.com/@kwmonroe/monitor-your-kubernetes-cluster-a856d2603ec3
[2]:https://www.graylog.org/
[3]:https://prometheus.io/
[4]:https://insights.ubuntu.com/wp-content/uploads/706b/1_TAA57DGVDpe9KHIzOirrBA.png
[5]:https://conjure-up.io/
[6]:https://jujucharms.com/canonical-kubernetes
[7]:https://insights.ubuntu.com/wp-content/uploads/98fd/1_o0UmYzYkFiHIs2sBgj7G9A.png
[8]:https://insights.ubuntu.com/wp-content/uploads/0351/1_pgVaO_ZlalrjvYd5pOMJMA.png
[9]:https://insights.ubuntu.com/wp-content/uploads/9977/1_WXKxMlml2DWA5Kj6wW9oXQ.png
[10]:https://insights.ubuntu.com/wp-content/uploads/8588/1_NWq7u6g6UAzyFxtbM-ipqg.png
[11]:https://insights.ubuntu.com/wp-content/uploads/a1c3/1_hHK5mSrRJQi6A6u0yPSGOA.png
[12]:https://insights.ubuntu.com/wp-content/uploads/937f/1_cP36lpmSwlsPXJyDUpFluQ.png
[13]:http://docs.graylog.org/en/2.3/pages/dashboards.html
[14]:https://insights.ubuntu.com/wp-content/uploads/9256/1_kskust3AOImIh18QxQPgRw.png
[15]:https://insights.ubuntu.com/wp-content/uploads/2037/1_qJpjPOTGMQbjFY5-cZsYrQ.png
[16]:https://jujucharms.com/
[17]:https://raw.githubusercontent.com/conjure-up/spells/master/canonical-kubernetes/addons/graylog/steps/01_install-graylog/graylog-vhost.tmpl
[18]:https://raw.githubusercontent.com/conjure-up/spells/master/canonical-kubernetes/addons/prometheus/steps/01_install-prometheus/prometheus-scrape-k8s.yaml
[19]:https://github.com/conjure-up/spells/blob/master/canonical-kubernetes/addons/prometheus/steps/01_install-prometheus/after-deploy#L25
[20]:https://github.com/conjure-up/spells/blob/master/canonical-kubernetes/addons/prometheus/steps/01_install-prometheus/after-deploy#L10
[21]:https://github.com/conjure-up/spells/blob/master/canonical-kubernetes/addons/prometheus/steps/01_install-prometheus/after-deploy#L11
[22]:https://raw.githubusercontent.com/conjure-up/spells/master/canonical-kubernetes/addons/prometheus/steps/01_install-prometheus/grafana-telegraf.json
[23]:https://raw.githubusercontent.com/conjure-up/spells/master/canonical-kubernetes/addons/prometheus/steps/01_install-prometheus/grafana-k8s.json
