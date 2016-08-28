Baidu Takes FPGA Approach to Accelerating SQL at Scale
===================

![](http://www.nextplatform.com/wp-content/uploads/2016/08/BaiduFPGAFeatured-200x114.png)

While much of the work at Baidu we have focused on this year has centered on the Chinese search giant’s [deep learning initiatives][1], many other critical, albeit less bleeding edge applications present true big data challenges.

As Baidu’s Jian Ouyang detailed this week at the Hot Chips conference, Baidu sits on over an exabyte of data, processes around 100 petabytes per day, updates 10 billion webpages daily, and handles over a petabyte of log updates every 24 hours. These numbers are on par with Google and as one might imagine, it takes a Google-like approach to problem solving at scale to get around potential bottlenecks.

Just as we have described Google looking for any way possible to beat Moore’s Law, Baidu is on the same quest. While the exciting, sexy machine learning work is fascinating, acceleration of the core mission-critical elements of the business is as well—because it has to be. As Ouyang notes, there is a widening gap between the company’s need to deliver top-end services based on their data and what CPUs are capable of delivering.

![](http://www.nextplatform.com/wp-content/uploads/2016/08/BaiduFPGA1.png)

As for Baidu’s exascale problems, on the receiving end of all of this data are a range of frameworks and platforms for data analysis; from the company’s massive knowledge graph, multimedia tools, natural language processing frameworks, recommendation engines, and click stream analytics. In short, the big problem of big data is neatly represented here—a diverse array of applications matched with overwhelming data volumes.

When it comes to acceleration for large-scale data analytics at Baidu, there are several challenges. Ouyang says it is difficult to abstract the computing kernels to find a comprehensive approach. “The diversity of big data applications and variable computing types makes this a challenge. It is also difficult to integrate all of this into a distributed system because there are also variable platforms and program models (MapReduce, Spark, streaming, user defined, and so on). Further there is more variance in data types and storage formats.”

Despite these barriers, Ouyang says teams looked for the common thread. And as it turns out, that string that ties together many of their data-intensive jobs is good old SQL. “Around 40% of our data analysis jobs are already written in SQL and rewriting others to match it can be done.” Further, he says they have the benefit of using existing SQL system that mesh with existing frameworks like Hive, Spark SQL, and Impala. The natural thing to do was to look for SQL acceleration—and Baidu found no better hardware than an FPGA.

![](http://www.nextplatform.com/wp-content/uploads/2016/08/BaiduFPGA2.png)

These boards, called processing elements (PE on coming slides), automatically handle key SQL functions as they come in. With that said, a disclaimer note here about what we were able to glean from the presentation. Exactly what the FPGA is talking to is a bit of a mystery and so by design. If Baidu is getting the kinds of speedups shown below in their benchmarks, this is competitive information. Still, we will share what was described. At its simplest, the FPGAs are running in the database and when it sees SQL queries coming it, the software the team designed ([and presented at Hot Chips two years ago][2] related to DNNs) kicks into gear.

![](http://www.nextplatform.com/wp-content/uploads/2016/08/BaiduFPGA3.png)

One thing Ouyang did note about the performance of their accelerator is that their performance could have been higher but they were bandwidth limited with the FPGA. In the evaluation below, Baidu setup with a 12-core 2.0 Ghz Intel E26230 X2 sporting 128 GB of memory. The SDA had five processing elements (the 300 MHzFPGA boards seen above) each of which handles core functions (filter, sort, aggregate, join and group by.).

To make the SQL accelerator, Baidu picked apart the TPC-DS benchmark and created special engines, called processing elements, that accelerate the five key functions in that benchmark test. These include filter, sort, aggregate, join, and group by SQL functions. (And no, we are not going to put these in all caps to shout as SQL really does.) The SDA setup employs an offload model, with the accelerator card having multiple processing elements of varying kinds shaped into the FPGA logic, with the type of SQL function and the number per card shaped by the specific workload. As these queries are being performed on Baidu’s systems, the data for the queries is pushed to the accelerator card in columnar format (which is blazingly fast for queries) and through a unified SDA API and driver, the SQL work is pushed to the right processing elements and the SQL operations are accelerated.

The SDA architecture uses a data flow model, and functions not supported by the processing elements are pushed back to the database systems and run natively there. More than any other factor, the performance of the SQL accelerator card developed by Baidu is limited by the memory bandwidth of the FPGA card. The accelerator works across clusters of machines, by the way, but the precise mechanism of how data and SQL operations are parsed out to multiple machines was not disclosed by Baidu.

![](http://www.nextplatform.com/wp-content/uploads/2016/08/BaiduFPGA4.png)

![](http://www.nextplatform.com/wp-content/uploads/2016/08/BaiduFPGA5.png)

We’re limited in some of the details Baidu was willing to share but these benchmark results are quite impressive, particularly for Terasort. We will follow up with Baidu after Hot Chips to see if we can get more detail about how this is hooked together and how to get around the memory bandwidth bottlenecks.



--------------------------------------------------------------------------------

via: http://www.nextplatform.com/2016/08/24/baidu-takes-fpga-approach-accelerating-big-sql/?utm_source=dbweekly&utm_medium=email

作者：[Nicole Hemsoth][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.nextplatform.com/author/nicole/
[1]: http://www.nextplatform.com/?s=baidu+deep+learning
[2]: http://www.hotchips.org/wp-content/uploads/hc_archives/hc26/HC26-12-day2-epub/HC26.12-5-FPGAs-epub/HC26.12.545-Soft-Def-Acc-Ouyang-baidu-v3--baidu-v4.pdf







