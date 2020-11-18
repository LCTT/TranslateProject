[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to create trust in artificial intelligence using open source)
[#]: via: (https://opensource.com/article/20/11/ai-open-source)
[#]: author: (Rebecca Whitworth https://opensource.com/users/rsimmond)

How to create trust in artificial intelligence using open source
======
Opening up the "black box" helps remove uncertainties about AI outcomes,
providing insight into the modeling process and identifying biases and
errors.
![Brain on a computer screen][1]

Artificial intelligence (AI) is being used more frequently in our daily lives, with systems such as Siri and Alexa becoming commonplace in many households. Many households themselves are "smart," powered by devices that can control your lights, heating and air, and even the music playing. And those music players are powered by AI that recommends songs and artists you may like.

However, these systems are often referred to as "black box" systems because we do not know how the data is processed—how do the users know why the model has made that prediction? The advent and widespread adoption of deep neural networks, while providing impressive results, made this even more critical, since humans can't logically interpret how information is processed within thousands of neurons.

A more safety-critical example of AI systems is when doctors use them to reduce stress loads. These systems do this by quickly ingesting data at a rapid rate; for example, thousands of medical journals could be read and parsed by AI exponentially faster than by a human. This data can then be used to train predictive models, which are used to help doctors diagnose patients, this time armed with far more data points than were available before and in a quicker time. People assume that, with all this information, a machine can make "better" decisions than humans. However, how can we trust a machine to make such critical decisions when we do not fully understand the data processing techniques?

Open source supports many methods and applications that can lead to better trust in AI systems. In this article, we will explore some of those open source projects as well as the open source mentality, and how by becoming part of the open source community, you can gain more trust in your AI.

Projects like [LIME][2] and [SHAP][3], which are open source, can explain the outcome of a prediction. To illustrate how this works, let's look at a loan request use case. Based on an AI outcome, a bank rejects a customer who has made a loan request, but why did the algorithm return that outcome? Projects like these aim to make the model more explainable by showing feature importance graphs, i.e., which features were significant to the outcome of the model. Features are the inputs that generate the prediction. In this example, if an important feature used to reject the loan had been "gender," then this would mean the model is biased or incorrect. If the model is known to be wrong, then retraining it will give improved predictions.

These projects help to build trust in AI systems by explaining the black box model and introspecting decision-making. By open sourcing projects such as this, we can ensure confidence in the system due to the openness of the predictive modeling process. It can give stakeholders confidence that the model is correct and that its recommendations can be trusted, so there is less business risk.

Open source can stop unfairness, such as the gender-bias example above, by iteratively testing the system's potential outcomes quickly and effectively. If the model is biased, then a notification to the community can be made in a timely fashion, as there are more developers in the community than there would be if the project was closed source. Therefore, if there is trust in the community, then there can be trust in the system.

Open source platforms leverage ideas from a broad group of peers and offer greater opportunity to innovate and create worthwhile features in a system. These ideas focus the project in a user-driven direction, and improvements come from the developers/users themselves. The system is trustworthy because it has a user-centric design pattern and fosters knowledge of system development and execution. Essentially, the people who have made the system can trust the system.

When an AI system fails, people may be offended or misled. The project or organization loses people's confidence, and it creates distrust of the system overall. Credibility can be protected by making an AI project open source, because with more testers in the community, the more the data and performance can be verified.

By leveraging the community-focused nature of open source, we can also ensure that more people with a wider variety of skill sets routinely check the codebase. Predictive models are very good at recognizing patterns; however, they can fail when faced with an outlier. Humans, on the other hand, are very good at being able to recognize and respond to anomalies and nuance. Therefore, having humans involved in the AI system is integral to stopping mistakes, which, in the example use case of the doctor, could actually be deadly. It is essential to have domain experts to check the system's outcomes, and the more, the better.

Community-focused feature development can also improve trust by ensuring that the project meets company regulations. The community can include stakeholders from the business who can then lead the development focus and reduce business risk.

A closed approach to AI can lead to inadequate feature design choices that are not relevant to the current needs of the community and businesses. Such features can be harmful to the system; for example, if a medical system's patient diagnostic function has poor accuracy due to lack of testing, then this will mean more human intervention and, ultimately, less trust.

A closed approach can also stifle creativity and freedom to develop innovative ideas, and it stops the feedback loop on ideas from community users or people outside of the company. A feedback loop is useful, as the people who are developing it have a greater knowledge of the system and how it works, and if the community knows it works, then they are more likely to use it.

Trusting AI can be hard when people use black box models, due to the lack of understanding of what they are doing and how they work. Open source mentality and models help users and developers to create more trust in AI by opening up the black box, encouraging iterative and collaborative development, and using the community to ensure proper functionality and fewer bugs. Open source allows AI to reach its potential in a trustworthy and meaningful way for users.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/ai-open-source

作者：[Rebecca Whitworth][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rsimmond
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brain_computer_solve_fix_tool.png?itok=okq8joti (Brain on a computer screen)
[2]: https://github.com/marcotcr/lime
[3]: https://github.com/slundberg/shap
