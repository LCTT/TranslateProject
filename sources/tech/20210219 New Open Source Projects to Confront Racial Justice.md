[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (New Open Source Projects to Confront Racial Justice)
[#]: via: (https://www.linux.com/news/new-open-source-projects-to-confront-racial-justice/)
[#]: author: (Jason Perlow https://www.linuxfoundation.org/en/blog/new-open-source-projects-to-confront-racial-justice/)

New Open Source Projects to Confront Racial Justice
======

![][1]

Today the Linux Foundation announced that it would be hosting seven projects that originated at [Call for Code for Racial Justice][2], an initiative driven by IBM to urge the global developer ecosystem and open source community to contribute to solutions that confront racial inequalities.

Launched by IBM in October 2020, [Call for Code for Racial Justice][2] facilitates the adoption and innovation of open source projects by developers, ecosystem partners, and communities across the world to promote racial justice across three distinct focus areas: Police &amp; Judicial Reform and Accountability; Diverse Representation; and Policy &amp; Legislation Reform.

The initiative builds upon Call for Code, created by IBM in 2018 and has grown to over 400,000 developers and problem solvers in 179 countries.

As part of today’s announcement, the Linux Foundation and IBM unveiled two new solution starters, Fair Change and TakeTwo:

**[Fair Change][3]** is a platform to help record, catalog, and access evidence of potentially racially charged incidents to enable transparency, reeducation, and reform as a matter of public interest and safety. For example, real-world video footage related to routine traffic stops, stop and search, or other scenarios may be recorded and accessed by the involved parties and authorities to determine whether the incidents were handled in a biased manner. Fair Change consists of a mobile application for iOS and Android built using React Native, an API for capturing data from various sources built using Node JS. It also includes a website with a geospatial map view of incidents built using Google Maps and React. Data can be stored in a cloud-hosted database and object-store. Visit the [tutorial][4] or [project page][3] to learn more.

**[TakeTwo][5]** aims to help mitigate digital content bias, whether overt or subtle, focusing on text across news articles, headlines, web pages, blogs, and even code. The solution is designed to leverage directories of inclusive terms compiled by trusted sources like the [Inclusive Naming Initiative,][6] which the Linux Foundation and CNCF co-founded. The terminology is categorized to train an AI model to enhance its accuracy over time. TakeTwo is built using open source technologies, including Python, [FastAPI][7], and [Docker][8]. The API can be run locally with a [CouchDB][9] backend database or [IBM Cloudant][10] database. IBM has already deployed TakeTwo within its existing IBM Developer tools that are used to publish new content produced by hundreds of IBMers each week. IBM is trialing TakeTwo for IBM Developer website content. Visit the [tutorial][11] or [project page][5] to learn more.

In addition to the two new solution starters, The Linux Foundation will now host five existing and evolving open source projects from Call for Code for Racial Justice:

  * [**Five-Fifths Voter:**][12] This web app empowers minorities to exercise their right to vote and ensures their voice is heard by determining optimal voting strategies and limiting suppression issues.
  * [**Legit-Info:**][13] Local legislation can significantly impact areas as far-reaching as jobs, the environment, and safety. Legit-Info helps individuals understand the legislation that shapes their lives.
  * [**Incident Accuracy Reporting System:**][14] This platform allows witnesses and victims to corroborate evidence or provide additional information from multiple sources against an official police report.
  * [**Open Sentencing**][15]**:** To help public defenders better serve their clients and make a stronger case, Open Sentencing shows racial bias in data such as demographics.
  * [**Truth Loop:**][16] This app helps communities simply understand the policies, regulations, and legislation that will impact them the most.



These projects were built using open source technologies that include [Red Hat OpenShift][17], [IBM Cloud][18], [IBM Watson][19], Blockchain ledger, [Node.js,][20] [Vu.js][21], [Docker][8], [Kubernetes][22], and [Tekton][23]. The Linux Foundation and IBM ask developers and ecosystem partners to contribute to these solutions by testing, extending, implementing them, and adding their own diverse perspectives and expertise to make them even stronger.

For more information and to begin contributing, please visit:

<https://developer.ibm.com/callforcode/racial-justice/get-started/>

<https://developer.ibm.com/callforcode/racial-justice/projects/>

<https://www.linuxfoundation.org/projects/call-for-code/>

<https://github.com/Call-for-Code-for-Racial-Justice/>

The post [New Open Source Projects to Confront Racial Justice][24] appeared first on [Linux Foundation][25].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/new-open-source-projects-to-confront-racial-justice/

作者：[Jason Perlow][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxfoundation.org/en/blog/new-open-source-projects-to-confront-racial-justice/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2021/02/feat_021921_frj_50.jpg
[2]: https://developer.ibm.com/callforcode/racial-justice/
[3]: https://github.com/Call-for-Code-for-Racial-Justice/fairchange
[4]: https://developer.ibm.com/tutorials/fair-change
[5]: https://github.com/Call-for-Code-for-Racial-Justice/TakeTwo
[6]: https://inclusivenaming.org/
[7]: https://fastapi.tiangolo.com/
[8]: https://www.docker.com/
[9]: https://couchdb.apache.org/
[10]: https://www.ibm.com/uk-en/cloud/cloudant
[11]: https://developer.ibm.com/tutorials/take-two/
[12]: https://github.com/Call-for-Code-for-Racial-Justice/Five-Fifths-Voter
[13]: https://github.com/Call-for-Code-for-Racial-Justice/Legit-Info/blob/main/README.md
[14]: https://github.com/Call-for-Code-for-Racial-Justice/Incident-Accuracy-Reporting-System
[15]: https://github.com/Call-for-Code-for-Racial-Justice/Open-Sentencing/
[16]: https://github.com/Call-for-Code-for-Racial-Justice/Truth-Loop
[17]: https://www.openshift.com/
[18]: https://www.ibm.com/cloud
[19]: https://www.ibm.com/watson
[20]: https://nodejs.org/
[21]: https://vuejs.org/
[22]: https://kubernetes.io/
[23]: https://www.tekton.com/
[24]: https://www.linuxfoundation.org/en/blog/new-open-source-projects-to-confront-racial-justice/
[25]: https://www.linuxfoundation.org/
