ictlyh Translating
PHP Security
================================================================================
![](http://www.codeproject.com/KB/PHP/363897/php_security.jpg)

### Introduction ### 

When offering an Internet service, you must always keep security in mind as you develop your code. It may appear that most PHP scripts aren't sensitive to security concerns; this is mainly due to the large number of inexperienced programmers working in the language. However, there is no reason for you to have an inconsistent security policy based on a rough guess at your code's significance. The moment you put anything financially interesting on your server, it becomes likely that someone will try to casually hack it. Create a forum program or any sort of shopping cart, and the probability of attack rises to a dead certainty. 

### Background ###

Here are a few general security guidelines for securing your web content:

#### Don't trust forms ####

Hacking forms is trivial. Yes, by using a silly JavaScript trick, you may be able to limit your form to allow only the numbers 1 through 5 in a rating field. The moment someone turns JavaScript off in their browser or posts custom form data, your client-side validation flies out the window. 

Users interact with your scripts primarily through form parameters, and therefore they're the biggest security risk. What's the lesson? Always validate the data that gets passed to any PHP script in the PHP script. In this article, we show you how to analyze and protect against cross-site scripting (XSS) attacks, which can hijack your user's credentials (and worse). You'll also see how to prevent the MySQL injection attacks that can taint or destroy your data.

#### Don't trust users   ####

Assume that every piece of data your website gathers is laden with harmful code. Sanitize every piece, even if you're positive that nobody would ever try to attack your site.

#### Turn off global variables ####

The biggest security hole you can have is having the register_globals configuration parameter enabled. Mercifully, it's turned off by default in PHP 4.2 and later. If **register_globals** is on, then you can disable this feature by turning the register_globals variable to Off in your server's php.ini file : 

    register_globals = Off 

Novice programmers view registered globals as a convenience, but they don't realize how dangerous this setting is. A server with global variables enabled automatically assigns global variables to any form parameters. For an idea of how this works and why this is dangerous, let's look at an example.

Let's say that you have a script named process.php that enters form data into your user database. The original form looked like this: 

    <input name="username" type="text" size="15" maxlength="64">

When running process.php, PHP with registered globals enabled places the value of this parameter into the $username variable. This saves some typing over accessing them through **$_POST['username']** or **$_GET['username']**. Unfortunately, this also leaves you open to security problems, because PHP sets a variable for any value sent to the script via a GET or POST parameter, and that is a big problem if you didn't explicitly initialize the variable and you don't want someone to manipulate it.

Take the script below, for example—if the $authorized variable is true, it shows confidential data to the user. Under normal circumstances, the $authorized variable is set to true only if the user has been properly authenticated via the hypothetical authenticated_user() function. But if you have **register_globals** active, anyone could send a GET parameter such as authorized=1 to override this:

    <?php
    // Define $authorized = true only if user is authenticated
    if (authenticated_user()) {
        $authorized = true;
    }
    ?>

The moral of the story is that you should pull form data from predefined server variables. All data passed on to your web page via a posted form is automatically stored in a large array called $_POST, and all GET data is stored in a large array called **$_GET**. File upload information is stored in a special array called $_FILES. In addition, there is a combined variable called $_REQUEST.

To access the username field from a POST method form, use **$_POST['username']**. Use **$_GET['username']** if the username is in the URL. If you don't care where the value came from, use **$_REQUEST['username']**.

    <?php
    $post_value = $_POST['post_value'];
    $get_value = $_GET['get_value'];
    $some_variable = $_REQUEST['some_value']; 
    ?>  

$_REQUEST is a union of the $_GET, $_POST, and $_COOKIE arrays. If you have two or more values of the same parameter name, be careful of which one PHP uses. The default order is cookie, POST, then GET.

#### Recommended Security Configuration Options ####

There are several PHP configuration settings that affect security features. Here are the ones that should obviously be used for production servers:

- **register_globals** set to off
- **safe_mode** set to off
- **error_reporting** set to off. This is visible error reporting that sends a message to the user's browser if something goes wrong. For production servers, use error logging instead. Development servers can enable error logging as long as they're behind a firewall.
- Disable these functions: system(), exec(), passthru(), shell_exec(), proc_open(), and popen().
- **open_basedir** set for both the /tmp directory (so that session information can be stored) and the web root so that scripts cannot access files outside a selected area.
- **expose_php** set to off. This feature adds a PHP signature that includes the version number to the Apache headers. 
- **allow_url_fopen** set to off. This isn't strictly necessary if you're careful about how you access files in your code—that is, you validate all input parameters. 
- **allow_url_include** set to off. There's really no sane reason for anyone to want to access include files via HTTP. 

In general, if you find code that wants to use these features, you shouldn't trust it. Be especially careful of anything that wants to use a function such as system()—it's almost certainly flawed.

With these settings now behind us, let's look at some specific attacks and the methods that will help you protect your server. 

### SQL Injection Attacks  ###

Because the queries that PHP passes to MySQL databases are written in the powerful SQL programming language, you run the risk of someone attempting an SQL injection attack by using MySQL in web query parameters. By inserting malicious SQL code fragments into form parameters, an attacker attempts to break into (or disable) your server.

Let's say that you have a form parameter that you eventually place into a variable named $product, and you create some SQL like this: 

    $sql = "select * from pinfo where product = '$product'";

If that parameter came straight from the form, use database-specific escapes with PHP's native functions, like this:

    $sql = 'Select * from pinfo where product = '"' 
           mysql_real_escape_string($product) . '"';

If you don't, someone might just decide to throw this fragment into the form parameter:

    39'; DROP pinfo; SELECT 'FOO 

Then the result of $sql is:

    select product from pinfo where product = '39'; DROP pinfo; SELECT 'FOO' 

Because the semicolon is MySQL's statement delimiter, the database processes these three statements:

    select * from pinfo where product = '39'
    DROP pinfo
    SELECT 'FOO' 

Well, there goes your table.

Note that this particular syntax won't actually work with PHP and MySQL, because the **mysql_query()** function allows just one statement to be processed per request. However, a subquery will still work.

To prevent SQL injection attacks, do two things:

- Always validate all parameters. For example, if something needs to be a number, make sure that it's a number.
- Always use the mysql_real_escape_string() function on data to escape any quotes or double quotes in your data. 

**Note: To automatically escape any form data, you can turn on Magic Quotes.**

Some MySQL damage can be avoided by restricting your MySQL user privileges. Any MySQL account can be restricted to only do certain kinds of queries on selected tables. For example, you could create a MySQL user who can select rows but nothing else. However, this is not terribly useful for dynamic data, and, furthermore, if you have sensitive customer information, it might be possible for someone to have access to some data that you didn't intend to make available. For example, a user accessing account data could try to inject some code that accesses another account number instead of the one assigned to the current session. 

### Preventing Basic XSS Attacks  ###

XSS stands for cross-site scripting. Unlike most attacks, this exploit works on the client side. The most basic form of XSS is to put some JavaScript in user-submitted content to steal the data in a user's cookie. Since most sites use cookies and sessions to identify visitors, the stolen data can then be used to impersonate that user—which is deeply troublesome when it's a typical user account, and downright disastrous if it's the administrative account. If you don't use cookies or session IDs on your site, your users aren't vulnerable, but you should still be aware of how this attack works.

Unlike MySQL injection attacks, XSS attacks are difficult to prevent. Yahoo!, eBay, Apple, and Microsoft have all been affected by XSS. Although the attack doesn't involve PHP, you can use PHP to strip user data in order to prevent attacks. To stop an XSS attack, you have to restrict and filter the data a user submits to your site. It is for this precise reason that most online bulletin boards don't allow the use of HTML tags in posts and instead replace them with custom tag formats such as **[b]** and **[linkto]**. 

Let's look at a simple script that illustrates how to prevent some of these attacks. For a more complete solution, use SafeHTML, discussed later in this article. 

    function transform_HTML($string, $length = null) {
    // Helps prevent XSS attacks
        // Remove dead space.
        $string = trim($string);
        // Prevent potential Unicode codec problems.
        $string = utf8_decode($string);
        // HTMLize HTML-specific characters.
        $string = htmlentities($string, ENT_NOQUOTES);
        $string = str_replace("#", "&#35;", $string);
        $string = str_replace("%", "&#37;", $string);
        $length = intval($length);
        if ($length > 0) {
            $string = substr($string, 0, $length);
        }
        return $string;
    } 

This function transforms HTML-specific characters into HTML literals. A browser renders any HTML run through this script as text with no markup. For example, consider this HTML string:

    <STRONG>Bold Text</STRONG>

Normally, this HTML would render as follows:

    Bold Text

However, when run through **transform_HTML()**, it renders as the original input. The reason is that the tag characters are HTML entities in the processed string. The resulting string from **HTML()** in plaintext looks like this:

    &lt;STRONG&gt;Bold Text&lt;/STRONG&gt; 

The essential piece of this function is the htmlentities() function call that transforms <, >, and & into their entity equivalents of **&lt;**, **&gt;**, and **&amp;**. Although this takes care of the most common attacks, experienced XSS hackers have another sneaky trick up their sleeve: Encoding their malicious scripts in hexadecimal or UTF-8 instead of normal ASCII text, hoping to circumvent your filters. They can send the code along as a GET variable in the URL, saying, "Hey, this is hexadecimal code, but could you run it for me anyway?" A hexadecimal example looks something like this:

    <a href="http://host/a.php?variable=%22%3e %3c%53%43%52%49%50%54%3e%44%6f%73%6f%6d%65%74%68%69%6e%67%6d%61%6c%69%63%69%6f%75%73%3c%2f%53%43%52%49%50%54%3e"> 

But when the browser renders that information, it turns out to be:

    <a href="http://host/a.php?variable="> <SCRIPT>Dosomethingmalicious</SCRIPT>

To prevent this, transform_HTML() takes the additional steps of converting # and % signs into their entity, shutting down hex attacks, and converting UTF-8–encoded data.

Finally, just in case someone tries to overload a string with a very long input, hoping to crash something, you can add an optional $length parameter to trim the string to the maximum length you specify. 

### Using SafeHTML ###

The problem with the previous script is that it is simple, and it does not allow for any kind of user markup. Unfortunately, there are hundreds of ways to try to sneak JavaScript past someone's filters, and short of stripping all HTML from someone's input, there's no way of stopping it.

Currently, there's no single script that's guaranteed to be unbreakable, though there are some that are better than most. There are two approaches to security, whitelisting and blacklisting, and whitelisting tends to be less complicated and more effective. 

One whitelisting solution is the SafeHTML anti-XSS parser from PixelApes.

SafeHTML is smart enough to recognize valid HTML, so it can hunt and strip any dangerous tags. It does its parsing with another package called HTMLSax.

To install and use SafeHTML, do the following: 

1. Go to [http://pixel-apes.com/safehtml/?page=safehtml][1] and download the latest version of SafeHTML.
1. Put the files in the classes directory on your server. This directory contains everything that SafeHTML and HTMLSax need to function.
1. Include the SafeHTML class file (safehtml.php) in your script.
1. Create a new SafeHTML object called $safehtml.
1. Sanitize your data with the $safehtml->parse() method.

Here's a complete example:  

    <?php
    /* If you're storing the HTMLSax3.php in the /classes directory, along
       with the safehtml.php script, define XML_HTMLSAX3 as a null string. */
    define(XML_HTMLSAX3, '');
    // Include the class file.
    require_once('classes/safehtml.php');
    // Define some sample bad code.
    $data = "This data would raise an alert <script>alert('XSS Attack')</script>";
    // Create a safehtml object.
    $safehtml = new safehtml();
    // Parse and sanitize the data.
    $safe_data = $safehtml->parse($data);
    // Display result.
    echo 'The sanitized data is <br />' . $safe_data;
    ?>

If you want to sanitize any other data in your script, you don't have to create a new object; just use the $safehtml->parse() method throughout your script. 

#### What Can Go Wrong? ####

The biggest mistake you can make is assuming that this class completely shuts down XSS attacks. SafeHTML is a fairly complex script that checks for almost everything, but nothing is guaranteed. You still want to do the parameter validation that applies to your site. For example, this class doesn't check the length of a given variable to ensure that it fits into a database field. It doesn't check for buffer overflow problems.

XSS hackers are creative and use a variety of approaches to try to accomplish their objectives. Just look at RSnake's XSS tutorial at [http://ha.ckers.org/xss.html][2] to see how many ways there are to try to sneak code past someone's filters. The SafeHTML project has good programmers working overtime to try to stop XSS attacks, and it has a solid approach, but there's no guarantee that someone won't come up with some weird and fresh approach that could short-circuit its filters.

**Note: For an example of the powerful effects of XSS attacks, check out [http://namb.la/popular/tech.html][3], which shows a step-by-step approach to creating the JavaScript XSS worm that overloaded the MySpace servers. **

### Protecting Data with a One-Way Hash ###

This script performs a one-way transformation on data—in other words, it can make a hash signature of someone's password, but you can't ever decrypt it and go back to the original password. Why would you want to do that? The application is in storing passwords. An administrator doesn't need to know users' passwords—in fact, it's a good idea that only the user knows his or her password. The system (and the system alone) should be able to identify a correct password; this has been the Unix password security model for years. One-way password security works as follows:

1. When a user or administrator creates or changes an account password, the system hashes the password and stores the result. The host system discards the plaintext password.
1. When the user logs in to a system via any means, the entered password is again hashed.
1. The host system throws away the plaintext password entered.
1. This newly hashed password is compared against the stored hash.
1. If the hashed passwords match, then the system grants access.

The host system does this without ever knowing the original password; in fact, the original value is completely irrelevant. As a side effect, should someone break into your system and steal your password database, the intruder will have a bunch of hashed passwords without any way of reversing them to find the originals. Of course, given enough time, computer power, and poorly chosen user passwords, an attacker could probably use a dictionary attack to figure out the passwords. Therefore, don't make it easy for people to get their hands on your password database, and if someone does, have everyone change their passwords.

#### Encryption Vs Hashing ####

Technically speaking, this process is not encryption. It is a hash, which is different from encryption for two reasons:

Unlike in encryption, data cannot be decrypted.

It's possible (but extremely unlikely) that two different strings will produce the same hash. There's no guarantee that a hash is unique, so don't try to use a hash as something like a unique key in a database.

    function hash_ish($string) {
        return md5($string);
    }

The md5() function returns a 32-character hexadecimal string, based on the RSA Data Security Inc. Message-Digest Algorithm (also known, conveniently enough, as MD5). You can then insert that 32-character string into your database, compare it against other md5'd strings, or just adore its 32-character perfection.

#### Hacking the Script ####

It is virtually impossible to decrypt MD5 data. That is, it's very hard. However, you still need good passwords, because it's still easy to make a database of hashes for the entire dictionary. There are online MD5 dictionaries where you can enter **06d80eb0c50b49a509b49f2424e8c805** and get a result of "dog." Thus, even though MD5s can't technically be decrypted, they're still vulnerable—and if someone gets your password database, you can be sure that they'll be consulting an MD5 dictionary. Thus, it's in your best interests when creating password-based systems that the passwords are long (a minimum of six characters and preferably eight) and contain both letters and numbers. And make sure that the password isn't in the dictionary.

### Encrypting Data with Mcrypt ###

MD5 hashes work just fine if you never need to see your data in readable form. Unfortunately, that's not always an option—if you offer to store someone's credit card information in encrypted format, you need to decrypt it at some later point.

One of the easiest solutions is the Mcrypt module, an add-in for PHP that allows high-grade encryption. The Mcrypt library offers more than 30 ciphers to use in encryption and the possibility of a passphrase that ensures that only you (or, optionally, your users) can decrypt data.

Let's see some hands-on use. The following script contains functions that use Mcrypt to encrypt and decrypt data:

    <?php
    $data = "Stuff you want encrypted";
    $key = "Secret passphrase used to encrypt your data";
    $cipher = "MCRYPT_SERPENT_256";
    $mode = "MCRYPT_MODE_CBC";
    function encrypt($data, $key, $cipher, $mode) {
    // Encrypt data
    return (string)
                base64_encode
                    (
                    mcrypt_encrypt
                        (
                        $cipher,
                        substr(md5($key),0,mcrypt_get_key_size($cipher, $mode)),
                        $data,
                        $mode,
                        substr(md5($key),0,mcrypt_get_block_size($cipher, $mode))
                        )
                    );
    }
    function decrypt($data, $key, $cipher, $mode) {
    // Decrypt data
        return (string)
                mcrypt_decrypt
                    (
                    $cipher,
                    substr(md5($key),0,mcrypt_get_key_size($cipher, $mode)),
                    base64_decode($data),
                    $mode,
                    substr(md5($key),0,mcrypt_get_block_size($cipher, $mode))
                    );
    }
    ?>

The **mcrypt()** function requires several pieces of information:

- The data to encrypted.
- The passphrase used to encrypt and unlock your data, also known as the key.
- The cipher used to encrypt the data, which is the specific algorithm used to encrypt the data. This script uses **MCRYPT_SERPENT_256**, but you can choose from an array of fancy-sounding ciphers, including **MCRYPT_TWOFISH192**, **MCRYPT_RC2**, **MCRYPT_DES**, and **MCRYPT_LOKI97**.
- The mode used to encrypt the data. There are several modes you can use, including Electronic Codebook and Cipher Feedback. This script uses **MCRYPT_MODE_CBC**, Cipher Block Chaining.
- An **initialization vector**—also known as an IV, or a seed—an additional bit of binary data used to seed the encryption algorithm. That is, it's something extra thrown in to make the algorithm harder to crack.
- The length of the string needed for the key and IV, which vary by cipher and block. Use the **mcrypt_get_key_size()** and **mcrypt_get_block_size()** functions to find the appropriate length; then trim the key value to the appropriate length with a handy **substr()** function. (If the key is shorter than the required value, don't worry—Mcrypt pads it with zeros.)

If someone steals both your data and your passphrase, they can just cycle through the ciphers until finding the one that works. Thus, we apply the additional security of using the **md5()** function on the key before we use it, so even having both data and passphrase won't get the intruder what she wants.

An intruder would need the function, the data, and the passphrase all at once—and if that is the case, they probably have complete access to your server, and you're hosed anyway.

There's a small data storage format problem here. Mcrypt returns its encrypted data in an ugly binary format that causes horrific errors when you try to store it in certain MySQL fields. Therefore, we use the **base64encode()** and **base64decode()** functions to transform the data into a SQL-compatible alphabetical format and retrieve rows.

#### Hacking the Script ####

In addition to experimenting with various encryption methods, you can add some convenience to this script. For example, rather than providing the key and mode every time, you could declare them as global constants in an included file. 

### Generating Random Passwords  ###

Random (but difficult-to-guess) strings are important in user security. For example, if someone loses a password and you're using MD5 hashes, you won't be able to, nor should you want to, look it up. Instead, you should generate a secure random password and send that to the user. Another application for random number generation is creating activation links in order to access your site's services. Here is a function that creates a password: 

    <?php
     function make_password($num_chars) {
        if ((is_numeric($num_chars)) &&
            ($num_chars > 0) &&
            (! is_null($num_chars))) {
            $password = '';
            $accepted_chars = 'abcdefghijklmnopqrstuvwxyz1234567890';
            // Seed the generator if necessary.
            srand(((int)((double)microtime()*1000003)) );
            for ($i=0; $i<=$num_chars; $i++) {
                $random_number = rand(0, (strlen($accepted_chars) -1));
                $password .= $accepted_chars[$random_number] ;
            }
            return $password;
         }
    }
    ?> 

#### Using the Script ####

The **make_password()** function returns a string, so all you need to do is supply the length of the string as an argument:

    <?php
    $fifteen_character_password = make_password(15);
    ?> 

The function works as follows:

- The function makes sure that **$num_chars** is a positive nonzero integer. 
- The function initializes the **$password** variable to an empty string.
- The function initializes the **$accepted_chars** variable to the list of characters the password may contain. This script uses all lowercase letters and the numbers 0 through 9, but you can choose any set of characters you like.
- The random number generator needs a seed, so it gets a bunch of random-like values. (This isn't strictly necessary on PHP 4.2 and later.)
- The function loops **$num_chars** times, one iteration for each character in the password to generate.
- For each new character, the script looks at the length of **$accepted_chars**, chooses a number between 0 and the length, and adds the character at that index in **$accepted_chars** to $password. 
- After the loop completes, the function returns **$password**.  

### License ###

This article, along with any associated source code and files, is licensed under [The Code Project Open License (CPOL)][4]

--------------------------------------------------------------------------------

via: http://www.codeproject.com/Articles/363897/PHP-Security

作者：[SamarRizvi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.codeproject.com/script/Membership/View.aspx?mid=7483622
[1]:http://pixel-apes.com/safehtml/?page=safehtml
[2]:http://ha.ckers.org/xss.html
[3]:http://namb.la/popular/tech.html
[4]:http://www.codeproject.com/info/cpol10.aspx