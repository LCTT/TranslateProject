[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Deep Learning Based Chatbots are Smarter)
[#]: via: (https://opensourceforu.com/2019/09/deep-learning-based-chatbots-are-smarter/)
[#]: author: (Dharmendra Patel https://opensourceforu.com/author/dharmendra-patel/)

Deep Learning Based Chatbots are Smarter
======

[![][1]][2]

_Contemporary chatbots extensively use machine learning, natural language processing, artificial intelligence and deep learning. They are typically used in the customer service space for almost all domains. Chatbots based on deep learning are far better than traditional variants. Here’s why._

Chatbots are currently being used extensively to change customer behaviour. Usually, traditional artificial intelligence (AI) concepts are used in designing chatbots. However, modern applications generate such vast volumes of data that it becomes arduous to process this with traditional AI algorithms.
Deep learning is a subset of AI and is the most suitable technique to process large quantities of data. Deep learning based systems learn from copious data points. Systems like chatbots are the right contenders for deep learning as they require abundant data points to train the system to reach precise levels of performance. The main purpose of chatbots is to offer the most appropriate reply to any question or message that it receives. The ideal response from a chatbot has multiple aspects to it, such as:

  * It should be able to chat in a pragmatic manner
  * Respond to the caller’s query
  * Provide the corresponding, relevant information
  * Raise follow up questions like in a real conversation



Deep learning simulates the human mind for processing information. It works like the human brain by categorising a variety of information, and automatically discovers the features to be used to classify this information in a way that is perfect for chatbot systems.

![Figure 1: Steps for designing chatbots using deep learning][3]

**Steps for designing chatbots using deep learning**
The goal while designing chatbots using deep learning is to entirely automate the system to lessen the need for human management as much as possible. To achieve this, we need to completely replace all human experts with a chatbot, eradicating the need for client service representatives entirely. Figure 1 depicts the steps for designing chatbots using deep learning.

The first step when designing a chatbot is to collect the existing interactions between clients and service representatives, in order to teach the machine the phrases that are important while interacting with customers. This is called ontology creation.

The data preparation or data preprocessing is the next step in designing the chatbot. This consists of several steps such as tokenisation, stemming and lemmatising. This phase integrates grammar into machine understanding.

The third step involves deciding on the appropriate model of the chatbot. There are two prominent models — retrieval based and generative. Retrieval models apply the repository of predefined responses while generative models are advanced versions of the retrieval model that use deep learning concepts.

The next step is to decide on the appropriate technique to handle client interactions efficiently.
Now you are ready to design and implement the chatbot. Use the appropriate programming language for the implementation. Once it is implemented successfully, test it to uncover any bugs or errors.

**Deep learning based models for chatbots**
Generative models are based on deep learning. They are the smartest models for chatbots but are very complicated to build and operate. They give the best response for any query as they use semantic similarity, which identifies the terms that have common characteristics.

The Recurrent Neural Network (RNN) encoder-decoder is the ultimate generative model for chatbots, and consists of two RNNs. As an input, the encoder takes a sentence and processes one word at a time. It translates the series of the words into a predetermined size feature vector. It takes only significant words and removes the unnecessary ones. The encoder consists of a number of hidden layers in which one layer influences the other. The final hidden layer acts as a summary layer for the entire sentence.
The decoder, on the other hand, generates another series, one word at a time. The decoder is influenced by the context and by previously generated words.

Generally, this model is best suited to fixed length sequences; however, before applying the training to the model, padding concepts are used to convert variable length series into fixed length series. For example:

```
Query : [P P P P P P “What” “About” “Placement” “ ?” ]
// Assume that the fixed length is 10.P is Padding
Response : [ SD “ It” “is” “Almost” “100%” END P P P P ]
// SD means start decoding. END means response is over. P is Padding
```

Word embedding is another important aspect of deep learning based chatbots. It captures the context of the word in the sentence, the semantic and syntactic similarities, as well as the relationship with other words. Word2Vec is a famous method to construct word embedding. There are two main techniques in Word2Vec and both are based on neural networks — continuous bag-of-words (CBOW) and continuous skip-gram.

The continuous bag-of-words method is generally used as a tool of feature generation. A sentence is first converted into a bag of words. After that, various measures are calculated to characterise the sentence.

The frequency is the main measure of the CBOW. It provides better accuracy for frequent words. The skip-gram method achieves the reverse of the CBOW method. It tries to predict the source context words from the target. It works well for fewer training data sets.

The logic for the chatbots that use deep learning is as follows:
_Step 1:_ Build the corpus vocabulary.
_Step 2:_ Map a unique numeric identifier with each word.
_Step 3:_ Padding is done to the context words to keep their size fixed.
_Step 4:_ Make a pair of target words and surround the context words.
_Step 5:_ Build the deep learning architecture for the CBOW model. This involves the following sequence:

  * Input as context words
  * Initialised with random weights
  * Arrange the word embeddings
  * Create a dense softmax layer
  * Predict target word
  * Match with actual target word
  * Compute the loss
  * Perform back propagation to update embedding layer
_Step 6:_ Train the model.
_Step 7:_ Test the model.



![Figure 2: Encoder layers][4]

![Figure 3: Decoder functioning][5]

**Deep learning tools for chatbots**
TensorFlow is a great tool that uses deep learning. It uses linear regression to achieve effective conversation. We first need to develop a TensorFlow model by using JSON to recognise patterns. The next step is loading this framework and contextualising the data. TensorFlow makes chatbots realistic and very effective.

Microsoft conversational AI tools are another important resource to design effective chatbots. These tools can be used to design, link, install and accomplish intelligent bots. The Microsoft Bot Builder software development kit (SDK) is ideal for the quick, free and easy development of chatbots with intelligence.

Pytorch is an excellent open source library based on Python for applications like chatbots. The Optim module implements various algorithms based on neural networks, which are essential for the designing of efficient chatbots. It also provides the power of Tensors and so has the same functionalities as TensorFlow.
Chatbots are essential if organisations aim to deal with customers without any human intervention. As discussed, deep learning based chatbots are the better option compared to the traditional variants, as the former handle abundant data efficiently. And generative models for building chatbots are more appropriate in the modern context.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/09/deep-learning-based-chatbots-are-smarter/

作者：[Dharmendra Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/dharmendra-patel/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Screenshot-from-2019-09-20-16-23-04.png?resize=696%2C472&ssl=1 (Screenshot from 2019-09-20 16-23-04)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/09/Screenshot-from-2019-09-20-16-23-04.png?fit=706%2C479&ssl=1
[3]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/09/1DL.png?resize=350%2C248&ssl=1
[4]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/09/2DL.png?resize=350%2C72&ssl=1
[5]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/09/3DL.png?resize=350%2C67&ssl=1
