[#]: subject: (Try Dolibarr, an open source customer relationship management platform)
[#]: via: (https://opensource.com/article/21/7/open-source-dolibarr)
[#]: author: (Pradeep Vijayakumar https://opensource.com/users/deepschennai)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Try Dolibarr, an open source customer relationship management platform
======
Maintain a customer database and send promotions and offers with
Dolibarr's CRM features.
![a handshake ][1]

No matter what industry you work in, a key aspect of sustaining your business is keeping your customers. In the customer-relations domain, we call this _customer retention_.

Whether you run a retail store, restaurant, pub, supermarket, gym, or any other business, you need a reliable way to keep in touch with your customers. After all, they're customers because they like what you do, and, if they've shared their contact information with you, they want to hear more about what you have to offer. Sending them discount coupons, promotions, and special offers benefits your customers and helps ensure they remember your brand and come back to do business with you again.

So, how can you achieve this?

I work with [many other people][2] on the [Dolibarr][3] project. It's an open source enterprise resource planning (ERP) and customer relationship management (CRM) software. Dolibarr provides a whole range of ERP features, including point-of-sale (POS), invoicing, stock and inventory management, sales orders, purchase orders, and human resources management. This article focuses on Dolibarr's CRM features, which help you maintain a database of your customers and connect with them to send promotions and offers.

Even if you've never used a CRM system before, Dolibarr makes it easy to manage your customers and, as long as you put in the effort, enhance customer loyalty.

### Install Dolibarr CRM

Dolibarr is open source, so you can [download][4] it and run it locally. If your store's staff includes more than a few people, you probably need a few networked Dolibarr instances. Your systems administrator can set that up for you or, if you're on your own, many hosting service providers offer one-click installers, such as Installatron and Softaculous.

In the interim, you can try Dolibarr's [online demo][5].

### Add customer data

The first step to getting to know your customers is getting your customers' information into your CRM system. You may not have this data yet, so you'll be starting fresh, or you might have a database or spreadsheet from a system that hasn't been working out for you. Dolibarr imports a wide variety of formats, so it's relatively painless to migrate.

For the sake of simplicity, I'll assume you're entering new customers. To enter a new customer into your Dolibarr system, navigate to the **Third-parties** menu, and click on the **New Customer** menu item.

![add a new customer to Dolibarr][6]

(Pradeep Vijayakumar, [CC BY-SA 4.0][7])

All the fields are configurable, and you can add and remove fields if you want. Define a marketing strategy on how you want to connect with your customers. It could be email, SMS, Facebook, Twitter, or another way your customers prefer. Once you have defined the communication channel, you know what information you need to capture for each customer.

For example, if you've chosen email as your communication method, you know to ask your customers for an email address so that you can put it into the system, along with their name, location, and any other information that may be important to you.

### Set up an email campaign

Imagine you're running a weekend promotion with a 20% discount on selected products. Here's how to run an email campaign to announce this offer to all your customers in just a few clicks.

First, click on the **Tools** tab and the **New Emailing** link. You can use the editor's WYSIWYG capabilities to design attractive emails.

![Drafting a marketing email with Dolibarr's WYSIWYG Editor][8]

(Pradeep Vijayakumar, [CC BY-SA 4.0][7])

You can use substitution variables to individualize your customers' name, location, gender, etc., as long as you have captured this information in the system (use the **?** tool tip to get the list of substitution variables). Because this email will go out to all the people in your database, you must use the substitution variables to represent any customer-specific data, such as your customers' names.

Once you've drafted your email, the next step is choosing your customer list. Navigate to the **Recipients** tab and choose **Third parties (by categories)**.

![Add customers to an email campaign list][9]

(Pradeep Vijayakumar, [CC BY-SA 4.0][7])

All your customers should be included in this email list; you can confirm this by looking at the count displayed next to the list and under **Number of distinct recipients**.

You can now click on **Validate** and then **Send** to send your email to all of your customers. Dolibarr automatically substitutes the substitution variables with actual customer data. You can also view the delivery reports for the emails that were sent out.

### Integrations

Because the marketplace is ever-changing, CRM software needs to keep pace with what customers use for communication. Dolibarr is designed for integration. You can, for instance, manage SMS marketing the same way you manage email marketing. The same is true for WhatsApp and many other targets.

### Learn more

All things considered, I think Dolibarr is an indispensable tool for implementing a customer relationship and customer retention strategy for your business. You can learn more about Dolibarr's CRM features by watching [this video on YouTube][10].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/open-source-dolibarr

作者：[Pradeep Vijayakumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/deepschennai
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/handshake_business_contract_partner.png?itok=NrAWzIDM (a handshake )
[2]: https://www.dolibarr.org/who-works-on-the-dolibarr-project-.php
[3]: http://dolibarr.org/
[4]: https://www.dolibarr.org/downloads.php
[5]: https://www.dolibarr.org/onlinedemo.php
[6]: https://opensource.com/sites/default/files/uploads/dolibarr_add-customer.png (add a new customer to Dolibarr)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://opensource.com/sites/default/files/uploads/dolibarr_create-email.png (Drafting a marketing email with Dolibarr's WYSIWYG Editor)
[9]: https://opensource.com/sites/default/files/uploads/dolibarr_select-recipients.png (Add customers to an email campaign list)
[10]: https://youtu.be/9ETxdpVsgU0
