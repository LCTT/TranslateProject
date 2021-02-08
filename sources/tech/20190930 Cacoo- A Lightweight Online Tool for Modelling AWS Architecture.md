[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cacoo: A Lightweight Online Tool for Modelling AWS Architecture)
[#]: via: (https://opensourceforu.com/2019/09/cacoo-a-lightweight-online-tool-for-modelling-aws-architecture/)
[#]: author: (Magesh Kasthuri https://opensourceforu.com/author/magesh-kasthuri/)

Cacoo: A Lightweight Online Tool for Modelling AWS Architecture
======

[![AWS][1]][2]

_Cacoo is a simple and efficient online tool that can be used to model diagrams for AWS architecture. It is not specific to AWS architecture and can be used for UML modelling, cloud architecture for GCP, Azure, network architecture, etc. However, this open source tool is one of the most efficient in architecture modelling for AWS solutions._

For a cloud architect, representing the solution’s design as an architecture diagram is much more helpful in explaining the details visually to target audiences like the IT manager, the development team, business stakeholders and the application owner. Though there are many tools like Sparkx Enterprise Architect, Rational Software Modeler and Visual Paradigm, to name a few, these are not so sophisticated and flexible enough for cloud architecture modelling. Cacoo is an advanced and lightweight tool that has many features to support AWS cloud modelling, as can be seen in Figures 1 and 2.

![Figure 1: Template options for AWS architecture diagram][3]

![Figure 2: Sample AWS architecture diagram in Cacoo][4]

![Figure 3: AWS diagram options in Cacoo][5]

Though AWS provides developer tools, there is no built-in tool provided for solution modelling and hence we have to choose an external tool like Cacoo for the design preparation.

We can start with solution modelling in Cacoo either by using the AWS diagram templates, which list pre-built templates for standard architecture diagrams like the network diagram, DevOps solutions, etc. If you want to develop a custom solution from the list of shapes available in the Cacoo online editor, you can choose AWS components like compute, storage, network, analytics, AI tools, etc, and prepare custom architecture to suit your solution, as shown in Figure 2.

There are connectors available to relate the components (for example, how network communication happens, and how ELB or elastic load balancing branches to EC2 storage). Figure 3 lists sample diagram shapes available for AWS architecture diagrams in Cacoo.

![Figure 4: Create an IAM role to connect to Cacoo][6]

![Figure 5: Add the policy to the IAM role to enable Cacoo to import from the AWS account][7]

**Integrating Cacoo with an AWS account to import architecture**
One of the biggest advantages of Cacoo compared to other cloud modelling tools is that it can import architecture from an AWS account. We can connect to an AWS account, and Cacoo selects the services created in the account with the role attached and prepares an architecture diagram, on the fly.

For this, we need to first create an IAM (Identity and Access Management) role in the AWS account with the account ID and external ID as given in the Cacoo Import AWS Architecture account (Figure 4).

Then we need to add a policy to the IAM role in order to access the components attached to this role from Cacoo. For policy creation, we have sample policies available in Cacoo’s Import AWS Architecture wizard. We just need to copy and paste the policy as shown in Figure 5.

Once this is done, the IAM role is created in the AWS account. Now we need to copy the role ARN (Amazon Resource Name) from the new role created and paste it in Cacoo’s Import AWS Architecture wizard as shown in Figure 6. This imports the architecture of the services created in the account, which is attached to the IAM role we have created and displays it as an architecture diagram.

![Figure 6: Cacoo’s AWS Architecture Import wizard][8]

![Figure 7: Cacoo’ worksheet with AWS imported architecture][9]

Once this is done, we can see the architecture in Cacoo’s worksheet (Figure 7). We can print or export the architecture diagram into PPT, PNG, SVG, PDF, etc, for an architecture document, or for poster printing and other technical discussion purposes, as needed.
Cacoo is one of the most powerful cloud architecture modelling tools and can be used for visual designs for AWS architecture, on the fly, using online tools without installing any software. The online account is accessible from anywhere and can be used for quick architecture presentation.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/09/cacoo-a-lightweight-online-tool-for-modelling-aws-architecture/

作者：[Magesh Kasthuri][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/magesh-kasthuri/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2017/07/AWS.jpg?resize=696%2C427&ssl=1 (AWS)
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2017/07/AWS.jpg?fit=750%2C460&ssl=1
[3]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-1-Template-options-for-AWS-architecture-diagram.jpg?resize=350%2C262&ssl=1
[4]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-2-Sample-AWS-architecture-diagram-in-Cacoo.jpg?resize=350%2C186&ssl=1
[5]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-3-AWS-diagram-options-in-Cacoo.jpg?resize=350%2C337&ssl=1
[6]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-4-Create-an-IAM-role-to-connect-to-Cacoo.jpg?resize=350%2C228&ssl=1
[7]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-5-Add-the-policy-to-the-IAM-role-to-enable-Cacoo-to-import-from-the-AWS-account.jpg?resize=350%2C221&ssl=1
[8]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-6-Cacoo%E2%80%99s-AWS-Architecture-Import-wizard.jpg?resize=350%2C353&ssl=1
[9]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Figure-7-Cacoo%E2%80%99s-worksheet-with-AWS-imported-architecture.jpg?resize=350%2C349&ssl=1
