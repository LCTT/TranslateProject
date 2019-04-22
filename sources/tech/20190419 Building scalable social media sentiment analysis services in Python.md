[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Building scalable social media sentiment analysis services in Python)
[#]: via: (https://opensource.com/article/19/4/social-media-sentiment-analysis-python-scalable)
[#]: author: (Michael McCune  https://opensource.com/users/elmiko/users/jschlessman)

Building scalable social media sentiment analysis services in Python
======
Learn how you can use spaCy, vaderSentiment, Flask, and Python to add
sentiment analysis capabilities to your work.
![Tall building with windows][1]

The [first part][2] of this series provided some background on how sentiment analysis works. Now let's investigate how to add these capabilities to your designs.

### Exploring spaCy and vaderSentiment in Python

#### Prerequisites

  * A terminal shell
  * Python language binaries (version 3.4+) in your shell
  * The **pip** command for installing Python packages
  * (optional) A [Python Virtualenv][3] to keep your work isolated from the system



#### Configure your environment

Before you begin writing code, you will need to set up the Python environment by installing the [spaCy][4] and [vaderSentiment][5] packages and downloading a language model to assist your analysis. Thankfully, most of this is relatively easy to do from the command line.

In your shell, type the following command to install the spaCy and vaderSentiment packages:


```
`pip install spacy vaderSentiment`
```

After the command completes, install a language model that spaCy can use for text analysis. The following command will use the spaCy module to download and install the English language [model][6]:


```
`python -m spacy download en_core_web_sm`
```

With these libraries and models installed, you are now ready to begin coding.

#### Do a simple text analysis

Use the [Python interpreter interactive mode][7] to write some code that will analyze a single text fragment. Begin by starting the Python environment:


```
$ python
Python 3.6.8 (default, Jan 31 2019, 09:38:34)
[GCC 8.2.1 20181215 (Red Hat 8.2.1-6)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

_(Your Python interpreter version print might look different than this.)_

  1. Import the necessary modules: [code] >>> import spacy
>>> from vaderSentiment import vaderSentiment 
```
2. Load the English language model from spaCy: [code]`>>> english = spacy.load("en_core_web_sm")`
```
  3. Process a piece of text. This example shows a very simple sentence that we expect to return a slightly positive sentiment: [code]`>>> result = english("I like to eat applesauce with sugar and cinnamon.")`
```
4. Gather the sentences from the processed result. SpaCy has identified and processed the entities within the phrase; this step generates sentiment for each sentence (even though there is only one sentence in this example): [code]`>>> sentences = [str(s) for s in result.sents]`
```
  5. Create an analyzer using vaderSentiments: [code]`>>> analyzer = vaderSentiment.SentimentIntensityAnalyzer()`
```
6. Perform the sentiment analysis on the sentences: [code]`>>> sentiment = [analyzer.polarity_scores(str(s)) for s in sentences]`
```



The sentiment variable now contains the polarity scores for the example sentence. Print out the value to see how it analyzed the sentence.


```
>>> print(sentiment)
[{'neg': 0.0, 'neu': 0.737, 'pos': 0.263, 'compound': 0.3612}]
```

What does this structure mean?

On the surface, this is an array with a single dictionary object; had there been multiple sentences, there would be a dictionary for each one. There are four keys in the dictionary that correspond to different types of sentiment. The **neg** key represents negative sentiment, of which none has been reported in this text, as evidenced by the **0.0** value. The **neu** key represents neutral sentiment, which has gotten a fairly high score of **0.737** (with a maximum of **1.0** ). The **pos** key represents positive sentiments, which has a moderate score of **0.263**. Last, the **compound** key represents an overall score for the text; this can range from negative to positive scores, with the value **0.3612** representing a sentiment more on the positive side.

To see how these values might change, you can run a small experiment using the code you already entered. The following block demonstrates an evaluation of sentiment scores on a similar sentence.


```
>>> result = english("I love applesauce!")
>>> sentences = [str(s) for s in result.sents]
>>> sentiment = [analyzer.polarity_scores(str(s)) for s in sentences]
>>> print(sentiment)
[{'neg': 0.0, 'neu': 0.182, 'pos': 0.818, 'compound': 0.6696}]
```

You can see that by changing the example sentence to something overwhelmingly positive, the sentiment values have changed dramatically.

### Building a sentiment analysis service

Now that you have assembled the basic building blocks for doing sentiment analysis, let's turn that knowledge into a simple service.

For this demonstration, you will create a [RESTful][8] HTTP server using the Python [Flask package][9]. This service will accept text data in English and return the sentiment analysis. Please note that this example service is for learning the technologies involved and not something to put into production.

#### Prerequisites

  * A terminal shell
  * The Python language binaries (version 3.4+) in your shell.
  * The **pip** command for installing Python packages
  * The **curl** command
  * A text editor
  * (optional) A [Python Virtualenv][3] to keep your work isolated from the system



#### Configure your environment

This environment is nearly identical to the one in the previous section. The only difference is the addition of the Flask package to Python.

  1. Install the necessary dependencies: [code]`pip install spacy vaderSentiment flask`
```
2. Install the English language model for spaCy: [code]`python -m spacy download en_core_web_sm`
```



#### Create the application file

Open your editor and create a file named **app.py**. Add the following contents to it _(don't worry, we will review every line)_ :


```
import flask
import spacy
import vaderSentiment.vaderSentiment as vader

app = flask.Flask(__name__)
analyzer = vader.SentimentIntensityAnalyzer()
english = spacy.load("en_core_web_sm")

def get_sentiments(text):
result = english(text)
sentences = [str(sent) for sent in result.sents]
sentiments = [analyzer.polarity_scores(str(s)) for s in sentences]
return sentiments

@app.route("/", methods=["POST", "GET"])
def index():
if flask.request.method == "GET":
return "To access this service send a POST request to this URL with" \
" the text you want analyzed in the body."
body = flask.request.data.decode("utf-8")
sentiments = get_sentiments(body)
return flask.json.dumps(sentiments)
```

Although this is not an overly large source file, it is quite dense. Let's walk through the pieces of this application and describe what they are doing.


```
import flask
import spacy
import vaderSentiment.vaderSentiment as vader
```

The first three lines bring in the packages needed for performing the language analysis and the HTTP framework.


```
app = flask.Flask(__name__)
analyzer = vader.SentimentIntensityAnalyzer()
english = spacy.load("en_core_web_sm")
```

The next three lines create a few global variables. The first variable, **app** , is the main entry point that Flask uses for creating HTTP routes. The second variable, **analyzer** , is the same type used in the previous example, and it will be used to generate the sentiment scores. The last variable, **english** , is also the same type used in the previous example, and it will be used to annotate and tokenize the initial text input.

You might be wondering why these variables have been declared globally. In the case of the **app** variable, this is standard procedure for many Flask applications. But, in the case of the **analyzer** and **english** variables, the decision to make them global is based on the load times associated with the classes involved. Although the load time might appear minor, when it's run in the context of an HTTP server, these delays can negatively impact performance.


```
def get_sentiments(text):
result = english(text)
sentences = [str(sent) for sent in result.sents]
sentiments = [analyzer.polarity_scores(str(s)) for s in sentences]
return sentiments
```

The next piece is the heart of the service—a function for generating sentiment values from a string of text. You can see that the operations in this function correspond to the commands you ran in the Python interpreter earlier. Here they're wrapped in a function definition with the source **text** being passed in as the variable text and finally the **sentiments** variable returned to the caller.


```
@app.route("/", methods=["POST", "GET"])
def index():
if flask.request.method == "GET":
return "To access this service send a POST request to this URL with" \
" the text you want analyzed in the body."
body = flask.request.data.decode("utf-8")
sentiments = get_sentiments(body)
return flask.json.dumps(sentiments)
```

The last function in the source file contains the logic that will instruct Flask how to configure the HTTP server for the service. It starts with a line that will associate an HTTP route **/** with the request methods **POST** and **GET**.

After the function definition line, the **if** clause will detect if the request method is **GET**. If a user sends this request to the service, the following line will return a text message instructing how to access the server. This is largely included as a convenience to end users.

The next line uses the **flask.request** object to acquire the body of the request, which should contain the text string to be processed. The **decode** function will convert the array of bytes into a usable, formatted string. The decoded text message is now passed to the **get_sentiments** function to generate the sentiment scores. Last, the scores are returned to the user through the HTTP framework.

You should now save the file, if you have not done so already, and return to the shell.

#### Run the sentiment service

With everything in place, running the service is quite simple with Flask's built-in debugging server. To start the service, enter the following command from the same directory as your source file:


```
`FLASK_APP=app.py flask run`
```

You will now see some output from the server in your shell, and the server will be running. To test that the server is running, you will need to open a second shell and use the **curl** command.

First, check to see that the instruction message is printed by entering this command:


```
`curl http://localhost:5000`
```

You should see the instruction message:


```
`To access this service send a POST request to this URI with the text you want analyzed in the body.`
```

Next, send a test message to see the sentiment analysis by running the following command:


```
`curl http://localhost:5000 --header "Content-Type: application/json" --data "I love applesauce!"`
```

The response you get from the server should be similar to the following:


```
`[{"compound": 0.6696, "neg": 0.0, "neu": 0.182, "pos": 0.818}]`
```

Congratulations! You have now implemented a RESTful HTTP sentiment analysis service. You can find a link to a [reference implementation of this service and all the code from this article on GitHub][10].

### Continue exploring

Now that you have an understanding of the principles and mechanics behind natural language processing and sentiment analysis, here are some ways to further your discovery of this topic.

#### Create a streaming sentiment analyzer on OpenShift

While creating local applications to explore sentiment analysis is a convenient first step, having the ability to deploy your applications for wider usage is a powerful next step. By following the instructions and code in this [workshop from Radanalytics.io][11], you will learn how to create a sentiment analyzer that can be containerized and deployed to a Kubernetes platform. You will also see how Apache Kafka is used as a framework for event-driven messaging and how Apache Spark can be used as a distributed computing platform for sentiment analysis.

#### Discover live data with the Twitter API

Although the [Radanalytics.io][12] lab generated synthetic tweets to stream, you are not limited to synthetic data. In fact, anyone with a Twitter account can access the Twitter streaming API and perform sentiment analysis on tweets with the [Tweepy Python][13] package.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/social-media-sentiment-analysis-python-scalable

作者：[Michael McCune ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/elmiko/users/jschlessman
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/windows_building_sky_scale.jpg?itok=mH6CAX29 (Tall building with windows)
[2]: https://opensource.com/article/19/4/social-media-sentiment-analysis-python-part-1
[3]: https://virtualenv.pypa.io/en/stable/
[4]: https://pypi.org/project/spacy/
[5]: https://pypi.org/project/vaderSentiment/
[6]: https://spacy.io/models
[7]: https://docs.python.org/3.6/tutorial/interpreter.html
[8]: https://en.wikipedia.org/wiki/Representational_state_transfer
[9]: http://flask.pocoo.org/
[10]: https://github.com/elmiko/social-moments-service
[11]: https://github.com/radanalyticsio/streaming-lab
[12]: http://Radanalytics.io
[13]: https://github.com/tweepy/tweepy
