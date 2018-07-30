translating---geekpi

Textricator: Data extraction made simple
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/document_free_access_cut_security.png?itok=ocvCv8G2)

You probably know the feeling: You ask for data and get a positive response, only to open the email and find a whole bunch of PDFs attached. Data, interrupted.

We understand your frustration, and we’ve done something about it: Introducing [Textricator][1], our first open source product.

We’re Measures for Justice, a criminal justice research and transparency organization. Our mission is to provide data transparency for the entire justice system, from arrest to post-conviction. We do this by producing a series of up to 32 performance measures covering the entire criminal justice system, county by county. We get our data in many ways—all legal, of course—and while many state and county agencies are data-savvy, giving us quality, formatted data in CSVs, the data is often bundled inside software with no simple way to get it out. PDF reports are the best they can offer.

Developers Joe Hale and Stephen Byrne have spent the past two years developing Textricator to extract tens of thousands of pages of data for our internal use. Textricator can process just about any text-based PDF format—not just tables, but complex reports with wrapping text and detail sections generated from tools like Crystal Reports. Simply tell Textricator the attributes of the fields you want to collect, and it chomps through the document, collecting and writing out your records.

Not a software engineer? Textricator doesn’t require programming skills; rather, the user describes the structure of the PDF and Textricator handles the rest. Most users run it via the command line; however, a browser-based GUI is available.

We evaluated other great open source solutions like [Tabula][2], but they just couldn’t handle the structure of some of the PDFs we needed to scrape. “Textricator is both flexible and powerful and has cut the time we spend to process large datasets from days to hours,” says Andrew Branch, director of technology.

At MFJ, we’re committed to transparency and knowledge-sharing, which includes making our software available to anyone, especially those trying to free and share data publicly. Textricator is available on [GitHub][3] and released under [GNU Affero General Public License Version 3][4].

You can see the results of our work, including data processed via Textricator, on our free [online data portal][5]. Textricator is an essential part of our process and we hope civic tech and government organizations alike can unlock more data with this new tool.

If you use Textricator, let us know how it helped solve your data problem. Want to improve it? Submit a pull request.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/textricator

作者：[Stephen Byrne][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:
[1]:https://textricator.mfj.io/
[2]:https://tabula.technology/
[3]:https://github.com/measuresforjustice/textricator
[4]:https://www.gnu.org/licenses/agpl-3.0.en.html
[5]:https://www.measuresforjustice.org/portal/
