BeeGFS Parallel File System Goes Open Source
==================================================

![](http://insidehpc.com/wp-content/uploads/2015/08/beegfs.jpg)

Today ThinkParQ announced that the complete [BeeGFS parallel file system][1] is now available as open source. Developed specifically for performance-critical environments, the BeeGFS parallel file system was developed with a strong focus on easy installation and high flexibility, including converged setups where storage servers are also used for compute jobs. By increasing the number of servers and disks in the system, performance and capacity of the file system can simply be scaled out to the desired level, seamlessly from small clusters up to enterprise-class systems with thousands of nodes.

The first official announcement to make the BeeGFS sources available was made at the International Supercomputing Conference 2013. This was in the context of the European exascale project [DEEP-ER][2], where several new approaches to address extreme I/O requirements are being designed and implemented. For exascale systems, the different software and hardware layers have to work together very efficiently to achieve maximum scalability. Thus, making the sources of BeeGFS available is one logical step to enabling efficient integration of all layers of an exascale stack.

“While some of our users are just happy with the fact that BeeGFS is so easy to install and doesn’t require much attention, others really want to understand exactly what is happening under the hood to further optimize the runtime of their applications, improve their monitoring or port it to other platforms like BSD,” said Sven Breuner, CEO of ThinkParQ, the company behind BeeGFS “Also, being able to build BeeGFS for non-x86 architectures like ARM and Power is another important aspect that the community has been waiting for.”

The steady advances in ARM technology indeed make it a more and more interesting technology to look at for future procurements. Thus, the BeeGFS team is also participating in [ExaNeSt][3], a new European exascale project, which is specifically focused on getting the ARM ecosystem ready for performance-critical workloads. “Although BeeGFS can already run out of the box on ARM systems today, this project will give us the opportunity to make sure that we can deliver the maximum performance on this architecture as well.”, adds Bernd Lietzow, BeeGFS head for ExaNeSt.

With a rather compact code base of about 25K lines of C++ code for the distributed metadata service and about 15K lines of C++ code for the distributed storage service, BeeGFS should be relatively easy to understand and extend, not only for senior programmers, but also for University students interested in file system research. On GitHub, there are already a number of projects listed related to BeeGFS, e.g. for browser-based monitoring or Docker integration.

In related news, the [BeeGFS User Meeting][4] will take place May 18-19 in Kaiserslautern, Germany.

-----------------------------------------------------------------------------------------

via: http://insidehpc.com/2016/02/beegfs-parallel-file-system-now-open-source/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+InsideHPC+%28insideHPC.com%29

作者：[staff][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://insidehpc.com/author/staff/
[1]: http://www.beegfs.com/
[2]: http://www.deep-project.eu/deep-project/EN/Home/home_node.html
[3]: http://www.exanest.eu/
[4]: http://www.beegfs.com/content/user-meeting-2016/
