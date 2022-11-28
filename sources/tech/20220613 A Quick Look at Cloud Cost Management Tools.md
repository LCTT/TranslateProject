[#]: subject: "A Quick Look at Cloud Cost Management Tools"
[#]: via: "https://www.opensourceforu.com/2022/06/a-quick-look-at-cloud-cost-management-tools/"
[#]: author: "Dr Anand Nayyar https://www.opensourceforu.com/author/anand-nayyar/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A Quick Look at Cloud Cost Management Tools
======
Whether you are using a single cloud computing service provider or operating in a multi-cloud or hybrid cloud computing environment, you may be paying for resources that your organisation does not use at all. That is why cloud cost management is so important.

![Cloud cost management tools][1]

If you are a developer or software engineer, you will be using a range of cloud resources. Managing cloud costs, and knowing exactly where and why the expenditure on the cloud is happening is a huge challenge. If cloud-native technologies like microservices, containers and Kubernetes are being used, cloud utilisation may not be fully visible and the organisation may end up paying for far more services than have been used.

![Figure 1: Cost per customer report][2]

### What is cloud cost management?

Cloud cost management is defined as the efficient monitoring, measuring and control of cloud costs. Traditionally, cloud cost management focused on cutting down cloud cost wastages in terms of under-utilised and forgotten resources but, nowadays, it focuses on architectural optimisation.

The advantages of cloud cost management are:

* High accuracy in the planning, budgeting and forecasting of cloud services
* Re-architecting resources for more profit
* Reducing operational costs and decommissioning wasteful services
* Effective load balancing management and better usage of computing resources

Cloud native cost management services

AWS Cloud Economics Center
Though the key driver for any enterprise to migrate to a cloud platform is better total cost of ownership (TCO), the benefits don’t stop there today. Cloud economics or FinOps is the term used for creating a framework that can help to derive the expenditure in cloud adoption.

![Figure 2: Amazon cost management solutions][3]

When a business is growing, good planning, budget control and predicting the pattern of cloud asset usage are important. Cloud economics addresses this space. There are many third party tools like CloudHealth, Densify or Apptio Cloudability available as cost management tools, which come with financial management, advisory and advanced analytics. Most of these tools work on any cloud platform — Azure, AWS or GCP.

At the same time, there are native tools available as well for cost management like the AWS Economics Center or Cost Management console.

AWS Economics is based on a cloud value framework and has the following benefits.

* Cost savings: Offers usage details on the cloud assets and TCO calculation to compare with existing and forecasted spends.
* Staff productivity: Improved automation tasks like DevOps pipeline, automated code review, and automated cost optimisation alerts reduce manual efforts.
* Operational resilience: A well-architected framework is used to ensure high availability, security and compliance, leading to highly resilient cloud platform usage.
* Business agility: Reduces errors in cloud deployment by using best practices and AWS partner solutions.

![Figure 3: AWS cost management dashboard][4]

### Azure cloud cost management

A well-architected framework has five pillars of cloud architecture development — cost optimisation, performance efficiency, operational excellence, reliability and security. Of these, cost optimisation will give immediate to long-term benefits, and requires a cost adoption framework and operating model to build an efficient cost pillar.

Cloud cost management includes cost transparency and cost governance as per the FinOps framework guidance. This can be implemented by using the Crawl-Walk-Run principle, where we start with cost transparency and the operating model (crawl), move towards cost optimisation and automation (walk) and, finally, implement cost management solutions and governance policies for efficient cost optimisation (run).

The Azure platform calls this the Build-Measure-Learn principle (similar to the Crawl-Walk-Run principle). It suggests reviewing the cost principles, including right-sizing of resources and resource tagging, and then developing a cost model to decide the billing models for resources. These will capture cost requirements, policies for infrastructure provisioning and associated budget allocation. Cost alerts and budget thresholds should also be set.

Resources should be tagged so that priorities can be set in cost allocation for production and non-production environments, to create a workflow process in budget management.

![Figure 4: AWS Trusted Advisor][5]

### Google cost visibility services

The Google Cloud Platform or GCP cost management suite is built on three tools.

* Cost visibility: Provides the cost per resource.

* Resource usage optimisation: The cost advisory facility helps you to tune the cost per resource by giving the history of and the prediction for cloud service usage.

* Pricing efficiency: Advisory guidelines are given to optimise the cloud services, like use of cost-efficient compute or storage resources based on usage patterns.

![Figure 5: Azure guidance principles for cost optimisation (Image source: Azure documentation)][6]

Cost management tools provide dashboard visualisation of resource usage. Alerts are given with respect to over usage or under usage of services, and a usage summary can be scheduled (weekly, monthly or quarterly). Billing exports to CSV or JSON files can be used for historical analysis.

Google Cloud Platform (GCP) also has many native cloud services for cloud billing; it has reporting, forecasting and optimisation features for compute and storage services, some of which are listed below.

* Cost management provides visualisation reports on service utilisation, filtered by labels. Data Studio can be used to build custom dashboards.
* Billing APIs and data collection APIs (StackDriver, Resource Manager API) offer integration with native and third party cost management tools.
* Google Recommender can be used for optimising cost and usage, based on patterns of resource usage. Resource hierarchy can be used for fine grained resource management for cost allocation.
* Quota limits can be used to proactively control the spend rate on resources including apps and infrastructure.
* Budgets and alerts can throttle cap costs to control spends. These can be used to closely monitor costs, and send alerts through an SMS or e-mail using programmatic budget notifications.
* GCP can be integrated with ‘Cloud Build’, ‘Cloud Pub/Sub’ (event/alerts) and cloud functions for cost reporting, billing and notifications.

![Figure 6: GCP cost summary dashboard (Image source: Google documentation)][7]

### Some best practices to handle cloud costs efficiently

Cost management and cost transparency are the two common principles of cloud governance. The FinOps framework addresses both these principles.

The top seven ways to optimise cloud cost usage are listed below.

* Shutdown unused resources/instances: A common issue in resource optimisation is handling unused resources or instances, particularly in non-production environments. Monitoring and controlling these will enable better cost optimisation.
* Right-size underused resources: During cloud migration, infrastructure sizing is done based on the existing on-premises infrastructure. We may not know the performance requirements (completely) at the initial stage, and hence right-sizing resources like VM instances, storage services and database size can help reduce costs.
* Reserve instances or spot instances for consistent long-term workloads: When moving to the cloud, we generally have a clear idea of what we need for long-term usage like data lakes or FTP landing zone. For these services, using reserved or spot instances for three to five years can give as much as 50 per cent cost benefit.
* Choose the hybrid cloud approach for reducing migration costs: Instead of moving all applications at once to the cloud, we can migrate in stages, keeping some key applications on-premises.
* Use auto-scaling features for the required resources: Many cloud services have the auto-scale feature, which helps to scale-up computing and storage when there is higher usage and scale these down in case of lower usage. This feature too helps to reduce costs.
Budget your resources: We can set a quota for resources using a budget and cost allocation, so that if there is dynamic burst in resource requirement it can be controlled well within the allocated budget by enabling alerts and notifications.
* Choose the right compute services for better performance and costs: Though cloud service providers like Azure, AWS and GCP have multiple compute models and instance types, we may not know if we are using the right compute size and model. If we can optimise the compute model considering performance and technical requirements, we can manage costs better.

### Open source cloud cost management tools

#### Kube-Downscaler

Kube-Downscaler is an open source framework written in Python, which can be used to handle automatic shutdowns or set the uptime for Kubernetes worker pods based on usage patterns (for example, shutdown during the weekend and set uptime during office hours).

This framework runs on a single pod in the Kubernetes cluster and can work with Azure (AKS), AWS (EKS) and GCP (GKE). It has a configuration setup that can be given for the shutdown time period or uptime running period. It can be scheduled to run once or regularly for a given period (monthly, yearly).

![Figure 7: Integrated FinOps toolchain ecosystem][8]

Alternatively, we can use Kubernetes-Ops, which is another open source framework for handling end-to-end Kubernetes clusters. It can create pods/clusters, and manage, deploy, scale and monitor them in a single pane of glass.

#### Kubecost

Though cloud cost governance aims at managing compute and storage services to a large extent, managing container costs is also a challenging exercise.

Kubecost helps to get monthly spends, costs for name space level, and deployment resource costs; it identifies cost efficiency in a Kubernetes clustered environment. It comes in both a free-to-use open source model (where there are limitations to using it such as a single cluster, metric retention period) and a commercial model.

We can get details of underutilised or over-provisioned resources (nodes and pods, and abandoned resources) based on usage footprints. The major features of Kubecost are cost allocation across nodes and pods, unified cost monitoring with integrated dashboard, cost optimisation insights to identify under-provisioned or over-provisioned cluster resources, and cost alerts as well as notifications for anomalous behaviour in resource usage.

Kubecost can be used with Azure Kubernetes Service (AKS), Amazon’s Elastic Kubernetes Service (EKS) and Fargate, Google Kubernetes Engine (GKE) and other Kubernetes platforms in private cloud environments.

### Integrated FinOps toolchain solution

FinOps is more of a culture adoption and is driven by the three-dimensional approach for cloud cost management — people (cost administration, team structure, training), processes (cost levers, maturity models, metrics definitions) and tools (cost management services, third party tools, cost advisory services).

FinOps is a collaborative activity between the finance/procurement team, technical IT operations team, and business management (COO, CIO). It can be developed as an agnostic framework for implementation in a multi-cloud environment (public/private/hybrid). It can also be easily integrated with third party tools for flexible implementation. For example, developing reports and dashboards could be made flexible with this integration of third-party tools.

![Figure 8: Kubecost dashboard (Image source: Azure documentation)][9]

### Future trends in FinOps adoption

The adoption of FinOps is maturing in most organisations that have substantial cloud consumption as they need processes and procedures to manage, monitor, allocate and forecast cloud spending. With the introduction of FinOps, organisations will have deeper insights into the resources available or reserved, which will promote appropriate procurement of cloud resources and avoid unnecessary spend in the first place.

Choosing between the right FinOps platform from cloud services providers (Azure Cost Management, AWS Cost Explorer and GCP Cost Tools), third party options or in-house development is not an easy task. Factors like variability in size and usage of cloud resources, fast-changing technology, and the advent of new cloud use cases complicate the process of automating cost optimisation. Building a governance culture and mindset is vital, but not always easy.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/a-quick-look-at-cloud-cost-management-tools/

作者：[Dr Anand Nayyar][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/anand-nayyar/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Cloud-cost-management-tools.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Fig1-CloudZero.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-2.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figuer-3.jpg
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-4.jpg
[6]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-5.jpg
[7]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-6.jpg
[8]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-7.jpg
[9]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-8.jpg
