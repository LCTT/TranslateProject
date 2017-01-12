编写 android 测试单元该做的和不该做的事
============================================================

在本文中, 我将根据我的实际经验，为大家阐述一个编写测试用例的最佳实践。在本文中我将使用 Espresso 编码, 但是它们可以用到单元和 instrumentation 测试当中。基于以上目的, 我们来研究一个新闻程序.

> 以下内容纯属虚构，如有雷同纯属巧合:P

一个新闻 APP 应该会有以下这些 <ruby>活动<rt>activities</rt></ruby>。

*   语言选择 - 当用户第一次打开软件, 他必须至少选择一种语言。选择后，选项保存在共享偏好中，用户跳转到新闻列表 activity。
*   新闻列表 - 当用户来到新闻列表 activity，将发送一个包含语言参数的请求到服务器，并将服务器返回的内容显示在 recycler view 上（包含有新闻列表的 id _news_list_）。 如果共享偏好中未存语言参数，或者服务器没有返回一个成功消息, 就会弹出一个错误对话框并且 recycler view 将不可见。如果用户只选择了一种语言，新闻列表 activity 有个 “Change your Language” 的按钮,或者如果用户选择多种语言，则按钮为 “Change your Languages” 。 ( 我对天发誓这是一个虚构的 APP 软件)
*   新闻细节 - 如同名字所述, 当用户点选新闻列表项时将启动这个 activity。

这个 APP 功能已经足够,，让我们深入研究下为新闻列表 activity 编写的测试用例。 这是我第一次写的代码。

```
/*
    Click on the first news item.
    It should open NewsDetailActivity
     */
    @Test
    public void testClickOnAnyNewsItem() {
        onView(allOf(withId(R.id.news_list), isDisplayed())).perform(RecyclerViewActions
                .actionOnItemAtPosition(1, click()));
        intended(hasComponent(NewsDetailsActivity.class.getName()));
    }


  /**
   * To test the correct text on the button
   */
  @Test
  public void testChangeLanguageFeature() {
    int count = UserPreferenceUtil.getSelectedLanguagesCount();
    if (count == 1) {
      onView(withText("Choose your Language")).check(matches(isDisplayed()));
    } else if (count > 1) {
      onView(withText("Choose your Languages")).check(matches(isDisplayed()));
    }
 ?}
```

#### 仔细想想测试什么。

在第一个测试用例 _testClickOnAnyNewsItem()_， 如果服务器没有返回成功信息，测试用例将会返回失败，因为 recycler view 是不可见的。但是这个测试用例的目的并非如此。 **不管该用例为 PASS 还是 FAIL，它的最低要求是 recycler view 总是可见的,** 如果因某种原因，recycler view 不可见，那么测试用例不应视为 FAILED。正确的测试代码应该像下面这个样子。

```
 /*
  Click on any news item.
  It should open NewsDetailActivity
   */
  @Test
  public void testClickOnAnyNewsItem() {
    try {
            /*To test this case, we need to have recyclerView present. If we don't have the
            recyclerview present either due to the presence of error_screen, then we should consider
            this test case successful. The test case should be unsuccesful only when we click on a
            news item and it doesn't open NewsDetail activity
            */
      ViewInteraction viewInteraction = onView(withId(R.id.news_list));
      viewInteraction.check(matches(isDisplayed()));
    } catch (NoMatchingViewException e) {
      return;
    } catch (AssertionFailedError e) {
      return;
    }
    //在这里我们确信，news_list的 recyclerview 对用户是可见的。
    onView(allOf(withId(R.id.news_list), isDisplayed())).perform(RecyclerViewActions
        .actionOnItemAtPosition(1, click()));
    intended(hasComponent(NewsDetailsActivity.class.getName()));
  }
}

```
#### 一个测试用例本身应该是完整的

当我开始测试, 我通常按如下顺序测试 activities:

*   语音选择

*   新闻列表

*   新闻细节

