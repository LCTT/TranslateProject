[#]: subject: "A Complete Guide to  Cloud Service Architectures"
[#]: via: "https://www.opensourceforu.com/2022/09/a-complete-guide-to-cloud-service-architectures/"
[#]: author: "Mir H.S. Quadri https://www.opensourceforu.com/author/shah-quadri/"
[#]: collector: "lkxed"
[#]: translator: "cool-summer-021"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A Complete Guide to  Cloud Service Architectures
======
*In its roughly 16 years of evolution, cloud computing has evolved to become a technology that is used by almost everyone who uses the Internet. It can be used as a service to support various types of business and consumer requirements. Therefore, multiple service architectures are being used in cloud computing to customise the technology as per modern day needs. This article provides a complete guide to all the service architectures being used today.*

While the idea of having a network of computers collaborating across the world has existed since the early 1960s, the formal conceptualisation of it occurred in 2006 when Eric Schmidt, the then CEO of Google, introduced the term ‘cloud computing’ in its modern day context.

Cloud computing can be simply understood as a network of remote servers across the world, sharing data and collaborating over the Internet to provide services to businesses and customers. Albeit an arbitrary definition, it does cover the core idea behind cloud computing. The primary motivating factor for such a technology was to create more ‘stickability in data’, i.e., to make data more easily accessible across the devices whilst reducing the risks of data loss. If a user x has data in only one server, the chances of permanent data loss for x are higher given that all it takes is one server outage. That is equivalent to the proverbial ‘putting all your eggs in one basket’ method, which is never a good idea especially when you are dealing with data that can be critical for businesses and consumers. But if you replicate the data of x in multiple servers across the globe, it will have two major benefits. For one, x will still be able to access his/her data even if a server is facing an outage. Second, the cloud can provide x with access to its data from a server that is available closest to it with the least amount of load. This makes data faster and more easily accessible across different devices for x.

In its roughly 16 years of evolution, cloud computing has gone from being something used simply for backing up photos to becoming the backbone of the Internet. Almost every app today, from Microsoft Office to Asana and Todoist, makes use of cloud computing for real-time access and sharing of data. Almost any app that you can think of uses cloud computing. Everything from Gmail and YouTube, to Instagram and even WhatsApp, uses cloud computing in the background to provide fast, easy, and reliable access to data.

The companies that provide cloud computing services are called cloud service providers. Amazon, Google, Microsoft, Salesforce, Cloud9, etc, all provide cloud as a service in both B2B and B2C contexts.

In the early days, cloud service providers generally offered only three types of services to their customers:

* Software as a Service (SaaS)
* Platform as a Service (PaaS)
* Infrastructure as a Service (IaaS)

However, as the industry requirements have evolved with new technologies such as blockchain and AI coming into the picture, cloud service providers have come up with new models to better serve the varying requirements of their customers. In this article, we are going to go through all the cloud computing service models currently being used in the market.

### The architecture of a cloud

Now that we have an idea of what cloud computing is and how it evolved into becoming a 445 billion dollar industry, let us try to understand the cloud from a technical perspective. A generalised architecture of a cloud can be conceptualised as consisting of two major components — the front-end and the back-end.

![Figure 1: The architecture of a cloud (Courtesy: TechVidvan)][1]

The front-end contains the client infrastructure, i.e., the device and the user interface of the application used for communicating with the cloud. In a real-world context, your smartphone and the Google Drive app are the front-end client infrastructure that can be used for accessing the Google cloud.

The back-end contains the cloud infrastructure, i.e., all the mechanisms and machinery required to run a cloud computing service. The servers, virtual machines, services and storage are all provided by the cloud infrastructure, as shown in ure 1. Let’s quickly go through each component of the back-end in order to get a complete picture.

* Application: The back-end of whatever app the user or business uses to interact with the cloud via the Internet.
* Service: The infrastructure for the type of service that the cloud provides. We are going to go into detail about all the different types of services in this article.
* Runtime: The provision of runtime and execution made available to the virtual machines.
* Storage: The acquisition and management of user/business data with the flexibility of scaling.
* Infrastructure: The hardware and software required to run the cloud.
* Security and management: Putting security mechanisms in place to protect user/business data as well as managing individual units of the cloud architecture to avoid overload and service outages.

### Software as a Service (SaaS)

Software as a Service is a cloud computing model that provides software and applications as a service over the Internet. A good example of this is Google Drive or Google Workspace. All the apps available in Google Drive such as docs, sheets, slides, forms, etc, can be accessed online using a Web browser and saved automatically to the cloud. You can access the latest version of your documents through any device. All you need to do is login to your account. This is the benefit of having the Software as a Service model. Instead of having to install anything to your device locally or using your local storage space, you can directly access the software application in the cloud thus removing a lot of the liabilities that come with localised software. SaaS often follows the ‘pay as you go’ model, i.e., you pay for the services you need. You can always purchase more storage and/or features by paying more or downgrade your package as per your requirements.

#### Benefits of SaaS

1. SaaS is highly scalable, thanks to the ‘pay as you go’ model. You can increase/decrease storage and/or the features of the apps as and how you need to.
2. It is considerably cost-effective given the features it provides such as real-time access through any device with any operating system.
3. It involves low effort at the customer-end. No installations or confusing steps are required to initialise the software. You can use it from the comfort of your browser and/or app.
4. Software updates automatically without you having to install it or wait for installation at your end.

### Platform as a Service (PaaS)

Not every tech startup has the required resources to maintain their own infrastructure to run their apps on the cloud. In many cases, companies (especially startups) prefer to have their app hosted on the cloud without having to handle all the backend infrastructure. It is in situations such as these where a Platform as a Service model comes into play. Companies such as Heroku cloud offer PaaS architecture-based cloud solutions for companies and individuals to host and run their apps in the cloud without having any direct contact with the hardware infrastructure. Like SaaS, this model also provides flexibility in choosing only the services you require along with scalability and security from an infrastructural perspective.

#### Benefits of PaaS

1. No hassle of handling the cloud infrastructure. You outsource that to the company that hosts your app in their cloud. This helps you focus solely on your app development life cycle.
2. PaaS is scalable. You can increase or decrease your storage requirements, add-on services, etc, as per your requirements.
3. The only security parameters you set are for your own app. The cloud security is dealt with by your cloud service provider.
4. It is time- and cost-effective for companies and individuals looking to host their apps in the cloud, especially startups that cannot afford to build their own infrastructure.

### Infrastructure as a Service (IaaS)

Infrastructure as a Service goes one step deeper than PaaS, providing customers with even more autonomy. In an IaaS model, the cloud service provider gives you control over the underlying infrastructure of the cloud. Simply put, you get to design your own cloud environment customised to your company’s requirements all the way from dedicated servers and virtual machines, to operating systems running on the servers, setting bandwidths, creating your own security protocols, and pretty much everything else that goes into creating a cloud infrastructure. Amazon AWS and Google Compute Engine are great examples of IaaS models. Given the autonomy over the hardware that this model provides, it is also referred to as Hardware as a Service (HaaS).

#### Benefits of IaaS

1. Granular flexibility in the ‘pay as you go’ model. You get to decide how many VMs you want to run and for how long. You can even pay by the hour.
2. Highly scalable, given that it follows the ‘pay as you go’ model to its core.
3. Complete autonomy and control over everything in the infrastructure without the hassle of maintaining the servers physically at your company location.
4. Most companies guarantee uptime, security and 24/7 on-site customer support, which can be essential for enterprises.

### Storage as a Service (StaaS)

Google Drive, OneDrive, Dropbox, and iCloud are some of the big names in the industry providing Storage as a Service to their customers. StaaS is as simple as it sounds. If all you require is storage in the cloud that is accessible to you in real-time through any of your devices, then the StaaS model is the one to choose. Many companies and individuals make use of this service model to back up their data.

#### Benefits of StaaS

1. Access your data in its most updated form in real-time with the help of built-in version control systems.
2. Access your data through any type of device with any operating system.
3. Back-up your data in real-time as and how you create, edit, and delete your files.
4. Scale your storage as and how you require. StaaS follows the ‘pay as you go’ model.

### Anything/Everything as a Service (XaaS)

A hybrid version of the IaaS, PaaS, SaaS, and StaaS, is what is being called the Anything/Everything as a Service model, and is quickly gaining traction in the cloud community. It is possible for a customer to have requirements that are so varied that they might be a mishmash of all the different models. In such a scenario, complete autonomy is provided to customers to select the services from different tiers to create their own custom ‘pay as you go’ model. This has the benefit of giving complete freedom to the customer to use the cloud on their own terms.

#### Benefits of XaaS

1. Choose what you like, how you like and as you like.
2. Pay only for exactly what you need without having to pay for any base fee predicated on a tier system.
3. Select your infrastructure, platform, and functionality on a granular level.
4. If used appropriately, XaaS can be the most time-, cost- and work-effective method of hosting your application on the cloud.

### Function as a Service (FaaS)

In certain cases, companies or individuals require the benefits of PaaS without having to use all its functionality. For example, trigger-based systems such as cron jobs only require a piece of code or a function to run on a serverless system to achieve a particular objective. For instance, a customer may want to create a website traffic monitoring system that sends a notification the moment a certain number of page downloads occur. In such a case, the customer requirements are simply to run a piece of code in the cloud that keeps checking for a trigger to execute. Using a PaaS model can be a costly solution. This is where Function as a Service comes in. Many companies such as Heroku offer FaaS to their customers to host only a specific piece of code or function that is reactionary and only activates upon a trigger.

#### Benefits of FaaS

1. You only pay for the number of executions of the code. You are generally not charged for hosting your code unless it is computationally expensive.
2. It removes all the liability of PaaS while giving you all its benefits.
3. You are not responsible for the underlying infrastructure in any way. Therefore, you can simply upload your code without having to worry about any maintenance of the virtual machines.
4. FaaS provides you with the ability to be agile, i.e., to write functional code.

### Blockchain Platform as a Service (BPaaS)

Blockchain has taken the tech industry by storm in recent years. It is one of the most in-demand technologies right now, surpassed marginally by AI and data science related technologies. What makes blockchain so attractive is its open-ledger architecture providing security, scalability, and transparency. These features are necessary for many applications such as banking, electoral systems, and even social media. With such wide-ranging applications, it becomes necessary to be able to host such products on the cloud with a model that specifically caters to the needs of this technology. This is where BPaaS comes into the picture. Many companies today, including big names such as Amazon AWS and Microsoft Azure, are providing BPaaS solutions for customers specifically looking to host blockchain based apps in the cloud.

#### Benefits of BPaaS

1. It caters to the specific needs of the blockchain industry such as support for custom languages used for writing smart contracts.
2. Supports integrations with pre-eminent blockchains such as Ethereum by providing API bridges.
3. Supports custom databases used in the application life cycle of blockchain technologies.
4. It has all the goodness of the cloud with the ‘pay as you go’ feature, scalability, security, and ease of access.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/a-complete-guide-to-cloud-service-architectures/

作者：[Mir H.S. Quadri][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/shah-quadri/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/08/Figure-1-The-architecture-of-a-cloud-2.jpg
