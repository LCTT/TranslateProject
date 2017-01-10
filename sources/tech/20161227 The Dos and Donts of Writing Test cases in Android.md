translating by kokialoves
The Do’s and Don’ts of Writing Test cases in Android.
============================================================

In this post, I will try to explain the best practices of writing the test cases based on my experience. I will use Espresso code in this post, but these practices will apply on both unit and instrumentation tests. For the purpose of explaining, I will consider a news application.

> The features and conditions of the application mentioned below are purely fictitious and are meant purely for the purpose of explaining the best practices and have no resemblance to any application active or removed from Play Store. :P

The news application will have the following activities.

*   LanguageSelection- When the user launches the application for the very first time, he has to select at least one language. On selecting one or more than one language, the selection will be saved in the shared preferences and the user will be redirected to NewsList activity.
*   NewsList - When the user lands on the NewsList activity, a request is sent to the server along with the language parameter and the response is shown in the recycler view (which has id _news_list_). In case the language is not present in the shared preference or server does not give a successful response, an error screen will become visible to the user and the recycler view will be gone. The NewsList activity has a button which has the text “Change your Language” if the user had selected only one language and “Change your Languages” if the user had selected more than one language which will always be visible. ( I swear to God that this is a fictional app)
*   NewsDetail- As the name suggests, this activity is launched when the user clicks on any news list item.


Enough about the great features of the app. Let’s dive into the test cases written for NewsList activity. This is the code which I wrote the very first time.


#### Decide carefully what the test case is about.

In the first test case_ testClickOnAnyNewsItem()_, if the server does not send a successful response, the test case will fail because the visibility of the recycler view is GONE. But that is not what the test case is about. For this test case to PASS or FAIL, the minimum requirement is that the recycler view should be present and if due to any reason, it is not present, then the test case should not be considered FAILED. The correct code for this test should be something like this.


#### A test case should be complete in itself

When I started testing, I always tested the activities in the following sequence

*   LanguageSelection
*   NewsList
*   NewsDetail

Since I tested the LanguageSelection activity first, a language was always getting set before the tests for NewsList activity began. But when I tested NewsList activity first, the tests started to fail. The reason for the failure was simple- language was not selected and because of that, the recycler view was not present. Thus, the order of execution of the test cases should not affect the outcome of the test. Therefore before running the test, the language should be saved in the shared preferences. In this case, the test case now becomes independent from LanguageSelection activity test.


#### Avoid conditional coding in test cases.

Now in the second test case _testChangeLanguageFeature()_, we get the count of the languages selected by the user and based on the count, we write an if-else condition for testing. But the if-else conditions should be written inside your actual code, not in the testing code. Each and every condition should be tested separately. So, in this case, instead of writing only a single test case, we should have written two test cases as follows.


#### The Test cases should be independent of external factors

In most of the applications, we interact with external agents like network and database. A test case can invoke a request to the server during its execution and the response can be either successful or failed. But due to the failed response from the server, the test case should not be considered failed. Think of it as this way- If a test case fails, then we make some changes in the client code so that the test code works. But in this case, are we going to make any changes in the client code?- NO.

But you should also not completely avoid testing the network request and response. Since the server is an external agent, there can be a scenario when it can send some wrong response which might result in crashing of the application. Therefore, you should write test cases and cover all the possible responses from the server, even the responses which the server will never send. In this way, all the code will be covered and you make sure that the application handles all the responses gracefully and never crashes down.

> Writing the test cases in a correct way is as important as writing the code for which the tests are written.


Thanks for reading the article. I hope it helps you write better test cases. You can connect with me on [LinkedIn][1]. You can check out my other medium articles [here][2].

_For more about programming, follow _[_Mindorks_][3]_ , so you’ll get notified when we write new posts._


--------------------------------------------------------------------------------

via: https://blog.mindorks.com/the-dos-and-don-ts-of-writing-test-cases-in-android-70f1b5dab3e1#.lfilq9k5e

作者：[Anshul Jain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.mindorks.com/@anshuljain?source=post_header_lockup
[1]:http://www.linkedin.com/in/anshul-jain-b7082573
[2]:https://medium.com/@anshuljain
[3]:https://blog.mindorks.com/
