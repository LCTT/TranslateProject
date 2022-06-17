[#]: subject: "Data Profiler: An Open Source Machine Learning Technology For Data Monitoring"
[#]: via: "https://www.opensourceforu.com/2022/05/data-profiler-an-open-source-machine-learning-technology-for-data-monitoring/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Data Profiler: An Open Source Machine Learning Technology For Data Monitoring
======
![Business Network concept, Social Network Concept, Profiling and human behavior analysis by artificial intelligence technology, Futuristic Technology background][1]

The amount of data that firms can manage has increased rapidly since moving to the cloud. This is why Capital One developed Data Profiler, an open source Python package that uses machine learning to assist users in monitoring huge data and detecting sensitive information. Data Profiler provides users with a pre-trained deep learning model for quick detection of sensitive information, as well as components for statistical analysis of the dataset and an API for creating data labelers.

He went on to say that the data labeler’s deep learning model analyses a dataset’s unstructured text and then determines what type of data is being represented in that particular dataset.

“Our library has a list of labels of which a subset is considered non-public personally identifiable pieces of information… the data labeler is able to use that deep learning model to identify where that exists in a dataset… and calls out where that exists to that user that’s doing the analysis,” Goodsitt explained.

Customers can use Data Profiler in a variety of ways. The library can detect the schema, statistics, and entities from any data, whether it is structured, unstructured, or semi-structured. This flexibility allows models to be changed and allows many models to be run on the same dataset with only a few lines of code.

Goodsitt also talked about how this sensitive data detection methodology might be used to sanitise datasets on a mobile device so that when they leave the customer’s device, the specific personal information is deleted, guaranteeing that the data is safe no matter where it travels.

The key reasons for Capital One’s decision to open source Data Profiler, according to Nureen D’Souza, leader of the Open-Source Program Office, are to promote cooperation with new talent, display the expertise of its data scientists, and give back to the open-source community.

“We can now have others in a similar field contribute to this project and make Data Profiler greater than it is today,” she said, “We thought it would be good to open source because it solves the problem that we are seeing, and we couldn’t find another open source project that would.”

Goodsitt also emphasised the advantages of Data Profiler’s reader feature. This is a single command class that allows customers to point to various sorts of files or even a URL that hosts a dataset, and it will automatically identify and read that dataset for them.

Users can also use Data Profiler to parallelize, batch, or stream profile a dataset so that it does not have to be profiled all at once. This functionality was not easily discoverable before to this release, according to Goodsitt, unless you were doing your own statistical study. Since its debut in 2021, Data Profiler has received 54 forks on GitHub and over 700 stars, according to D’Souza, demonstrating how highly this open-source tool is regarded by the community, with no signs of slowing down.

This open source solution will be showcased at PyCon 2022, the Python Conference, which will take place in Salt Lake City from April 27 to May 3. PyCon is returning in person after two years of being a virtual event, with various health and safety requirements in place.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/data-profiler-an-open-source-machine-learning-technology-for-data-monitoring/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/Data-Profiling-1-696x464.jpeg
