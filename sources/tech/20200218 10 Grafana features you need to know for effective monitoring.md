[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 Grafana features you need to know for effective monitoring)
[#]: via: (https://opensource.com/article/20/2/grafana-features)
[#]: author: (Daniel Lee https://opensource.com/users/daniellee)

10 Grafana features you need to know for effective monitoring
======
Learn how to make the most of this open source dashboard tool.
![metrics and data shown on a computer screen][1]

The [Grafana][2] project [started in 2013][3] when [Torkel Ödegaard][4] decided to fork Kibana and turn it into a time-series and graph-focused dashboarding tool. His guiding vision: to make everything look more clean and elegant, with fewer things distracting you from the data.

More than 500,000 active installations later, Grafana dashboards are ubiquitous and instantly recognizable. (Even during a [SpaceX launch][5]!)

Whether you're a recent adopter or an experienced power user, you may not be familiar with all of the features that [Grafana Labs][6]—the company formed to accelerate the adoption of the Grafana project and to build a sustainable business around it—and the Grafana community at large have developed over the past 6+ years.

Here's a look at some of the most impactful:

  1. **Dashboard templating**: One of the key features in Grafana, templating allows you to create dashboards that can be reused for lots of different use cases. Values aren't hard-coded with these templates, so for instance, if you have a production server and a test server, you can use the same dashboard for both. Templating allows you to drill down into your data, say, from all data to North America data, down to Texas data, and beyond. You can also share these dashboards across teams within your organization—or if you create a great dashboard template for a popular data source, you can contribute it to the whole community to customize and use.
  2. **Provisioning**: While it's easy to click, drag, and drop to create a single dashboard, power users in need of many dashboards will want to automate the setup with a script. You can script anything in Grafana. For example, if you're spinning up a new Kubernetes cluster, you can also spin up a Grafana automatically with a script that would have the right server, IP address, and data sources preset and locked. It's also a way of getting control over a lot of dashboards.
  3. **Annotations:** This feature, which shows up as a graph marker in Grafana, is useful for correlating data in case something goes wrong. You can create the annotations manually—just control-click on a graph and input some text—or you can fetch data from any data source. (Check out how Wikimedia uses annotations on its [public Grafana dashboard][7], and here is [another example][8] from the OpenHAB community.) A good example is if you automatically create annotations around releases, and a few hours after a new release, you start seeing a lot of errors, then you can go back to your annotation and correlate whether the errors started at the same time as the release. This automation can be achieved using the Grafana HTTP API (see examples [here][9] and [here][10]). Many of Grafana's largest customers use the HTTP API for a variety of tasks, particularly setting up databases and adding users. It's an alternative to provisioning for automation, and you can do more with it. For instance, the team at DigitalOcean used the API to integrate a [snapshot feature for reviewing dashboards][11].
  4. **Kiosk mode and playlists:** If you want to display your Grafana dashboards on a TV monitor, you can use the playlist feature to pick the dashboards that you or your team need to look at through the course of the day and have them cycle through on the screen. The [kiosk mode][12] hides all the user interface elements that you don't need in view-only mode. Helpful hint: The [Grafana Kiosk][13] utility handles logging in, switching to kiosk mode, and opening a playlist—eliminating the pain of logging in on a TV that has no keyboard.
  5. **Custom plugins:** Plugins allow you to extend Grafana with integrations with other tools, different visualizations, and more. Some of the most popular in the community are [Worldmap Panel][14] (for visualizing data on top of a map), [Zabbix][15] (an integration with Zabbix metrics), and [Influx Admin Panel][16] (which offers other functionality like creating databases or adding users). But they're only the tip of the iceberg. Just by writing a bit of code, you can get anything that produces a timestamp and a value visualized in Grafana. Plus, Grafana Enterprise customers have access to more plugins for integrations with Splunk, Datadog, New Relic, and others.
  6. **Alerting and alert hooks:** If you're using Grafana alerting, you can have alerts sent through a number of different notifiers, including PagerDuty, SMS, email, or Slack. Alert hooks allow you to create different notifiers with a bit of code if you prefer some other channels of communication.
  7. **Permissions and teams**: When organizations have one Grafana and multiple teams, they often want the ability to both keep things separate and share dashboards. Early on, the default in Grafana was that everybody could see everyone else's dashboards, and that was it. Later, Grafana introduced multi-tenant mode, in which you can switch organizations but can't share dashboards. Some people were using huge hacks to enable both, so Grafana decided to officially create an easier way to do this. Now you can create a team of users and then set permissions on folders, dashboards, and down to the data source level if you're using Grafana Enterprise.
  8. **SQL data sources:** Grafana's native support for SQL helps you turn anything—not just metrics—in an SQL database into metric data that you can graph. Power users are using SQL data sources to do a whole bunch of interesting things, like creating business dashboards that "make sense for your boss's boss," as the team at Percona put it. Check out their [presentation at GrafanaCon][17].
  9. **Monitoring your monitoring**: If you're serious about monitoring and you want to monitor your own monitoring, Grafana has its own Prometheus HTTP endpoint that Prometheus can scrape. It's quite simple to get dashboards and statics. There's also an enterprise version in development that will offer Google Analytics-style easy access to data, such as how much CPU your Grafana is using or how long alerting is taking.
  10. **Authentication**: Grafana supports different authentication styles, such as LDAP and OAuth, and allows you to map users to organizations. In Grafana Enterprise, you can also map users to teams: If your company has its own authentication system, Grafana allows you to map the teams in your internal systems to teams in Grafana. That way, you can automatically give people access to the dashboards designated for their teams.



Want to take a deeper dive? Join the [Grafana community][18], check out the [how-to section][19], and share what you think.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/grafana-features

作者：[Daniel Lee][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniellee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://github.com/grafana/grafana
[3]: https://grafana.com/blog/2019/09/03/the-mostly-complete-history-of-grafana-ux/
[4]: https://grafana.com/author/torkel
[5]: https://youtu.be/ANv5UfZsvZQ?t=29
[6]: https://grafana.com/
[7]: https://grafana.wikimedia.org/d/000000143/navigation-timing?orgId=1&refresh=5m
[8]: https://community.openhab.org/t/howto-create-annotations-in-grafana-via-rules/48929
[9]: https://docs.microsoft.com/en-us/azure/devops/service-hooks/services/grafana?view=azure-devops
[10]: https://medium.com/contentsquare-engineering-blog/from-events-to-grafana-annotation-f35aafe8bd3d
[11]: https://youtu.be/kV3Ua6guynI
[12]: https://play.grafana.org/d/vmie2cmWz/bar-gauge?orgId=1&refresh=10s&kiosk
[13]: https://github.com/grafana/grafana-kiosk
[14]: https://grafana.com/grafana/plugins/grafana-worldmap-panel
[15]: https://grafana.com/grafana/plugins/alexanderzobnin-zabbix-app
[16]: https://grafana.com/grafana/plugins/natel-influx-admin-panel
[17]: https://www.youtube.com/watch?v=-xlchgoqkqY
[18]: https://community.grafana.com/
[19]: https://community.grafana.com/c/howto/6
