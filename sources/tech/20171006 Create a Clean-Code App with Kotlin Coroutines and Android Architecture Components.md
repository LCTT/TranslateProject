Create a Clean-Code App with Kotlin Coroutines and Android Architecture Components
============================================================

Translating by S9mtAt

### Full demo weather app included.

Android development is evolving fast. A lot of developers and companies are trying to address common problems and create some great tools or libraries that can totally change the way we structure our apps.


![](https://cdn-images-1.medium.com/max/800/1*4z7VB5NWS2PMqD5k0hG4vQ.png)

We get excited by the new possibilities, but it’s difficult to find time to rewrite our app to really benefit from a new programming style. But what if we actually start a new project? Which of those breakthrough ideas to employ? Which solutions are stable enough? Should we use RxJava extensively and structure our app with reactive-first mindset?

> The Cycle.js library (by [André Staltz][6]) contains a great explanation of reactive-first mindset: [Cycle.js — Streams][7].

Rx is highly composable and it has great potential, but it’s so different from regular object-oriented programming style, that it will be really hard to understand for any developer without RxJava experience.

There are more questions to ask before starting a new project. For example:

*   Should we use Kotlin instead of Java?
    (actually here the answer is simple: [YES][1])

*   Should we use experimental Kotlin Coroutines? (which, again, promote totally new programming style)

*   Should we use the new experimental library from Google:
    Android Architecture Components?

It’s necessary to try it all first in a small app to really make an informed decision. This is exactly what [I did][8], getting some useful insights in the process. If you want to find out what I learned, read on!

### About [The App][9]

The aim of the experiment was to create an [app][10] that downloads weather data for cities selected by user and then displays forecasts with graphical charts (and some fancy animations). It’s simple, yet it contains most of the typical features of Android projects.

It turns out that coroutines and architecture components play really well together and give us clean app architecture with good separation of concerns. Coroutines allow to express ideas in a natural and concise way. Suspendable functions are great if you want to code line-by-line the exact logic you have in mind — even if you need to make some asynchronous calls in between.

Also: no more jumping between callbacks. In this example app, coroutines also completely removed the need of using RxJava. Functions with suspendable points are easier to read and understand than some RxJava operator chains — these chains can quickly become too  _functional. _ ;-)

> Having said that, I don’t think that RxJava can be replaced with coroutines in every use case. Observables give us a different kind of expressiveness that can not be mapped one to one to suspendable functions. In particular once constructed observable operator chain allow many events to flow through it, while a suspendable point resumes only once per invocation.

Back to our weather app:
You can watch it in action below — but beware, I’m not a designer. :-)
Chart animations show how easily you can implement them arbitrarily by hand with simple coroutine — without any ObjectAnimators, Interpolators, Evaluators, PropertyValuesHolders, etc.

 ** 此处有Canvas,请手动处理 ** 

 ** 此处有iframe,请手动处理 ** 

The most important source code snippets are displayed below. However, if you’d like to see the full project, it’s available [on GitHub.][11]

