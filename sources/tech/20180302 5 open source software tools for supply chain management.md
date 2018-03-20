5 open source software tools for supply chain management
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_Maze2.png?itok=EH_L-J6Q)

This article was originally posted on January 14, 2016, and last updated March 2, 2018.

If you manage a business that deals with physical goods, [supply chain management][1] is an important part of your business process. Whether you're running a tiny Etsy store with just a few customers, or a Fortune 500 manufacturer or retailer with thousands of products and millions of customers worldwide, it's important to have a close understanding of your inventory and the parts and raw materials you need to make your products.

Keeping track of physical items, suppliers, customers, and all the many moving parts associated with each can greatly benefit from, and in some cases be totally dependent on, specialized software to help manage these workflows. In this article, we'll take a look at some free and open source software options for supply chain management and some of the features of each.

Supply chain management goes a little further than just inventory management. It can help you keep track of the flow of goods to reduce costs and plan for scenarios in which the supply chain could change. It can help you keep track of compliance issues, whether these fall under the umbrella of legal requirements, quality minimums, or social and environmental responsibility. It can help you plan the minimum supply to keep on hand and enable you to make smart decisions about order quantities and delivery times.

Because of its nature, a lot of supply chain management software is bundled with similar software, such as [customer relationship management][2] (CRM) and [enterprise resource planning][3] (ERP) tools. So, when making a decision about which tool is best for your organization, you may wish to consider integration with other tools as a part of your decision-making criteria.

### Apache OFBiz

[Apache OFBiz][4] is a suite of related tools for helping you manage a variety of business processes. While it can manage a variety of related issues like catalogs, e-commerce sites, accounting, and point of sale, its primary supply chain functions focus on warehouse management, fulfillment, order, and manufacturing management. It is very customizable, but the flip side of that is that it requires a good deal of careful planning to set up and integrate with your existing processes. That's one reason it is probably the best fit for a midsize to large operation. The project's functionality is built across three layers: presentation, business, and data, making it a scalable solution, but again, a complex one.

The source code of Apache OFBiz can be found in the [project's repository][5]. Apache OFBiz is written in Java and is licensed under an [Apache 2.0 license][6].

If this looks interesting, you might also want to check out [opentaps][7], which is built on top of OFBiz. Opentaps enhances OFBiz's user interface and adds core ERP and CRM features, including warehouse management, purchasing, and planning. It's licensed under [AGPL 3.0][8], with a commercial license available for organizations that don't want to be bound by the open source license.

### OpenBoxes

[OpenBoxes][9] is a supply chain management and inventory control project, primarily and originally designed for keeping track of pharmaceuticals in a healthcare environment, but it can be modified to track any type of stock and the flows associated with it. It has tools for demand forecasting based on historical order quantities, tracking stock, supporting multiple facilities, expiration date tracking, kiosk support, and many other features that make it ideal for healthcare situations, but could also be useful for other industries.

Available under an [Eclipse Public License][10], OpenBoxes is written primarily in Groovy and its source code can be browsed on [GitHub][11].

### OpenLMIS

Like OpenBoxes, [OpenLMIS][12] is a supply chain management tool for the healthcare sector, but it was specifically designed for use in low-resource areas in Africa to ensure medications and medical supplies get to patients in need. Its API-driven approach enables users to customize and extend OpenLMIS while maintaining a connection to the common codebase. It was developed with funding from the Rockefeller Foundation, and other contributors include the UN, USAID, and the Bill & Melinda Gates Foundation.

OpenLMIS is written in Java and JavaScript with AngularJS. It is available under an [AGPL 3.0 license][13], and its source code is accessible on [GitHub][13].

### Odoo

You might recognize [Odoo][14] from our previous top [ERP projects][3] article. In fact, a full ERP may be a good fit for you, depending on your needs. Odoo's supply chain management tools mostly revolve around inventory and purchase management, as well as connectivity with e-commerce and point of sale, but it can also connect to other tools like [frePPLe][15] for open source production planning.

Odoo is available both as a software-as-a-service solution and an open source community edition. The open source edition is released under [LGPL][16] version 3, and the source is available on [GitHub][17]. Odoo is primarily written in Python.

### xTuple

Billing itself as "supply chain management software for growing businesses," [xTuple][18] focuses on businesses that have outgrown their conventional small business ERP and CRM solutions. Its open source version, called Postbooks, adds some inventory, distribution, purchasing, and vendor reporting features to its core accounting, CRM, and ERP capabilities, and a commercial version expands the [features][19] for manufacturers and distributors.

xTuple is available under the Common Public Attribution License ([CPAL][20]), and the project welcomes developers to fork it to create other business software for inventory-based manufacturers. Its web app core is written in JavaScript, and its source code can be found on [GitHub][21].

There are, of course, other open source tools that can help with supply chain management. Know of a good one that we left off? Let us know in the comments below.

--------------------------------------------------------------------------------

via: https://opensource.com/tools/supply-chain-management

作者：[Jason Baker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:https://en.wikipedia.org/wiki/Supply_chain_management
[2]:https://opensource.com/business/14/7/top-5-open-source-crm-tools
[3]:https://opensource.com/resources/top-4-open-source-erp-systems
[4]:http://ofbiz.apache.org/
[5]:http://ofbiz.apache.org/source-repositories.html
[6]:http://www.apache.org/licenses/LICENSE-2.0
[7]:http://www.opentaps.org/
[8]:http://www.fsf.org/licensing/licenses/agpl-3.0.html
[9]:http://openboxes.com/
[10]:http://opensource.org/licenses/eclipse-1.0.php
[11]:https://github.com/openboxes/openboxes
[12]:http://openlmis.org/
[13]:https://github.com/OpenLMIS/openlmis-ref-distro/blob/master/LICENSE
[14]:https://www.odoo.com/
[15]:https://frepple.com/
[16]:https://github.com/odoo/odoo/blob/9.0/LICENSE
[17]:https://github.com/odoo/odoo
[18]:https://xtuple.com/
[19]:https://xtuple.com/comparison-chart
[20]:https://xtuple.com/products/license-options#cpal
[21]:http://xtuple.github.io/