因为我首先测试语音选择 activity，在测试 NewsList activity 之前，总有一种语音已经是选择好了的。但是当我先测试新闻列表 activity 时，测试用例开始返回错误信息。原因很简单 - 没有选择语言，recycler view 不会显示。**注意, 测试用例的执行顺序不能影响测试结果。** 因此在运行测试用例之前, 语言选项必须是保存在共享偏好中的。在本例中，测试用例独立于语言选择 activity 的测试。

```
@Rule
  public ActivityTestRule activityTestRule =
      new ActivityTestRule(TopicsActivity.class, false, false);
  
  /*
  Click on any news item.
  It should open NewsDetailActivity
   */
  @Test
  public void testClickOnAnyNewsItem() {
    UserPreferenceUtil.saveUserPrimaryLanguage("english");
    Intent intent = new Intent();
    activityTestRule.launchActivity(intent);
    try {
      ViewInteraction viewInteraction = onView(withId(R.id.news_list));
      viewInteraction.check(matches(isDisplayed()));
    } catch (NoMatchingViewException e) {
      return;
    } catch (AssertionFailedError e) {
      return;
    }
    onView(allOf(withId(R.id.news_list), isDisplayed())).perform(RecyclerViewActions
        .actionOnItemAtPosition(1, click()));
    intended(hasComponent(NewsDetailsActivity.class.getName()));
 ?}
```
#### 在测试用例中避免使用条件代码。

现在在第二个测试用例 _testChangeLanguageFeature()_中，我们获取到用户选择语言的个数, 基于这个数目，我们写了 if-else 条件来进行测试。 但是 if-else 条件应该写在你的代码当中，而不是测试代码里。每一个条件应该单独测试。 因此, 在本例中, 不是只写一条测试用例，而是要写如下两个测试用例。

```
/**
   * To test the correct text on the button when only one language is selected.
   */
  @Test
  public void testChangeLanguageFeatureForSingeLanguage() {
    //Other initializations
    UserPreferenceUtil.saveSelectedLanguagesCount(1);
    Intent intent = new Intent();
    activityTestRule.launchActivity(intent);
      onView(withText("Choose your Language")).check(matches(isDisplayed()));
  }

  /**
   * To test the correct text on the button when more than one language is selected.
   */
  @Test
  public void testChangeLanguageFeatureForMultipleLanguages() {
    //Other initializations
    UserPreferenceUtil.saveSelectedLanguagesCount(5); //Write anything greater than 1.
    Intent intent = new Intent();
    activityTestRule.launchActivity(intent);
    onView(withText("Choose your Languages")).check(matches(isDisplayed()));
  }

```
#### 测试用例应该独立于外部因素

在大多数应用中，我们与外部网络或者数据库进行交互。一个测试用例运行时可以向服务器发送一个请求，并获取成功或失败的返回信息。但是不能因从服务器获取到失败信息，就认为测试用例没有通过。这样想这个问题 - 如果测试用例失败，然后我们修改客户端代码，以便测试用例通过。 但是在本例中, 我们要在客户端进行任何更改吗？- **NO**。

但是你应该也无法完全避免要测试网络请求和响应。由于服务器是一个外部代理，我们可以设想一个场景，发送一些可能导致程序崩溃的错误响应。因此, 你写的测试用例应该覆盖所有可能来自服务器的响应，甚至包括服务器决不会发出的响应。这样可以覆盖所有代码，并能保证应用可以处理所有响应，而不会崩溃。


> 正确的编写测试用例与编写这些测试代码同等重要。

感谢你阅读此文章。希望对测试用例写的更好有所帮助。你可以在 [LinkedIn][1] 上联系我。还可以[在这里][2]阅读我的其他文章。

获取更多资讯请关注_[Mindorks][3]_, 我们发新文章时您将获得通知。

--------------------------------------------------------------------------------

via: https://blog.mindorks.com/the-dos-and-don-ts-of-writing-test-cases-in-android-70f1b5dab3e1#.lfilq9k5e

作者：[Anshul Jain][a]
译者：[kokialoves](https://github.com/kokialoves)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.mindorks.com/@anshuljain?source=post_header_lockup
[1]:http://www.linkedin.com/in/anshul-jain-b7082573
[2]:https://medium.com/@anshuljain
[3]:https://blog.mindorks.com/
