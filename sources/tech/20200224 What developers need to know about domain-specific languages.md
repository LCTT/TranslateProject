[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What developers need to know about domain-specific languages)
[#]: via: (https://opensource.com/article/20/2/domain-specific-languages)
[#]: author: (Girish Managoli https://opensource.com/users/gammay)

What developers need to know about domain-specific languages
======
DSLs are used for a specific context in a particular domain. Learn more
about what they are and why you might want to use one.
![Various programming languages in use][1]

A [domain-specific language][2] (DSL) is a language meant for use in the context of a particular domain. A domain could be a business context (e.g., banking, insurance, etc.) or an application context (e.g., a web application, database, etc.) In contrast, a general-purpose language (GPL) can be used for a wide range of business problems and applications.

A DSL does not attempt to please all. Instead, it is created for a limited sphere of applicability and use, but it's powerful enough to represent and address the problems and solutions in that sphere. A good example of a DSL is HTML. It is a language for the web application domain. It can't be used for, say, number crunching, but it is clear how widely used HTML is on the web.

A GPL creator does not know where the language might be used or the problems the user intends to solve with it. So, a GPL is created with generic constructs that potentially are usable for any problem, solution, business, or need. Java is a GPL, as it's used on desktops and mobile devices, embedded in the web across banking, finance, insurance, manufacturing, etc., and more.

### Classifying DSLs

In the DSL world, there are two types of languages:

  * **Domain-specific language (DSL):** The language in which a DSL is written or presented
  * **Host language:** The language in which a DSL is executed or processed



A DSL written in a distinct language and processed by another host language is called an **external** DSL.

This is a DSL in SQL that can be processed in a host language:


```
SELECT account
FROM accounts
WHERE account = '123' AND branch = 'abc' AND amount &gt;= 1000
```

For that matter, a DSL could be written in English with a defined vocabulary and form that can be processed in another host language using a parser generator like ANTLR:


```
`if smokes then increase premium by 10%`
```

If the DSL and host language are the same, then the DSL type is **internal**, where the DSL is written in the language's semantics and processed by it. These are also referred to as **embedded** DSLs. Here are two examples.

  * A Bash DSL that can be executed in a Bash engine: [code]`if today_is_christmas; then apply_christmas_discount; fi` [/code] This is valid Bash that is written like English.
  * A DSL written in a GPL like Java: [code] orderValue = orderValue
                .applyFestivalDiscount()
                .applyCustomerLoyalityDiscount()
                .applyCustomerAgeDiscount(); [/code] This uses a fluent style and is readable like English.



Yes, the boundaries between DSL and GPL sometimes blur.

### DSL examples

Some languages used for DSLs include:

  * Web: HTML
  * Shell: sh, Bash, CSH, and the likes for *nix; MS-DOS, Windows Terminal, PowerShell for Windows
  * Markup languages: XML
  * Modeling: UML
  * Data management: SQL and its variants
  * Business rules: Drools
  * Hardware: Verilog, VHD
  * Build tools: Maven, Gradle
  * Numerical computation and simulation: MATLAB (commercial), GNU Octave, Scilab
  * Various types of parsers and generators: Lex, YACC, GNU Bison, ANTLR



### Why DSL?

The purpose of a DSL is to capture or document the requirements and behavior of one domain. A DSL's usage might be even narrower for particular aspects within the domain (e.g., commodities trading in finance). DSLs bring business and technical teams together. This does not imply a DSL is for business use alone. For example, designers and developers can use a DSL to represent or design an application.

A DSL can also be used to generate source code for an addressed domain or problem. However, code generation from a DSL is not considered mandatory, as its primary purpose is domain knowledge. However, when it is used, code generation is a serious advantage in domain engineering.

### DSL pros and cons

On the plus side, DSLs are powerful for capturing a domain's attributes. Also, since DSLs are small, they are easy to learn and use. Finally, a DSL offers a language for domain experts and between domain experts and developers.

On the downside, a DSL is narrowly used within the intended domain and purpose. Also, a DSL has a learning curve, although it may not be very high. Additionally, although there may be advantages to using tools for DSL capture, they are not essential, and the development or configuration of such tools is an added effort. Finally, DSL creators need domain knowledge as well as language-development knowledge, and individuals rarely have both.

### DSL software options

Open source DSL software options include:

  * **Xtext:** Xtext enables the development of DSLs and is integrated with Eclipse. It makes code generation possible and has been used by several open source and commercial products to provide specific functions. [MADS][3] (Multipurpose Agricultural Data System) is an interesting idea based on Xtext for "modeling and analysis of agricultural activities" (however, the project seems to be no longer active).
  * **JetBrains MPS:** JetBrains MPS is an integrated development environment (IDE) to create DSLs. It calls itself a projectional editor that stores a document as its underlying abstract tree structure. (This concept is also used by programs such as Microsoft Word.) JetBrains MPS also supports code generation to Java, C, JavaScript, or XML.



### DSL best practices

Want to use a DSL? Here are a few tips:

  * DSLs are not GPLs. Try to address limited ranges of problems in the definitive domain.
  * You do not need to define your own DSL. That would be tedious. Look for an existing DSL that solves your need on sites like [DSLFIN][4], which lists DSLs for the finance domain. If you are unable to find a suitable DSL, you could define your own.
  * It is better to make DSLs "like English" rather than too technical.
  * Code generation from a DSL is not mandatory, but it offers significant and productive advantages when it is done.
  * DSLs are called languages but, unlike GPLs, they need not be executable. Being executable is not the intent of a DSL.
  * DSLs can be written with word processors. However, using a DSL editor makes syntax and semantics checks easier.



If you are using DSL now or plan to do so in the future, please share your experience in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/domain-specific-languages

作者：[Girish Managoli][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gammay
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_language_c.png?itok=mPwqDAD9 (Various programming languages in use)
[2]: https://en.wikipedia.org/wiki/Domain-specific_language
[3]: http://mads.sourceforge.net/
[4]: http://www.dslfin.org/resources.html
