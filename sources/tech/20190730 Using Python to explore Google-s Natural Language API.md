[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using Python to explore Google's Natural Language API)
[#]: via: (https://opensource.com/article/19/7/python-google-natural-language-api)
[#]: author: (JR Oakes https://opensource.com/users/jroakes)

Using Python to explore Google's Natural Language API
======
Google's API can surface clues to how Google is classifying your site
and ways to tweak your content to improve search results.
![magnifying glass on computer screen][1]

As a technical search engine optimizer, I am always looking for ways to use data in novel ways to better understand how Google ranks websites. I recently investigated whether Google's [Natural Language API][2] could better inform how Google may be classifying a site's content.

Although there are [open source NLP tools][3], I wanted to explore Google's tools under the assumption it might use the same tech in other products, like Search. This article introduces Google's Natural Language API and explores common natural language processing (NLP) tasks and how they might be used to inform website content creation.

### Understanding the data types

To begin, it is important to understand the types of data that Google's Natural Language API returns.

#### Entities

Entities are text phrases that can be tied back to something in the physical world. Named entity recognition (NER) is a difficult part of NLP because tools often need to look at the full context around words to understand their usage. For example, homographs are spelled the same but have multiple meanings. Does "lead" in a sentence refer to a metal (a noun), causing someone to move (a verb), or the main character in a play (also a noun)? Google has 12 distinct types of entities, as well as a 13th catch-all category called "UNKNOWN." Some of the entities tie back to Wikipedia articles, suggesting [Knowledge Graph][4] influence on the data. Each entity returns a salience score, which is its overall relevance to the supplied text.

![Entities][5]

#### Sentiment

Sentiment, a view of or attitude towards something, is measured at the document and sentence level and for individual entities discovered in the document. The score of the sentiment ranges from -1.0 (negative) to 1.0 (positive). The magnitude represents the non-normalized strength of emotion; it ranges between 0.0 and infinity.

![Sentiment][6]

#### Syntax

Syntax parsing contains most of the common NLP activities found in better libraries, like [lemmatization][7], [part-of-speech tagging][8], and [dependency-tree parsing][9]. NLP mainly deals with helping machines understand text and the relationship between words. Syntax parsing is a foundational part of most language-processing or understanding tasks.

![Syntax][10]

#### Categories

Categories assign the entire given content to a specific industry or topical category with a confidence score from 0.0 to 1.0. The categories appear to be the same audience and website categories used by other Google tools, like AdWords.

![Categories][11]

### Pulling some data

Now I'll pull some sample data to play around with. I gathered some search queries and their corresponding URLs using Google's [Search Console API][12]. Google Search Console is a tool that reports the terms people use to find a website's pages with Google Search. This [open source Jupyter notebook][13] allows you to pull similar data about your website. For this example, I pulled Google Search Console data on a website (which I won't name) generated between January 1 and June 1, 2019, and restricted it to queries that received at least one click (as opposed to just impressions).

This dataset contains information on 2,969 pages and 7,144 queries that displayed the website's pages in Google Search results. The table below shows that the vast majority of pages received very few clicks, as this site focuses on what is called long-tail (more specific and usually longer) as opposed to short-tail (very general, higher search volume) search queries.

![Histogram of clicks for all pages][14]

To reduce the dataset size and get only top-performing pages, I limited the dataset to pages that received at least 20 impressions over the period. This is the histogram of clicks by page for this refined dataset, which includes 723 pages:

![Histogram of clicks for subset of pages][15]

### Using Google's Natural Language API library in Python

To test out the API, create a small script that leverages the **[google-cloud-language][16]** library in Python. The following code is Python 3.5+.

First, activate a new virtual environment and install the libraries. Replace **&lt;your-env&gt;** with a unique name for the environment.


```
virtualenv &lt;your-env&gt;
source &lt;your-env&gt;/bin/activate
pip install --upgrade google-cloud-language
pip install --upgrade requests
```

This script extracts HTML from a URL and feeds the HTML to the Natural Language API. It returns a dictionary of **sentiment**, **entities**, and **categories**, where the values for these keys are all lists. I used a Jupyter notebook to run this code because it makes it easier to annotate and retry code using the same kernel.


```
# Import needed libraries
import requests
import json

from google.cloud import language
from google.oauth2 import service_account
from google.cloud.language import enums
from google.cloud.language import types

# Build language API client (requires service account key)
client = language.LanguageServiceClient.from_service_account_json('services.json')

# Define functions
def pull_googlenlp(client, url, invalid_types = ['OTHER'], **data):
   
        html = load_text_from_url(url, **data)
   
        if not html:
        return None
   
        document = types.Document(
        content=html,
        type=language.enums.Document.Type.HTML )

        features = {'extract_syntax': True,
                'extract_entities': True,
                'extract_document_sentiment': True,
                'extract_entity_sentiment': True,
                'classify_text': False
                }
   
        response = client.annotate_text(document=document, features=features)
        sentiment = response.document_sentiment
        entities = response.entities
   
        response = client.classify_text(document)
        categories = response.categories
         
        def get_type(type):
        return client.enums.Entity.Type(entity.type).name
   
        result = {}
   
        result['sentiment'] = []    
        result['entities'] = []
        result['categories'] = []

        if sentiment:
        result['sentiment'] = [{ 'magnitude': sentiment.magnitude, 'score':sentiment.score }]
         
        for entity in entities:
        if get_type(entity.type) not in invalid_types:
                result['entities'].append({'name': entity.name, 'type': get_type(entity.type), 'salience': entity.salience, 'wikipedia_url': entity.metadata.get('wikipedia_url', '-')  })
         
        for category in categories:
        result['categories'].append({'name':category.name, 'confidence': category.confidence})
         
         
        return result

def load_text_from_url(url, **data):

        timeout = data.get('timeout', 20)
   
        results = []
   
        try:
         
        print("Extracting text from: {}".format(url))
        response = requests.get(url, timeout=timeout)

        text = response.text
        status = response.status_code

        if status == 200 and len(text) &gt; 0:
                return text
         
        return None
         

        except Exception as e:
        print('Problem with url: {0}.'.format(url))
        return None
```

To access the API, follow Google's [quickstart instructions][17] to create a project in Google Cloud Console, enable the API, and download a service account key. Afterward, you should have a JSON file that looks similar to this:

![services.json file][18]

Upload it to your project folder with the name **services.json**.

Then you can pull the API data for any URL (such as Opensource.com) by running the following:


```
url = "<https://opensource.com/article/19/6/how-ssh-running-container>"
pull_googlenlp(client,url)
```

If it's set up correctly, you should see this output:

![Output from pulling API data][19]

To make it easier to get started, I created a [Jupyter Notebook][20] that you can download and use to test extracting web pages' entities, categories, and sentiment. I prefer using [JupyterLab][21], which is an extension of Jupyter Notebooks that includes a file viewer and other enhanced user experience features. If you're new to these tools, I think [Anaconda][22] is the easiest way to get started using Python and Jupyter. It makes installing and setting up Python, as well as common libraries, very easy, especially on Windows.

### Playing with the data

With these functions that scrape the HTML of the given page and pass it to the Natural Language API, I can run some analysis across the 723 URLs. First, I'll look at the categories relevant to the site by looking at the count of returned top categories across all pages.

#### Categories

![Categories data from example site][23]

This seems to be a fairly accurate representation of the key themes of this particular site. Looking at a single query that one of the top-performing pages ranks for, I can compare the other ranking pages in Google's results for that same query.

  * _URL 1 | Top Category: /Law &amp; Government/Legal (0.5099999904632568) of 1 total categories._
  * _No categories returned._
  * _URL 3 | Top Category: /Internet &amp; Telecom/Mobile &amp; Wireless (0.6100000143051147) of 1 total categories._
  * _URL 4 | Top Category: /Computers &amp; Electronics/Software (0.5799999833106995) of 2 total categories._
  * _URL 5 | Top Category: /Internet &amp; Telecom/Mobile &amp; Wireless/Mobile Apps &amp; Add-Ons (0.75) of 1 total categories._
  * _No categories returned._
  * _URL 7 | Top Category: /Computers &amp; Electronics/Software/Business &amp; Productivity Software (0.7099999785423279) of 2 total categories._
  * _URL 8 | Top Category: /Law &amp; Government/Legal (0.8999999761581421) of 3 total categories._
  * _URL 9 | Top Category: /Reference/General Reference/Forms Guides &amp; Templates (0.6399999856948853) of 1 total categories._
  * _No categories returned._



The numbers in parentheses above represent Google's confidence that the content of the page is relevant for that category. The eighth result has much higher confidence than the first result for the same category, so this doesn't seem to be a magic bullet for defining relevance for ranking. Also, the categories are much too broad to make sense for a specific search topic.

Looking at average confidence by ranking position, there doesn't seem to be a correlation between these two metrics, at least for this dataset:

![Plot of average confidence by ranking position ][24]

Both of these approaches make sense to review for a website at scale to ensure the content categories seem appropriate, and boilerplate or sales content isn't moving your pages out of relevance for your main expertise area. Think if you sell industrial supplies, but your pages return _Marketing_ as the main category. There doesn't seem to be a strong suggestion that category relevancy has anything to do with how well you rank, at least at a page level.

#### Sentiment

I won't spend much time on sentiment. Across all the pages that returned a sentiment from the API, they fell into two bins: 0.1 and 0.2, which is almost neutral sentiment. Based on the histogram, it is easy to tell that sentiment doesn't provide much value. It would be a much more interesting metric to run for a news or opinion site to measure the correlation of sentiment to median rank for particular pages.

![Histogram of sentiment for unique pages][25]

#### Entities

Entities were the most interesting part of the API, in my opinion. This is a selection of the top entities, across all pages, by salience (or relevancy to the page). Notice that Google is inferring different types for the same terms (Bill of Sale), perhaps incorrectly. This is caused by the terms appearing in different contexts in the content.

![Top entities for example site][26]

Then I looked at each entity type individually and all together to see if there was any correlation between the salience of the entity and the best-ranking position of the page. For each type, I matched the salience (overall relevance to the page) of the top entity matching that type ordered by salience (descending).

Some of the entity types returned zero salience across all examples, so I omitted those results from the charts below.

![Correlation between salience and best ranking position][27]

The **Consumer Good** entity type had the highest positive correlation, with a Pearson correlation of 0.15854, although since lower-numbered rankings are better, the **Person** entity had the best result with a -0.15483 correlation. This is an extremely small sample set, especially for individual entity types, so I can't make too much of the data. I didn't find any value with a strong correlation, but the **Person** entity makes the most sense. Sites usually have pages about their chief executive and other key employees, and these pages are very likely to do well in search results for those queries.

Moving on, while looking at the site holistically, the following themes emerge based on **entity** **name** and **entity type**.

![Themes based on entity name and entity type][28]

I blurred a few results that seem too specific to mask the site's identity. Thematically, the name information is a good way to look topically at your (or a competitor's) site to see its core themes. This was done based only on the example site's ranking URLs and not all the site's possible URLs (Since Search Console data only reports on pages that received impressions in Google), but the results would be interesting, especially if you were to pull a site's main ranking URLs from a tool like [Ahrefs][29], which tracks many, many queries and the Google results for those queries.

The other interesting piece in the entity data is that entities marked **CONSUMER_GOOD** tended to "look" like results I have seen in Knowledge Results, i.e., the Google Search results on the right-hand side of the page.

![Google search results][30]

Of the **Consumer Good** entity names from our data set that had three or more words, 5.8% had the same Knowledge Results as Google's results for the entity name. This means, if you searched for the term or phrase in Google, the block on the right (eg. the Knowledge Results showing Linux above), would display in the search result page. Since Google "picks" an exemplar webpage to represent the entity, it is a good opportunity to identify opportunities to be singularly featured in search results. Also of interest, of the 5.8% names that displayed these Knowledge Results in Google, none of the entities had Wikipedia URLs returned from the Natural Language API. This is interesting enough to warrant additional analysis. It would be very useful, especially for more esoteric topics that traditional global rank-tracking tools, like Ahrefs, don't have in their databases.

As mentioned, the Knowledge Results can be important to site owners who want to have their content featured in Google, as they are strongly highlighted on desktop search. They are also more than likely, hypothetically, to line up with knowledge-base topics from Google [Discover][31], an offering for Android and iOS that attempts to surface content for users based on topics they are interested in but haven't searched explicitly for.

### Wrapping up

This article went over Google's Natural Language API, shared some code, and investigated ways this API may be useful for site owners. The key takeaways are:

  * Learning to use Python and Jupyter Notebooks opens your data-gathering tasks to a world of incredible APIs and open source projects (like Pandas and NumPy) built by incredibly smart and talented people.
  * Python allows me to quickly pull and test my hypothesis about the value of an API for a particular purpose.
  * Passing a website's pages through Google's categorization API may be a good check to ensure its content falls into the correct thematic categories. Doing this for competitors' sites may also offer guidance on where to tune-up or create content.
  * Google's sentiment score didn't seem to be an interesting metric for the example site, but it may be for news or opinion-based sites.
  * Google's found entities gave a much more granular topic-level view of the website holistically and, like categorization, would be very interesting to use in competitive content analysis.
  * Entities may help define opportunities where your content can line up with Google Knowledge blocks in search results or Google Discover results. With 5.8% of our results set for longer (word count) **Consumer Goods** entities, displaying these results, there may be opportunities, for some sites, to better optimize their page's salience score for these entities to stand a better chance of capturing this featured placement in Google search results or Google Discovers suggestions.



--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/python-google-natural-language-api

作者：[JR Oakes][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jroakes
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_issue_bug_programming.png?itok=XPrh7fa0 (magnifying glass on computer screen)
[2]: https://cloud.google.com/natural-language/#natural-language-api-demo
[3]: https://opensource.com/article/19/3/natural-language-processing-tools
[4]: https://en.wikipedia.org/wiki/Knowledge_Graph
[5]: https://opensource.com/sites/default/files/uploads/entities.png (Entities)
[6]: https://opensource.com/sites/default/files/uploads/sentiment.png (Sentiment)
[7]: https://en.wikipedia.org/wiki/Lemmatisation
[8]: https://en.wikipedia.org/wiki/Part-of-speech_tagging
[9]: https://en.wikipedia.org/wiki/Parse_tree#Dependency-based_parse_trees
[10]: https://opensource.com/sites/default/files/uploads/syntax.png (Syntax)
[11]: https://opensource.com/sites/default/files/uploads/categories.png (Categories)
[12]: https://developers.google.com/webmaster-tools/
[13]: https://github.com/MLTSEO/MLTS/blob/master/Demos.ipynb
[14]: https://opensource.com/sites/default/files/uploads/histogram_1.png (Histogram of clicks for all pages)
[15]: https://opensource.com/sites/default/files/uploads/histogram_2.png (Histogram of clicks for subset of pages)
[16]: https://pypi.org/project/google-cloud-language/
[17]: https://cloud.google.com/natural-language/docs/quickstart
[18]: https://opensource.com/sites/default/files/uploads/json_file.png (services.json file)
[19]: https://opensource.com/sites/default/files/uploads/output.png (Output from pulling API data)
[20]: https://github.com/MLTSEO/MLTS/blob/master/Tutorials/Google_Language_API_Intro.ipynb
[21]: https://github.com/jupyterlab/jupyterlab
[22]: https://www.anaconda.com/distribution/
[23]: https://opensource.com/sites/default/files/uploads/categories_2.png (Categories data from example site)
[24]: https://opensource.com/sites/default/files/uploads/plot.png (Plot of average confidence by ranking position )
[25]: https://opensource.com/sites/default/files/uploads/histogram_3.png (Histogram of sentiment for unique pages)
[26]: https://opensource.com/sites/default/files/uploads/entities_2.png (Top entities for example site)
[27]: https://opensource.com/sites/default/files/uploads/salience_plots.png (Correlation between salience and best ranking position)
[28]: https://opensource.com/sites/default/files/uploads/themes.png (Themes based on entity name and entity type)
[29]: https://ahrefs.com/
[30]: https://opensource.com/sites/default/files/uploads/googleresults.png (Google search results)
[31]: https://www.blog.google/products/search/introducing-google-discover/
