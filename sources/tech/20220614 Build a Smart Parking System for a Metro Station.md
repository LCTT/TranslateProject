[#]: subject: "Build a Smart Parking System for a Metro Station"
[#]: via: "https://www.opensourceforu.com/2022/06/build-a-smart-parking-system-for-a-metro-station/"
[#]: author: "Dr Maheswari R. https://www.opensourceforu.com/author/dr-maheswari-r/"
[#]: collector: "lkxed"
[#]: translator: "Maisie-x "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Build a Smart Parking System for a Metro Station
======
This article will help you design a Web based application that automates a smart parking system for cars in a metro station using Node-RED.

![Smart car parking][1]

A Web application is software that gets executed on a Web server. Every Web application is accessed by the end user through a Web browser. These Web applications are programmed using a client-server architecture, where the user (client) is provided services through a remotely located server that might be hosted by a third-party. A Web API (application programming interface) is available across the Web and can be accessed by the user using the HTTP protocol, as shown in Figure 1.

This article will demonstrate how to design a Web based application for an automated smart parking system for cars in a metro station. It is designed using open source Node-RED. This system creates an interactive and stylish user login form using a template node, where HTML and CSS are coded to get car owner details to automate the parking system. We can see the login and submission form flow diagrams in Figures 2 and 3.

The nodes used are as follows:

**[Metro smart parking node flow design][2]**
Node-RED is triggered using the command ‘node-red’. Through the URL *http://127.0.0.1:1880/*, the node-RED UI flow browser is enabled. We have considered that the Node-RED setup is done and working.

![table function][3]

![Figure 1: Web API][4]

Follow the steps given below to create the login and submission forms.

![Figure 2: Login form flow diagram][5]

![Figure 3: Submission form flow diagram][6]

*Login form*
1) From the node palette, drag and drop http in node, which creates an HTTP end point for creating Web services.
2) Connect http in node to function node. The latter helps to code JavaScript functions to run against the messages being received by the node.

![Figure 4: Login form for smart parking for cars][7]

3) Connect function node to template node, where the latter creates a Web API based on the provided template.
4) Connect template node to http response node; the latter sends responses back to requests received from an http input node.

![Figure 5: Submission form for smart parking for cars][8]

**Submission form**
1) Drag and drop http in node and connect it to json node, which converts and communicates the data as JSON string.
2) Connect http in node to debug node, which gives output in a debug monitor.
3) Place and connect json node to function node and connect the latter to http response node.

After the creation of a complete flow, click on the Deploy button in the top right corner of the Node-RED window. To view the user interface, go to the link*127.0.0.1:1880/ui/.*
Once you enter and then click Submit, it will take you to the next page where you can read all the news articles.

**Node-RED workflow**
In a single flow of Node-RED, you can create both the login form and submission form, as shown in Figures 4 and 5.

Now we will configure the Node properties.

*Login form:* Edit the http in property by choosing the method ‘Get’ and set the URL to ‘/MetroStation’ and configure the name as ‘Smart Parking’.

![Figure 6: Http in node property configurations][9]

| - |
| :- |
| Note: The URL can be any user defined local variable. |

Now select the function node and edit its properties by coding the ‘msg.url = project’ and configure the name field with ‘Project Submission’.

![Figure 7: Function node property configurations][10]

In the Property window of the template node, configure the appropriate HTML code required for the login form and specify the name as ‘Display panel’. The Mustache template format is being used in this flow. Mustache is a simple Web template system that is described as a logicless template engine. It does not have any explicit control flow statements, such as ‘if’ and ‘else’ conditionals or ‘for’ loops. Looping and conditional evaluation can be achieved using section tags processing lists and lambdas.

![Figure 8: Template node property configurations][11]

Configure the edit property of http response node with the name ‘Smart Parking’ (Figure 9).

![Figure 9: Http response node property configurations][12]

*Submission form:*In the edit property window of http in node, choose the method ‘POST’ and the URL ‘/project’.

![Figure 10: Http in node property configurations][13]

In the JSON node edit window, set *Action* as ‘Convert between JSON String & Object’. Refer to Figure 11.

![Figure 11: JSON node property configurations][14]

The function node is configured as specified in Figure 12.

![Figure 12: Function node property configurations][15]

In http response node, edit the property name as ‘Project Submitted’.

![Figure 13: Http response node property configurations][16]

| - |
| :- |
| Note: Also add the comment node with comments as ‘Login Form’ and ‘Submission Form’ |

![Figure 14: Debug node property configurations][17]

**Dashboard UI Web page**
When the user clicks on Submit, the data given will be displayed in the UI and the debug node. If Reset is clicked, the details will be cleared, allowing the user to enter new details (Figure 15).

![Figure 15: User login UI][18]

Metro parking rates are provided through a hyperlink, and the tariff output is displayed in the UI. So the smart parking for cars is automated with appropriate hyperlinks to exhibit the parking tariff at the metro station. The final outputs of this automated system are retrieved and displayed in the Node-RED dashboard UI and debug monitor.

![Figure 16: Metro parking tariff][19]

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/build-a-smart-parking-system-for-a-metro-station/

作者：[Dr Maheswari R.][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/dr-maheswari-r/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Smart-car-parking.jpg
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/04/table-function-node-red.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/04/table-function-node-red.jpg
[4]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-1-Web-Application-Programming-Interface300.jpg
[5]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-2-Login-Form-Flow-Diagram300.jpg
[6]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-3-Submission-Form-Flow-Diagram300.jpg
[7]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-4-Login-Form-of-Metro-Smart-Car-Parking300.jpg
[8]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-5-Submission-Form-of-Metro-Smart-Car-Parking300.jpg
[9]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-6-Http-in-Node-Property-Configurations300.jpg
[10]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-7-Function-Node-Property-Configurations300.jpg
[11]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-8-Template-Node-Property-Configurations300.jpg
[12]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-9-Template-Node-Property-Configurations300.jpg
[13]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-10-Http-in-Node-Property-Configurations300.jpg
[14]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-11-Json-Node-Property-Configurations300.jpg
[15]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-12-Function-Node-Property-Configurations300.jpg
[16]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-13-Http-Response-Node-Property-Configurations300.jpg
[17]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-14-Debug-Node-Property-Configurations300.jpg
[18]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-15-User-Login-UI300.jpg
[19]: https://www.opensourceforu.com/wp-content/uploads/2022/04/Figure-16-Parking-Tariff-Metro300.jpg
