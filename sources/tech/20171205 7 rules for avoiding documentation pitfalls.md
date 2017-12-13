translating by lujun9972
7 rules for avoiding documentation pitfalls
======
English serves as _lingua franca_ in the open source community. To reduce
translation costs, many teams have switched to English as the source language
for their documentation. But surprisingly, writing in English for an
international audience does not necessarily put native English speakers in a
better position. On the contrary, they tend to forget that the document 's
language might not be the audience's first language.

Let's have a look at the following simple sentence as an example: "Encrypt the
password using the `foo bar` command." Grammatically, the sentence is correct.
Given that '-ing' forms (gerunds) are frequently used in the English language
and most native speakers consider them an elegant way of expressing things,
native speakers usually do not hesitate to phrase a sentence like this. On
closer inspection, the sentence is ambiguous because "using" may refer either
to the object ("the password") or to the verb ("encrypt"). Thus, the sentence
can be interpreted in two different ways:

  * "Encrypt the password that uses the `foo bar` command."
  * "Encrypt the password by using the `foo bar` command."

As long as you have previous knowledge about the topic (password encryption or
the `foo bar` command), you can resolve this ambiguity and correctly decide
that the second version is the intended meaning of this sentence. But what if
you lack in-depth knowledge of the topic? What if you are not an expert, but a
translator with only general knowledge of the subject? Or if you are a non-
native speaker of English, unfamiliar with advanced grammatical forms like
gerunds?

Even native English speakers need training to write clear and straightforward
technical documentation. The first step is to raise awareness about the
usability of texts and potential problems, so let's look at seven rules that
can help avoid common pitfalls.

### 1. Know your target audience and step into their shoes.

If you are a developer writing for end users, view the product from their
perspective. Does the structure reflect the users' goals? The [persona
technique][1] can help you to focus on the target audience and provide the
right level of detail for your readers.

### 2. Follow the KISS principle--keep it short and simple.

The principle can be applied on several levels, such as grammar, sentences, or
words. Here are examples:

  * Use the simplest tense that is appropriate. For example, use present tense when mentioning the result of an action: 
    * " ~~Click 'OK.' The 'Printer Options' dialog will appear.~~" -> "Click 'OK.' The 'Printer Options' dialog appears."
  * As a rule of thumb, present one idea in one sentence; however, short sentences are not automatically easy to understand (especially if they are an accumulation of nouns). Sometimes, trimming down sentences to a certain word count can introduce ambiguities. In turn, this makes the sentences more difficult to understand.
  * Uncommon and long words slow reading and might be obstacles for non-native speakers. Use simpler alternatives:  

    * " ~~utilize~~ " -> "use"
    * " ~~indicate~~ " -> "show," "tell," or "say"
    * " ~~prerequisite~~ " -> "requirement"

### 3. Avoid disturbing the reading flow.

Move particles or longer parentheses to the beginning or end of a sentence:

  * " ~~They are not, however, marked as installed.~~ " -> "However, they are not marked as installed."

Place long commands at the end of a sentence. This also results in better
segmentation of sentences for automatic or semi-automatic translations.

### 4. Discriminate between two basic information types.

Discriminating between _descriptive information_ and _task-based information_
is useful. Typical examples for descriptive information are command-line
references, whereas how-to 's are task-based information; however, both
information types are needed in technical writing. On closer inspection, many
texts contain a mixture of both information types. Clearly separating the
information types is helpful. For better orientation, label them accordingly.
Titles should reflect a section's content and information type. Use noun-based
titles for descriptive sections ("Types of Frobnicators") and verbally phrased
titles for task-based sections ("Installing Frobnicators"). This helps readers
quickly identify the sections they are interested in and allows them to skip
the ones they don't need at the moment.

### 5. Consider different reading situations and modes of text consumption.

Some of your readers are already frustrated when they turn to the product
documentation because they could not achieve a certain goal on their own. They
might also work in a noisy environment that makes it hard to focus on reading.
Also, do not expect your audience to read cover to cover, as many people skim
or browse texts for keywords or look up topics by using tables, indexes, or
full-text search. With that in mind, look at your text from different
perspectives. Often, compromises are needed to find a text structure that
works well for multiple situations.

### 6. Break down complex information into smaller chunks.

This makes it easier for the audience to remember and process the information.
For example, procedures should not exceed seven to 10 steps (according to
[Miller's Law][2] in cognitive psychology). If more steps are required, split
the task into separate procedures.

### 7. Form follows function.

Examine your text according to the question: What is the _purpose_ (function)
of a certain sentence, a paragraph, or a section? For example, is it an
instruction? A result? A warning? For instructions, use active voice:
"Configure the system." Passive voice may be appropriate for descriptions:
"The system is configured automatically." Add warnings _before_ the step or
action where danger arises. Focusing on the purpose also helps detect
redundant content to help eliminate fillers like  "basically" or "easily,"
unnecessary modifications like " ~~already~~ existing " or " ~~completely~~
new, " or any content that is not relevant for your target audience.

As you might have guessed by now, writing is re-writing. Good writing requires
effort and practice. Even if you write only occasionally, you can
significantly improve your texts by focusing on the target audience and
following the rules above. The better the readability of a text, the easier it
is to process, even for audiences with varying language skills. Especially
when it comes to localization, good quality of the source text is important:
"Garbage in, garbage out." If the original text has deficiencies, translating
the text takes longer, resulting in higher costs. In the worst case, flaws are
multiplied during translation and must be corrected in various languages.


--------------------------------------------------------------------------------

via: https://opensource.com/article/17/12/7-rules

作者：[Tanja Roth][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com
[1]:https://en.wikipedia.org/wiki/Persona_(user_experience)
[2]:https://en.wikipedia.org/wiki/The_Magical_Number_Seven,_Plus_or_Minus_Two
