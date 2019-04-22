[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with social media sentiment analysis in Python)
[#]: via: (https://opensource.com/article/19/4/social-media-sentiment-analysis-python)
[#]: author: (Michael McCune  https://opensource.com/users/elmiko/users/jschlessman)

Getting started with social media sentiment analysis in Python
======
Learn the basics of natural language processing and explore two useful
Python packages.
![Raspberry Pi and Python][1]

Natural language processing (NLP) is a type of machine learning that addresses the correlation between spoken/written languages and computer-aided analysis of those languages. We experience numerous innovations from NLP in our daily lives, from writing assistance and suggestions to real-time speech translation and interpretation.

This article examines one specific area of NLP: sentiment analysis, with an emphasis on determining the positive, negative, or neutral nature of the input language. This part will explain the background behind NLP and sentiment analysis and explore two open source Python packages. [Part 2][2] will demonstrate how to begin building your own scalable sentiment analysis services.

When learning sentiment analysis, it is helpful to have an understanding of NLP in general. This article won't dig into the mathematical guts, rather our goal is to clarify key concepts in NLP that are crucial to incorporating these methods into your solutions in practical ways.

### Natural language and text data

A reasonable place to begin is defining: "What is natural language?" It is the means by which we, as humans, communicate with one another. The primary modalities for communication are verbal and text. We can take this a step further and focus solely on text communication; after all, living in an age of pervasive Siri, Alexa, etc., we know speech is a group of computations away from text.

### Data landscape and challenges

Limiting ourselves to textual data, what can we say about language and text? First, language, particularly English, is fraught with exceptions to rules, plurality of meanings, and contextual differences that can confuse even a human interpreter, let alone a computational one. In elementary school, we learn articles of speech and punctuation, and from speaking our native language, we acquire intuition about which words have less significance when searching for meaning. Examples of the latter would be articles of speech such as "a," "the," and "or," which in NLP are referred to as _stop words_ , since traditionally an NLP algorithm's search for meaning stops when reaching one of these words in a sequence.

Since our goal is to automate the classification of text as belonging to a sentiment class, we need a way to work with text data in a computational fashion. Therefore, we must consider how to represent text data to a machine. As we know, the rules for utilizing and interpreting language are complicated, and the size and structure of input text can vary greatly. We'll need to transform the text data into numeric data, the form of choice for machines and math. This transformation falls under the area of _feature extraction_.

Upon extracting numeric representations of input text data, one refinement might be, given an input body of text, to determine a set of quantitative statistics for the articles of speech listed above and perhaps classify documents based on them. For example, a glut of adverbs might make a copywriter bristle, or excessive use of stop words might be helpful in identifying term papers with content padding. Admittedly, this may not have much bearing on our goal of sentiment analysis.

### Bag of words

When you assess a text statement as positive or negative, what are some contextual clues you use to assess its polarity (i.e., whether the text has positive, negative, or neutral sentiment)? One way is connotative adjectives: something called "disgusting" is viewed as negative, but if the same thing were called "beautiful," you would judge it as positive. Colloquialisms, by definition, give a sense of familiarity and often positivity, whereas curse words could be a sign of hostility. Text data can also include emojis, which carry inherent sentiments.

Understanding the polarity influence of individual words provides a basis for the [_bag-of-words_][3] (BoW) model of text. It considers a set of words or vocabulary and extracts measures about the presence of those words in the input text. The vocabulary is formed by considering text where the polarity is known, referred to as _labeled training data_. Features are extracted from this set of labeled data, then the relationships between the features are analyzed and labels are associated with the data.

The name "bag of words" illustrates what it utilizes: namely, individual words without consideration of spatial locality or context. A vocabulary typically is built from all words appearing in the training set, which tends to be pruned afterward. Stop words, if not cleaned prior to training, are removed due to their high frequency and low contextual utility. Rarely used words can also be removed, given the lack of information they provide for general input cases.

It is important to note, however, that you can (and should) go further and consider the appearance of words beyond their use in an individual instance of training data, or what is called [_term frequency_][4] (TF). You should also consider the counts of a word through all instances of input data; typically the infrequency of words among all documents is notable, which is called the [_inverse document frequency_][5] (IDF). These metrics are bound to be mentioned in other articles and software packages on this subject, so having an awareness of them can only help.

BoW is useful in a number of document classification applications; however, in the case of sentiment analysis, things can be gamed when the lack of contextual awareness is leveraged. Consider the following sentences:

  * We are not enjoying this war.
  * I loathe rainy days, good thing today is sunny.
  * This is not a matter of life and death.



The sentiment of these phrases is questionable for human interpreters, and by strictly focusing on instances of individual vocabulary words, it's difficult for a machine interpreter as well.

Groupings of words, called _n-grams_ , can also be considered in NLP. A bigram considers groups of two adjacent words instead of (or in addition to) the single BoW. This should alleviate situations such as "not enjoying" above, but it will remain open to gaming due to its loss of contextual awareness. Furthermore, in the second sentence above, the sentiment context of the second half of the sentence could be perceived as negating the first half. Thus, spatial locality of contextual clues also can be lost in this approach. Complicating matters from a pragmatic perspective is the sparsity of features extracted from a given input text. For a thorough and large vocabulary, a count is maintained for each word, which can be considered an integer vector. Most documents will have a large number of zero counts in their vectors, which adds unnecessary space and time complexity to operations. While a number of clever approaches have been proposed for reducing this complexity, it remains an issue.

### Word embeddings

Word embeddings are a distributed representation that allows words with a similar meaning to have a similar representation. This is based on using a real-valued vector to represent words in connection with the company they keep, as it were. The focus is on the manner that words are used, as opposed to simply their existence. In addition, a huge pragmatic benefit of word embeddings is their focus on dense vectors; by moving away from a word-counting model with commensurate amounts of zero-valued vector elements, word embeddings provide a more efficient computational paradigm with respect to both time and storage.

Following are two prominent word embedding approaches.

#### Word2vec

The first of these word embeddings, [Word2vec][6], was developed at Google. You'll probably see this embedding method mentioned as you go deeper in your study of NLP and sentiment analysis. It utilizes either a _continuous bag of words_ (CBOW) or a _continuous skip-gram_ model. In CBOW, a word's context is learned during training based on the words surrounding it. Continuous skip-gram learns the words that tend to surround a given word. Although this is more than what you'll probably need to tackle, if you're ever faced with having to generate your own word embeddings, the author of Word2vec advocates the CBOW method for speed and assessment of frequent words, while the skip-gram approach is better suited for embeddings where rare words are more important.

#### GloVe

The second word embedding, [_Global Vectors for Word Representation_][7] (GloVe), was developed at Stanford. It's an extension to the Word2vec method that attempts to combine the information gained through classical global text statistical feature extraction with the local contextual information determined by Word2vec. In practice, GloVe has outperformed Word2vec for some applications, while falling short of Word2vec's performance in others. Ultimately, the targeted dataset for your word embedding will dictate which method is optimal; as such, it's good to know the existence and high-level mechanics of each, as you'll likely come across them.

#### Creating and using word embeddings

Finally, it's useful to know how to obtain word embeddings; in part 2, you'll see that we are standing on the shoulders of giants, as it were, by leveraging the substantial work of others in the community. This is one method of acquiring a word embedding: namely, using an existing trained and proven model. Indeed, myriad models exist for English and other languages, and it's possible that one does what your application needs out of the box!

If not, the opposite end of the spectrum in terms of development effort is training your own standalone model without consideration of your application. In essence, you would acquire substantial amounts of labeled training data and likely use one of the approaches above to train a model. Even then, you are still only at the point of acquiring understanding of your input-text data; you then need to develop a model specific for your application (e.g., analyzing sentiment valence in software version-control messages) which, in turn, requires its own time and effort.

You also could train a word embedding on data specific to your application; while this could reduce time and effort, the word embedding would be application-specific, which would reduce reusability.

### Available tooling options

You may wonder how you'll ever get to a point of having a solution for your problem, given the intensive time and computing power needed. Indeed, the complexities of developing solid models can be daunting; however, there is good news: there are already many proven models, tools, and software libraries available that may provide much of what you need. We will focus on [Python][8], which conveniently has a plethora of tooling in place for these applications.

#### SpaCy

[SpaCy][9] provides a number of language models for parsing input text data and extracting features. It is highly optimized and touted as the fastest library of its kind. Best of all, it's open source! SpaCy performs tokenization, parts-of-speech classification, and dependency annotation. It contains word embedding models for performing this and other feature extraction operations for over 46 languages. You will see how it can be used for text analysis and feature extraction in the second article in this series.

#### vaderSentiment

The [vaderSentiment][10] package provides a measure of positive, negative, and neutral sentiment. As the [original paper][11]'s title ("VADER: A Parsimonious Rule-based Model for Sentiment Analysis of Social Media Text") indicates, the models were developed and tuned specifically for social media text data. VADER was trained on a thorough set of human-labeled data, which included common emoticons, UTF-8 encoded emojis, and colloquial terms and abbreviations (e.g., meh, lol, sux).

For given input text data, vaderSentiment returns a 3-tuple of polarity score percentages. It also provides a single scoring measure, referred to as _vaderSentiment's compound metric_. This is a real-valued measurement within the range **[-1, 1]** wherein sentiment is considered positive for values greater than **0.05** , negative for values less than **-0.05** , and neutral otherwise.

In [part 2][2], you will learn how to use these tools to add sentiment analysis capabilities to your designs.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/social-media-sentiment-analysis-python

作者：[Michael McCune ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/elmiko/users/jschlessman
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/getting_started_with_python.png?itok=MFEKm3gl (Raspberry Pi and Python)
[2]: https://opensource.com/article/19/4/social-media-sentiment-analysis-python-part-2
[3]: https://en.wikipedia.org/wiki/Bag-of-words_model
[4]: https://en.wikipedia.org/wiki/Tf%E2%80%93idf#Term_frequency
[5]: https://en.wikipedia.org/wiki/Tf%E2%80%93idf#Inverse_document_frequency
[6]: https://en.wikipedia.org/wiki/Word2vec
[7]: https://en.wikipedia.org/wiki/GloVe_(machine_learning)
[8]: https://www.python.org/
[9]: https://pypi.org/project/spacy/
[10]: https://pypi.org/project/vaderSentiment/
[11]: http://comp.social.gatech.edu/papers/icwsm14.vader.hutto.pdf
