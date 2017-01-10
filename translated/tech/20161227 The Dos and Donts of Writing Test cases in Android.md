编写android测试单元应该做的和不应该做的.
============================================================

在本文中, 根据我的实际经验我将为大家阐述一个测试用例.在本文中我将使用Espresso编码, 但是它们可以用到单元测试当中. 基于以上目的, 我们来研究一个新闻程序.

> 以下内容纯属虚构,如有雷同纯属巧合:P

一个新闻APP应该会有以下几个工作流.


*   语言选择页面- 当用户第一次打开软件, 他必须至少选择一种语言. 当选择一个或者多个语言, 用shared preferences保存选项,用户跳转到新闻列表页面.
*   新闻列表页面- 当用户来到新闻列表页面, 将发送一个包含语言参数的请求到服务器，并将服务器返回的内容显示在recycler view上(包含有新闻列表的 id?_news_list_). 如果语言参数不存在在shared preferences或者服务器没有返回一个成功消息, 就会弹出一个错误对话框并且recycler view将不可见. 新闻列表页面有个名叫 “Change your Language” 的按钮,如果用户选择了一种语言 或者用户选择多种语言“Change your Languages” 永远是可见的. ( 我对天发誓这是一个虚构的APP软件)
*   新闻详细内容-如同名字所述, 当用户点选新闻列表项将启动这个页面.


这个APP已经研究的足够了,让我们深入新闻列表页面编写测试用例. 这是我第一次写的代码.


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
#### 仔细想想测试什么.

我们首先来测试新闻列表项的点击_?testClickOnAnyNewsItem()_, 如果服务器没有返回成功信息, 测试用例将会返回失败,因为recycler view是不可见的. 但是这个测试用例的通过或者失败并不是我们所期望的结果, 它要求不管什么原因recycler view都是可见的, 如果recycler view不可见,将返回失败信息. 正确的测试代码应该像下面这个样子.

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
    //Here we are sure, that the news_list recyclerview is visible to the user.
    onView(allOf(withId(R.id.news_list), isDisplayed())).perform(RecyclerViewActions
        .actionOnItemAtPosition(1, click()));
    intended(hasComponent(NewsDetailsActivity.class.getName()));
  }
}

```
#### 一个测试用例本身应该是完整的

当我开始测试, 我通常按如下顺序测试

*   语音选择页面
*   新闻列表页面
*   新闻详细内容

当我开始测试语音选择页面, 总有一种语音已经是选择好了的. 但是当我测试新闻列表页面, 测试用例开始返回错误信息. 原因很简单- 没有选择语音,recycler view讲不会显示出来.因此, 测试用例的执行顺序不能影响测试结果. 因此在运行测试用例之前, 语言选项必须是保存的. 在本例中,测试用例独立与语言选择页面单独运行.

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
#### 在测试用例中避免使用条件代码.

现在在第二个测试用例_testChangeLanguageFeature()_, 我们获取到用户选择语言个数,  我们写了if-else条件来进行测试 . 但是 if-else 条件应该写在你的代码当中, 不是测试代码里. 每一个条件应该单独测试. 因此, 在本例中, 我们将写如下两个测试用例.

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

在大多数APP中, 我们与外部网络或者数据库进行交互.一个测试用例可以向服务器发送一个请求并获取返回信息. 但是当获取失败信息以后, 我们不能认为测试用例没有通过.试想一下如果测试用例没有通过, 然后我们修改客户端代码,测试用例通过. 但是在本文中, 我们有在客户端进行任何更改吗?-没有.

但是你应该也无法避免要测试网络请求和响应. 由于服务器是一个外部代理, 我们可以设想一个场景,发送一些可能导致程序崩溃的错误请求. 因此, 你写的测试用例应该覆盖所有可能来自服务器的响应,通过这种方式来保证你的代码不会崩溃.

> 正确的编写测试用例非常重要的.

感谢你阅读此文章。你可以联系我[LinkedIn][1]. 你还可以阅读我的其他文章[here][2].

获取更多资讯请关注?_[_Mindorks_][3]_?, 你将获得我们的最新信息.


--------------------------------------------------------------------------------

via: https://blog.mindorks.com/the-dos-and-don-ts-of-writing-test-cases-in-android-70f1b5dab3e1#.lfilq9k5e

作者：[Anshul Jain][a]
译者：[kokialoves](https://github.com/kokialoves)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.mindorks.com/@anshuljain?source=post_header_lockup
[1]:http://www.linkedin.com/in/anshul-jain-b7082573
[2]:https://medium.com/@anshuljain
[3]:https://blog.mindorks.com/
