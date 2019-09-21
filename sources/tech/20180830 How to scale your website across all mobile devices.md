How to scale your website across all mobile devices
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q)

Most of us surf the internet, make online purchases, and even pay bills using our mobile devices because they are handy and easily accessible. According to a Forrester study, [The Digital Business Imperative][1], 43% of banking customers in the US used mobile phones to complete banking transactions in a three-month period.

The significant year-over-year growth of online business transactions done via mobile devices has encouraged companies to build websites and e-commerce sites that look, feel, and function identically on computers and smart mobile devices. However, many users still find the experience of browsing a website on a smartphone isn’t the same as on a computer. In order to develop websites that scale effectively and smoothly across different devices, it's important to understand what causes these differences across platforms.

Web pages are usually composed of one or more of the following components: Header and footer, main content (text), images, forms, videos, and tables. Devices differ on features such as screen dimension (length x width), screen resolution (pixel density), compute power (CPU and memory), and operating system (iOS, Android, Windows, etc.). These differences contribute significantly to the overall performance and rendering of web components such as images, videos, and text across different devices. Another important factor is that mobile users may not always be connected to a high-speed network, so web pages should be carefully designed to work effectively on low-bandwidth connections.

### The most troublesome issues on mobile platforms

Here are some of the most common issues that can affect the performance and scalability of websites across devices:

  * **Sites do not automatically adapt to different screen sizes.** Some websites are designed to format for variable screen sizes, but their elements may not auto-scale. This would result in the site automatically adjusting itself for various screen sizes, but the elements in the site may look too large on smaller devices. Some sites may not be designed to adjust for variable screen sizes, causing the elements to look extremely small on devices with smaller screens.
  * **Sites have too much content for mobile devices.** Some websites are loaded with content to fill empty space on a desktop screen. Websites developed without considering mobile users generally fall under this category. These sites take more time and bandwidth to load, and if the pages aren’t designed appropriately for mobile devices, some content may not even appear.
  * **Sites take too long to load images.** Websites with too many images or heavy image files are likely to take a long time to load, especially if the images were not optimized during the design phase.
  * **Data in tables looks complex and takes too long to load.** Many websites present data in a tabular fashion (for example, comparisons of competing products, airfare data from different travel sites, flight schedules, etc.), and on mobile devices, these tables can be slow and difficult to comprehend.
  * **Websites host videos that don’t play on some devices.** Not all mobile devices support all video formats. Some websites host media that require licenses, Adobe Flash, or other players that some mobile devices may not support. This causes frustration and a poor overall user experience.



### Design your sites to adapt to different devices

All these issues can be addressed through proper design and by adopting a [mobile-first][2] approach. When working with limitations such as screen size, bandwidth, etc., focus on the right quantity and quality of content. A mobile-first strategy places content as the primary object and designs for the smallest devices, ensuring that a site includes only the most essential features. Address the design challenges for mobile devices first, and then progressively enhance the design for larger devices.

Here are a few best practices to consider when designing websites that need to scale on different devices.

* **Adapting to any screen size**. At a minimum, a web page needs to be scaled to fit the screen size of any mobile device. Today's mobile devices come with very high screen resolutions. The pixel density on mobile devices is much higher than that of desktop screens, so it is important to format pages to match the mobile screen’s width in device-independent pixels. The “meta viewport” tag included in the HTML document addresses this requirement.

