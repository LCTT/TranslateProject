translating wi-cuckoo
How to monitor NGINX with Datadog - Part 3
================================================================================
![](http://www.datadoghq.com/wp-content/uploads/2015/07/NGINX_hero_3.png)

If you’ve already read [our post on monitoring NGINX][1], you know how much information you can gain about your web environment from just a handful of metrics. And you’ve also seen just how easy it is to start collecting metrics from NGINX on ad hoc basis. But to implement comprehensive, ongoing NGINX monitoring, you will need a robust monitoring system to store and visualize your metrics, and to alert you when anomalies happen. In this post, we’ll show you how to set up NGINX monitoring in Datadog so that you can view your metrics on customizable dashboards like this:

![NGINX dashboard](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx_board_5.png)

Datadog allows you to build graphs and alerts around individual hosts, services, processes, metrics—or virtually any combination thereof. For instance, you can monitor all of your NGINX hosts, or all hosts in a certain availability zone, or you can monitor a single key metric being reported by all hosts with a certain tag. This post will show you how to:

- Monitor NGINX metrics on Datadog dashboards, alongside all your other systems
- Set up automated alerts to notify you when a key metric changes dramatically

### Configuring NGINX ###

To collect metrics from NGINX, you first need to ensure that NGINX has an enabled status module and a URL for reporting its status metrics. Step-by-step instructions [for configuring open-source NGINX][2] and [NGINX Plus][3] are available in our companion post on metric collection.

### Integrating Datadog and NGINX ###

#### Install the Datadog Agent ####

The Datadog Agent is [the open-source software][4] that collects and reports metrics from your hosts so that you can view and monitor them in Datadog. Installing the agent usually takes [just a single command][5].

As soon as your Agent is up and running, you should see your host reporting metrics [in your Datadog account][6].

![Datadog infrastructure list](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/infra_2.png)

#### Configure the Agent ####

Next you’ll need to create a simple NGINX configuration file for the Agent. The location of the Agent’s configuration directory for your OS can be found [here][7].

Inside that directory, at conf.d/nginx.yaml.example, you will find [a sample NGINX config file][8] that you can edit to provide the status URL and optional tags for each of your NGINX instances:

    init_config:
     
    instances:
     
        -   nginx_status_url: http://localhost/nginx_status/
            tags:
                -   instance:foo

Once you have supplied the status URLs and any tags, save the config file as conf.d/nginx.yaml.

#### Restart the Agent ####

You must restart the Agent to load your new configuration file. The restart command varies somewhat by platform—see the specific commands for your platform [here][9].

#### Verify the configuration settings ####

To check that Datadog and NGINX are properly integrated, run the Datadog info command. The command for each platform is available [here][10].

If the configuration is correct, you will see a section like this in the output:

    Checks
    ======
     
      [...]
     
      nginx
      -----
          - instance #0 [OK]
          - Collected 8 metrics & 0 events 

#### Install the integration ####

Finally, switch on the NGINX integration inside your Datadog account. It’s as simple as clicking the “Install Integration” button under the Configuration tab in the [NGINX integration settings][11].

![Install integration](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/install.png)

### Metrics! ###

Once the Agent begins reporting NGINX metrics, you will see [an NGINX dashboard][12] among your list of available dashboards in Datadog.

The basic NGINX dashboard displays a handful of graphs encapsulating most of the key metrics highlighted [in our introduction to NGINX monitoring][13]. (Some metrics, notably request processing time, require log analysis and are not available in Datadog.)

You can easily create a comprehensive dashboard for monitoring your entire web stack by adding additional graphs with important metrics from outside NGINX. For example, you might want to monitor host-level metrics on your NGINX hosts, such as system load. To start building a custom dashboard, simply clone the default NGINX dashboard by clicking on the gear near the upper right of the dashboard and selecting “Clone Dash”.

![Clone dash](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/clone_2.png)

You can also monitor your NGINX instances at a higher level using Datadog’s [Host Maps][14]—for instance, color-coding all your NGINX hosts by CPU usage to identify potential hotspots.

![](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx-host-map-3.png)

### Alerting on NGINX metrics ###

Once Datadog is capturing and visualizing your metrics, you will likely want to set up some monitors to automatically keep tabs on your metrics—and to alert you when there are problems. Below we’ll walk through a representative example: a metric monitor that alerts on sudden drops in NGINX throughput.

#### Monitor your NGINX throughput ####

Datadog metric alerts can be threshold-based (alert when the metric exceeds a set value) or change-based (alert when the metric changes by a certain amount). In this case we’ll take the latter approach, alerting when our incoming requests per second drop precipitously. Such drops are often indicative of problems.

1.**Create a new metric monitor**. Select “New Monitor” from the “Monitors” dropdown in Datadog. Select “Metric” as the monitor type.

![NGINX metric monitor](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_1.png)

2.**Define your metric monitor**. We want to know when our total NGINX requests per second drop by a certain amount. So we define the metric of interest to be the sum of nginx.net.request_per_s across our infrastructure.

![NGINX metric](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_2.png)

3.**Set metric alert conditions**. Since we want to alert on a change, rather than on a fixed threshold, we select “Change Alert.” We’ll set the monitor to alert us whenever the request volume drops by 30 percent or more. Here we use a one-minute window of data to represent the metric’s value “now” and alert on the average change across that interval, as compared to the metric’s value 10 minutes prior.

![NGINX metric change alert](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_3.png)

4.**Customize the notification**. If our NGINX request volume drops, we want to notify our team. In this case we will post a notification in the ops team’s chat room and page the engineer on call. In “Say what’s happening”, we name the monitor and add a short message that will accompany the notification to suggest a first step for investigation. We @mention the Slack channel that we use for ops and use @pagerduty to [route the alert to PagerDuty][15]

![NGINX metric notification](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/monitor2_step_4v3.png)

5.**Save the integration monitor**. Click the “Save” button at the bottom of the page. You’re now monitoring a key NGINX [work metric][16], and your on-call engineer will be paged anytime it drops rapidly.

### Conclusion ###

In this post we’ve walked you through integrating NGINX with Datadog to visualize your key metrics and notify your team when your web infrastructure shows signs of trouble.

If you’ve followed along using your own Datadog account, you should now have greatly improved visibility into what’s happening in your web environment, as well as the ability to create automated monitors tailored to your environment, your usage patterns, and the metrics that are most valuable to your organization.

If you don’t yet have a Datadog account, you can sign up for [a free trial][17] and start monitoring your infrastructure, your applications, and your services today.

----------

Source Markdown for this post is available [on GitHub][18]. Questions, corrections, additions, etc.? Please [let us know][19].

------------------------------------------------------------

via: https://www.datadoghq.com/blog/how-to-monitor-nginx-with-datadog/

作者：K Young
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://www.datadoghq.com/blog/how-to-monitor-nginx/
[2]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/#open-source
[3]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/#plus
[4]:https://github.com/DataDog/dd-agent
[5]:https://app.datadoghq.com/account/settings#agent
[6]:https://app.datadoghq.com/infrastructure
[7]:http://docs.datadoghq.com/guides/basic_agent_usage/
[8]:https://github.com/DataDog/dd-agent/blob/master/conf.d/nginx.yaml.example
[9]:http://docs.datadoghq.com/guides/basic_agent_usage/
[10]:http://docs.datadoghq.com/guides/basic_agent_usage/
[11]:https://app.datadoghq.com/account/settings#integrations/nginx
[12]:https://app.datadoghq.com/dash/integration/nginx
[13]:https://www.datadoghq.com/blog/how-to-monitor-nginx/
[14]:https://www.datadoghq.com/blog/introducing-host-maps-know-thy-infrastructure/
[15]:https://www.datadoghq.com/blog/pagerduty/
[16]:https://www.datadoghq.com/blog/monitoring-101-collecting-data/#metrics
[17]:https://www.datadoghq.com/blog/how-to-monitor-nginx-with-datadog/#sign-up
[18]:https://github.com/DataDog/the-monitor/blob/master/nginx/how_to_monitor_nginx_with_datadog.md
[19]:https://github.com/DataDog/the-monitor/issues