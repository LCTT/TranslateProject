translating----geekpi

5 DevOps Tools for Logging and Monitoring
============================================================


 ![DevOps tools](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devops-logging.jpg?itok=8-1glKie "DevOps tools") 
These DevOps logging and monitoring tools are part of the trend that's reshaping cloud computing -- learn more in the Guide to the Open Cloud.[Creative Commons Zero][1]Pixabay

In the cloud, open source tools and applications produce many kinds of DevOps efficiencies, and that’s especially true for logging and monitoring solutions. Monitoring cloud platforms, applications and components — along with processing and analyzing logs — is essential for ensuring high availability, top performance, low latency, and more. In fact, RightScale’s most recent[ State of the Cloud Survey][4] reports that the most common cloud optimization action, focused on by 45 percent of enterprises and SMBs, is monitoring.

However, proprietary logging and monitoring solutions are expensive. Even worse, they are often bundled into even more expensive managed service offerings.

Enter the new wave of powerful open logging and monitoring solutions. Some of these focus on targeted tasks, such as container cluster monitoring and performance analysis, while others qualify as holistic monitoring and alerting toolkits, capable of multi-dimensional data collection and querying.

The Linux Foundation recently[ announced][5] the release of its report[ Guide to the Open Cloud: Current Trends and Open Source Projects.][6] This third annual report provides a comprehensive look at the state of open cloud computing, and includes a section on logging and monitoring for the DevOps community. The report, which you can[ download][7] now, aggregates and analyzes research, illustrating how trends in containers, monitoring, and more are reshaping cloud computing. The report provides descriptions and links to categorized projects central to today’s open cloud environment. It takes special note of the fact that DevOps has emerged as the most effective method for application delivery and maintenance in the cloud.

In [a series of posts][8] appearing here, we are calling out many of these projects from the guide, by category, providing extra insights on how the overall category is evolving. Below, you’ll find a collection of several important DevOps tools for logging and monitoring and the impact that they are having, along with links to their GitHub repositories, all gathered from the Guide to the Open Cloud:

### Logging and monitoring

[Fluentd][9]

Fluentd is an open source data collector for unified logging layer, sponsored by Treasure Data. It structures data as JSON to unify all facets of processing log data: collecting, filtering, buffering, and outputting logs across multiple sources and destinations. [Fluentd on GitHub][10]

[Heapster][11]

Heapster is a container cluster monitoring and performance analysis tool in Kubernetes. It supports Kubernetes and CoreOS natively and can be adapted to run on OpenShift. It also supports a pluggable storage backend: InfluxDB with Grafana, Google Cloud Monitoring, Google Cloud Logging, Hawkular, Riemann and Kafka. [Heapster on GitHub][12]

[Logstash][13]

Logstash is Elastic’s open source data pipeline to help process logs and other event data from a variety of systems. Its plugins can connect to a variety of sources and stream data at scale to a central analytics system. [LogStash on GitHub][14]

[Prometheus][15]

Prometheus is an open source systems monitoring and alerting toolkit, originally built at SoundCloud and now a Cloud-Native Computing Foundation project at The Linux Foundation. It fits both machine-centric and microservices architectures and supports multi-dimensional data collection and querying. [Prometheus on GitHub][16]

[Weave Scope][17]

Weave Scope is Weaveworks’ open source tool to monitor distributed applications and their containers in real time. It integrates with Kubernetes and AWS ECS. [Weave Scope on GitHub][18]

_Learn more about trends in open source cloud computing and see the full list of the top open source cloud computing projects. [Download The Linux Foundation’s Guide to the Open Cloud report today!][3]_

--------------------------------------------------------------------------------

via: https://www.linux.com/news/open-cloud-report/2016/5-devops-tools-logging-and-monitoring

作者：[SAM DEAN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/sam-dean
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://www.linux.com/files/images/devops-loggingjpg
[3]:http://bit.ly/2eHQOwy
[4]:http://www.rightscale.com/blog/cloud-industry-insights/cloud-computing-trends-2016-state-cloud-survey
[5]:https://www.linux.com/blog/linux-foundation-issues-2016-guide-open-source-cloud-projects
[6]:http://go.linuxfoundation.org/l/6342/2016-10-31/3krbjr?utm_source=press-release&utm_medium=pr&utm_campaign=open-cloud-report-2016
[7]:http://go.linuxfoundation.org/l/6342/2016-10-31/3krbjr
[8]:https://www.linux.com/news/open-cloud-report/2016/guide-open-cloud-state-micro-oses
[9]:http://www.fluentd.org/
[10]:https://github.com/fluent
[11]:http://blog.kubernetes.io/2015/05/resource-usage-monitoring-kubernetes.html
[12]:https://github.com/kubernetes/heapster
[13]:https://www.elastic.co/products/logstash
[14]:https://github.com/elastic/logstash
[15]:https://prometheus.io/
[16]:https://github.com/prometheus
[17]:https://www.weave.works/products/weave-scope/
[18]:https://github.com/weaveworks/scope
