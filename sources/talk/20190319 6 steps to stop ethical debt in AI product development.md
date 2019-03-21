[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 steps to stop ethical debt in AI product development)
[#]: via: (https://opensource.com/article/19/3/ethical-debt-ai-product-development)
[#]: author: (Lauren Maffeo https://opensource.com/users/lmaffeo)

6 steps to stop ethical debt in AI product development
======

Machine bias in artificial intelligence is a known and unavoidable problem—but it is not unmanageable.

![old school calculator][1]

It's official: artificial intelligence (AI) isn't the unbiased genius we want it to be.

Alphabet (Google's parent company) used its latest annual report [to warn][2] that ethical concerns about its products might hurt future revenue. Entrepreneur Joy Buolamwini established the [Safe Face Pledge][3] to prevent abuse of facial analysis technology.

And years after St. George's Hospital Medical School in London was found to have used AI that inadvertently [screened out qualified female candidates][4], Amazon scrapped a recruiting tool last fall after machine learning (ML) specialists found it [doing the same thing][5].

We've learned the hard way that technologies built with AI are biased like people. Left unchecked, the datasets used to train such products can pose [life-or-death consequences][6] for their end users.

For example, imagine a self-driving car that can't recognize commands from people with certain accents. If the dataset used to train the technology powering that car isn't exposed to enough voice variations and inflections, it risks not recognizing all its users as fully human.

Here's the good news: Machine bias in AI is unavoidable—but it is _not_ unmanageable. Just like product and development teams work to reduce technical debt, you can [reduce the risk of ethical debt][7] as well.

Here are six steps that your technical team can start taking today:

### 1\. Document your priorities upfront

Reducing ethical debt within your product will require you to answer two key questions in the product specification phase:

  * Which methods of fairness will you use?
  * How will you prioritize them?



If your team is building a product based on ML, it's not enough to reactively fix bugs or pull products from shelves. Instead, answer these questions [in your tech spec][8] so that they're included from the start of your product lifecycle.

### 2\. Train your data under fairness constraints

This step is tough because when you try to control or eliminate both direct and indirect bias, you'll find yourself in a Catch-22.

If you train exclusively on non-sensitive attributes, you eliminate direct discrimination but introduce or reinforce indirect bias.

However, if you train separate classifiers for each sensitive feature, you reintroduce direct discrimination.

Another challenge is that detection can occur only after you've trained your model. When this occurs, the only recourse is to scrap the model and retrain it from scratch.

To reduce these risks, don't just measure average strengths of acceptance and rejection across sensitive groups. Instead, use limits to determine what is or isn't included in the model you're training. When you do this, discrimination tests are expressed as restrictions and limitations on the learning process.

### 3\. Monitor your datasets throughout the product lifecycle

Developers build training sets based on data they hope the model will encounter. But many don't monitor the data their creations receive from the real world.

ML products are unique in that they're continuously taking in data. New data allows the algorithms powering these products to keep refining their results.

But such products often encounter data in deployment that differs from what they were trained on in production. It's also not uncommon for the algorithm to be updated without the model itself being revalidated.

This risk will decrease if you appoint someone to monitor the source, history, and context of the data in your algorithm. This person should conduct continuous audits to find unacceptable behavior.

Bias should be reduced as much as possible while maintaining an acceptable level of accuracy, as defined in the product specification. If unacceptable biases or behaviors are detected, the model should be rolled back to an earlier state prior to the first time you saw bias.

### 4\. Use tagged training data

We live in a world with trillions of images and videos at our fingertips, but most neural networks can't use this data for one reason: Most of it isn't tagged.

Tagging refers to which classes are present in an image and their locations. When you tag an image, you share which classes are present and where they're located.

This sounds simple—until you realize how much work it would take to draw shapes around every single person in a photo of a crowd or a box around every single person on a highway.

Even if you succeeded, you might rush your tagging and draw your shapes sloppily, leading to a poorly trained neural network.

The good news is that more products are coming to market so they can decrease the time and cost of tagging.

As one example, [Brain Builder][9] is a data annotation product from Neurala that uses open source frameworks like TensorFlow and Caffe. Its goal is to help users [manage and annotate their training data][10]. It also aims to bring diverse class examples to datasets—another key step in data training.

### 5\. Use diverse class examples

Training data needs positive and negative examples of classes. If you want specific classes of objects, you need negative examples as well. This (hopefully) mimics the data that the algorithm will encounter in the wild.

Consider the example of “homes” within a dataset. If the algorithm contains only images of homes in North America, it won't know to recognize homes in Japan, Morocco, or other international locations. Its concept of a “home” is thus limited.

Neurala warns, "Most AI applications require thousands of images to be tagged, and since data tagging cost is proportional to the time spent tagging, this step alone often costs tens to hundreds of thousands of dollars per project."

Luckily, 2018 saw a strong increase in the number of open source AI datasets. Synced has a helpful [roundup of 10 datasets][11]—from multi-label images to semantic parsing—that were open sourced last year. If you're looking for datasets by industry, GitHub [has a longer list][12].

### 6\. Focus on the subject, not the context

Tech leaders in monitoring ML datasets should aim to understand how the algorithm classifies data. That's because AI sometimes focuses on irrelevant attributes that are shared by several targets in the training set.

Let's start by looking at the biased training set below. Wolves were tagged standing in snow, but the model wasn't shown images of dogs. So, when dogs were introduced, the model started tagging them as wolves because both animals were standing in snow. In this case, the AI put too much emphasis on the context (a snowy backdrop).

![Wolves in snow][13]

Source: [Gartner][14] (full research available for clients)

By contrast, here is a training set from Brain Builder that is focused on the subject dogs. When monitoring your own training set, make sure the AI is giving more weight to the subject of each image. If you saw an image classifier state that one of the dogs below is a wolf, you would need to know which aspects of the input led to this misclassification. This is a sign to check your training set and confirm that the data is accurate.

![Dogs training set][15]

Source: [Brain Builder][16]

Reducing ethical debt isn't just the “right thing to do”—it also reduces _technical_ debt. Since programmatic bias is so tough to detect, working to reduce it, from the start of your lifecycle, will save you the need to retrain models from scratch.

This isn't an easy or perfect job; tech teams will have to make tradeoffs between fairness and accuracy. But this is the essence of product management: compromises based on what's best for the product and its end users.

Strategy is the soul of all strong products. If your team includes measures of fairness and algorithmic priorities from the start, you'll sail ahead of your competition.

* * *

_Lauren Maffeo will present_ [_Erase Unconscious Bias From Your AI Datasets_][17] _at[DrupalCon][18] in Seattle, April 8-12, 2019._

* * *

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/ethical-debt-ai-product-development

作者：[Lauren Maffeo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lmaffeo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/math_money_financial_calculator_colors.jpg?itok=_yEVTST1 (old school calculator)
[2]: https://www.yahoo.com/news/google-warns-rise-ai-may-181710642.html?soc_src=mail&soc_trk=ma
[3]: https://www.safefacepledge.org/
[4]: https://futurism.com/ai-bias-black-box
[5]: https://uk.reuters.com/article/us-amazon-com-jobs-automation-insight/amazon-scraps-secret-ai-recruiting-tool-that-showed-bias-against-women-idUKKCN1MK08G
[6]: https://opensource.com/article/18/10/open-source-classifiers-ai-algorithms
[7]: https://thenewstack.io/tech-ethics-new-years-resolution-dont-build-software-you-will-regret/
[8]: https://eng.lyft.com/awesome-tech-specs-86eea8e45bb9
[9]: https://www.neurala.com/tech
[10]: https://www.roboticsbusinessreview.com/ai/brain-builder-neurala-video-annotation/
[11]: https://medium.com/syncedreview/2018-in-review-10-open-sourced-ai-datasets-696b3b49801f
[12]: https://github.com/awesomedata/awesome-public-datasets
[13]: https://opensource.com/sites/default/files/uploads/wolves_in_snow.png (Wolves in snow)
[14]: https://www.gartner.com/doc/3889586/control-bias-eliminate-blind-spots
[15]: https://opensource.com/sites/default/files/uploads/ai_ml_canine_recognition.png (Dogs training set)
[16]: https://www.neurala.com/
[17]: https://events.drupal.org/seattle2019/sessions/erase-unconscious-bias-your-ai-datasets
[18]: https://events.drupal.org/seattle2019
