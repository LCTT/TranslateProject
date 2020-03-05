[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with the Gutenberg editor in Drupal)
[#]: via: (https://opensource.com/article/20/3/gutenberg-editor-drupal)
[#]: author: (MaciejLukianski https://opensource.com/users/maciejlukianski)

Getting started with the Gutenberg editor in Drupal
======
Learn how to use the WYSIWYG editor, made popular in WordPress, with
Drupal.
![Text editor on a browser, in blue][1]

Since 2017, WordPress has had a really great WYSIWYG editor in the [Gutenberg][2] plugin. But the Drupal community hasn't yet reached consensus on the best approach to the content management system's (CMS) editorial experience. But a strong new option appeared when, with a lot of community effort, [Gutenberg was integrated with Drupal][3].

Previously, there were two main approaches to content creation in Drupal 8:

  * In the [**Paragraph-based approach**][4], content is assembled out of entities called paragraphs. Currently, approximately 100,000 websites use the Paragraphs module (according to Drupal).
  * The [**Layout-Builder approach**][5] uses an editorial tool shipped with Drupal 8.5. It is still undergoing improvements, but it is the next strong contender because it is really well integrated with the Drupal core. Stats on usage are not available since Layout Builder is part of Drupal.



At the end of 2018, the Drupal community, lead by Fronkom (a Norwegian digital agency strongly focused on open source solutions), ported the WordPress Gutenberg project as a contributed module into Drupal. Let's take a look at how Gutenberg works in Drupal (including some cool Drupal-specific integrations).

### Installation

Installing the [Gutenberg module][6] is as straightforward as installing any Drupal module, and it has good [installation documentation][7].

### Configuration

Gutenberg is integrated into Drupal's default content-entity creation workflow. You can use it on any of the content types you choose, provided that the content type has at least one text area field, which is where the Gutenberg editor's output will be saved.

To enable the Gutenberg project on a content type in Drupal, you have to navigate to its settings: **Structure &gt; Content types** and, from the dropdown next to the content type where you want to use Gutenberg, click **Edit**.

![Drupal settings][8]

In the form that appears, scroll down and select the **Gutenberg experience** tab on the left, where you can find the settings described below. Select the **Enable Gutenberg experience** box.

![Drupal Gutenberg settings][9]

#### Template

This is one of the cool features that is not available in WordPress out of the box. It enables you to define a template for a new page in a JSON structure. This will pre-populate all newly created articles with dummy placeholder content, which will help editors structure content correctly. In the screenshot above, I added a heading and a paragraph. Note that any double-quotes have to be escaped.

#### Template lock

This setting allows you to define whether users are allowed to delete the placeholder content, add new blocks, or just edit the existing, pre-populated content.

#### Allowed Gutenberg and Drupal blocks

This is another super-cool feature on the Drupal side of Gutenberg. Drupal allows users to create various types of blocks to design a page. For example, you could create a block with a list of the five latest blog posts, the most recent comments, or a form to collect users' emails.

Gutenberg's deep integration with Drupal allows users to select which Drupal blocks are available to users while they are editing (e.g., limit embeds to YouTube) and use blocks as inline content. This is a very handy feature that allows granular control of the user experience.

There's not much to choose from in a blank Drupal installation, but a live site usually has many blocks that provide various functionalities. In the screenshot below, the **Search form** Drupal block is selected.

![Drupal Gutenberg blocks][10]

After you finish the configuration, hit **Save content type**.

### Publishing content with Drupal Gutenberg

When Gutenberg is enabled for a content type, it takes over most of the editorial experience.

![Drupal Gutenberg content screen][11]

In the main window, you can see the dummy placeholder content I added in the Template configuration above.

#### Drupal-specific options

On the right-hand side, there are a few fields and settings that Drupal provides. For example, the **Title** field is a required separate field in Drupal, and therefore it is not on the main Gutenberg screen.

Underneath the **Title**, there are additional settings that can vary, depending on the modules installed and options set up in Drupal. You can see **Revision log messages**, **Menu settings**, **Comment settings**, and a place to add a **URL alias**.

Typically, Drupal content types are composed of several text fields, such as tags, categories, checkboxes, image fields for teasers, etc. When you enable Gutenberg for a content type, these additional fields are available in the **More settings** tab.

You can now add your content—it works the same as it does in WordPress Gutenberg, with the additional option to add Drupal blocks.

In the screenshot below, you can see what happens when I add some text to replace the placeholder text, a search block from Drupal, a title, tags, and a custom URL alias.

![Drupal Gutenberg entering text][12]

After you hit **Save**, your content will be published.

![Drupal Gutenberg output][13]

And that is it. It works like a charm!

### Working together for better software experiences

Gutenberg in Drupal works well. It is an alternative option that allows editors to control the look and feel of their websites down to the tiniest details. Adoption is growing well, with over 1,000 installations as of this writing and 50 new ones every month. The Drupal integration adds other cool features like fine-grained permissions, placeholder content, and the ability to include Drupal blocks inline, which aren't available in the WordPress plugin.

It is great to see the communities of two separate projects working together to achieve the common goal of giving people better software.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/gutenberg-editor-drupal

作者：[MaciejLukianski][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/maciejlukianski
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://wordpress.org/plugins/gutenberg/
[3]: https://drupalgutenberg.org/
[4]: https://www.droptica.com/blog/flexible-and-easy-content-creation-drupal-paragraphs-module/
[5]: https://www.droptica.com/blog/layout-builder-building-drupal-8-layouts/
[6]: https://www.drupal.org/project/gutenberg
[7]: https://www.drupal.org/docs/8/extending-drupal-8/installing-drupal-8-modules
[8]: https://opensource.com/sites/default/files/uploads/gutenberg_edit.png (Drupal settings)
[9]: https://opensource.com/sites/default/files/uploads/gutenberg_settings.png (Drupal Gutenberg settings)
[10]: https://opensource.com/sites/default/files/uploads/gutenberg_blocks.png (Drupal Gutenberg blocks)
[11]: https://opensource.com/sites/default/files/uploads/gutenberg_contentwindow.png (Drupal Gutenberg content screen)
[12]: https://opensource.com/sites/default/files/uploads/gutenberg_entry.png (Drupal Gutenberg entering text)
[13]: https://opensource.com/sites/default/files/uploads/gutenberg-demo.png (Drupal Gutenberg output)
