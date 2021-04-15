[#]: subject: (Make your data boss-friendly with this open source tool)
[#]: via: (https://opensource.com/article/21/4/visualize-data-eda)
[#]: author: (Juanjo Ortilles https://opensource.com/users/jortilles)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Make your data boss-friendly with this open source tool
======
Enterprise Data Analytics aims to bring data visualization to everyday
business users.
![metrics and data shown on a computer screen][1]

Enterprise Data Analytics ([EDA][2]) is a web application that enables access to information through a simple, clear interface.

After several years of working for Barcelona open source analytics company [Jortilles][3], we realized that the modern world collects data compulsively but there was no easy way for average people to see or interpret that data. There are some powerful open source tools for this purpose, but they are very complex. We couldn't identify a tool designed to be easy to use by common people with little technical skill.

We developed EDA because we consider access to information to be a requirement and obligation for modern organizations and wanted to provide everyone with access to information.

![EDA interface][4]

(Juanjo Ortilles, [CC BY-SA 4.0][5])

### Visualize your data

EDA offers a data model using business terms that people already understand. You choose the information you want, and you can view it how you want. It aims to be user friendly and still powerful.

EDA visualizes and enriches the information in a database through a metadata model. It can read data from BigQuery, Postgres, [MariaDB, MySQL][6], and several other databases. This transforms the technical database model into familiar business concepts.

It is also designed to speed up information propagation because it taps into the data already stored in a database. EDA discovers the database's topology and proposes a business model. If you've designed a good database model, you have a good business model. EDA can also connect to production servers to provide real-time analysis.

This combination of data and a data model mean you and anyone in your organization can analyze its data. However, to protect the data, you can define data security, down to the row, to grant access to the right data to the right people.

Some of EDA's features include:

  * Automatic data-model generation
  * A consistent data model that prevents inconsistent queries
  * SQL mode for advanced users
  * Data visualizations:
    * Standard charts (e.g., bar charts, pie charts, line charts, treemaps)
    * Map integration (e.g., geoJSON shapefiles, latitude, longitude)
    * Email alerts, which can be defined though key performance indicators (KPIs)
  * Private and public information controls to enable private and public dashboards, which you can share with a link
  * Data caches and programatic refreshes



### How to use EDA

The first step in visualizing data with EDA is to create a data model.

#### Create a data model

First, select **New Datasource** in the left-hand menu.

Next, choose the database system where your data is stored (e.g., Postgres, MariaDB, MySQL, Vertica, SqlServer, Oracle, Big Query) and provide the connection parameters.

EDA will automatically generate the data model for you. It reads tables and columns and defines names for them as well as the relationships between tables. You can also enrich your data model by adding virtual views or geoJSON maps.

#### Make a dashboard

Now you are ready to make your first dashboard. On the main page of EDA's interface, you should see a **New dashboard** button. Click it, name your dashboard, and select the data model you created. A new dashboard will appear with a panel for you to configure.

To configure a panel, click the **Configuration** button in the top-right corner and choose what you want to do. In **Edit query**, select the data you want to show. A new window will appear with your data model represented by entities and attributes for the entities. Choose the entity you want to see and the attributes you want to use. For example, for an entity named **Customers** you might show **Customer Name**, and for a **Sales** entity, you might want to show **Total Sales**.

Next, run a query, and choose the visualization you want.

![EDA interface][7]

(Juanjo Ortilles, [CC BY-SA 4.0][5])

You can add as many panels, filters, and text fields as you want, all with explanations. Once you save your dashboard, you can view it, share it with colleagues, and even publish it to the internet.

### Getting EDA

The quickest way to take a look at EDA is with the [public demo][8]. But if you want to give it a try on your own, you can get the latest EDA release with Docker:


```
`$ docker run -p 80:80 jortilles / eda: latest`
```

We also have a cloud software-as-a-service option for anyone who wants to use EDA without having to do setup, configuration, and ongoing updates. You can review the [cloud options][9] on our website.

If you want to see it in action, you can watch some [demonstrations][10] on YouTube.

EDA is in continuous development, and you can find its [source code on GitHub][11].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/visualize-data-eda

作者：[Juanjo Ortilles][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jortilles
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://eda.jortilles.com/en/jortilles-english/
[3]: https://www.jortilles.com/
[4]: https://opensource.com/sites/default/files/uploads/eda-display.jpeg (EDA interface)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/20/10/mariadb-mysql-cheat-sheet
[7]: https://opensource.com/sites/default/files/uploads/eda-chart.jpeg (EDA interface)
[8]: https://demoeda.jortilles.com/
[9]: https://eda.jortilles.com
[10]: https://youtu.be/cBAAJbohHXQ
[11]: https://github.com/jortilles/EDA
