# Filtering Packets In Wireshark on Kali Linux


Contents

*   *   [1. Introduction][1]

    *   [2. Boolean Expressions and Comparison Operators][2]

    *   [3. Filtering Capture][3]

    *   [4. Filtering Results][4]

    *   [5. Closing Thoughts][5]

### Introduction

Filtering allows you to focus on the exact sets of data that you are interested in reading. As you have seen, Wireshark collects  _everything_  by default. That can get in the way of the specific data that you are looking for. Wireshark provides two powerful filtering tools to make targeting the exact data you need simple and painless. 

There are two way that Wireshark can filter packets. It can filter an only collect certain packets, or the packet results can be filtered after they are collected. Of course, these can be used in conjunction with one another, and their respective usefulness is dependent on which and how much data is being collected.

### Boolean Expressions and Comparison Operators

Wireshark has plenty of built-in filters which work just great. Start typing in either of the filter fields, and you will see them autocomplete in. Most correspond to the more common distinctions that a user would make between packets. Filtering only HTTP requests would be a good example. 

For everything else, Wireshark uses Boolean expressions and/or comparison operators. If you've ever done any kind of programming, you should be familiar with Boolean expressions. They are expressions that use "and," "or," and "not" to verify the truthfulness of a statement or expression. Comparison operators are much simpler. They just determine if two or more things are equal, greater, or less than one another.

### Filtering Capture

Before diving in to custom capture filters, take a look at the ones Wireshark already has built in. Click on the "Capture" tab on the top menu, and go to "Options." Below the available interfaces is the line where you can write your capture filters. Directly to its left is a button labeled "Capture Filter." Click on it, and you will see a new dialog box with a listing of pre-built capture filters. Look around and see what's there. 

![Wireshark dialog for creating a capture filter](https://linuxconfig.org/images/wireshark-capture-filter.jpg)


At the bottom of that box, there is a small form for creating and saving hew capture filters. Press the "New" button to the left. It will create a new capture filter populated with filler data. To save the new filter, just replace the filler with the actual name and expression that you want and click "Ok." The filter will be saved and applied. Using this tool, you can write and save multiple different filters and have them ready to use again in the future. 

Capture has it's own syntax for filtering. For comparison, it omits and equals symbol and uses `>` and for greater and less than. For Booleans, it relies on the words "and," "or," and "not." 

If, for example, you only wanted to listen to traffic on port 80, you could use and expressions like this: `port 80`. If you only wanted to listen on port 80 from a specific IP, you would add that on. `port 80 and host 192.168.1.20` As you can see, capture filters have specific keywords. These keywords are used to tell Wireshark how to monitor packets and which ones to look at. For example, `host` is used to look at all traffic from an IP. `src` is used to look at traffic originating from that IP. `dst` in contrast, only watches incoming traffic to an IP. To watch traffic on a set of IPs or a network, use `net`.

### Filtering Results

The bottom menu bar on your layout is the one dedicated to filtering results. This filter doesn't change the data that Wireshark has collected, it just allows you to sort through it more easily. There is a text field for entering a new filter expression with a drop down arrow to review previously entered filters. Next to that is a button marked "Expression" and a few others for clearing and saving your current expression. 

Click on the "Expression" button. You will see a small window with several boxes with options in them. To the left is the largest box with a huge list of items, each with additional collapsed sub-lists. These are all of the different protocols, fields, and information that you can filter by. There's no way to go through all of it, so the best thing to do is look around. You should notice some familiar options like HTTP, SSL, and TCP. 

![Wireshark dailog for creating a results filter](https://linuxconfig.org/images/wireshark-results-filter.jpg)

The sub-lists contain the different parts and methods that you can filter by. This would be where you'd find the methods for filtering HTTP requests by GET and POST. 

You can also see a list of operators in the middle boxes. By selecting items from each column, you can use this window to create filters without memorizing every item that Wireshark can filter by. For filtering results, comparison operators use a specific set of symbols. `==` determines if two things are equal. `>`determines if one thing is greater than another, `<` finds if something is less. `>=` and `<=` are for greater than or equal to and less than or equal to respectively. They can be used to determine if packets contain the right values or filter by size. An example of using `==` to filter only HTTP GET requests like this: `http.request.method == "GET"`. 

Boolean operators can chain smaller expressions together to evaluate based on multiple conditions. Instead of words like with capture, they use three basic symbols to do this. `&&` stands for "and." When used, both statements on either side of `&&` must be true in order for Wireshark to filter those packages. `||`signifies "or." With `||` as long as either expression is true, it will be filtered. If you were looking for all GET and POST requests, you could use `||` like this: `(http.request.method == "GET") || (http.request.method == "POST")`. `!` is the "not" operator. It will look for everything but the thing that is specified. For example, `!http` will give you everything but HTTP requests.

### Closing Thoughts

Filtering Wireshark really allows you to efficiently monitor your network traffic. It takes some time to familiarize yourself with the options available and become used to the powerful expressions that you can create with filters. Once you do, though, you will be able to quickly collect and find exactly the network data the you are looking for without having to comb through long lists of packets or do a whole lot of work.

--------------------------------------------------------------------------------

via: https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux

作者：[Nick Congleton ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux
[1]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux#h1-introduction
[2]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux#h2-boolean-expressions-and-comparison-operators
[3]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux#h3-filtering-capture
[4]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux#h4-filtering-results
[5]:https://linuxconfig.org/filtering-packets-in-wireshark-on-kali-linux#h5-closing-thoughts
