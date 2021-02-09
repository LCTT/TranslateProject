[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open source data control for cloud services with Apache Ranger)
[#]: via: (https://opensource.com/article/20/9/apache-ranger)
[#]: author: (Balaji Ganesan https://opensource.com/users/balajiganesan)

Open source data control for cloud services with Apache Ranger
======
Comparing different approaches to make more data available to more users
while maintaining security and compliance with data privacy regulations.
![Tools in a cloud][1]

As the movement to migrate enterprise data to the cloud gathers steam, there is an active debate on the best approach to securing and protecting it. But before we talk about the details of the various access control frameworks, let us first understand the breadth of challenges a company faces when it begins migrating its data to the cloud. First and foremost is the wide array of storage and analysis or compute services offered by cloud and third-party providers. In other words, when a company decides to move its data to the cloud, it needs to decide the type of repository in which it is going to store its data.

Each cloud company offers many different data stores, and there are a dozen different services to analyze data once it has been migrated to the cloud. Then there are cloud-native third-party services to allow data science platforms and data warehouses to operate as part of the leading public cloud infrastructure. Each of these services offers a unique mechanism by which to administer access to data consumers such as data analysts and scientists in the organization.

If you think this is beginning to sound a lot like Hadoop-based data lakes, you're right. Needless to say, this places a very heavy burden on the administrators that have to make data widely available in the organization and comply with privacy and industry regulations such as California Consumer Privacy Act (CCPA), General Data Protection Regulation (GDPR), and Health Insurance Portability and Accountability Act (HIPAA) at the same time.

### The fundamentals of two popular approaches: RBAC vs. ABAC

Access control mechanisms have been part of the enterprise IT landscape since the advent of computer systems, and there are two key aspects to controlling access to data. The first relates to authenticating the identity of the user and establishing whether the individual or system is actually who they claim to be. The second has to do with ensuring that the user has the appropriate permission to access a data system, a process known as authorization. These principles also apply to the data stored in the cloud. Today, role-based access control (RBAC) and attribute-based access control (ABAC) are the two most prevalent approaches to managing access to data in the enterprise. The goal of these approaches is to help define and enforce the policies and privileges that grant authorized users access to the required data.

RBAC is based on the concepts of users, roles, groups, and privileges in an organization. Administrators grant privileges or permissions to pre-defined organizational roles—roles that are assigned to subjects or users based on their responsibility or area of expertise. For example, a user who is assigned the role of a manager might have access to a different set of objects and/or is given permission to perform a broader set of actions on them as compared to a user with the assigned role of an analyst. When the user generates a request to access a data object, the access control mechanism evaluates the role assigned to the user and the set of operations this role is authorized to perform on the object before deciding whether to grant or deny the request.

RBAC simplifies the administration of data access controls because concepts such as users and roles are well-understood constructs in a majority of organizations. In addition to being based on familiar database concepts, RBAC also offers administrators the flexibility to assign users to various roles, reassign users from one role to another, and grant or revoke permissions as required. Once an RBAC framework is established, the administrator's role is primarily to assign or revoke users to specific roles. In RBAC, a user can be assigned many roles, a role can have many users, and a role/user can perform many operations.

The concept of attribute-based access control appeared on the scene in the early 2000s. Prior to ABAC, managing access to enterprise data involved granting a user or subject permission to perform a specific action on an entity—in this case, a database, table, or column. In ABAC, the decision to grant access or request to perform an operation on an object is based on assigned attributes of the subject, object, environment conditions, and a set of policies that are specific to those attributes and conditions. Environment conditions are dynamic factors that are independent of user or object and can include things such as the time and location of the subject. Just like subjects or users have attributes, so do objects such as databases, files, or tables. Object attributes may include author, creation date, version, effective date, last update, etc.

ABAC operates by assigning attributes to subjects and objects and developing policies that govern rules of data access. Each component in the information system is assigned attributes that are specific to the object. For example, a file can be classified as an intellectual property (IP). Similarly, each user or subject in the system can be assigned attributes that may include the user's location and time zone. Based on these attributes, an administrator can build an access policy that specifies that any document that has been classified as IP cannot be accessed by a user who is located outside the US or that it can only be accessed by users who are affiliated with the company's legal department during the hours of 8:00am and 5:00pm PST. You can now see how ABAC extends the concept of role, users, and privileges to include attributes.

ABAC also offers several advantages to infrastructure administrators. For instance, they do not require knowledge of specific users or subjects that need access to data. The combination of user and object attributes governed by a set of policies can accommodate an unlimited number of users. As new users are added to the platform, they, too, can be governed by the same set of rules. Because ABAC does not require administrators to have prior knowledge of the users, this approach is better suited to environments where individuals are routinely added and removed from the data platform.

### Making the right choice

It is important to point out that the distinction between RBAC and ABAC approaches is increasingly blurred by access control platforms such as Apache Ranger, a data governance framework originally developed to manage Big Data in Hadoop data lakes.

Today, Apache Ranger is the leading open source project for data access governance for Big Data environments, including Apache Spark. It's in use at hundreds of enterprises around the world, utilized to define and enforce data access control policies to govern sensitive data as mandated by regulations like GDPR and CCPA.

Apache Ranger was built to centrally manage access to data used by different engines that are part of the Hadoop platforms. It is inherently architected to handle the diversity of data storage and compute environments presented by multiple cloud services in use at enterprises today.

Apache Ranger's approach to data authorization is based on ABAC, which is a combination of the subject, action, resource, and environment. At the same time, Ranger can provide fine-grained access control to users based on the concepts of role, user, and permission.

The best strategy for organizations migrating to the cloud is to select a data access control platform that strikes a balance between empowering administrators to make more data available to more data consumers and complying with industry and privacy regulations. More importantly, it must do this without adversely affecting the performance of the data platform or user behavior. 

Looking for ways to draw meaningful conclusions from big data? Rommel Garcia runs through three...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/apache-ranger

作者：[Balaji Ganesan][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/balajiganesan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT (Tools in a cloud)
