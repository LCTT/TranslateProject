[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I'm using AI to translate 'wash your hands' in 500 languages)
[#]: via: (https://opensource.com/article/20/4/ai-translation)
[#]: author: (Daniel Whitenack https://opensource.com/users/datadan)

How I'm using AI to translate 'wash your hands' in 500 languages
======
By using both human and machine-generated translations, key health
phrases can be translated into local languages spoken all over the
world.
![Two diverse hands holding a globe][1]

You might not know, but there are currently [7,117 languages spoken in the world][2]. Not dialects, but living languages! However, much of the world's digital media is available in only a couple dozen languages, and translation platforms like Google Translate only support around 100 languages. This reality means that there are billions of people around the world that are marginalized due to a lack of timely access to information. The current coronavirus (COVID-19) pandemic has made this painfully clear, and it has stressed the need for immediate, rapid translation of health-related phrases (like "wash your hands" or "keep your distance") into the long tail of languages.

To this end, I applied state-of-the-art AI techniques to construct something close to the phrase "wash your hands" in 544 languages and counting (my GPUs are still running). Multilingual Unsupervised and Supervised Embeddings (MUSE) methods are used to train cross-lingual word embeddings between each of 544 languages and English. These embeddings then allow for the extraction of a phrase similar to the target phrase from existing documents.

I performed this work in collaboration with my colleagues at SIL International, who have gathered even more human translations of the phrase. The combination of these human translations and some of my machine translations can be searched on [this Ethnologue guide page][3] (machine-generated phrases are indicated with a little robot icon), and more translations will be added as they are generated/gathered.

### Leveraging existing corpora

SIL International has done linguistic work in over 2000 languages and is currently managing over 1600 language projects. Thus, as I approached this particular problem, I knew that we had likely already translated the phrase "wash your hands" and/or similar phrases many times into hundreds of languages, and that guess paid off in spades. I was able to quickly gather documents (mostly completed shell book templates, educational materials, and Bibles) from our archives in over 900 languages. Each of these documents has an English parallel, which necessarily includes the phrase "wash your hands" and/or similar phrases like "wash your face." Moreover, each of these documents is very high quality and translated and checked in cooperation with the local language communities.

That is quite the multilingual data set. However, there are two problems to overcome. First, this data included thousands of samples for most languages, which is in contrast to the millions used to train machine translation models. Second, even if the documents include the phrase "wash your hands" in the target language, we don't know the exact location of the phrase within the surrounding text.

We could certainly exploit some of the latest tricks in [machine translation for low resource languages][4], but it would take some time to tune automated methods for rapidly adapting translation models in each language pair. Moreover, many of the languages we are targeting have no existing baseline with which we could compare evaluation metrics, e.g., [BLEU score][5]. Given the pressing concerns about the Coronavirus pandemic, we wanted to move a bit faster than that (although we plan to return to this problem in the future).

I opted to try and construct the phrase "wash your hands" by finding the phrase itself or components of the phrase (like "wash your" or "your hands") in existing documents. To find these, I trained cross-lingual embedding for each {English, Target Language} pair using [Multilingual Unsupervised and Supervised Embedding (MUSE)][6] from Facebook Research. MUSE takes monolingual word embeddings as input (I used [_fasttext_][7] to generate these) and learns a mapping from the English to the target embedding space using adversarial methods. The output of this process is cross-lingual word embeddings.

![Using fasttext along with MUSE to perform cross-language embedding][8]

Once the cross-lingual embeddings are generated, we can get to finding the phrase components in the target language documents. As it turns out, the phrase "wash your face" was most clearly used throughout the documents along with instances of "hands," "wash your," etc. in isolation. For each of the languages, I search through n-grams in areas where I expected the phrase to appear (based on its usage in the English parallel). N-grams were vectorized using the cross-lingual embedding and compared with vectorized versions of the English phrases using various distance metrics. The n-grams that were "closest" to the English phrases in the embedding space were determined to be the target language matches.

Finally, component phrases matching their English counterparts were combined to generate the phrase "wash your hands" in the target language. This combination utilizes the cross-lingual embedding again to make sure that the components are combined in an appropriate manner. For example, if we matched the phrase "wash your feet" in the target language, the n-gram corresponding to "feet" must be replaced with the n-gram corresponding to "hands." Here's an example for Belize Kriol English:

![][9]

There were, of course, some assumptions that were made during this matching process, and it is entirely possible that this procedure does not produce grammatically correct predictions. For example, I assumed that in most languages, the word for "hands" and the word for "feet" are both one token long (with tokens being separated by spaces and punctuation). This is certainly not always the case. This could create a bad word salad something like "and wash the and hand you" or similar. Hopefully, we can overcome some of these limitations and extend the system in the future, but, for now, we chose to reinforce the idea with graphics.

We adapted the World Health Organization's hand washing instructions into a template PNG image. We then took our translated and generated phrases and rendered them into the hand washing image using a combination of Bash and Go scripts. In this way, the idea of proper hand washing is emphasized in both text and imagery (just in case our generated translations are awkward).

![][10]

### Results

Thus far, I've been able to train cross-lingual embeddings for 544 languages. I used the above-discussed method to try and construct "wash your hands" for all of these languages. Because I don't have aligned data for many of the language pairs, I used separate holdout documents also containing components of "wash your hands" to help validate the tokens in the constructed phrase. This gives us some confidence in the translations that we publicly release (at least that they contain information indicating washing and/or hands). In addition, I compared the method with language pairs that are also supported by Google Translate and/or have available human translations. Here's a sample of the translations with language stats from [the Ethnologue][11]:

#### Language: Italian [ita]

Location: Italy
Population: 68,000,000
Our system: "làvati la mani"
Google Translate: "Lavati le mani"

#### Language: Bulgarian [bul]

Location: Bulgaria
Population: 8,000,000
Our system: "умий ръцете"
Google Translate: "Измий си ръцете"

#### Language: Dutch [nld]

Location: Netherlands
Population: 24,000,000
Our system: "wast uw handen"
Google Translate: "Was je handen"

#### Language: Pijin [pis]

Location: Solomon Islands
Population: 550,000
Our system: "wasim han"
Google Translate: Not supported

#### Language: Tikar [tik]

Location: Cameroon
Population: 110,000
Our system: "ɓɔsi fyàʼ"
Google Translate: Not supported

#### Language: Waffa [waj]

Location: Papua New Guinea
Population: 1,300
Our system: "yaakuuvaitana nnikiiyauvaa fini"
Google Translate: Not supported

The constructed phrases are similar to reference translations or appear to be alternative ways of saying "wash your hands." For example, in Bulgarian, I predict "умий ръцете," and Google Translate predicts "Измий си ръцете." However, if I back-translate my prediction using Google Translate, I still get "wash your hands." There is some uncertainty where I can't compare to reference translations (e.g., Pijin [pis] from the Solomon Islands) or human-annotated spans, but I can still validate that the word for wash (wasim) and the word for hands (han) are used in other reference documents that are necessarily talking about washing, or hands, respectively. About 15% of the translations could be validated using this method, and I hope to validate more as I gather reference dictionaries.

Note, I used at most about 7,000 sentences in each language to get the above translations, even for high-resource languages like Italian. I also did not rely on aligned sentences between the language pairs. Despite this very data-scarce, unsupervised scenario, I was still able to obtain phrases similar to that of Google Translate for languages supported by both systems. This demonstrates the potential utility of this sort of "hybrid" approach (unsupervised alignment of word embeddings + rule-based matching) for translating short phrases into languages where very little data exists.

Note—I'm definitely not saying that this is a solution to the problem of information spread about Coronavirus and other health-related issues. There are still a lot of things to explore and formally evaluate here, and we are working on that. In many cases, this approach won't be able to help construct important informational material in hundreds of languages. However, I think that we should all be trying to develop creative solutions to problems related to the current crisis. Maybe this is one piece of a very large puzzle.

You can view the complete list of validated translations plus human translations on [this Ethnologue guide page][3]. In addition, a more thorough description and analysis of the system in paper form is forthcoming. We welcome feedback from the public on the translations to help fine-tune the system and, most of all, to make sure that health information gets out to marginalized language communities around the world.

### Create your own hand washing posters

We have open sourced [the code used to render complex scripts and generate the hand washing posters][12]. This methodology should be able to handle almost all languages and scripts. You can add your own translation of "wash your hands" to a poster to help spread the word or tailor the translations for your own local context. Be sure to share your generated posters on social media with the hashtag #WashYourHands.

### Develop your AI skills

There are so many exciting AI problems out there that can make a huge impact in the world. If you want to solve problems like the one above with AI or if you think your business might need to start leveraging AI for other things (supply chain optimization, recommendation, customer service automation, etc.), don't miss the [_AI Classroom_ training event this May][13]. _AI Classroom_ is an immersive, three-day virtual training event for anyone with at least some programming experience and foundational understanding of mathematics. The training provides a practical baseline for realistic AI development using Python and open source frameworks like TensorFlow and PyTorch. After completing the course, participants will have the confidence to start developing and deploying their own AI solutions.

_This article was republished with permission from <https://datadan.io/blog/wash-your-hands>_

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/ai-translation

作者：[Daniel Whitenack][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/datadan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/world_hands_diversity.png?itok=zm4EDxgE (Two diverse hands holding a globe)
[2]: https://www.ethnologue.com/guides/how-many-languages
[3]: https://www.ethnologue.com/guides/health
[4]: https://datadan.io/blog/resources-for-low-resource-machine-translation
[5]: https://en.wikipedia.org/wiki/BLEU
[6]: https://github.com/facebookresearch/MUSE
[7]: https://fasttext.cc/
[8]: https://opensource.com/sites/default/files/uploads/ai-language-translation-wash-your-hands-opensourcedotcom.gif (Using fasttext along with MUSE to perform cross-language embedding)
[9]: https://opensource.com/sites/default/files/uploads/ai-language-translation-wash-your-hands-opensourcedotcom2.gif
[10]: https://opensource.com/sites/default/files/uploads/ai-language-translation-wash-your-hands-opensourcedotcom3.gif
[11]: https://www.ethnologue.com/
[12]: https://github.com/sil-ai/wash-your-hands
[13]: https://datadan.io/