[https://github.com/elpassion/crweather][12]

There is not a lot of code and it should be easy to go through.

I will present the app structure starting from the network layer. Then I will move to the business logic (in the [MainModel.kt][13] file) which is  _(almost)_  not Android-specific. And finish with the UI part (which obviously is Android-specific).

Here is the general architecture diagram with text reference numbers added for your convenience. I will especially focus on  _green_  elements —  _suspendable functions_  and  _actors_  (an actor is a really useful kind of  _coroutine builder_ ).

> The actor model in general is a mathematical model of concurrent computation — more about it in my next blog post.


![](https://cdn-images-1.medium.com/max/800/1*DL--eDRDLPPCDR1nsAmILg.png)

### 01 Weather Service

This service downloads weather forecasts for a given city from [Open Weather Map][14] REST API.

I use simple but powerful library from [Square][15] called [Retrofit][16]. I guess by now every Android developer knows it, but in case you never used it: it’s the most popular HTTP client on Android. It makes network calls and parses responses to [POJO][17]. Nothing fancy here — just a typical Retrofit configuration. I plug in the [Moshi][18] converter to convert JSON responses to data classes.


![](https://cdn-images-1.medium.com/max/800/1*QGvoMVNbR_nHjmn0WCCFsw.png)
[https://github.com/elpassion/crweather/…/OpenWeatherMapApi.kt][2]

One important thing to note here is that I set a return types of functions generated by Retrofit to: [Call][19].

I use [Call.enqueue(Callback)][20] to actually make a call to Open Weather Map. I don’t use any [call adapter][21] provided by Retrofit, because I wrap the Call object in the  _suspendable function_  myself.

### 02 Utils

This is where we enter the ([brave new][22])  _coroutines_  world: we want to create a generic  _suspendable function_  that wraps a [Call][23] object.

> I assume you know at least the very basics of coroutines. Please read the first chapter of [Coroutines Guide][24] (written by [Roman Elizarov][25]) if you don’t.

It will be an extension function:  [_suspend_  fun Call<T>.await()][26] that invokes the [Call.enqueue(…)][27] (to actually make a network call), then  _suspends_  and later  _resumes_  (when the response comes back).

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/800/1*T6QT9tRQbqOS9pKJfyh0og.png)
[https://github.com/elpassion/crweather/…/CommonUtils.kt][3]

To turn any asynchronous computation into a  _suspendable function,_  we use the [suspendCoroutine][28] function from The Kotlin Standard Library. It gives us a [Continuation][29] object which is kind of a universal callback. We just have to call its [resume][30] method (or [resumeWithException][31]) anytime we want our new  _suspendable function_  to resume (normally or by throwing an exception).

The next step will be to use our new  _suspend_  fun Call<T>.await() function to convert asynchronous functions generated by Retrofit into convenient  _suspendable functions_ .

### 03 Repository

The Repository object is a source of the data ([charts][32]) displayed in our app.



![](https://cdn-images-1.medium.com/max/800/1*rie-ith-AXP8-ajuBiNdzw.png)
[https://github.com/elpassion/crweather/…/Repository.kt][4]

Here we have some private  _suspendable functions_  created by applying our  _suspend_  fun Call<T>.await() extension to weather service functions. This way all of them return ready to use data like Forecast instead of Call<Forecast>. Then we use it in our one public  _suspendable function_ :  _suspend_  fun getCityCharts(city: String): List<Chart>. It converts the data from api to a ready to display list of charts. I use some custom extension properties on List<DailyForecast> to actually convert the data to List<Chart>. Important note: only  _suspendable functions_  can call other  _suspendable functions_ .

> We have the [appid][33] hardcoded here for simplicity. Please generate new appid [here][34]if you want to test the app — this hardcoded one will be automatically blocked for 24h if it is used too frequently by too many people.

In the next step we will create the main app model (implementing the Android [ViewModel][35] architecture component), that uses an  _actor (coroutine builder)_  to implement the application logic.

### 04 Model

In this app we only have one simple model: [MainModel][36] : [ViewModel][37] used by our one activity: [MainActivity][38].



![](https://cdn-images-1.medium.com/max/800/1*2frMeRS2T_3jwPpFeRInlQ.png)
[https://github.com/elpassion/crweather/…/MainModel.kt][5]

This class represents the app itself. It will be instantiated by our activity (actually by the Android system [ViewModelProvider][39]), but it will survive configuration changes such as a screen rotation — new activity instance will get the same model instance. We don’t have to worry about activity lifecycle here at all. Instead of implementing all those activity lifecycle related methods (onCreate, onDestroy, …), we have just one onCleared() method called when the user exits the app.

> To be precise onCleared method is called when the activity is finished.

Even though we are not tightly coupled to activity lifecycle anymore, we still have to somehow publish current state of our app model to display it somewhere (in the activity). This is where the [LiveData][40] comes into play.

The [LiveData][41] is like [RxJava][42] [BehaviorSubject][43] reinvented once again… It holds a mutable value that is observable. The most important difference is how we subscribe to it and we will see it later in the [MainActivity][44].

> Also LiveData doesn’t have all those powerful composable operators Observable has. There are only some simple [Transformations][45].

> Another difference is that LiveData is Android-specific and RxJava subjects are not, so they can be easily tested with regular non-android JUnit tests.

> Yet another difference is that LiveData is “lifecycle aware” — more about it in my next posts, where I present the [MainActivity][46] class.

In here we are actually using the [MutableLiveData][47] : [LiveData][48] objects that allow to push new values into it freely. The app state is represented by four LiveData objects: city, charts, loading, and message. The most important of these is the charts: LiveData<List<Chart>> object which represents current list of charts to display.

All the work of changing the app state and reacting to user actions is performed by an  _ACTOR_ .

 _Actors_  are awesome and will be explained in my next blog post :-)

### Summary

We have already prepared everything for our main  _actor_ . And if you look at the  _actor_  code itself — you can (kind of) see how it works even without knowing  _coroutines_  or  _actors_  theory. Even though it has only a few lines, it actually contains all important business logic of this app. The magic is where we call  _suspendable functions_  (marked by gray arrows with green line). One  _suspendable point_  is the iteration over user actions and second is the network call. Thanks to  _coroutines_  it looks like synchronous blocking code but it doesn’t block the thread at all.

Stay tuned for my next post, where I will explain  _actors_  (and  _channels_ ) in detail.

--------------------------------------------------------------------------------

via: https://blog.elpassion.com/create-a-clean-code-app-with-kotlin-coroutines-and-android-architecture-components-f533b04b5431

作者：[Marek Langiewicz][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.elpassion.com/@marek.langiewicz?source=post_header_lockup
[1]:https://www.quora.com/Does-Kotlin-make-Android-development-easier-and-faster/answer/Michal-Przadka?srid=Gu6q
[2]:https://github.com/elpassion/crweather/blob/master/app/src/main/java/com/elpassion/crweather/OpenWeatherMapApi.kt
[3]:https://github.com/elpassion/crweather/blob/master/app/src/main/java/com/elpassion/crweather/CommonUtils.kt
[4]:https://github.com/elpassion/crweather/blob/master/app/src/main/java/com/elpassion/crweather/Repository.kt
[5]:https://github.com/elpassion/crweather/blob/master/app/src/main/java/com/elpassion/crweather/MainModel.kt
[6]:https://medium.com/@andrestaltz
[7]:https://cycle.js.org/streams.html
[8]:https://github.com/elpassion/crweather
[9]:https://github.com/elpassion/crweather
[10]:https://github.com/elpassion/crweather
[11]:https://github.com/elpassion/crweather
[12]:https://github.com/elpassion/crweather
[13]:https://github.com/elpassion/crweather/blob/master/app/src/main/java/com/elpassion/crweather/MainModel.kt
[14]:http://openweathermap.org/api
[15]:https://github.com/square
[16]:http://square.github.io/retrofit/
[17]:https://en.wikipedia.org/wiki/Plain_old_Java_object
[18]:https://github.com/square/retrofit/tree/master/retrofit-converters/moshi
[19]:https://github.com/square/retrofit/blob/master/retrofit/src/main/java/retrofit2/Call.java
[20]:https://github.com/square/retrofit/blob/b3ea768567e9e1fb1ba987bea021dbc0ead4acd4/retrofit/src/main/java/retrofit2/Call.java#L48
[21]:https://github.com/square/retrofit/tree/master/retrofit-adapters
[22]:https://www.youtube.com/watch?v=_Lvf7Zu4XJU
[23]:https://github.com/square/retrofit/blob/master/retrofit/src/main/java/retrofit2/Call.java
[24]:https://github.com/Kotlin/kotlinx.coroutines/blob/master/coroutines-guide.md
[25]:https://medium.com/@elizarov
[26]:https://github.com/elpassion/crweather/blob/9c3e3cb803b7e4fffbb010ff085ac56645c9774d/app/src/main/java/com/elpassion/crweather/CommonUtils.kt#L24
[27]:https://github.com/square/retrofit/blob/b3ea768567e9e1fb1ba987bea021dbc0ead4acd4/retrofit/src/main/java/retrofit2/Call.java#L48
[28]:https://github.com/JetBrains/kotlin/blob/8f452ed0467e1239a7639b7ead3fb7bc5c1c4a52/libraries/stdlib/src/kotlin/coroutines/experimental/CoroutinesLibrary.kt#L89
[29]:https://github.com/JetBrains/kotlin/blob/8fa8ba70558cfd610d91b1c6ba55c37967ac35c5/libraries/stdlib/src/kotlin/coroutines/experimental/Coroutines.kt#L23
[30]:https://github.com/JetBrains/kotlin/blob/8fa8ba70558cfd610d91b1c6ba55c37967ac35c5/libraries/stdlib/src/kotlin/coroutines/experimental/Coroutines.kt#L32
[31]:https://github.com/JetBrains/kotlin/blob/8fa8ba70558cfd610d91b1c6ba55c37967ac35c5/libraries/stdlib/src/kotlin/coroutines/experimental/Coroutines.kt#L38
[32]:https://github.com/elpassion/crweather/blob/master/app/src/main/java/com/elpassion/crweather/DataTypes.kt
[33]:http://openweathermap.org/appid
[34]:http://openweathermap.org/appid
[35]:https://developer.android.com/topic/libraries/architecture/viewmodel.html
[36]:https://github.com/elpassion/crweather/blob/master/app/src/main/java/com/elpassion/crweather/MainModel.kt
[37]:https://developer.android.com/topic/libraries/architecture/viewmodel.html
[38]:https://github.com/elpassion/crweather/blob/master/app/src/main/java/com/elpassion/crweather/MainActivity.kt
[39]:https://developer.android.com/reference/android/arch/lifecycle/ViewModelProvider.html
[40]:https://developer.android.com/topic/libraries/architecture/livedata.html
[41]:https://developer.android.com/topic/libraries/architecture/livedata.html
[42]:https://github.com/ReactiveX/RxJava
[43]:https://github.com/ReactiveX/RxJava/wiki/Subject
[44]:https://github.com/elpassion/crweather/blob/master/app/src/main/java/com/elpassion/crweather/MainActivity.kt
[45]:https://developer.android.com/reference/android/arch/lifecycle/Transformations.html
[46]:https://github.com/elpassion/crweather/blob/master/app/src/main/java/com/elpassion/crweather/MainActivity.kt
[47]:https://developer.android.com/reference/android/arch/lifecycle/MutableLiveData.html
[48]:https://developer.android.com/topic/libraries/architecture/livedata.html
