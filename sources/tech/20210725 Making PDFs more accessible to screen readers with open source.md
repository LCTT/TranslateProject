[#]: subject: (Making PDFs more accessible to screen readers with open source)
[#]: via: (https://opensource.com/article/21/7/pdf-latex)
[#]: author: (Quinn Foster https://opensource.com/users/quinn-foster)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Making PDFs more accessible to screen readers with open source
======
One university open source program office is working to improve
accessibility of an open access journal with LaTeX.
![Person using a laptop][1]

A screen reader is a vital tool that helps individuals who are blind or low-vision read digital text. Unfortunately, not all file formats receive the same level of support from screen readers. For example, while PDF files have accessibility features that you can use, they are often not the preferred file format for screen reader users. Between line breaks, multiple columns, symbols, and images, screen readers can have trouble reading PDFs in a cohesive way to their users.

This is what the folks at [Open @ RIT][2] are trying to change.

Open @ RIT is the open source program office at the Rochester Institute of Technology, offering RIT faculty and staff assistance in opening their research projects and maintaining communities of practice around their work. One such faculty member is Dr. Todd Pagano, Professor of Chemistry and Associate Dean for Teaching and Scholarship Excellence at the National Technical Institute for the Deaf. Dr. Pagano came to Open @ RIT seeking help to increase the accessibility of an open-access journal, the publications of which currently exist as PDFs.

The Open @ RIT team, consisting of UX designer Rahul Jaiswal and full-stack developer Suhas C.V., have used this project as a stepping stone to begin exploring ways to convert PDFs into accessible HTML.

> "It's very difficult to make PDFs fully accessible, especially in an automated way," says Mike Nolan, assistant director of Open @ RIT. 

Open @ RIT tested multiple tools that already included accessibility features in their quest to convert PDFs into HTML successfully. Despite these features, the resulting HTML files still had many issues that made them difficult for screen readers to read, such as pauses and interruptions.

At this point, Open @ RIT decided to pursue a more open source tool-chain to assist in the conversion from received submissions to accessible formats like HTML while maintaining the same style and general look of the published article, in which the use of LaTeX was instrumental.

The workflow with LaTeX is simple:

  * A submitted paper—in the form of a PDF—is pasted into a  `.tex` template and turned into a `.tex` file.
This `.tex` template is an edited version of the Association for Computing Machinery ([ACM][3]) `.tex` template.
  * Then [_tex2html_][4]—the conversion tool built by Open @ RIT—is applied to the `.tex` file that uses an open source LaTeX converter called LaTeXML to convert it to HTML finally.
  * The resulting HTML file shows significant improvement with screen readers.



Some standing issues with the tool-chain are still being worked on, but using LaTeX to facilitate and standardize the generation of the resulting formats (PDF and HTML) has shown great promise in achieving this goal. Publishing journal articles in PDF and HTML gives readers a choice and more options for compatibility with screen readers.

Those who want to learn more about the project will get the chance very soon. During their explorations of LaTeX, Rahul and Suhas contacted experts associated with [TeX Users Group (TUG) 2021][5]—this year's conference run by [TUC][6] for all things TeX and LaTeX. They're invited to do a presentation on their project. The duo, along with Dr. Pagano, will discuss how they have been using LaTeX in their accessibility efforts and the need for journals to be accessible. TUG 2021 will be running online from August 5-8, 2021.

Their work shows the capacity for open source to be used in a way that doesn't just increase digital transparency but also accessibility for all people.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/pdf-latex

作者：[Quinn Foster][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/quinn-foster
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://www.rit.edu/research/open
[3]: https://services.acm.org/public/qj/keep_inventing/qjprofm_control.cfm?promo=DA4SCA
[4]: https://gitlab.com/open-rit/tex2html
[5]: https://tug.org/tug2021/
[6]: https://www.tug.org/
