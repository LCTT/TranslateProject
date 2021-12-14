[#]: subject: "6 ideas for building an equitable partner program for your open source project"
[#]: via: "https://opensource.com/article/21/12/open-source-project-partner-program"
[#]: author: "Ruth Cheesley https://opensource.com/users/rcheesley"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

6 ideas for building an equitable partner program for your open source project
======
How one open source project found a way to give credit for all kinds of
contributions.
![Two diverse hands holding a globe][1]

The organizations that partner with you to contribute to your open source project deserve recognition. But there is more to showcasing these organizations than simply adding a logo to your website.

I work at [Acquia][2] where I am the Project Lead for the open source marketing automation project, [Mautic][3]. In the Mautic project, we wanted to have a way to showcase these contributors in order to say, "These are the folks who are the makers. They support this project—work with them so they can do more!"

As we started to plan, we immediately bumped into some pretty major challenges. We needed to develop an equitable program with entry requirements that reflect both the complexities of worldwide financial systems and the nuances of what we considered a contribution to our community.

Here's how we set about it.

### Financial management

First, we needed a way to manage our finances. I have always encouraged the community to default to transparency, and this is extremely important when it comes to money.

The Mautic team looked into different options, but, based on experiences in other open source communities, getting a bank account with a physical bank can be extremely challenging when you're geographically dispersed. The same challenges apply when navigating tax systems and accounting.

Enter the [Open Collective][4], a fantastic organization that exists to support organizations with their financial management in an open, transparent way. We applied for a Fiscal Host with [Open Source Collective][5], which focuses on providing financial infrastructure for open source projects, in November 2020. Within a day or two, we were up and running.

### Sponsors

Now that we had a way to manage money, we were able to invite people to sponsor Mautic. We didn't know how much people would be willing to invest, so we set up a few tiers with suggested amounts.

Importantly, we set a differentiator at US$ 100/month, which allowed the sponsor to have a logo and link on mautic.org/sponsors. We have recently formalized our guidelines on promoting contributors, sponsors, and partners, which you can read [here][6].

We have Open Collective's sponsorship tiers available, and we also participate in GitHub Sponsors, which sends the funds directly to our Open Collective account each month. If folks active on GitHub prefer to sponsor us there (e.g., so that their personal or organizational profile shows them as a sponsor), the GitHub Sponsors function lets them do that.

### Developing a partners program

Once we had the sponsorship opportunities up and running, we focused on building a program for both the organizations that financially support the project and those practically contributing to the community.

Many projects have similar programs, often with complex tiering systems and requirements to join the program. As we were starting this in a bootstrapped fashion, we decided to have only one partner tier to start the [program][7].** **

#### Setting the entry requirements

##### Financial contributions

The next tricky question was, how much do we deem enough to qualify an organization to become a partner? How can we set an amount fair to everyone, wherever they are around the world, taking into account its value in their local economy?

We started with a method used in the [Joomla! community][8] to determine the cost of taking the official examinations: the [Big Mac Index][9]. Essentially, this method allows you to work out the relationship between currencies based on the price of a McDonald's Big Mac in each country (check out the latest data [here][10]). This method isn't perfect—for example, if a country is experiencing hyperinflation, the index does not work—so we have to exercise some discretion.

We decided to set the baseline price at US$ 100 per month and work out prices for other countries according to the Big Mac Index. This method gave us a [minimum monthly amount][11] to use as the entry point for potential partners in most countries. We decided on a term of three months over which the organization must have contributed at the minimum amount. We chose this to align with our quarterly reporting and for ease of management.

##### Practical contributions

We also needed to decide how to define a contribution and how to consistently measure contributions across our community in the most automated, streamlined way possible.

Defining contributions in open source is a bit of a thorny subject. Historically, code has been considered the first and best way to contribute to open source projects by default. In Mautic, however, most of our users are not developers—in fact, very few are. We have a lot of non-code things that need to be done, ranging from writing articles to creating videos, moderating on the forum, and running meetup groups.

We needed first to clarify how we could identify and measure these contributions automatically. Second, we needed to find tools to bring this all together into a community overview.

Enter [Savannah CRM][12], an open source community relationship management (CoRM) system with a hosted platform available if you prefer not to self-host. The tool was a huge bonus to both building our community, by helping us identify the key people who were well connected and talking about specific things, and gathering the metrics from across all of our community channels.

We use the Savannah [definition of contributions][13], which closely matches what we were already planning to track and enables us to track across all the various channels in which our community interacts.

When an organization requests to become a partner, we review their activity over the previous three months and determine whether there is a consistent contribution and activity history. The leadership team discusses what we've found and, if all are in agreement, the partner is accepted.

We also monitor the activity of our partners each quarter. If a partner has dropped their contribution or activity in the previous quarter, we reach out to them and let them know they need to maintain their activity to retain their partner status.

### Creating policies

It's essential to have clear policy documentation to explain how an organization might join the program and the processes to retain that status. We've tried to keep this simple and straightforward on [our website][14].

We decided to feature the top three most active/contributing partners on our homepage each month, basing the ranking on the previous month's activity. Doing this necessitated a monthly cadence to reporting. We accomplish this recognition through a shout-out in our Announcements channel on our community chat, then include a [quarterly roundup][15] in the report we share on our blog.

### Building the partners portal

Because we were bootstrapping this project, we didn't have much capacity for development work. As a result, our [partners portal][7] had to be built quickly using static pages. Drupal has a great layout builder that enables us to create modular pages rapidly, and we used this to create the portal.

The [main landing page][7] lists the partners in order of activity the previous month; these can be updated easily with the drag-and-drop interface. Each partner has a [landing page][16] that we create with them, using a standardized template, including their activity and contribution history for the previous 90 days and their contributors who have been active in that time. Currently, we use a screenshot, but in the future, we would like to embed it.

Partners have the option of including a Mautic form that sends an inquiry if people want to work with them. They can also include links to Mautic case studies about projects they were involved in. These case studies are featured on the general [Mautic Case Studies][17] page as well.

### Perks for partners

We decided to offer some perks for partners that are not available to sponsors, such as getting a mention in the keynotes during our main conferences. They can also propose up to three features each year for inclusion in the product roadmap. These proposals go directly to the Project Lead and Product Team for consideration, without going through the community voting process.

### Next steps

While the partners portal is purposely pretty simple, it definitely won't be scalable as the number of partners grows, so we will be looking to build something a bit fancier in the future. For example, we want filters and the ability to search by geographic region or language. We also want to automate ranking the organizations each month and then automatically feature the top three on our website.

We would like to build on the sense of belonging, for example, by having a badge that our partners can share on their websites to show that they are a partner. We might also explore the possibility of an [NGO][18] which they are a member of, which we don't currently have.

We plan to look into a tiered system in the future, especially as we have some partners who contribute significantly more than others. If we go this route, we will need to ensure that the thresholds remain fair and consistent in both the financial and practical aspects.

### Outcomes

To date, the partner program has been very well received. Organizations in the community value the opportunity to be listed on the partners portal. While it doesn't generate huge volumes of sales, it does raise their profile in the community and enables people to find reputable companies helping build and support the future of the project.

Most importantly, organizations have agreed that our implementation of the program is a fair approach to ensuring that both financial and practical support are considered for inclusion in the program.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/open-source-project-partner-program

作者：[Ruth Cheesley][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rcheesley
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/world_hands_diversity.png?itok=zm4EDxgE (Two diverse hands holding a globe)
[2]: https://www.acquia.com/
[3]: https://www.mautic.org/
[4]: https://www.opencollective.com/
[5]: https://www.oscollective.org/
[6]: https://contribute.mautic.org/policies/promoting-contributors-sponsors-partners
[7]: https://www.mautic.org/mautic-community-partners
[8]: https://certification.joomla.org/exams/prices
[9]: https://www.economist.com/big-mac-index
[10]: https://github.com/TheEconomist/big-mac-data
[11]: https://docs.google.com/spreadsheets/d/1VctW_ZSySbnKpgfR4981qmUJUkglqP-ddwU8pclQMoA/edit?usp=sharing%21
[12]: https://github.com/SavannahHQ/Savannah
[13]: https://docs.savannahhq.com/pages/contributions/
[14]: https://contribute.mautic.org/policies/mautic-community-partners-program
[15]: https://www.mautic.org/blog/community/q3-2021-mautic-community-roundup
[16]: https://www.mautic.org/mautic-community-partners/webmecanik
[17]: https://mautic.org/case-studies
[18]: https://en.wikipedia.org/wiki/Non-governmental_organization
