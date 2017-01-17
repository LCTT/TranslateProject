Martin translating…

Explore climate data with open source tools
============================================================[up][1]
 ![Explore climate data with open source tools](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/bus-cloud.png?itok=bdROR1aE "Explore climate data with open source tools") 
Image credits : 

[Flickr user: theaucitron][2] (CC BY-SA 2.0)

You can't look anywhere these days without seeing evidence of the changing weather patterns on the earth. Monthly, we are confronted with facts and figures that point to a warming planet.

Climate scientists warn us that inaction could be fatal to our futures here. Military strategists at the Pentagon have [recently cautioned][3] President-Elect Trump that inaction on climate change could spell disaster for our national security as shrinking water supplies and meager rainfall cause crop failures will force large numbers of people to migrate to other parts of the world that can sustain them.

With all of the research on our climate by NASA, the US Defense Department, and others, I was curious if there are open source tools that would allow interested citizens to explore climate data and draw our own conclusions. A quick search of the Internet led me to the [Open Climate Workbench][4], a project that is part of the [Apache Software Foundation][5].

The Open Climate Workbench (OCW) develops software that performs climate model evaluation on data that comes from the [Earth System Grid Federation][6], [Coordinated Regional Climate Downscaling Environment][7], the U.S. Global Change Research Program's [National Climate Assessment][8], the[ North American Regional Climate Assessment Program][9], and from NASA, NOAA, and others.

You can download the OCW's [tar ball][10] and install it on your Linux computer by following the [prerequisites][11]. You can also install the OCW in a virtual machine using Vagrant and a provider like VirtualBox. [Get the instructions][12] for an OCW virtual machine.  

I found the easiest way to see how the OCW works is to download a [virtual machine image][13] from the Regional Climate Model Evaluation System (RCMES).

According to its website, the RCMES "is designed to facilitate regional-scale evaluations of climate and Earth system models by providing standardized access to a vast and comprehensive set of observations (e.g., satellite, reanalyzes and in-situ) and modeling resources (e.g., [CMIP][14] & [CORDEX][15] on the [ESGF][16]), as well as tools for performing common analysis and visualization tasks (e.g., OCW)."

You will need to have VirtualBox and Vagrant installed on your host computer. With it you can see an excellent example of the OCW in operation. The RCMES provides [detailed instructions][17] for downloading, importing, and running the virtual machine. Once your virtual machine is up and running you can log into it with the following credentials.

**Username:vagrant, password:vagrant. **

 ![Regional Climate Model Evaluation System Data Plot](https://opensource.com/sites/default/files/rcmes_data_plot.png "Regional Climate Model Evaluation System Data Plot") 

RCMES data plot sample

[Tutorials][18] for the RCMES are available on their website to help you quickly become familiar with the software. The community [is active][19] and they are looking for more [developers][20]. You can [subscribe to their mailing lists][21], too.

[Source code][22] for the project is on GitHub and licensed under the Apache License, Version 2.0.

--------------------------------------------------------------------------------

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/donw2-crop.jpg?itok=OqOYd3A8)

Don Watkins - Educator, education technology specialist,  entrepreneur, open source advocate. M.A. in Educational Psychology, MSED in Educational Leadership, Linux system administrator, CCNA, virtualization using Virtual Box and VMware. Follow me at @Don_Watkins .

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/apache-open-climate-workbench

作者：[Don Watkins][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://opensource.com/article/17/1/apache-open-climate-workbench?rate=Hv4_T-1gbcRNsiP9jnevzP1OTNKHIyQLXwqdjnBy2Bs
[2]:https://www.flickr.com/photos/theaucitron/5810163712/in/photolist-5p9nh3-6EkSKG-6EgGEF-9hYBcr-abCSpq-9zbjDz-4PVqwm-9RqBfq-abA2T4-4nXfwv-9RQkdN-dmjSdA-84o2ER-abA2Wp-ehyhPC-7oFYrc-4nvqBz-csMQXb-nRegFf-ntS23C-nXRyaB-6Xw3Mq-cRMaCq-b6wkkP-7u8sVQ-yqcg-6fTmk7-bzm3vU-6Xw3vL-6EkzCQ-d3W8PG-5MoveP-oMWsyY-jtMME6-XEMwS-2SeRXT-d2hjzJ-p2ZZVZ-7oFYoX-84r6Mo-cCizvm-gnnsg5-77YfPx-iDjqK-8gszbW-6MUZEZ-dhtwtk-gmpTob-6TBJ8p-mWQaAC/
[3]:https://www.scientificamerican.com/article/military-leaders-urge-trump-to-see-climate-as-a-security-threat/
[4]:https://climate.apache.org/
[5]:https://www.apache.org/
[6]:http://esgf.llnl.gov/
[7]:http://www.cordex.org/
[8]:http://nca2014.globalchange.gov/
[9]:http://www.narccap.ucar.edu/
[10]:http://climate.apache.org/downloads.html
[11]:http://climate.apache.org/downloads.html#prerequsites
[12]:https://cwiki.apache.org/confluence/display/CLIMATE/OCW+VM+-+A+Self+Contained+OCW+Environment
[13]:https://rcmes.jpl.nasa.gov/RCMES_Turtorial_data/RCMES_June09-2016.ova
[14]:http://cmip-pcmdi.llnl.gov/
[15]:http://www.cordex.org/
[16]:http://esgf.org/
[17]:https://rcmes.jpl.nasa.gov/content/running-rcmes-virtual-machine
[18]:https://rcmes.jpl.nasa.gov/content/tutorials-overview
[19]:http://climate.apache.org/community/get-involved.html
[20]:https://cwiki.apache.org/confluence/display/CLIMATE/Developer+Getting+Started+Guide
[21]:http://climate.apache.org/community/mailing-lists.html
[22]:https://github.com/apache/climate
