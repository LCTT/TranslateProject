A Large-Scale Study of Programming Languages and Code Quality in GitHub
============================================================


![A Large-Scale Study of Programming Languages, illustration](https://cacm.acm.org/system/assets/0002/8759/092117_Getty_Large-Scale-Study1.large.jpg?1506007488&1506007487 "A Large-Scale Study of Programming Languages, illustration")

What is the effect of programming languages on software quality? This question has been a topic of much debate for a very long time. In this study, we gather a very large data set from GitHub (728 projects, 63 million SLOC, 29,000 authors, 1.5 million commits, in 17 languages) in an attempt to shed some empirical light on this question. This reasonably large sample size allows us to use a mixed-methods approach, combining multiple regression modeling with visualization and text analytics, to study the effect of language features such as static versus dynamic typing and allowing versus disallowing type confusion on software quality. By triangulating findings from different methods, and controlling for confounding effects such as team size, project size, and project history, we report that language design does have a significant, but modest effect on software quality. Most notably, it does appear that disallowing type confusion is modestly better than allowing it, and among functional languages, static typing is also somewhat better than dynamic typing. We also find that functional languages are somewhat better than procedural languages. It is worth noting that these modest effects arising from language design are overwhelmingly dominated by the process factors such as project size, team size, and commit size. However, we caution the reader that even these modest effects might quite possibly be due to other, intangible process factors, for example, the preference of certain personality types for functional, static languages that disallow type confusion.

[Back to Top][46]

### 1\. Introduction

A variety of debates ensue during discussions whether a given programming language is "the right tool for the job." While some of these debates may appear to be tinged with an almost religious fervor, most agree that programming language choice can impact both the coding process and the resulting artifact.

Advocates of strong, static typing tend to believe that the static approach catches defects early; for them, an ounce of prevention is worth a pound of cure. Dynamic typing advocates argue, however, that conservative static type checking is wasteful of developer resources, and that it is better to rely on strong dynamic type checking to catch type errors as they arise. These debates, however, have largely been of the armchair variety, supported only by anecdotal evidence.

This is perhaps not unreasonable; obtaining empirical evidence to support such claims is a challenging task given the number of other factors that influence software engineering outcomes, such as code quality, language properties, and usage domains. Considering, for example, software quality, there are a number of well-known influential factors, such as code size,[6][1] team size,[2][2]and age/maturity.[9][3]

Controlled experiments are one approach to examining the impact of language choice in the face of such daunting confounds, however, owing to cost, such studies typically introduce a confound of their own, that is, limited scope. The tasks completed in such studies are necessarily limited and do not emulate  _real world_  development. There have been several such studies recently that use students, or compare languages with static or dynamic typing through an experimental factor.[7][4], [12][5],[15][6]

Fortunately, we can now study these questions over a large body of real-world software projects. GitHub contains many projects in multiple languages that substantially vary across size, age, and number of developers. Each project repository provides a detailed record, including contribution history, project size, authorship, and defect repair. We then use a variety of tools to study the effects of language features on defect occurrence. Our approach is best described as mixed-methods, or triangulation[5][7] approach; we use text analysis, clustering, and visualization to confirm and support the findings of a quantitative regression study. This empirical approach helps us to understand the practical impact of programming languages, as they are used colloquially by developers, on software quality.

[Back to Top][47]

### 2\. Methodology

Our methods are typical of large scale observational studies in software engineering. We first gather our data from several sources using largely automated methods. We then filter and clean the data in preparation for building a statistical model. We further validate the model using qualitative methods. Filtering choices are driven by a combination of factors including the nature of our research questions, the quality of the data and beliefs about which data is most suitable for statistical study. In particular, GitHub contains many projects written in a large number of programming languages. For this study, we focused our data collection efforts on the most popular projects written in the most popular languages. We choose statistical methods appropriate for evaluating the impact of factors on count data.

![*](http://dl.acm.org/images/bullet.gif)
 **2.1\. Data collection**

We choose the top 19 programming languages from GitHub. We disregard CSS, Shell script, and Vim script as they are not considered to be general purpose languages. We further include `Typescript`, a typed superset of `JavaScript`. Then, for each of the studied languages we retrieve the top 50 projects that are primarily written in that language. In total, we analyze 850 projects spanning 17 different languages.

Our language and project data was extracted from the  _GitHub Archive_ , a database that records all public GitHub activities. The archive logs 18 different GitHub events including new commits, fork events, pull request, developers' information, and issue tracking of all the open source GitHub projects on an hourly basis. The archive data is uploaded to Google BigQuery to provide an interface for interactive data analysis.

**Identifying top languages.** We aggregate projects based on their primary language. Then we select the languages with the most projects for further analysis, as shown in [Table 1][48]. A given project can use many languages; assigning a single language to it is difficult. Github Archive stores information gathered from GitHub Linguist which measures the language distribution of a project repository using the source file extensions. The language with the maximum number of source files is assigned as the  _primary language_  of the project.

 [![t1.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t1.jpg)][49] 
**Table 1\. Top 3 projects in each language.**

**Retrieving popular projects.** For each selected language, we filter the project repositories written primarily in that language by its popularity based on the associated number of  _stars._ This number indicates how many people have actively expressed interest in the project, and is a reasonable proxy for its popularity. Thus, the top 3 projects in C are  _linux, git_ , and  _php-src_ ; and for C++ they are  _node-webkit, phantomjs_ , and  _mongo_ ; and for `Java` they are  _storm, elasticsearch_ , and  _ActionBarSherlock._  In total, we select the top 50 projects in each language.

To ensure that these projects have a sufficient development history, we drop the projects with fewer than 28 commits (28 is the first quartile commit count of considered projects). This leaves us with 728 projects. [Table 1][50] shows the top 3 projects in each language.

**Retrieving project evolution history.** For each of 728 projects, we downloaded the non-merged commits, commit logs, author date, and author name using  _git._  We compute code churn and the number of files modified per commit from the number of added and deleted lines per file. We retrieve the languages associated with each commit from the extensions of the modified files (a commit can have multiple language tags). For each commit, we calculate its  _commit age_  by subtracting its commit date from the first commit of the corresponding project. We also calculate other project-related statistics, including maximum commit age of a project and the total number of developers, used as control variables in our regression model, and discussed in Section 3\. We identify bug fix commits made to individual projects by searching for error related keywords: "error," "bug," "fix," "issue," "mistake," "incorrect," "fault," "defect," and "flaw," in the commit log, similar to a prior study.[18][8]

[Table 2][51] summarizes our data set. Since a project may use multiple languages, the second column of the table shows the total number of projects that use a certain language at some capacity. We further exclude some languages from a project that have fewer than 20 commits in that language, where 20 is the first quartile value of the total number of commits per project per language. For example, we find 220 projects that use more than 20 commits in C. This ensures sufficient activity for each language–project pair.

 [![t2.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t2.jpg)][52] 
**Table 2\. Study subjects.**

In summary, we study 728 projects developed in 17 languages with 18 years of history. This includes 29,000 different developers, 1.57 million commits, and 564,625 bug fix commits.

![*](http://dl.acm.org/images/bullet.gif)
 **2.2\. Categorizing languages**

We define language classes based on several properties of the language thought to influence language quality,[7][9], [8][10], [12][11] as shown in [Table 3][53]. The  _Programming Paradigm_  indicates whether the project is written in an imperative procedural, imperative scripting, or functional language. In the rest of the paper, we use the terms procedural and scripting to indicate imperative procedural and imperative scripting respectively.

 [![t3.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t3.jpg)][54] 
**Table 3\. Different types of language classes.**

 _Type Checking_  indicates static or dynamic typing. In statically typed languages, type checking occurs at compile time, and variable names are bound to a value and to a type. In addition, expressions (including variables) are classified by types that correspond to the values they might take on at run-time. In dynamically typed languages, type checking occurs at run-time. Hence, in the latter, it is possible to bind a variable name to objects of different types in the same program.

 _Implicit Type Conversion_  allows access of an operand of type T1 as a different type T2, without an explicit conversion. Such implicit conversion may introduce type-confusion in some cases, especially when it presents an operand of specific type T1, as an instance of a different type T2\. Since not all implicit type conversions are immediately a problem, we operationalize our definition by showing examples of the implicit type confusion that can happen in all the languages we identified as allowing it. For example, in languages like `Perl, JavaScript`, and `CoffeeScript` adding a string to a number is permissible (e.g., "5" + 2 yields "52"). The same operation yields 7 in `Php`. Such an operation is not permitted in languages such as `Java` and `Python` as they do not allow implicit conversion. In C and C++ coercion of data types can result in unintended results, for example, `int x; float y; y=3.5; x=y`; is legal C code, and results in different values for x and y, which, depending on intent, may be a problem downstream.[a][12] In `Objective-C` the data type  _id_  is a generic object pointer, which can be used with an object of any data type, regardless of the class.[b][13] The flexibility that such a generic data type provides can lead to implicit type conversion and also have unintended consequences.[c][14]Hence, we classify a language based on whether its compiler  _allows_  or  _disallows_  the implicit type conversion as above; the latter explicitly detects type confusion and reports it.

Disallowing implicit type conversion could result from static type inference within a compiler (e.g., with `Java`), using a type-inference algorithm such as Hindley[10][15] and Milner,[17][16] or at run-time using a dynamic type checker. In contrast, a type-confusion can occur silently because it is either undetected or is unreported. Either way, implicitly allowing type conversion provides flexibility but may eventually cause errors that are difficult to localize. To abbreviate, we refer to languages allowing implicit type conversion as  _implicit_  and those that disallow it as  _explicit._ 

 _Memory Class_  indicates whether the language requires developers to manage memory. We treat `Objective-C` as unmanaged, in spite of it following a hybrid model, because we observe many memory errors in its codebase, as discussed in RQ4 in Section 3.

Note that we classify and study the languages as they are colloquially used by developers in real-world software. For example, `TypeScript` is intended to be used as a static language, which disallows implicit type conversion. However, in practice, we notice that developers often (for 50% of the variables, and across `TypeScript`-using projects in our dataset) use the `any` type, a catch-all union type, and thus, in practice, `TypeScript` allows dynamic, implicit type conversion. To minimize the confusion, we exclude `TypeScript` from our language classifications and the corresponding model (see [Table 3][55] and [7][56]).

![*](http://dl.acm.org/images/bullet.gif)
 **2.3\. Identifying project domain**

We classify the studied projects into different domains based on their features and function using a mix of automated and manual techniques. The projects in GitHub come with `project descriptions` and README files that describe their features. We used Latent Dirichlet Allocation (LDA)[3][17] to analyze this text. Given a set of documents, LDA identifies a set of topics where each topic is represented as probability of generating different words. For each document, LDA also estimates the probability of assigning that document to each topic.

We detect 30 distinct domains, that is, topics, and estimate the probability that each project belonging to each domain. Since these auto-detected domains include several project-specific keywords, for example, facebook, it is difficult to identify the underlying common functions. In order to assign a meaningful name to each domain, we manually inspect each of the 30 domains to identify projectname-independent, domain-identifying keywords. We manually rename all of the 30 auto-detected domains and find that the majority of the projects fall under six domains: Application, Database, CodeAnalyzer, Middleware, Library, and Framework. We also find that some projects do not fall under any of the above domains and so we assign them to a catchall domain labeled as  _Other_ . This classification of projects into domains was subsequently checked and confirmed by another member of our research group. [Table 4][57] summarizes the identified domains resulting from this process.

 [![t4.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t4.jpg)][58] 
**Table 4\. Characteristics of domains.**

![*](http://dl.acm.org/images/bullet.gif)
 **2.4\. Categorizing bugs**

While fixing software bugs, developers often leave important information in the commit logs about the nature of the bugs; for example, why the bugs arise and how to fix the bugs. We exploit such information to categorize the bugs, similar to Tan  _et al._ [13][18], [24][19]

First, we categorize the bugs based on their  _Cause_  and  _Impact. Causes_  are further classified into disjoint subcategories of errors: Algorithmic, Concurrency, Memory, generic Programming, and Unknown. The bug  _Impact_  is also classified into four disjoint subcategories: Security, Performance, Failure, and Other unknown categories. Thus, each bug-fix commit also has an induced Cause and an Impact type. [Table 5][59] shows the description of each bug category. This classification is performed in two phases:

 [![t5.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg)][60] 
**Table 5\. Categories of bugs and their distribution in the whole dataset.**

**(1) Keyword search.** We randomly choose 10% of the bug-fix messages and use a keyword based search technique to automatically categorize them as potential bug types. We use this annotation, separately, for both Cause and Impact types. We chose a restrictive set of keywords and phrases, as shown in [Table 5][61]. Such a restrictive set of keywords and phrases helps reduce false positives.

**(2) Supervised classification.** We use the annotated bug fix logs from the previous step as training data for supervised learning techniques to classify the remainder of the bug fix messages by treating them as test data. We first convert each bug fix message to a bag-of- words. We then remove words that appear only once among all of the bug fix messages. This reduces project specific keywords. We also stem the bag-of- words using standard natural language processing techniques. Finally, we use Support Vector Machine to classify the test data.

To evaluate the accuracy of the bug classifier, we manually annotated 180 randomly chosen bug fixes, equally distributed across all of the categories. We then compare the result of the automatic classifier with the manually annotated data set. The performance of this process was acceptable with precision ranging from a low of 70% for performance bugs to a high of 100% for concurrency bugs with an average of 84%. Recall ranged from 69% to 91% with an average of 84%.

The result of our bug classification is shown in [Table 5][62]. Most of the defect causes are related to generic programming errors. This is not surprising as this category involves a wide variety of programming errors such as type errors, typos, compilation error, etc. Our technique could not classify 1.04% of the bug fix messages in any Cause or Impact category; we classify these as Unknown.

![*](http://dl.acm.org/images/bullet.gif)
 **2.5\. Statistical methods**

We model the number of defective commits against other factors related to software projects using regression. All models use  _negative binomial regression_  (NBR) to model the counts of project attributes such as the number of commits. NBR is a type of generalized linear model used to model non-negative integer responses.[4][20]

In our models we control for several language per-project dependent factors that are likely to influence the outcome. Consequently, each (language, project) pair is a row in our regression and is viewed as a sample from the population of open source projects. We log-transform dependent count variables as it stabilizes the variance and usually improves the model fit.[4][21] We verify this by comparing transformed with non transformed data using the AIC and Vuong's test for non-nested models.

To check that excessive multicollinearity is not an issue, we compute the variance inflation factor of each dependent variable in all of the models with a conservative maximum value of 5.[4][22]We check for and remove high leverage points through visual examination of the residuals versus leverage plot for each model, looking for both separation and large values of Cook's distance.

We employ  _effects_ , or  _contrast_ , coding in our study to facilitate interpretation of the language coefficients.[4][23] Weighted effects codes allow us to compare each language to the average effect across all languages while compensating for the unevenness of language usage across projects.[23][24]To test for the relationship between two factor variables we use a Chi-square test of independence.[14][25] After confirming a dependence we use Cramer's V, an  _r_  ×  _c_  equivalent of the phi coefficient for nominal data, to establish an effect size.

[Back to Top][63]

### 3\. Results

We begin with a straightforward question that directly addresses the core of what some fervently believe must be true, namely:

**RQ1\. Are some languages more defect-prone than others?**

We use a regression model to compare the impact of each language on the number of defects with the average impact of all languages, against defect fixing commits (see [Table 6][64]).

 [![t6.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t6.jpg)][65] 
**Table 6\. Some languages induce fewer defects than other languages.**

We include some variables as controls for factors that will clearly influence the response. Project age is included as older projects will generally have a greater number of defect fixes. Trivially, the number of commits to a project will also impact the response. Additionally, the number of developers who touch a project and the raw size of the project are both expected to grow with project activity.

The sign and magnitude of the estimated coefficients in the above model relates the predictors to the outcome. The first four variables are control variables and we are not interested in their impact on the outcome other than to say that they are all positive and significant. The language variables are indicator variables, viz. factor variables, for each project. The coefficient compares each language to the grand weighted mean of all languages in all projects. The language coefficients can be broadly grouped into three general categories. The first category is those for which the coefficient is statistically insignificant and the modeling procedure could not distinguish the coefficient from zero. These languages may behave similar to the average or they may have wide variance. The remaining coefficients are significant and either positive or negative. For those with positive coefficients we can expect that the language is associated with a greater number of defect fixes. These languages include `C, C++, Objective-C, Php`, and `Python`. The languages `Clojure, Haskell, Ruby`, and `Scala`, all have negative coefficients implying that these languages are less likely than average to result in defect fixing commits.

One should take care not to overestimate the impact of language on defects. While the observed relationships are statistically significant, the effects are quite small. Analysis of deviance reveals that language accounts for less than 1% of the total explained deviance.

 [![ut1.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/ut1.jpg)][66] 

We can read the model coefficients as the expected change in the log of the response for a one unit change in the predictor with all other predictors held constant; that is, for a coefficient  _β<sub style="border: 0px; outline: 0px; font-size: smaller; vertical-align: sub; background: transparent;">i</sub>_ , a one unit change in  _β<sub style="border: 0px; outline: 0px; font-size: smaller; vertical-align: sub; background: transparent;">i</sub>_  yields an expected change in the response of e _βi_ . For the factor variables, this expected change is compared to the average across all languages. Thus, if, for some number of commits, a particular project developed in an  _average_  language had four defective commits, then the choice to use C++ would mean that we should expect one additional defective commit since e0.18 × 4 = 4.79\. For the same project, choosing `Haskell` would mean that we should expect about one fewer defective commit as  _e_ −0.26 × 4 = 3.08\. The accuracy of this prediction depends on all other factors remaining the same, a challenging proposition for all but the most trivial of projects. All observational studies face similar limitations; we address this concern in more detail in Section 5.

**Result 1:**  _Some languages have a greater association with defects than other languages, although the effect is small._ 

In the remainder of this paper we expand on this basic result by considering how different categories of application, defect, and language, lead to further insight into the relationship between languages and defect proneness.

Software bugs usually fall under two broad categories: (1)  _Domain Specific bug_ : specific to project function and do not depend on the underlying programming language. (2)  _Generic bug_ : more generic in nature and has less to do with project function, for example, typeerrors, concurrency errors, etc.

Consequently, it is reasonable to think that the interaction of application domain and language might impact the number of defects within a project. Since some languages are believed to excel at some tasks more so than others, for example, C for low level work, or `Java` for user applications, making an inappropriate choice might lead to a greater number of defects. To study this we should ideally ignore the domain specific bugs, as generic bugs are more likely to depend on the programming language featured. However, since a domain-specific bugs may also arise due to a generic programming error, it is difficult to separate the two. A possible workaround is to study languages while controlling the domain. Statistically, however, with 17 languages across 7 domains, the large number of terms would be challenging to interpret given the sample size.

Given this, we first consider testing for the dependence between domain and language usage within a project, using a Chi-square test of independence. Of 119 cells, 46, that is, 39%, are below the value of 5 which is too high. No more than 20% of the counts should be below 5.[14][26] We include the value here for completeness[d][27]; however, the low strength of association of 0.191 as measured by Cramer's V, suggests that any relationship between domain and language is small and that inclusion of domain in regression models would not produce meaningful results.

One option to address this concern would be to remove languages or combine domains, however, our data here presents no clear choices. Alternatively, we could combine languages; this choice leads to a related but slightly different question.

**RQ2\. Which language properties relate to defects?**

Rather than considering languages individually, we aggregate them by language class, as described in Section 2.2, and analyze the relationship to defects. Broadly, each of these properties divides languages along lines that are often discussed in the context of errors, drives user debate, or has been the subject of prior work. Since the individual properties are highly correlated, we create six model factors that combine all of the individual factors across all of the languages in our study. We then model the impact of the six different factors on the number of defects while controlling for the same basic covariates that we used in the model in  _RQ1_ .

As with language (earlier in [Table 6][67]), we are comparing language  _classes_  with the average behavior across all language classes. The model is presented in [Table 7][68]. It is clear that `Script-Dynamic-Explicit-Managed` class has the smallest magnitude coefficient. The coefficient is insignificant, that is, the z-test for the coefficient cannot distinguish the coefficient from zero. Given the magnitude of the standard error, however, we can assume that the behavior of languages in this class is very close to the average across all languages. We confirm this by recoding the coefficient using `Proc-Static-Implicit-Unmanaged` as the base level and employing treatment, or dummy coding that compares each language class with the base level. In this case, `Script-Dynamic-Explicit-Managed` is significantly different with  _p_  = 0.00044\. We note here that while choosing different coding methods affects the coefficients and z-scores, the models are identical in all other respects. When we change the coding we are rescaling the coefficients to reflect the comparison that we wish to make.[4][28] Comparing the other language classes to the grand mean, `Proc-Static-Implicit-Unmanaged` languages are more likely to induce defects. This implies that either implicit type conversion or memory management issues contribute to greater defect proneness as compared with other procedural languages.

 [![t7.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t7.jpg)][69] 
**Table 7\. Functional languages have a smaller relationship to defects than other language classes whereas procedural languages are greater than or similar to the average.**

Among scripting languages we observe a similar relationship between languages that allow versus those that do not allow implicit type conversion, providing some evidence that implicit type conversion (vs. explicit) is responsible for this difference as opposed to memory management. We cannot state this conclusively given the correlation between factors. However when compared to the average, as a group, languages that do not allow implicit type conversion are less error-prone while those that do are more error-prone. The contrast between static and dynamic typing is also visible in functional languages.

The functional languages as a group show a strong difference from the average. Statically typed languages have a substantially smaller coefficient yet both functional language classes have the same standard error. This is strong evidence that functional static languages are less error-prone than functional dynamic languages, however, the z-tests only test whether the coefficients are different from zero. In order to strengthen this assertion, we recode the model as above using treatment coding and observe that the `Functional-Static-Explicit-Managed` language class is significantly less defect-prone than the `Functional-Dynamic-Explicit-Managed`language class with  _p_  = 0.034.

 [![ut2.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/ut2.jpg)][70] 

As with language and defects, the relationship between language class and defects is based on a small effect. The deviance explained is similar, albeit smaller, with language class explaining much less than 1% of the deviance.

We now revisit the question of application domain. Does domain have an interaction with language class? Does the choice of, for example, a functional language, have an advantage for a particular domain? As above, a Chi-square test for the relationship between these factors and the project domain yields a value of 99.05 and  _df_  = 30 with  _p_  = 2.622e–09 allowing us to reject the null hypothesis that the factors are independent. Cramer's-V yields a value of 0.133, a weak level of association. Consequently, although there is some relation between domain and language, there is only a weak relationship between domain and language class.

**Result 2:**  _There is a small but significant relationship between language class and defects. Functional languages are associated with fewer defects than either procedural or scripting languages._ 

It is somewhat unsatisfying that we do not observe a strong association between language, or language class, and domain within a project. An alternative way to view this same data is to disregard projects and aggregate defects over all languages and domains. Since this does not yield independent samples, we do not attempt to analyze it statistically, rather we take a descriptive, visualization-based approach.

We define  _Defect Proneness_  as the ratio of bug fix commits over total commits per language per domain. [Figure 1][71] illustrates the interaction between domain and language using a heat map, where the defect proneness increases from lighter to darker zone. We investigate which language factors influence defect fixing commits across a collection of projects written across a variety of languages. This leads to the following research question:

 [![f1.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/f1.jpg)][72] 
**Figure 1\. Interaction of language's defect proneness with domain. Each cell in the heat map represents defect proneness of a language (row header) for a given domain (column header). The "Overall" column represents defect proneness of a language over all the domains. The cells with white cross mark indicate null value, that is, no commits were made corresponding to that cell.**

**RQ3\. Does language defect proneness depend on domain?**

In order to answer this question we first filtered out projects that would have been viewed as outliers, filtered as high leverage points, in our regression models. This was necessary here as, even though this is a nonstatistical method, some relationships could impact visualization. For example, we found that a single project, Google's v8, a `JavaScript` project, was responsible for all of the errors in Middleware. This was surprising to us since `JavaScript` is typically not used for Middleware. This pattern repeats in other domains, consequently, we filter out the projects that have defect density below 10 and above 90 percentile. The result is in [Figure 1][73].

We see only a subdued variation in this heat map which is a result of the inherent defect proneness of the languages as seen in RQ1\. To validate this, we measure the pairwise rank correlation between the language defect proneness for each domain with the overall. For all of the domains except Database, the correlation is positive, and p-values are significant (<0.01). Thus, w.r.t. defect proneness, the language ordering in each domain is strongly correlated with the overall language ordering.

 [![ut3.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/ut3.jpg)][74] 

**Result 3:**  _There is no general relationship between application domain and language defect proneness._ 

We have shown that different languages induce a larger number of defects and that this relationship is not only related to particular languages but holds for general classes of languages; however, we find that the type of project does not mediate this relationship to a large degree. We now turn our attention to categorization of the response. We want to understand how language relates to specific kinds of defects and how this relationship compares to the more general relationship that we observe. We divide the defects into categories as described in [Table 5][75] and ask the following question:

**RQ4\. What is the relation between language and bug category?**

We use an approach similar to RQ3 to understand the relation between languages and bug categories. First, we study the relation between bug categories and language class. A heat map ([Figure 2][76]) shows aggregated defects over language classes and bug types. To understand the interaction between bug categories and languages, we use an NBR regression model for each category. For each model we use the same control factors as RQ1 as well as languages encoded with weighted effects to predict defect fixing commits.

 [![f2.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/f2.jpg)][77] 
**Figure 2\. Relation between bug categories and language class. Each cell represents percentage of bug fix commit out of all bug fix commits per language class (row header) per bug category (column header). The values are normalized column wise.**

The results along with the anova value for language are shown in [Table 8][78]. The overall deviance for each model is substantially smaller and the proportion explained by language for a specific defect type is similar in magnitude for most of the categories. We interpret this relationship to mean that language has a greater impact on specific categories of bugs, than it does on bugs overall. In the next section we expand on these results for the bug categories with significant bug counts as reported in [Table 5][79]. However, our conclusion generalizes for all categories.

 [![t8.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg)][80] 
**Table 8\. While the impact of language on defects varies across defect category, language has a greater impact on specific categories than it does on defects in general.**

**Programming errors.** Generic programming errors account for around 88.53% of all bug fix commits and occur in all the language classes. Consequently, the regression analysis draws a similar conclusion as of RQ1 (see [Table 6][81]). All languages incur programming errors such as faulty error-handling, faulty definitions, typos, etc.

**Memory errors.** Memory errors account for 5.44% of all the bug fix commits. The heat map in [Figure 2][82] shows a strong relationship between `Proc-Static-Implicit-Unmanaged` class and memory errors. This is expected as languages with unmanaged memory are known for memory bugs. [Table 8][83]confirms that such languages, for example, C, C++, and `Objective-C` introduce more memory errors. Among the managed languages, `Java` induces more memory errors, although fewer than the unmanaged languages. Although `Java` has its own garbage collector, memory leaks are not surprising since unused object references often prevent the garbage collector from reclaiming memory.[11][29] In our data, 28.89% of all the memory errors in `Java` are the result of a memory leak. In terms of effect size, language has a larger impact on memory defects than all other  _cause_ categories.

**Concurrency errors.** 1.99% of the total bug fix commits are related to concurrency errors. The heat map shows that `Proc-Static-Implicit-Unmanaged` dominates this error type. C and C++ introduce 19.15% and 7.89% of the errors, and they are distributed across the projects.

 [![ut4.jpg](http://deliveryimages.acm.org/10.1145/3130000/3126905/ut4.jpg)][84] 

Both of the `Static-Strong-Managed` language classes are in the darker zone in the heat map confirming, in general static languages produce more concurrency errors than others. Among the dynamic languages, only `Erlang` is more prone to concurrency errors, perhaps relating to the greater use of this language for concurrent applications. Likewise, the negative coefficients in [Table 8][85] shows that projects written in dynamic languages like `Ruby` and `Php` have fewer concurrency errors. Note that, certain languages like `JavaScript, CoffeeScript`, and `TypeScript` do not support concurrency, in its traditional form, while `Php` has a limited support depending on its implementations. These languages introduce artificial zeros in the data, and thus the concurrency model coefficients in [Table 8][86] for those languages cannot be interpreted like the other coefficients. Due to these artificial zeros, the average over all languages in this model is smaller, which may affect the sizes of the coefficients, since they are given w.r.t. the average, but it will not affect their relative relationships, which is what we are after.

A textual analysis based on word-frequency of the bug fix messages suggests that most of the concurrency errors occur due to a race condition, deadlock, or incorrect synchronization, as shown in the table above. Across all language, race conditions are the most frequent cause of such errors, for example, 92% in `Go`. The enrichment of race condition errors in `Go` is probably due to an accompanying race-detection tool that may help developers locate races. The synchronization errors are primarily related to message passing interface (MPI) or shared memory operation (SHM). `Erlang` and `Go` use MPI[e][30] for inter-thread communication, which explains why these two languages do not have any SHM related errors such as locking, mutex, etc. In contrast, projects in the other languages use SHM primitives for communication and can thus may have locking-related errors.

**Security and other impact errors.** Around 7.33% of all the bug fix commits are related to Impact errors. Among them `Erlang, C++`, and `Python` associate with more security errors than average ([Table 8][87]). `Clojure` projects associate with fewer security errors ([Figure 2][88]). From the heat map we also see that `Static` languages are in general more prone to failure and performance errors, these are followed by `Functional-Dynamic-Explicit-Managed` languages such as `Erlang`. The analysis of deviance results confirm that language is strongly associated with failure impacts. While security errors are the weakest among the categories, the deviance explained by language is still quite strong when compared with the residual deviance.

**Result 4:**  _Defect types are strongly associated with languages; some defect type like memory errors and concurrency errors also depend on language primitives. Language matters more for specific categories than it does for defects overall._ 

[Back to Top][89]

### 4\. Related Work

Prior work on programming language comparison falls in three categories:

**(1)  _Controlled experiment._**  For a given task, developers are monitored while programming in different languages. Researchers then compare outcomes such as development effort and program quality. Hanenberg[7][31] compared static versus dynamic typing by monitoring 48 programmers for 27 h while developing a parser program. He found no significant difference in code quality between the two; however, dynamic type-based languages were found to have shorter development time. Their study was conducted with undergraduate students in a lab setting with custom-designed language and IDE. Our study, by contrast is a field study of popular software applications. While we can only indirectly (and  _post facto_ ) control for confounding factors using regression, we benefit from much larger sample sizes, and more realistic, widely-used software. We find that statically typed languages in general are less defect-prone than the dynamic types, and that disallowing implicit type conversion is better than allowing it, in the same regard. The effect sizes are modest; it could be reasonably argued that they are visible here precisely because of the large sample sizes.

Harrison et al.[8][32] compared C++, a procedural language, with `SML`, a functional language, finding no significant difference in total number of errors, although `SML` has higher defect density than C++. `SML` was not represented in our data, which however, suggest that functional languages are generally less defect-prone than procedural languages. Another line of work primarily focuses on comparing development effort across different languages.[12][33], [20][34] However, they do not analyze language defect proneness.

**(2)  _Surveys._**  Meyerovich and Rabkin[16][35] survey developers' views of programming languages, to study why some languages are more popular than others. They report strong influence from non-linguistic factors: prior language skills, availability of open source tools, and existing legacy systems. Our study also confirms that the availability of external tools also impacts software quality; for example, concurrency bugs in `Go` (see RQ4 in Section 3).

**(3)  _Repository mining._**  Bhattacharya and Neamtiu[1][36] study four projects developed in both C and C++ and find that the software components developed in C++ are in general more reliable than C. We find that both C and C++ are more defect-prone than average. However, for certain bug types like concurrency errors, C is more defect-prone than C++ (see RQ4 in Section 3).

[Back to Top][90]

### 5\. Threats to Validity

We recognize few threats to our reported results. First, to identify bug fix commits we rely on the keywords that developers often use to indicate a bug fix. Our choice was deliberate. We wanted to capture the issues that developers continuously face in an ongoing development process, rather than reported bugs. However, this choice possesses threats of over estimation. Our categorization of domains is subject to interpreter bias, although another member of our group verified the categories. Also, our effort to categorize bug fix commits could potentially be tainted by the initial choice of keywords. The descriptiveness of commit logs vary across projects. To mitigate these threats, we evaluate our classification against manual annotation as discussed in Section 2.4.

We determine the language of a file based on its extension. This can be error-prone if a file written in a different language takes a common language extension that we have studied. To reduce such error, we manually verified language categorization against a randomly sampled file set.

To interpret language class in Section 2.2, we make certain assumptions based on how a language property is most commonly used, as reflected in our data set, for example, we classify `Objective-C` as unmanaged memory type rather than hybrid. Similarly, we annotate `Scala` as functional and C# as procedural, although both support either design choice.[19][37], [21][38] We do not distinguish object-oriented languages (OOP) from procedural languages in this work as there is no clear distinction, the difference largely depends on programming style. We categorize C++ as allowing implicit type conversion because a memory region of a certain type can be treated differently using pointer manipulation.[22][39] We note that most C++ compilers can detect type errors at compile time.

Finally, we associate defect fixing commits to language properties, although they could reflect reporting style or other developer properties. Availability of external tools or libraries may also impact the extent of bugs associated with a language.

[Back to Top][91]

### 6\. Conclusion

We have presented a large-scale study of language type and use as it relates to software quality. The Github data we used is characterized by its complexity and variance along multiple dimensions. Our sample size allows a mixed-methods study of the effects of language, and of the interactions of language, domain, and defect type while controlling for a number of confounds. The data indicates that functional languages are better than procedural languages; it suggests that disallowing implicit type conversion is better than allowing it; that static typing is better than dynamic; and that managed memory usage is better than unmanaged. Further, that the defect proneness of languages in general is not associated with software domains. Additionally, languages are more related to individual bug categories than bugs overall.

On the other hand, even large datasets become small and insufficient when they are sliced and diced many ways simultaneously. Consequently, with an increasing number of dependent variables it is difficult to answer questions about a specific variable's effect, especially where variable interactions exist. Hence, we are unable to quantify the specific effects of language type on usage. Additional methods such as surveys could be helpful here. Addressing these challenges remains for future work.

[Back to Top][92]

### Acknowledgments

This material is based upon work supported by the National Science Foundation under grant nos. 1445079, 1247280, 1414172, 1446683 and from AFOSR award FA955-11-1-0246.

[Back to Top][93]

### References

1\. Bhattacharya, P., Neamtiu, I. Assessing programming language impact on development and maintenance: A study on C and C++. In  _Proceedings of the 33rd International Conference on Software Engineering, ICSE'11_  (New York, NY USA, 2011). ACM, 171–180.

2\. Bird, C., Nagappan, N., Murphy, B., Gall, H., Devanbu, P. Don't touch my code! Examining the effects of ownership on software quality. In  _Proceedings of the 19th ACM SIGSOFT Symposium and the 13th European Conference on Foundations of Software Engineering_  (2011). ACM, 4–14.

3\. Blei, D.M. Probabilistic topic models.  _Commun. ACM 55_ , 4 (2012), 77–84.

4\. Cohen, J.  _Applied Multiple Regression/Correlation Analysis for the Behavioral Sciences._ Lawrence Erlbaum, 2003.

5\. Easterbrook, S., Singer, J., Storey, M.-A., Damian, D. Selecting empirical methods for software engineering research. In  _Guide to Advanced Empirical Software Engineering_  (2008). Springer, 285–311.

6\. El Emam, K., Benlarbi, S., Goel, N., Rai, S.N. The confounding effect of class size on the validity of object-oriented metrics.  _IEEE Trans. Softw. Eng. 27_ , 7 (2001), 630–650.

7\. Hanenberg, S. An experiment about static and dynamic type systems: Doubts about the positive impact of static type systems on development time. In  _Proceedings of the ACM International Conference on Object Oriented Programming Systems Languages and Applications, OOPSLA'10_  (New York, NY, USA, 2010). ACM, 22–35.

8\. Harrison, R., Smaraweera, L., Dobie, M., Lewis, P. Comparing programming paradigms: An evaluation of functional and object-oriented programs.  _Softw. Eng. J. 11_ , 4 (1996), 247–254.

9\. Harter, D.E., Krishnan, M.S., Slaughter, S.A. Effects of process maturity on quality, cycle time, and effort in software product development.  _Manage. Sci. 46_  4 (2000), 451–466.

10\. Hindley, R. The principal type-scheme of an object in combinatory logic.  _Trans. Am. Math. Soc._  (1969), 29–60.

11\. Jump, M., McKinley, K.S. Cork: Dynamic memory leak detection for garbage-collected languages. In  _ACM SIGPLAN Notices_ , Volume 42 (2007). ACM, 31–38.

12\. Kleinschmager, S., Hanenberg, S., Robbes, R., Tanter, É., Stefik, A. Do static type systems improve the maintainability of software systems? An empirical study. In  _2012 IEEE 20th International Conference on Program Comprehension (ICPC)_  (2012). IEEE, 153–162.

13\. Li, Z., Tan, L., Wang, X., Lu, S., Zhou, Y., Zhai, C. Have things changed now? An empirical study of bug characteristics in modern open source software. In  _ASID'06: Proceedings of the 1st Workshop on Architectural and System Support for Improving Software Dependability_  (October 2006).

14\. Marques De Sá, J.P.  _Applied Statistics Using SPSS, Statistica and Matlab_ , 2003.

15\. Mayer, C., Hanenberg, S., Robbes, R., Tanter, É., Stefik, A. An empirical study of the influence of static type systems on the usability of undocumented software. In  _ACM SIGPLAN Notices_ , Volume 47 (2012). ACM, 683–702.

16\. Meyerovich, L.A., Rabkin, A.S. Empirical analysis of programming language adoption. In  _Proceedings of the 2013 ACM SIGPLAN International Conference on Object Oriented Programming Systems Languages & Applications_  (2013). ACM, 1–18.

17\. Milner, R. A theory of type polymorphism in programming.  _J. Comput. Syst. Sci. 17_ , 3 (1978), 348–375.

18\. Mockus, A., Votta, L.G. Identifying reasons for software changes using historic databases. In  _ICSM'00\. Proceedings of the International Conference on Software Maintenance_  (2000). IEEE Computer Society, 120.

19\. Odersky, M., Spoon, L., Venners, B.  _Programming in Scala._  Artima Inc, 2008.

20\. Pankratius, V., Schmidt, F., Garretón, G. Combining functional and imperative programming for multicore software: An empirical study evaluating scala and java. In  _Proceedings of the 2012 International Conference on Software Engineering_  (2012). IEEE Press, 123–133.

21\. Petricek, T., Skeet, J.  _Real World Functional Programming: With Examples in F# and C#._ Manning Publications Co., 2009.

22\. Pierce, B.C.  _Types and Programming Languages._  MIT Press, 2002.

23\. Posnett, D., Bird, C., Dévanbu, P. An empirical study on the influence of pattern roles on change-proneness.  _Emp. Softw. Eng. 16_ , 3 (2011), 396–423.

24\. Tan, L., Liu, C., Li, Z., Wang, X., Zhou, Y., Zhai, C. Bug characteristics in open source software.  _Emp. Softw. Eng._  (2013).

--------------------------------------------------------------------------------

via: https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007

作者：[ Baishakhi Ray][a], [Daryl Posnett][b], [Premkumar Devanbu][c], [Vladimir Filkov ][d]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://delivery.acm.org/10.1145/3130000/3126905/mailto:rayb@virginia.edu
[b]:http://delivery.acm.org/10.1145/3130000/3126905/mailto:dpposnett@ucdavis.edu
[c]:http://delivery.acm.org/10.1145/3130000/3126905/mailto:devanbu@cs.ucdavis.edu
[d]:http://delivery.acm.org/10.1145/3130000/3126905/mailto:filkov@cs.ucdavis.edu
[1]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R6
[2]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R2
[3]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R9
[4]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R7
[5]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R12
[6]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R15
[7]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R5
[8]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R18
[9]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R7
[10]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R8
[11]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R12
[12]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#FNA
[13]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#FNB
[14]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#FNC
[15]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R10
[16]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R17
[17]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R3
[18]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R13
[19]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R24
[20]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R4
[21]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R4
[22]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R4
[23]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R4
[24]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R23
[25]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R14
[26]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R14
[27]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#FND
[28]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R4
[29]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R11
[30]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#FNE
[31]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R7
[32]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R8
[33]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R12
[34]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R20
[35]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R16
[36]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R1
[37]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R19
[38]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R21
[39]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#R22
[40]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#comments
[41]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#
[42]:https://cacm.acm.org/about-communications/mobile-apps/
[43]:http://dl.acm.org/citation.cfm?id=3144574.3126905&coll=portal&dl=ACM
[44]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/pdf
[45]:http://dl.acm.org/ft_gateway.cfm?id=3126905&ftid=1909469&dwn=1
[46]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[47]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[48]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t1.jpg
[49]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t1.jpg
[50]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t1.jpg
[51]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t2.jpg
[52]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t2.jpg
[53]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t3.jpg
[54]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t3.jpg
[55]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t3.jpg
[56]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t7.jpg
[57]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t4.jpg
[58]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t4.jpg
[59]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[60]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[61]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[62]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[63]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[64]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t6.jpg
[65]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t6.jpg
[66]:http://deliveryimages.acm.org/10.1145/3130000/3126905/ut1.jpg
[67]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t6.jpg
[68]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t7.jpg
[69]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t7.jpg
[70]:http://deliveryimages.acm.org/10.1145/3130000/3126905/ut2.jpg
[71]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f1.jpg
[72]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f1.jpg
[73]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f1.jpg
[74]:http://deliveryimages.acm.org/10.1145/3130000/3126905/ut3.jpg
[75]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[76]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f2.jpg
[77]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f2.jpg
[78]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[79]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t5.jpg
[80]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[81]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t6.jpg
[82]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f2.jpg
[83]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[84]:http://deliveryimages.acm.org/10.1145/3130000/3126905/ut4.jpg
[85]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[86]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[87]:http://deliveryimages.acm.org/10.1145/3130000/3126905/t8.jpg
[88]:http://deliveryimages.acm.org/10.1145/3130000/3126905/f2.jpg
[89]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[90]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[91]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[92]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
[93]:https://cacm.acm.org/magazines/2017/10/221326-a-large-scale-study-of-programming-languages-and-code-quality-in-github/fulltext?imm_mid=0f7103&cmp=em-prog-na-na-newsltr_20171007#PageTop
