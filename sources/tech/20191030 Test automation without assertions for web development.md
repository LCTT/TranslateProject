[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Test automation without assertions for web development)
[#]: via: (https://opensource.com/article/19/10/test-automation-without-assertions)
[#]: author: (Jeremias Roessler https://opensource.com/users/roesslerj)

Test automation without assertions for web development
======
Recheck-web promises the benefits of golden master-based testing without
the drawbacks.
![Coding on a computer][1]

Graphical user interface (GUI) test automation is broken. Regression testing is not testing; it's version control for a software's behavior. Here's my assertion: test automation _without_ _assertions_ works better!

In software development and test automation, an assertion is a means to check the result of a calculation, typically by comparing it to a singular expected value. While this is very well suited for unit-based test automation (i.e. testing the system from within), applying it to testing an interface (specifically the user interface) has proven to be problematic, as this post will explain.

The number of tools that work according to the [golden master][2] approach to testing, characterization testing, and approval testing—such as [Approval Tests][3], [Jest][4], or [recheck-web][5] ([retest][6])—is constantly increasing. This approach promises more robust tests with less effort (for both creation and maintenance) while testing more thoroughly.

The examples in this article are available on [GitHub][7].

### A basic Selenium test

Here's a simple example of a traditional test running against a web application's login page. Using [Selenium][8] as the testing framework, the code could look like this:


```
public class MySeleniumTest {

        RemoteWebDriver driver;

        @Before
        public void setup() {
                driver =  new ChromeDriver();
        }

        @Test
        public void login() throws Exception {
                driver.get("<https://assets.retest.org/demos/app/demo-app.html>");

                driver.findElement(By.id("username")).sendKeys("Simon");
                driver.findElement(By.id("password")).sendKeys("secret");
                driver.findElement(By.id("sign-in")).click();

                assertEquals(driver.findElement(By.tagName("h4")).getText(), "Success!");
        }

        @After
        public void tearDown() throws InterruptedException {
                driver.quit();
        }
}
```

This is a very simple test. It opens a specific URL, then finds input fields by their invisible element IDs. It enters the user name and password, then clicks the login button.

As is currently best practice, this test then uses a unit-test library to check the correct outcome by means of an _assert_ statement.

In this example, the test determines whether the text "Success!" is displayed.

You can run the test a few times to verify success, but it's important to experience failure, as well. To create an error, change the HTML of the website being tested. You could, for instance, edit the CSS declaration:


```
`<link href=_"./files/main.css"_ rel=_"stylesheet"_>`
```

Changing or removing as much as a single character of the URL (e.g. change "main" to "min") changes the website to display as raw HTML without a layout.

![Website login form displayed as raw HTML][9]

This small change is definitely an error. However, when the test is executed, it shows no problem and still passes. To outright ignore such a blatant error clearly is not what you would expect of your tests. They should guard against you involuntarily breaking your website after all.

Now instead, change or remove the element IDs of the input fields. Since these IDs are invisible, this change doesn't have any impact on the website from a user's perspective. But when the test executes, it fails with a **NoSuchElementException**. This essentially means that this irrelevant change _broke the test_. Tests that ignore major changes but fail on invisible and hence irrelevant ones are the current standard in test automation. This is basically the _opposite_ of how a test should behave.

Now, take the original test and wrap the driver in a RecheckDriver:


```
`driver = new RecheckDriver( new ChromeDriver() );`
```

Then either replace the assertion with a call to **driver.capTest();** at the end of the test or add a Junit 5 rule: **@ExtendWith(RecheckExtension.class)**. If you remove the CSS from the website, the test fails, as it should:

![Failed test][10]

But if you change or remove the element IDs instead, the test still passes.

This surprising ability, coming from the "unbreakable" feature of recheck-web, is explained in detail below. This is how a test should behave: detect changes important to the user, and do not break on changes that are irrelevant to the user.

### How it works

The [recheck-web][5] project is a free, open source tool that operates on top of Selenium. It is golden master-based, which essentially means that it creates a copy of the rendered website the first time the test is executed, and subsequent runs of the test compare the current state against that copy (the golden master). This is how it can detect that the website has changed in unfavorable ways. It is also how it can still identify an element after its ID has changed: It simply peeks into the golden master (where the ID is still present) and finds the element there. Using additional properties like XPath, HTML name, and CSS classes, recheck-web identifies the element on the changed website and returns it to Selenium. The test can then interact with the element, just as before, and report the change.

![recheck-web's process][11]

#### Problems with golden master testing

Golden master testing, in general, has two essential drawbacks:

  1. It is often difficult to ignore irrelevant changes. Many changes are not problematic (e.g., date and time changes, random IDs, etc.). For the same reason that Git features the **.gitignore** file, recheck-web features the **recheck.ignore** file. And its Git-like syntax makes it easy to specify which differences to ignore.
  2. It is often cumbersome to maintain redundancy. Golden masters usually have quite an overlap. Often, the same change has to be approved multiple times, nullifying the efficiency gained during the fast test creation. For that, recheck comes complete with its own [command-line interface (CLI)][12] that takes care of this annoying task. The CLI (and the [commercial GUI][13]) lets users easily apply the same change to the same element in all instances or simply apply or ignore all changes at once.



The example above illustrates both drawbacks and their respective solutions: the changed ID was detected, but not reported because the ID attribute in the **recheck.ignore** file was specified to be ignored with **attribute=id**. Removing that rule makes the test fail, but it does not _break_ (the test still executes and reports the changed ID).

The example test uses the implicit checking mechanism, which automatically checks the result after every action. (Note that if you prefer to do explicit checking (e.g. by calling **re.check**) this is entirely possible.) Opening the URL, entering the user name, and entering the password are three actions that are being performed on the same page, therefore three golden masters are created for the same page. The changed ID thus is reported three times. All three instances can be treated with a single call to **recheck commit --all tests.report** on the command line. Applying the change makes the recheck-web test fail because the ID is removed from the golden master. This calls for anther neat feature of recheck-web: the **retestId**.

### Virtual constant IDs

The basic idea of the **retestId** is to introduce an additional attribute in the copy of the website. Since this attribute lives only in the website copy, not on the live site, it can never be affected by a change (unless the element is completely removed). This is called a _virtual constant ID_.

Now, this **retestId** can be referred to in the test. Simply replace the call to, for instance, **By._id_("username")** with **By._retestId_("username")**, and this problem is solved for good. This also addresses instances where elements are hard to reference because they have no ID to begin with.

### Filter mechanism

What would Git be without the **.gitignore** file? Filtering out irrelevant changes is one of the most important features of a version-control system. Traditional assertion-based testing ignores more than 99% of the changes. Instead, similar to Git without a **.gitignore** file, recheck-web reports any and all changes.

It's up to the user to ignore changes that aren't of interest. Recheck-web can be used for cross-browser testing, cross-device testing, deep visual regression testing, and functional regression testing, depending on what you do or do not ignore.

The filtering mechanism is as simple (based on the **.gitignore** file) as it is powerful. Single attributes can be filtered globally or for certain elements. Single elements—or even whole parts of the page—can be ignored. If this is not powerful enough, you can implement filter rules in JavaScript to, for example, ignore different URLs with the same base or position differences of less than five pixels.

A good starting point for understanding this is the [predefined filter files][14] that are distributed with recheck-web. Ignoring element positioning is usually a good idea. If you want to learn more about how to maintain your **recheck.ignore** file or create your own filters, see the [documentation][15].

### Summary

Recheck-web is one of the few golden master-based testing tools available; alternatives include Approval Tests and Jest.

Recheck-web provides the ability to quickly and easily create tests that are more complete and robust than traditional tests. Because it compares rendered websites (or parts of them) with each other, cross-browser testing, cross-platform testing, and other test scenarios can be realized. Also, this kind of testing is an "enabler" technology that will enable artificial intelligence to generate additional tests.

Recheck-web is free and open source, so please [try it out][5]. The company's business model is to offer additional services (e.g., storing golden masters and reports as well as an AI to generate tests) and to have a commercial GUI on top of the CLI for maintaining the golden masters.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/test-automation-without-assertions

作者：[Jeremias Roessler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/roesslerj
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://opensource.com/article/19/7/what-golden-image
[3]: https://approvaltests.com
[4]: https://jestjs.io/
[5]: https://github.com/retest/recheck-web
[6]: http://retest.de
[7]: https://github.com/retest/recheck-web-example
[8]: https://www.seleniumhq.org/
[9]: https://opensource.com/sites/default/files/uploads/webformerror.png (Website login form displayed as raw HTML)
[10]: https://opensource.com/sites/default/files/uploads/testfails.png (Failed test)
[11]: https://opensource.com/sites/default/files/uploads/recheck-web-process.png (recheck-web's process)
[12]: https://github.com/retest/recheck.cli
[13]: https://retest.de/review/
[14]: https://github.com/retest/recheck/tree/master/src/main/resources/filter/web
[15]: https://docs.retest.de/recheck/usage/filter
