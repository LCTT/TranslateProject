[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create interactive content in WordPress with the H5P plugin)
[#]: via: (https://opensource.com/article/20/5/h5p-wordpress)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Create interactive content in WordPress with the H5P plugin
======
Turn your WordPress site into an interactive learning management system
with this open source plugin.
![Family learning and reading together at night in a room][1]

WordPress is best known as a website content management system, but it also a great [learning management system][2] (LMS) for delivering online courses. If that is what you are looking for out of WordPress, then [H5P][3] should be the top plugin on your list.

H5P is a way to create and share interactive HTML5 content, including presentations, games, quizzes, forms, and more, in a browser. You can download a wide variety of content types from H5P's [Examples and Downloads][4] page, or you can create unique content to embed in your WordPress site.

H5P provides plugins and integrations for WordPress, Moodle, Drupal, Canvas, Brightspace, Blackboard, and more. In this article, I will show how to use H5P in WordPress to create a reading comprehension quiz for students.

### Install the H5P plugin

The first step is to install the plugin. Log into your WordPress admin panel, go to **Plugins**, select **Add New**, and search for **H5P** in the Plugins field. When you find it, select **Install Now**.

![Adding the H5P plugin][5]

(Don Watkins, [CC BY-SA 4.0][6])

H5P should now appear in the list of installed plugins. Be sure to **Activate** the plugin by going to the H5P menu at the bottom of your WordPress admin panel and clicking the button. You will see the following display—be sure to consent so you can connect to the H5P Hub.

![H5P consent option][7]

(Don Watkins, [CC BY-SA 4.0][6])

Now you can begin adding H5P content to your WordPress installation.

### Create a quiz

One of my favorite poems is Robert Frost's "The Road Not Taken." Suppose you are teaching a class that is studying this poem, and one of your objectives is for your students to remember the poem's author. First, create a new WordPress post on your site that contains the poem's text and its author.

![Creating a WordPress post][8]

(Don Watkins, [CC BY-SA 4.0][6])

Now you want to test your students' comprehension with an HTML5 interactive content embedded below the poem.

In the WordPress admin panel, look near the bottom for the **H5P Content** menu and select it. In the menu that appears, click **Add New**.

![H5P Content menu][9]

(Don Watkins, [CC BY-SA 4.0][6])

You will see an array of content options that are available. Since you want to create a multiple-choice quiz, look for the **Multiple Choice** option and click **Get** to its right.

![H5P content types][10]

(Don Watkins, [CC BY-SA 4.0][6])

A form will open for you to start creating the quiz. Fill in the required fields (marked with a red asterisk)—give your quiz a title (e.g., "Road Not Taken Quiz"), enter a question (e.g., "Who wrote, 'The Road Not Taken'?") and correct and incorrect answers, and select the correct answer in the dialog box. When you finish creating the quiz, save the content.

![H5P quiz][11]

(Don Watkins, [CC BY-SA 4.0][6])

### Embed the quiz in a post

Now you're ready to insert the quiz exactly where you want it to appear in your post. Open the post where you want to put the quiz (e.g., "The Road Not Taken" post) in your WordPress editor, and you should see an **Add H5P** button near the top of the interface. Place your cursor wherever you want the quiz to appear in the post, and click **Add H5P**. Your H5P content will appear in a dialog box like this:

![H5P list of interactive content][12]

(Don Watkins, [CC BY-SA 4.0][6])

Select the content you want, and H5P will insert an embed code (e.g., `[h5p id="1"]`) in the post, like this:

![H5P embed code in a post][13]

(Don Watkins, [CC BY-SA 4.0][6])

Save your post, then open it in your browser. The quiz is exactly where you wanted it to appear in the post:

![H5P quiz shown in the post][14]

(Don Watkins, [CC BY-SA 4.0][6])

When a student answers this question correctly, they get pleasant visual feedback:

![Correct answer selection][15]

(Don Watkins, [CC BY-SA 4.0][6])

### The possibilities are endless

H5P offers a wide range of options to add interactivity to WordPress posts. In this example, you could have created a more complex set of multiple-choice questions. H5P also has lots of other content types, including interactive video, arithmetic quizzes, an audio recorder, image hotspots, fill-in-the-blank quizzes, and [many more][4].

H5P also provides [excellent documentation][16] and [great tutorials][17] to help anyone who wants to use the plugin on their WordPress site. H5P software is open source under the [MIT License][18] with the code available on [GitHub][19]. H5P also welcomes contributions to the community; check out the [developer guide][20] for more information.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/h5p-wordpress

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/family_learning_kids_night_reading.png?itok=6K7sJVb1 (Family learning and reading together at night in a room)
[2]: https://en.wikipedia.org/wiki/Learning_management_system
[3]: https://h5p.org/
[4]: https://h5p.org/content-types-and-applications
[5]: https://opensource.com/sites/default/files/uploads/addplugins-h5p.png (Adding the H5P plugin)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/h5p-consent.png (H5P consent option)
[8]: https://opensource.com/sites/default/files/uploads/wordpress-post.png (WordPress post)
[9]: https://opensource.com/sites/default/files/uploads/h5p-content-menu.png (H5P Content menu)
[10]: https://opensource.com/sites/default/files/uploads/h5p-content-types.png (H5P content types)
[11]: https://opensource.com/sites/default/files/uploads/h5p-multiple-choice-quiz.png (H5P quiz)
[12]: https://opensource.com/sites/default/files/uploads/h5p-insert-interactive-content.png (H5P list of interactive content)
[13]: https://opensource.com/sites/default/files/uploads/h5p-embedded-content.png (H5P embed code in a post)
[14]: https://opensource.com/sites/default/files/uploads/h5p-quiz.png (H5P quiz shown in the post)
[15]: https://opensource.com/sites/default/files/uploads/h5p-correct-answer.png (Correct answer selection)
[16]: https://h5p.org/documentation/setup/wordpress
[17]: https://h5p.org/documentation/for-authors/tutorials
[18]: https://h5p.org/MIT-licensed
[19]: https://github.com/h5p
[20]: https://h5p.org/developers