![](https://opensource.com/sites/default/files/uploads/image_1_0.png)

The meta viewport value, as shown above, helps format the entire HTML page and render the content to match any screen size.

* **" Content is king."** Content should determine the design of a website, not vice versa. Websites with too many elements such as tables, forms, charts, etc., become challenging when they need to scale on mobile devices. Developers end up hiding content for mobile users, and the desktop version and the mobile version become inconsistent. The design should focus on the core structure and content rather than decorative elements. The mobile-first methodology ensures a single version of content for both desktop and mobile users, so web designers should carefully consider, craft, and optimize content so that it not only satisfies business goals but also appeals to mobile users. Content that doesn’t appear in the mobile version may not even need to appear in the desktop version.
* **Responsive images**. The design should consider small hand-held devices operating in areas with low signal strength. Large photos and complex graphics are not suitable for mobile devices operating under such conditions. Make sure all images are optimized for different sizes of viewports and pixel densities. A recommended approach is [resolution switching][3], which enables the browser to select an appropriately sized image file, depending on the screen size of a device. Resolution switching uses two attributes—`srcset` and `sizes` (shown in the code snippet shown below)—which enable the browser to use the device width to select the most suitable media condition provided in the sizes list, choose the slot size based on that condition, and load the image referenced in the `srcset` that most closely matches the chosen slot size.

![](https://opensource.com/sites/default/files/uploads/image_2_0.png)

For example, if a device with a viewport of 320px loads the page, the media condition (max-width: 320px) in the sizes list will be true, and the corresponding 280px slot will be chosen. The width of the first image listed in `srcset` (elephant-320w.jpg) is the closest to this slot. Browsers that don’t support resolution switching display the image listed in the src attribute as the default image. This approach not only picks the right image for your device viewport, but it also prevents loading unnecessarily large images that consume significant bandwidth.

![](https://opensource.com/sites/default/files/uploads/image_3_0.png)

* **Responsive tables.** As the world becomes more data-driven, bringing critical, time-sensitive data to handheld devices provides power and freedom to users. The challenge is to present data in a way that is easy to load and read on mobile devices. Some data needs to be presented in the form of a table, but when data tables get too large and unwieldy, it can be frustrating for users to interpret them on a mobile device with a small screen. If the screen is much narrower than the width of the table, for example, users are forced to zoom out, making the text too small to read. Conversely, if the screen is wider than the table, users must zoom in to view the data, which requires constant vertical and horizontal scrolling.

Fortunately, there are several ways to build [responsive tables][4]. Here is one of the most effective:

    * The table's columns are transposed into rows. Each column is sized to the same width as the screen, preventing the need to scroll horizontally. Use of color helps users clearly distinguish each individual row of data. In this case, for each “cell,” the CSS-generated content `(:before)` should be used to apply the label so that each piece of data can be identified clearly.
    * Another approach is to display the data in one of two formats, based on screen width: chart format (for narrow screens) or complete table format (for wider screens). If the user wants to click the chart to see the complete table, the approach described above can be used to show the data in tabular form.(:before)
    * A third approach is to show a mini-graphic in a narrow screen to indicate the presence of a table. The user can click on the graphic to expand and display the table.
* **Videos that always play.** [Video files][5] generally won’t play on mobile devices if their formats are unsupported or if they require a proprietary video player. The recommended approach is to use standard HTML5 tags for videos and animations. The video element in HTML5 can be used to load, decode, and play videos on your website. Produce video in multiple formats to suit different mobile platforms, and be sure to size videos appropriately so that they play within their containers.

The example below shows the use of tags to specify different video formats (indicated by the type element). In this approach, the switch to the correct format happens at the client side, and only one request is made to the server. This reduces network latency and lets the browser select the most appropriate video format without first downloading it.

![](https://opensource.com/sites/default/files/uploads/image_4_0.png)

The `videoWidth` and `videoHeight` properties of the video element help identify the encoded size of a video. Video dimensions can be controlled using JavaScript or CSS. `max-width: 100%` helps size the videos to fit the screen. CSS media queries can be used to set the size based on the viewport dimensions. There are also several JavaScript libraries and plugins that can maintain the aspect ratio and size of videos.

### All things considered…

These days, users regularly surf the web and perform business transactions with their smartphones and tablets. The web is becoming the primary business channel for many businesses worldwide. Consequently, it is important to develop websites that work and scale well on mobile devices. The goal is to enhance the mobile user experience so that it mirrors the functionality and performance of desktop computers and large monitors.

The mobile-first approach helps web designers create sites that operate well on small mobile devices. Design should focus on content that satisfies business requirements while also considering technical limitations such as screen size, processor speed, memory, and operating conditions (e.g., poor network signal strength). It must also ensure that pictures, videos, and data are responsive across all mobile devices while remaining sensitive to breakpoints, touch targets, etc.

A well-designed website that works and scales on a small device can always be progressively enhanced to work on larger devices.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/how-scale-your-website-across-all-devices

作者：[Sridhar Asvathanarayanan][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sasvathanarayanangmailcom
[1]: https://www.forrester.com/report/The+Digital+Business+Imperative/-/E-RES115784#
[2]: https://www.uxpin.com/studio/blog/a-hands-on-guide-to-mobile-first-design/
[3]: https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images
[4]: https://css-tricks.com/responsive-data-tables/
[5]: https://developers.google.com/web/fundamentals/media/video
