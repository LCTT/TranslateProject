# Build Strong Real-Time Streaming Apps with Apache Calcite


 ![Calcite](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/calcite.jpg?itok=CUZmjPjy "Calcite ") 
Calcite is a data framework that lets you to build custom database functionality, explains Microsoft developer Atri Sharma in this preview to his upcoming talk at Apache: Big Data Europe, Nov. 14-16 in Seville, Spain.[Creative Commons Zero][2]Wikimedia Commons: Parent Géry

The [Apache Calcite][7] data management framework contains many pieces of a typical database management system but omits others, such as storage of data and algorithms to process data. In his talk at the upcoming [Apache: Big Data][6] conference in Seville, Spain, Atri Sharma, a Software Engineer for Azure Data Lake at Microsoft, will talk about developing applications using [Apache Calcite][5]'s advanced query planning capabilities. We spoke with Sharma to learn more about Calcite and how existing applications can take advantage of its functionality.

 ![Atri Sharma](https://www.linux.com/sites/lcom/files/styles/floated_images/public/atri-sharma.jpg?itok=77cvZWfw "Atri Sharma") 

Atri Sharma, Software Engineer, Azure Data Lake, Microsoft[Used with permission][1]

**Linux.com: Can you provide some background on Apache Calcite? What does it do?**

Atri Sharma: Calcite is a framework that is the basis of many database kernels. Calcite empowers you to build your custom database functionality and use the required resources from Calcite. For example, Hive uses Calcite for cost-based query optimization, Drill and Kylin use Calcite for SQL parsing and optimization, and Apex uses Calcite for streaming SQL.

**Linux.com: What are some features that make Apache Calcite different from other frameworks?**

Atri: Calcite is unique in the sense that it allows you to build your own data platform. Calcite does not manage your data directly but rather allows you to use Calcite's libraries to define your own components. For eg, instead of providing a generic query optimizer, it allows defining custom query optimizers using the Planners available in Calcite.

**Linux.com: Apache Calcite itself does not store or process data. How does that affect application development?**

Atri: Calcite is a dependency in the kernel of your database. It is targeted for data management platforms that wish to extend their functionalities without writing a lot of functionality from scratch.

**Linux.com: Who should be using it? Can you give some examples?**

Atri: Any data management platform looking to extend their functionalities should use Calcite. We are the foundation of your next high-performance database!

Specifically, I think the biggest examples would be Hive using Calcite for query optimization and Flink for parsing and streaming SQL processing. Hive and Flink are full-fledged data management engines, and they use Calcite for highly specialized purposes. This is a good case study for applications of Calcite to further strengthen the core of a data management platform.

**Linux.com: What are some new features that you’re looking forward to?**

Atri: Streaming SQL enhancements are something I am very excited about. These features are exciting because they will enable users of Calcite to develop real-time streaming applications much faster, and the strength and capabilities of these applications will be manifold. Streaming applications are the new de facto, and the strength to have query optimization in streaming SQL will be very useful for a large crowd. Also, there is discussion ongoing about temporal tables, so watch out for more!

--------------------------------------------------------------------------------

via: https://www.linux.com/news/build-strong-real-time-streaming-apps-apache-calcite

作者：[AMBER ANKERHOLZ][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/aankerholz
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/files/images/atri-sharmajpg
[4]:https://www.linux.com/files/images/calcitejpg
[5]:https://calcite.apache.org/
[6]:http://events.linuxfoundation.org/events/apache-big-data-europe
[7]:https://calcite.apache.org/
