[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create an online store with this Java-based framework)
[#]: via: (https://opensource.com/article/19/1/scipio-erp)
[#]: author: (Paul Piper https://opensource.com/users/madppiper)

Create an online store with this Java-based framework
======
Scipio ERP comes with a large range of applications and functionality.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_whitehurst_money.png?itok=ls-SOzM0)

So you want to sell products or services online, but either can't find a fitting software or think customization would be too costly? [Scipio ERP][1] may just be what you are looking for.

Scipio ERP is a Java-based open source e-commerce framework that comes with a large range of applications and functionality. The project was forked from [Apache OFBiz][2] in 2014 with a clear focus on better customization and a more modern appeal. The e-commerce component is quite extensive and works in a multi-store setup, internationally, and with a wide range of product configurations, and it's also compatible with modern HTML frameworks. The software also provides standard applications for many other business cases, such as accounting, warehouse management, or sales force automation. It's all highly standardized and therefore easy to customize, which is great if you are looking for more than a virtual cart.

The system makes it very easy to keep up with modern web standards, too. All screens are constructed using the system's "[templating toolkit][3]," an easy-to-learn macro set that separates HTML from all applications. Because of it, every application is already standardized to the core. Sounds confusing? It really isn't—it all looks a lot like HTML, but you write a lot less of it.

### Initial setup

Before you get started, make sure you have Java 1.8 (or greater) SDK and a Git client installed. Got it? Great! Next, check out the master branch from GitHub:

```
git clone https://github.com/ilscipio/scipio-erp.git
cd scipio-erp
git checkout master
```

To set up the system, simply run **./install.sh** and select either option from the command line. Throughout development, it is best to stick to an **installation for development** (Option 1), which will also install a range of demo data. For professional installations, you can modify the initial config data ("seed data") so it will automatically set up the company and catalog data for you. By default, the system will run with an internal database, but it [can also be configured][4] with a wide range of relational databases such as PostgreSQL and MariaDB.

![Setup wizard][6]

Follow the setup wizard to complete your initial configuration,

Start the system with **./start.sh** and head over to **<https://localhost:8443/setup/>** to complete the configuration. If you installed with demo data, you can log in with username **admin** and password **scipio**. During the setup wizard, you can set up a company profile, accounting, a warehouse, your product catalog, your online store, and additional user profiles. Keep the website entries on the product store configuration screen for now. The system allows you to run multiple webstores with different underlying code; unless you want to do that, it is easiest to stick to the defaults.

Congratulations, you just installed Scipio ERP! Play around with the screens for a minute or two to get a feel for the functionality.

### Shortcuts

Before you jump into the customization, here are a few handy commands that will help you along the way:

  * Create a shop-override: **./ant create-component-shop-override**
  * Create a new component: **./ant create-component**
  * Create a new theme component: **./ant create-theme**
  * Create admin user: **./ant create-admin-user-login**
  * Various other utility functions: **./ant -p**
  * Utility to install & update add-ons: **./git-addons help**



Also, make a mental note of the following locations:

  * Scripts to run Scipio as a service: **/tools/scripts/**
  * Log output directory: **/runtime/logs**
  * Admin application: **<https://localhost:8443/admin/>**
  * E-commerce application: **<https://localhost:8443/shop/>**



Last, Scipio ERP structures all code in the following five major directories:

  * Framework: framework-related sources, the application server, generic screens, and configurations
  * Applications: core applications
  * Addons: third-party extensions
  * Themes: modifies the look and feel
  * Hot-deploy: your own components



Aside from a few configurations, you will be working within the hot-deploy and themes directories.

### Webstore customizations

To really make the system your own, start thinking about [components][7]. Components are a modular approach to override, extend, and add to the system. Think of components as self-contained web modules that capture information on databases ([entity][8]), functions ([services][9]), screens ([views][10]), [events and actions][11], and web applications. Thanks to components, you can add your own code while remaining compatible with the original sources.

Run **./ant create-component-shop-override** and follow the steps to create your webstore component. A new directory will be created inside of the hot-deploy directory, which extends and overrides the original e-commerce application.

![component directory structure][13]

A typical component directory structure.

Your component will have the following directory structure:

  * config: configurations
  * data: seed data
  * entitydef: database table definitions
  * script: Groovy script location
  * servicedef: service definitions
  * src: Java classes
  * webapp: your web application
  * widget: screen definitions



Additionally, the **ivy.xml** file allows you to add Maven libraries to the build process and the **ofbiz-component.xml** file defines the overall component and web application structure. Apart from the obvious, you will also find a **controller.xml** file inside the web apps' **WEB-INF** directory. This allows you to define request entries and connect them to events and screens. For screens alone, you can also use the built-in CMS functionality, but stick to the core mechanics first. Familiarize yourself with **/applications/shop/** before introducing changes.

#### Adding custom screens

Remember the [templating toolkit][3]? You will find it used on every screen. Think of it as a set of easy-to-learn macros that structure all content. Here's an example:

```
<@section title="Title">
    <@heading id="slider">Slider</@heading>
    <@row>
        <@cell columns=6>
            <@slider id="" class="" controls=true indicator=true>
                <@slide link="#" image="https://placehold.it/800x300">Just some content…</@slide>
                <@slide title="This is a title" link="#" image="https://placehold.it/800x300"></@slide>
            </@slider>
        </@cell>
        <@cell columns=6>Second column</@cell>
    </@row>
</@section>
```

Not too difficult, right? Meanwhile, themes contain the HTML definitions and styles. This hands the power over to your front-end developers, who can define the output of each macro and otherwise stick to their own build tools for development.

Let's give it a quick try. First, define a request on your own webstore. You will modify the code for this. A built-in CMS is also available at **<https://localhost:8443/cms/>** , which allows you to create new templates and screens in a much more efficient way. It is fully compatible with the templating toolkit and comes with example templates that can be adopted to your preferences. But since we are trying to understand the system here, let's go with the more complicated way first.

Open the **[controller.xml][14]** file inside of your shop's webapp directory. The controller keeps track of request events and performs actions accordingly. The following will create a new request under **/shop/test** :

```
<!-- Request Mappings -->
<request-map uri="test">
     <security https="true" auth="false"/>
      <response name="success" type="view" value="test"/>
</request-map>
```

You can define multiple responses and, if you want, you could use an event or a service call inside the request to determine which response you may want to use. I opted for a response of type "view." A view is a rendered response; other types are request-redirects, forwards, and alike. The system comes with various renderers and allows you to determine the output later; to do so, add the following:

```
<!-- View Mappings -->
<view-map name="test" type="screen" page="component://mycomponent/widget/CommonScreens.xml#test"/>
```

Replace **my-component** with your own component name. Then you can define your very first screen by adding the following inside the tags within the **widget/CommonScreens.xml** file:

```
<screen name="test">
        <section>
            <actions>
            </actions>
            <widgets>
                <decorator-screen name="CommonShopAppDecorator" location="component://shop/widget/CommonScreens.xml">
                    <decorator-section name="body">
                        <platform-specific><html><html-template location="component://mycomponent/webapp/mycomponent/test/test.ftl"/></html></platform-specific>
                    </decorator-section>
                </decorator-screen>
            </widgets>
        </section>
    </screen>
```

Screens are actually quite modular and consist of multiple elements ([widgets, actions, and decorators][15]). For the sake of simplicity, leave this as it is for now, and complete the new webpage by adding your very first templating toolkit file. For that, create a new **webapp/mycomponent/test/test.ftl** file and add the following:

```
<@alert type="info">Success!</@alert>
```

![Custom screen][17]

A custom screen.

Open **<https://localhost:8443/shop/control/test/>** and marvel at your own accomplishments.

#### Custom themes

Modify the look and feel of the shop by creating your very own theme. All themes can be found as components inside of the themes folder. Run **./ant create-theme** to add your own.

![theme component layout][19]

A typical theme component layout.

Here's a list of the most important directories and files:

  * Theme configuration: **data/*ThemeData.xml**
  * Theme-specific wrapping HTML: **includes/*.ftl**
  * Templating Toolkit HTML definition: **includes/themeTemplate.ftl**
  * CSS class definition: **includes/themeStyles.ftl**
  * CSS framework: **webapp/theme-title/***



Take a quick look at the Metro theme in the toolkit; it uses the Foundation CSS framework and makes use of all the things above. Afterwards, set up your own theme inside your newly constructed **webapp/theme-title** directory and start developing. The Foundation-shop theme is a very simple shop-specific theme implementation that you can use as a basis for your own work.

Voila! You have set up your own online store and are ready to customize!

![Finished Scipio ERP shop][21]

A finished shop based on Scipio ERP.

### What's next?

Scipio ERP is a powerful framework that simplifies the development of complex e-commerce applications. For a more complete understanding, check out the project [documentation][7], try the [online demo][22], or [join the community][23].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/scipio-erp

作者：[Paul Piper][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/madppiper
[b]: https://github.com/lujun9972
[1]: https://www.scipioerp.com
[2]: https://ofbiz.apache.org/
[3]: https://www.scipioerp.com/community/developer/freemarker-macros/
[4]: https://www.scipioerp.com/community/developer/installation-configuration/configuration/#database-configuration
[5]: /file/419711
[6]: https://opensource.com/sites/default/files/uploads/setup_step5_sm.jpg (Setup wizard)
[7]: https://www.scipioerp.com/community/developer/architecture/components/
[8]: https://www.scipioerp.com/community/developer/entities/
[9]: https://www.scipioerp.com/community/developer/services/
[10]: https://www.scipioerp.com/community/developer/views-requests/
[11]: https://www.scipioerp.com/community/developer/events-actions/
[12]: /file/419716
[13]: https://opensource.com/sites/default/files/uploads/component_structure.jpg (component directory structure)
[14]: https://www.scipioerp.com/community/developer/views-requests/request-controller/
[15]: https://www.scipioerp.com/community/developer/views-requests/screen-widgets-decorators/
[16]: /file/419721
[17]: https://opensource.com/sites/default/files/uploads/success_screen_sm.jpg (Custom screen)
[18]: /file/419726
[19]: https://opensource.com/sites/default/files/uploads/theme_structure.jpg (theme component layout)
[20]: /file/419731
[21]: https://opensource.com/sites/default/files/uploads/finished_shop_1_sm.jpg (Finished Scipio ERP shop)
[22]: https://www.scipioerp.com/demo/
[23]: https://forum.scipioerp.com/
