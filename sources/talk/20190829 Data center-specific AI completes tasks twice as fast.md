[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Data center-specific AI completes tasks twice as fast)
[#]: via: (https://www.networkworld.com/article/3434597/data-center-specific-ai-completes-tasks-twice-as-fast.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

Data center-specific AI completes tasks twice as fast
======
Researchers at MIT have developed an artificial intelligence-powered system based on reinforcement learning that could revolutionize data center operations.
Matejmo / Getty Images

Data centers running artificial intelligence (AI) will be significantly more efficient than those operating with hand-edited algorithm schedules, say experts at MIT. The researchers there say they have developed an automated scheduler that speeds cluster jobs by up to 20 or 30 percent, and even faster (2x) in peak periods.

The school’s AI job scheduler works on a type of AI called “reinforcement learning” (RL). That’s a trial-and-error-based machine-learning method that modifies scheduling decisions depending on actual workloads in a specific cluster. AI, when done right, could supersede the current state-of-the-art method, which is algorithms. They often must be fine-tuned by humans, introducing inefficiency.

“The system could enable data centers to handle the same workload at higher speeds, using fewer resources,” [the school says in a news article related to the tech][1]. The MIT researchers say the data center-adapted form of RL could revolutionize operations.

**Also read: [AI boosts data center availability and efficiency][2]**

“If you have a way of doing trial and error using machines, they can try different ways of scheduling jobs and automatically figure out which strategy is better than others,” says Hongzi Mao, a student in the university’s Department of Electrical Engineering and Computer Science, in the article. “Any slight improvement in utilization, even 1%, can save millions of dollars and a lot of energy.”

### What's wrong with today's data center algorithms

The problem with the current algorithms for running tasks on thousands of servers at the same time is that they’re not very efficient. Theoretically, they should be, but because workloads (combinations of tasks) are varied, humans get involved in tweaking the performance—a resource, say, might need to be shared between jobs, or some jobs might need to be performed faster than others—but humans can’t handle the range or scope of the edits; the job is just too big.

Unfathomable permutations for humans in the manually edited scheduling can include the fact that a lower node (smaller computational task) can’t start work until an upper node (larger, more power-requiring computational task) has completed its work. It gets highly complicated allocating the computational resources, the scientists explain.

Decima, MIT’s system, can process dynamic graphs (representations) of nodes and edges (edges connect nodes, linking tasks), the school says. That hasn’t been possible before with RL because RL hasn’t been able to understand the graphs well enough at scale.

“Traditional RL systems are not accustomed to processing such dynamic graphs,” MIT says.

MIT’s graph-oriented AI is different than other forms of AI that are more commonly used with images. Robots, for example, learn the difference between objects in different scenarios by processing images and getting reward signals when they get it right.

Similar, though, to presenting images to robots, workloads in the Decima system are mimicked until the system, through the receipt of AI reward signals, improves its decisions. A special kind of baselining (comparison to history) then helps Decima figure out which actions are good and which ones are bad, even when the workload sequences only supply poor reward signals due to the complication of the job structures slowing everything down. That baselining is a key differentiator in the MIT system.

“Decima can find opportunities for [scheduling] optimization that are simply too onerous to realize via manual design/tuning processes,” says Aditya Akella, a professor at University of Wisconsin at Madison, in the MIT article. The team there has developed a number of high-performance schedulers. “Decima can go a step further,” Akella says.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3434597/data-center-specific-ai-completes-tasks-twice-as-fast.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: http://news.mit.edu/2019/decima-data-processing-0821
[2]: https://www.networkworld.com/article/3274654/ai-boosts-data-center-availability-efficiency.html
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
