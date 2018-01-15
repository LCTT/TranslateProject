AI and machine learning bias has dangerous implications
======
Translating

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW_goodbadugly.png?itok=ZxaimUWU)

Image by : opensource.com

Algorithms are everywhere in our world, and so is bias. From social media news feeds to streaming service recommendations to online shopping, computer algorithms--specifically, machine learning algorithms--have permeated our day-to-day world. As for bias, we need only examine the 2016 American election to understand how deeply--both implicitly and explicitly--it permeates our society as well.

What's often overlooked, however, is the intersection between these two: bias in computer algorithms themselves.

Contrary to what many of us might think, technology is not objective. AI algorithms and their decision-making processes are directly shaped by those who build them--what code they write, what data they use to "[train][1]" the machine learning models, and how they [stress-test][2] the models after they're finished. This means that the programmers' values, biases, and human flaws are reflected in the software. If I fed an image-recognition algorithm the faces of only white researchers in my lab, for instance, it [wouldn't recognize non-white faces as human][3]. Such a conclusion isn't the result of a "stupid" or "unsophisticated" AI, but to a bias in training data: a lack of diverse faces. This has dangerous consequences.

There's no shortage of examples. [State court systems][4] across the country use "black box" algorithms to recommend prison sentences for convicts. [These algorithms are biased][5] against black individuals because of the data that trained them--so they recommend longer sentences as a result, thus perpetuating existing racial disparities in prisons. All this happens under the guise of objective, "scientific" decision-making.

The United States federal government uses machine-learning algorithms to calculate welfare payouts and other types of subsidies. But [information on these algorithms][6], such as their creators and their training data, is extremely difficult to find--which increases the risk of public officials operating under bias and meting out systematically unfair payments.

This list goes on. From Facebook news algorithms to medical care systems to police body cameras, we as a society are at great risk of inserting our biases--racism, sexism, xenophobia, socioeconomic discrimination, confirmation bias, and more--into machines that will be mass-produced and mass-distributed, operating under the veil of perceived technological objectivity.

This must stop.

While we should by no means halt research and development on artificial intelligence, we need to slow its development such that we tread carefully. The danger of algorithmic bias is already too great.

## How can we fight algorithmic bias?

One of the best ways to fight algorithmic bias is by vetting the training data fed into machine learning models themselves. As [researchers at Microsoft][2] point out, this can take many forms.

The data itself might have a skewed distribution--for instance, programmers may have more data about United States-born citizens than immigrants, and about rich men than poor women. Such imbalances will cause an AI to make improper conclusions about how our society is in fact represented--i.e., that most Americans are wealthy white businessmen--simply because of the way machine-learning models make statistical correlations.

It's also possible, even if men and women are equally represented in training data, that the representations themselves result in prejudiced understandings of humanity. For instance, if all the pictures of "male occupation" are of CEOs and all those of "female occupation" are of secretaries (even if more CEOs are in fact male than female), the AI could conclude that women are inherently not meant to be CEOs.

We can imagine similar issues, for example, with law enforcement AIs that examine representations of criminality in the media, which dozens of studies have shown to be [egregiously slanted][7] towards black and Latino citizens.

Bias in training data can take many other forms as well--unfortunately, more than can be adequately covered here. Nonetheless, training data is just one form of vetting; it's also important that AI models are "stress-tested" after they're completed to seek out prejudice.

If we show an Indian face to our camera, is it appropriately recognized? Is our AI less likely to recommend a job candidate from an inner city than a candidate from the suburbs, even if they're equally qualified? How does our terrorism algorithm respond to intelligence on a white domestic terrorist compared to an Iraqi? Can our ER camera pull up medical records of children?

These are obviously difficult issues to resolve in the data itself, but we can begin to identify and address them through comprehensive testing.

## Why is open source well-suited for this task?

Both open source technology and open source methodologies have extreme potential to help in this fight against algorithmic bias.

Modern artificial intelligence is dominated by open source software, from TensorFlow to IBM Watson to packages like [scikit-learn][8]. The open source community has already proven extremely effective in developing robust and rigorously tested machine-learning tools, so it follows that the same community could effectively build anti-bias tests into that same software.

Debugging tools like [DeepXplore][9], out of Columbia and Lehigh Universities, for example, make the AI stress-testing process extensive yet also easy to navigate. This and other projects, such as work being done at [MIT's Computer Science and Artificial Intelligence Lab][10], develop the agile and rapid prototyping the open source community should adopt.

Open source technology has also proven to be extremely effective for vetting and sorting large sets of data. Nothing should make this more obvious than the domination of open source tools in the data analysis market (Weka, Rapid Miner, etc.). Tools for identifying data bias should be designed by the open source community, and those techniques should also be applied to the plethora of open training data sets already published on sites like [Kaggle][11].

The open source methodology itself is also well-suited for designing processes to fight bias. Making conversations about software open, democratized, and in tune with social good are pivotal to combating an issue that is partly caused by the very opposite--closed conversations, private software development, and undemocratized decision-making. If online communities, corporations, and academics can adopt these open source characteristics when approaching machine learning, fighting algorithmic bias should become easier.

## How can we all get involved?

Education is extremely important. We all know people who may be unaware of algorithmic bias but who care about its implications--for law, social justice, public policy, and more. It's critical to talk to those people and explain both how the bias is formed and why it matters because the only way to get these conversations started is to start them ourselves.

For those of us who work with artificial intelligence in some capacity--as developers, on the policy side, through academic research, or in other capacities--these conversations are even more important. Those who are designing the artificial intelligence of tomorrow need to understand the extreme dangers that bias presents today; clearly, integrating anti-bias processes into software design depends on this very awareness.

Finally, we should all build and strengthen open source community around ethical AI. Whether that means contributing to software tools, stress-testing machine learning models, or sifting through gigabytes of training data, it's time we leverage the power of open source methodology to combat one of the greatest threats of our digital age.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/1/how-open-source-can-fight-algorithmic-bias

作者：[Justin Sherman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/justinsherman
[1]:https://www.crowdflower.com/what-is-training-data/
[2]:https://medium.com/microsoft-design/how-to-recognize-exclusion-in-ai-ec2d6d89f850
[3]:https://www.ted.com/talks/joy_buolamwini_how_i_m_fighting_bias_in_algorithms
[4]:https://www.wired.com/2017/04/courts-using-ai-sentence-criminals-must-stop-now/
[5]:https://www.propublica.org/article/machine-bias-risk-assessments-in-criminal-sentencing
[6]:https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3012499
[7]:https://www.hivlawandpolicy.org/sites/default/files/Race%20and%20Punishment-%20Racial%20Perceptions%20of%20Crime%20and%20Support%20for%20Punitive%20Policies%20%282014%29.pdf
[8]:http://scikit-learn.org/stable/
[9]:https://arxiv.org/pdf/1705.06640.pdf
[10]:https://www.csail.mit.edu/research/understandable-deep-networks
[11]:https://www.kaggle.com/datasets
