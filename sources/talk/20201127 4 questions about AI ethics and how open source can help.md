[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 questions about AI ethics and how open source can help)
[#]: via: (https://opensource.com/article/20/11/ai-ethics)
[#]: author: (Sahana Sreeram https://opensource.com/users/sahanasreeram01gmailcom)

4 questions about AI ethics and how open source can help
======
Open source resources could provide effective solutions to some key
ethical considerations for artificial intelligence.
![A robot arm illustration][1]

As a high school student, I've become very interested in artificial intelligence (AI), which is emerging as one of the most impactful innovations of recent times. This past summer, I was selected for the [AI4ALL][2] program, where we learned how to develop AI systems using Python.

For my final project, I created an object-detection program and integrated it with a virtual drone simulation. Throughout the project, I was able to use open source frameworks, including [TensorFlow][3], [Keras][4], [Scikit-learn][5], and [PyTorch][6], to aid in developing the object-detection machine learning (ML) algorithm process.

By doing this project and using other open source frameworks like [Linux][7], [Apache Kafka][8], and [ElasticSearch][9], I realized the impact of open source technologies on AI system development. Access to these powerful, flexible technologies enables people to experiment with and develop AI systems.

I discovered another important aspect of AI when I attended a seminar at [William &amp; Mary][10] about AI and ethics. As we discussed some of the ethical concerns surrounding AI systems, I started wondering: How do I make sure that the systems I'm developing are ethical?

To answer my question, I interviewed three experts: [Alon Kaufman][11], PhD, CEO of Duality Technologies; [Iria Giuffrida][12], PhD, a law professor at William &amp; Mary; and an executive in the fintech industry (name kept confidential upon request). I am very grateful to these experts for giving me their valuable time, fueling my curiosity, and inspiring me with their journeys in this field.

### How important of a role does ethics currently play in AI systems?

As more advances are made with AI, society is starting to appreciate the importance of ethical implications. However, the discussions about ethical values in AI system development are still an academic exercise, Dr. Kaufman says. Today, much of AI, and especially ML models, remains a "black box" because advanced algorithms and complex AI technologies (such as deep learning) produce models that are not self-explainable. Without having explainable AI/ML models, it's hard to introduce ethical considerations into the conversation. 

For Dr. Kaufman, the industry's focus today is on data security and protection. As more smart technology is developed, it's getting easier to acquire data. The large amounts of data handled in AI systems make them vulnerable to cyber breaches.

While it is certainly vital to build data protection measures for AI systems, it is becoming critical to shift the focus to other ethical implications, such as privacy and machine bias.

### Is ethical AI development a good goal for the future, or is it wishful thinking?

The short answer is that it is a reasonable goal to create ethical AI systems, but it will take time.

"Ethics" is a difficult concept to define. One approach is to look at ethics through a three-pronged methodology: security, privacy, and fairness. Most of the industry is now focused on security, and a practical next step could be to address the issues of privacy and ensuring data anonymity. "Privacy-enhancing technologies, such as secure computing and [synthetic data][13] could offer assistance in this process," explains Dr. Kaufman. Only after finding solutions to the security and privacy areas of ethics is it reasonable to venture into machine fairness and bias.

There are many factors to consider in the development of unbiased AI. "The first step is the deployment of active-learning models into society, followed by the actual development of [fair systems][14]," says the fintech industry expert. He explains that when ML equipped with active learning is deployed, society's own biases are often imposed on the model, even unknowingly, creating very flawed systems. When developers create AI systems, their preconceived notions must never be injected into the system code, says Dr. Kaufman. These are some of the key areas that must be addressed in developing unbiased models.

### How early should students be exposed to ethical considerations in AI/ML?

It's increasingly important to learn not only about computer science principles but also about how to build ethical models. Professor Giuffrida says computer scientists and AI developers have not explicitly been trained to think about the ethics behind their systems. This is why the development of bias-proof systems cannot be a linear process, she says; they must go through multiple review levels to minimize injecting bias in the machine process.

Professor Giuffrida emphasizes that AI development should be treated as an interdisciplinary study, meaning that it is not just developers who are in charge of creating accurate and ethical systems—that's an enormous responsibility to put on one group. But introducing ethical concepts to aspiring AI engineers at a foundational level could accelerate building sustainable, functional, and ethical systems.

### Will ethics come at the expense of innovation?

This was the main question I kept coming back to throughout the interviews. During the AI4ALL course, we explored the recent [Genderify fiasco][15], which was AI software intended to identify a user's gender based on several data points, including name, email address, and username. When launched for public use, the results were highly inaccurate—for example, the name "Meghan Smith" was assigned female, but "Dr. Meghan Smith" was assigned male. These biases led to the service's failure. More comprehensive ethical reviews and tests conducted before launch could make this type of product successful, at least initially.

All three experts voiced the idea that ethical boundaries are becoming necessary. According to the fintech executive, "Reasonable ethical constraints will not limit innovation—companies must eventually figure out how to innovate within these boundaries." In this fashion, ethical considerations could increase sustainability and success for a product—rather than putting a complete stop to AI development. Venture capitalist Rob Toews offered an interesting perspective on [regulating AI][16], and I recommend this article if you want to learn more about this topic.

Ultimately, introducing ethics into pure AI is a daunting but necessary step to secure AI's viability in our world. Open source resources could provide effective solutions to some key ethical considerations, including comprehensive system testing. For example, the [AI Fairness 360][17] open source toolkit by IBM assesses discrimination and biases in ML models. Open source communities have the ability to develop tools like this to provide greater coverage and support for ethical AI systems. In the meantime, I believe it is my generation's responsibility to build bridges between creating revolutionary AI technologies and considering ethical implications that will stand the test of time.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/ai-ethics

作者：[Sahana Sreeram][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sahanasreeram01gmailcom
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/robot_arm_artificial_ai.png?itok=8CUU3U_7 (A robot arm illustration)
[2]: https://ai-4-all.org/
[3]: https://www.tensorflow.org/
[4]: https://keras.io/
[5]: https://scikit-learn.org/stable/
[6]: https://pytorch.org/
[7]: https://www.linux.org/
[8]: https://kafka.apache.org/
[9]: https://www.elastic.co/
[10]: https://www.wm.edu/
[11]: https://www.linkedin.com/in/alon-kaufman-24067b154/
[12]: https://law2.wm.edu/faculty/bios/fulltime/igiuffrida.php
[13]: https://en.wikipedia.org/wiki/Synthetic_data
[14]: https://en.wikipedia.org/wiki/Fairness_(machine_learning)
[15]: https://www.theverge.com/2020/7/29/21346310/ai-service-gender-verification-identification-genderify
[16]: https://www.forbes.com/sites/robtoews/2020/06/28/here-is-how-the-united-states-should-regulate-artificial-intelligence/?sh=1c242ebc7821
[17]: https://aif360.mybluemix.net/
