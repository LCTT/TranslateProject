[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using C and C++ for data science)
[#]: via: (https://opensource.com/article/20/2/c-data-science)
[#]: author: (Cristiano L. Fontana https://opensource.com/users/cristianofontana)

Using C and C++ for data science
======
Let's work through common data science task with C99 and C++11.
![metrics and data shown on a computer screen][1]

While languages like [Python][2] and [R][3] are increasingly popular for data science, C and C++ can be a strong choice for efficient and effective data science. In this article, we will use [C99][4] and [C++11][5] to write a program that uses the [Anscombe’s quartet][6] dataset, which I'll explain about next.

I wrote about my motivation for continually learning languages in an article covering [Python and GNU Octave][7], which is worth reviewing. All of the programs are meant to be run on the [command line][8], not with a [graphical user interface][9] (GUI). The full examples are available in the [polyglot_fit repository][10].

### The programming task

The program you will write in this series:

  * Reads data from a [CSV file][11]
  * Interpolates the data with a straight line (i.e., _f(x)=m ⋅ x + q_)
  * Plots the result to an image file



This is a common situation that many data scientists have encountered. The example data is the first set of [Anscombe's quartet][6], shown in the table below. This is a set of artificially constructed data that gives the same results when fitted with a straight line, but their plots are very different. The data file is a text file with tabs as column separators and a few lines as a header. This task will use only the first set (i.e., the first two columns).

[**Anscombe's quartet**][6]

I

II

III

IV

x

y

x

y

x

y

x

y

10.0

8.04

10.0

9.14

10.0

7.46

8.0

6.58

8.0

6.95

8.0

8.14

8.0

6.77

8.0

5.76

13.0

7.58

13.0

8.74

13.0

12.74

8.0

7.71

9.0

8.81

9.0

8.77

9.0

7.11

8.0

8.84

11.0

8.33

11.0

9.26

11.0

7.81

8.0

8.47

14.0

9.96

14.0

8.10

14.0

8.84

8.0

7.04

6.0

7.24

6.0

6.13

6.0

6.08

8.0

5.25

4.0

4.26

4.0

3.10

4.0

5.39

19.0

12.50

12.0

10.84

12.0

9.13

12.0

8.15

8.0

5.56

7.0

4.82

7.0

7.26

7.0

6.42

8.0

7.91

5.0

5.68

5.0

4.74

5.0

5.73

8.0

6.89

### The C way

[C][12] is a general-purpose programming language that is among the most popular languages in use today (according to data from the [TIOBE Index][13], [RedMonk Programming Language Rankings][14], [Popularity of Programming Language Index][15], and [State of the Octoverse of GitHub][16]). It is a quite old language (circa 1973), and many successful programs were written in it (e.g., the Linux kernel and Git to name just two). It is also one of the closest languages to the inner workings of the computer, as it is used to manipulate memory directly. It is a [compiled language][17]; therefore, the source code has to be translated by a [compiler][18] into [machine code][19]. Its [standard library][20] is small and light on features, so other libraries have been developed to provide missing functionalities.

It is the language I use the most for [number crunching][21], mostly because of its performance. I find it rather tedious to use, as it needs a lot of [boilerplate code][22], but it is well supported in various environments. The C99 standard is a recent revision that adds some nifty features and is well supported by compilers.

I will cover the necessary background of C and C++ programming along the way so both beginners and advanced users can follow along.  

#### Installation

To develop with C99, you need a compiler. I normally use [Clang][23], but [GCC][24] is another valid open source compiler. For linear fitting, I chose to use the [GNU Scientific Library][25]. For plotting, I could not find any sensible library, and therefore this program relies on an external program: [Gnuplot][26]. The example also uses a dynamic data structure to store data, which is defined in the [Berkeley Software Distribution][27] (BSD).

Installing in [Fedora][28] is as easy as running:


```
`sudo dnf install clang gnuplot gsl gsl-devel`
```

#### Commenting code

In C99, [comments][29] are formatted by putting **//** at the beginning of the line, and the rest of the line will be discarded by the interpreter. Alternatively, anything between **/*** and ***/** is discarded, as well.


```
// This is a comment ignored by the interpreter.
/* Also this is ignored */
```

#### Necessary libraries

Libraries are composed of two parts:

  * A [header file][30] that contains a description of the functions
  * A source file that contains the functions' definitions



Header files are included in the source, while the libraries' sources are [linked][31] against the executable. Therefore, the header files needed for this example are:


```
// Input/Output utilities
#include &lt;stdio.h&gt;
// The standard library
#include &lt;stdlib.h&gt;
// String manipulation utilities
#include &lt;string.h&gt;
// BSD queue
#include &lt;sys/queue.h&gt;
// GSL scientific utilities
#include &lt;gsl/gsl_fit.h&gt;
#include &lt;gsl/gsl_statistics_double.h&gt;
```

#### Main function

In C, the program must be inside a special function called **[main()][32]:**


```
int main(void) {
    ...
}
```

This differs from Python, as covered in the last tutorial, which will run whatever code it finds in the source files.

#### Defining variables

In C, variables have to be declared before they are used, and they have to be associated with a type. Whenever you want to use a variable, you have to decide what kind of data to store in it. You can also specify if you intend to use a variable as a constant value, which is not necessary, but the compiler can benefit from this information. From the [fitting_C99.c program][33] in the repository:


```
const char *input_file_name = "anscombe.csv";
const char *delimiter = "\t";
const unsigned int skip_header = 3;
const unsigned int column_x = 0;
const unsigned int column_y = 1;
const char *output_file_name = "fit_C99.csv";
const unsigned int N = 100;
```

Arrays in C are not dynamic, in the sense that their length has to be decided in advance (i.e., before compilation):


```
`int data_array[1024];`
```

Since you normally do not know how many data points are in a file, use a [singly linked list][34]. This is a dynamic data structure that can grow indefinitely. Luckily, the BSD [provides linked lists][35]. Here is an example definition:


```
struct data_point {
    double x;
    double y;

    SLIST_ENTRY(data_point) entries;
};

SLIST_HEAD(data_list, data_point) head = SLIST_HEAD_INITIALIZER(head);
SLIST_INIT(&amp;head);
```

This example defines a **data_point** list comprised of structured values that contain both an **x** value and a **y** value. The syntax is rather complicated but intuitive, and describing it in detail would be too wordy.

#### Printing output

To print on the terminal, you can use the [**printf()**][36] function, which works like Octave's **printf()** function (described in the first article):


```
`printf("#### Anscombe's first set with C99 ####\n");`
```

The **printf()** function does not automatically add a newline at the end of the printed string, so you have to add it. The first argument is a string that can contain format information for the other arguments that can be passed to the function, such as:


```
`printf("Slope: %f\n", slope);`
```

#### Reading data

Now comes the hard part… There are some libraries for CSV file parsing in C, but none seemed stable or popular enough to be in the Fedora packages repository. Instead of adding a dependency for this tutorial, I decided to write this part on my own. Again, going into details would be too wordy, so I will only explain the general idea. Some lines in the source will be ignored for the sake of brevity, but you can find the complete example in the repository.

First, open the input file:


```
`FILE* input_file = fopen(input_file_name, "r");`
```

Then read the file line-by-line until there is an error or the file ends:


```
while (![ferror][37](input_file) &amp;&amp; ![feof][38](input_file)) {
    size_t buffer_size = 0;
    char *buffer = NULL;
   
    getline(&amp;buffer, &amp;buffer_size, input_file);

    ...
}
```

The [**getline()**][39] function is a nice recent addition from the [POSIX.1-2008 standard][40]. It can read a whole line in a file and take care of allocating the necessary memory. Each line is then split into [tokens][41] with the [**strtok()**][42] function. Looping over the token, select the columns that you want:


```
char *token = [strtok][43](buffer, delimiter);

while (token != NULL)
{
    double value;
    [sscanf][44](token, "%lf", &amp;value);

    if (column == column_x) {
        x = value;
    } else if (column == column_y) {
        y = value;
    }

    column += 1;
    token = [strtok][43](NULL, delimiter);
}
```

Finally, when the **x** and **y** values are selected, insert the new data point in the linked list:


```
struct data_point *datum = [malloc][45](sizeof(struct data_point));
datum-&gt;x = x;
datum-&gt;y = y;

SLIST_INSERT_HEAD(&amp;head, datum, entries);
```

The [**malloc()**][46] function dynamically allocates (reserves) some persistent memory for the new data point.

#### Fitting data

The GSL linear fitting function [**gsl_fit_linear()**][47] expects simple arrays for its input. Therefore, since you won't know in advance the size of the arrays you create, you must manually allocate their memory:


```
const size_t entries_number = row - skip_header - 1;

double *x = [malloc][45](sizeof(double) * entries_number);
double *y = [malloc][45](sizeof(double) * entries_number);
```

Then, loop over the linked list to save the relevant data to the arrays:


```
SLIST_FOREACH(datum, &amp;head, entries) {
    const double current_x = datum-&gt;x;
    const double current_y = datum-&gt;y;

    x[i] = current_x;
    y[i] = current_y;

    i += 1;
}
```

Now that you are done with the linked list, clean it up. _Always_ release the memory that has been manually allocated to prevent a [memory leak][48]. Memory leaks are bad, bad, bad. Every time memory is not released, a garden gnome loses its head:


```
while (!SLIST_EMPTY(&amp;head)) {
    struct data_point *datum = SLIST_FIRST(&amp;head);

    SLIST_REMOVE_HEAD(&amp;head, entries);

    [free][49](datum);
}
```

Finally, finally(!), you can fit your data:


```
gsl_fit_linear(x, 1, y, 1, entries_number,
               &amp;intercept, &amp;slope,
               &amp;cov00, &amp;cov01, &amp;cov11, &amp;chi_squared);
const double r_value = gsl_stats_correlation(x, 1, y, 1, entries_number);

[printf][50]("Slope: %f\n", slope);
[printf][50]("Intercept: %f\n", intercept);
[printf][50]("Correlation coefficient: %f\n", r_value);
```

#### Plotting

You must use an external program for the plotting. Therefore, save the fitting function to an external file:


```
const double step_x = ((max_x + 1) - (min_x - 1)) / N;

for (unsigned int i = 0; i &lt; N; i += 1) {
    const double current_x = (min_x - 1) + step_x * i;
    const double current_y = intercept + slope * current_x;

    [fprintf][51](output_file, "%f\t%f\n", current_x, current_y);
}
```

The Gnuplot command for plotting both files is:


```
`plot 'fit_C99.csv' using 1:2 with lines title 'Fit', 'anscombe.csv' using 1:2 with points pointtype 7 title 'Data'`
```

#### Results

Before running the program, you must compile it:


```
`clang -std=c99 -I/usr/include/ fitting_C99.c -L/usr/lib/ -L/usr/lib64/ -lgsl -lgslcblas -o fitting_C99`
```

This command tells the compiler to use the C99 standard, read the **fitting_C99.c** file, load the libraries **gsl** and **gslcblas**, and save the result to **fitting_C99**. The resulting output on the command line is:


```
#### Anscombe's first set with C99 ####
Slope: 0.500091
Intercept: 3.000091
Correlation coefficient: 0.816421
```

Here is the resulting image generated with Gnuplot.

![Plot and fit of the dataset obtained with C99][52]

### The C++11 way

[C++][53] is a general-purpose programming language that is also among the most popular languages in use today. It was created as a [successor of C][54] (in 1983) with an emphasis on [object-oriented programming][55] (OOP). C++ is commonly regarded as a superset of C, so a C program should be able to be compiled with a C++ compiler. This is not exactly true, as there are some corner cases where they behave differently. In my experience, C++ needs less boilerplate than C, but the syntax is more difficult if you want to develop objects. The C++11 standard is a recent revision that adds some nifty features and is more or less supported by compilers.

Since C++ is largely compatible with C, I will just highlight the differences between the two. If I do not cover a section in this part, it means that it is the same as in C.

#### Installation

The dependencies for the C++ example are the same as the C example. On Fedora, run:


```
`sudo dnf install clang gnuplot gsl gsl-devel`
```

#### Necessary libraries

Libraries work in the same way as in C, but the **include** directives are slightly different:


```
#include &lt;cstdlib&gt;
#include &lt;cstring&gt;
#include &lt;iostream&gt;
#include &lt;fstream&gt;
#include &lt;string&gt;
#include &lt;vector&gt;
#include &lt;algorithm&gt;

extern "C" {
#include &lt;gsl/gsl_fit.h&gt;
#include &lt;gsl/gsl_statistics_double.h&gt;
}
```

Since the GSL libraries are written in C, you must inform the compiler about this peculiarity.

#### Defining variables

C++ supports more data types (classes) than C, such as a **string** type that has many more features than its C counterpart. Update the definition of the variables accordingly:


```
`const std::string input_file_name("anscombe.csv");`
```

For structured objects like strings, you can define the variable without using the **=** sign.

#### Printing output

You can use the **printf()** function, but the **cout** object is more idiomatic. Use the operator **&lt;&lt;** to indicate the string (or objects) that you want to print with **cout**:


```
std::cout &lt;&lt; "#### Anscombe's first set with C++11 ####" &lt;&lt; std::endl;

...

std::cout &lt;&lt; "Slope: " &lt;&lt; slope &lt;&lt; std::endl;
std::cout &lt;&lt; "Intercept: " &lt;&lt; intercept &lt;&lt; std::endl;
std::cout &lt;&lt; "Correlation coefficient: " &lt;&lt; r_value &lt;&lt; std::endl;
```

#### Reading data

The scheme is the same as before. The file is opened and read line-by-line, but with a different syntax:


```
std::ifstream input_file(input_file_name);

while (input_file.good()) {
    std::string line;

    getline(input_file, line);

    ...
}
```

The line tokens are extracted with the same function as in the C99 example. Instead of using standard C arrays, use two [vectors][56]. Vectors are an extension of C arrays in the [C++ standard library][57] that allows dynamic management of memory without explicitly calling **malloc()**:


```
std::vector&lt;double&gt; x;
std::vector&lt;double&gt; y;

// Adding an element to x and y:
x.emplace_back(value);
y.emplace_back(value);
```

#### Fitting data

For fitting in C++, you do not have to loop over the list, as vectors are guaranteed to have contiguous memory. You can directly pass to the fitting function the pointers to the vectors buffers:


```
gsl_fit_linear(x.data(), 1, y.data(), 1, entries_number,
               &amp;intercept, &amp;slope,
               &amp;cov00, &amp;cov01, &amp;cov11, &amp;chi_squared);
const double r_value = gsl_stats_correlation(x.data(), 1, y.data(), 1, entries_number);

std::cout &lt;&lt; "Slope: " &lt;&lt; slope &lt;&lt; std::endl;
std::cout &lt;&lt; "Intercept: " &lt;&lt; intercept &lt;&lt; std::endl;
std::cout &lt;&lt; "Correlation coefficient: " &lt;&lt; r_value &lt;&lt; std::endl;
```

#### Plotting

Plotting is done with the same approach as before. Write to a file:


```
const double step_x = ((max_x + 1) - (min_x - 1)) / N;

for (unsigned int i = 0; i &lt; N; i += 1) {
    const double current_x = (min_x - 1) + step_x * i;
    const double current_y = intercept + slope * current_x;

    output_file &lt;&lt; current_x &lt;&lt; "\t" &lt;&lt; current_y &lt;&lt; std::endl;
}

output_file.close();
```

And then use Gnuplot for the plotting.

#### Results

Before running the program, it must be compiled with a similar command:


```
`clang++ -std=c++11 -I/usr/include/ fitting_Cpp11.cpp -L/usr/lib/ -L/usr/lib64/ -lgsl -lgslcblas -o fitting_Cpp11`
```

The resulting output on the command line is:


```
#### Anscombe's first set with C++11 ####
Slope: 0.500091
Intercept: 3.00009
Correlation coefficient: 0.816421
```

And this is the resulting image generated with Gnuplot.

![Plot and fit of the dataset obtained with C++11][58]

### Conclusion

This article provides examples for a data fitting and plotting task in C99 and C++11. Since C++ is largely compatible with C, this article exploited their similarities for writing the second example. In some aspects, C++ is easier to use because it partially relieves the burden of explicitly managing memory. But the syntax is more complex because it introduces the possibility of writing classes for OOP. However, it is still possible to write software in C with the OOP approach. Since OOP is a style of programming, it can be used in any language. There are some great examples of OOP in C, such as the [GObject][59] and [Jansson][60] libraries.

For number crunching, I prefer working in C99 due to its simpler syntax and widespread support. Until recently, C++11 was not as widely supported, and I tended to avoid the rough edges in the previous versions. For more complex software, C++ could be a good choice.

Do you use C or C++ for data science as well? Share your experiences in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/c-data-science

作者：[Cristiano L. Fontana][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cristianofontana
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://opensource.com/article/18/9/top-3-python-libraries-data-science
[3]: https://opensource.com/article/19/5/learn-python-r-data-science
[4]: https://en.wikipedia.org/wiki/C99
[5]: https://en.wikipedia.org/wiki/C%2B%2B11
[6]: https://en.wikipedia.org/wiki/Anscombe%27s_quartet
[7]: https://opensource.com/article/20/2/python-gnu-octave-data-science
[8]: https://en.wikipedia.org/wiki/Command-line_interface
[9]: https://en.wikipedia.org/wiki/Graphical_user_interface
[10]: https://gitlab.com/cristiano.fontana/polyglot_fit
[11]: https://en.wikipedia.org/wiki/Comma-separated_values
[12]: https://en.wikipedia.org/wiki/C_%28programming_language%29
[13]: https://www.tiobe.com/tiobe-index/
[14]: https://redmonk.com/sogrady/2019/07/18/language-rankings-6-19/
[15]: http://pypl.github.io/PYPL.html
[16]: https://octoverse.github.com/
[17]: https://en.wikipedia.org/wiki/Compiled_language
[18]: https://en.wikipedia.org/wiki/Compiler
[19]: https://en.wikipedia.org/wiki/Machine_code
[20]: https://en.wikipedia.org/wiki/C_standard_library
[21]: https://en.wiktionary.org/wiki/number-crunching
[22]: https://en.wikipedia.org/wiki/Boilerplate_code
[23]: https://clang.llvm.org/
[24]: https://gcc.gnu.org/
[25]: https://www.gnu.org/software/gsl/
[26]: http://www.gnuplot.info/
[27]: https://en.wikipedia.org/wiki/Berkeley_Software_Distribution
[28]: https://getfedora.org/
[29]: https://en.wikipedia.org/wiki/Comment_(computer_programming)
[30]: https://en.wikipedia.org/wiki/Include_directive
[31]: https://en.wikipedia.org/wiki/Linker_%28computing%29
[32]: https://en.wikipedia.org/wiki/Entry_point#C_and_C++
[33]: https://gitlab.com/cristiano.fontana/polyglot_fit/-/blob/master/fitting_C99.c
[34]: https://en.wikipedia.org/wiki/Linked_list#Singly_linked_list
[35]: http://man7.org/linux/man-pages/man3/queue.3.html
[36]: https://en.wikipedia.org/wiki/Printf_format_string
[37]: http://www.opengroup.org/onlinepubs/009695399/functions/ferror.html
[38]: http://www.opengroup.org/onlinepubs/009695399/functions/feof.html
[39]: http://man7.org/linux/man-pages/man3/getline.3.html
[40]: https://en.wikipedia.org/wiki/POSIX
[41]: https://en.wikipedia.org/wiki/Lexical_analysis#Token
[42]: http://man7.org/linux/man-pages/man3/strtok.3.html
[43]: http://www.opengroup.org/onlinepubs/009695399/functions/strtok.html
[44]: http://www.opengroup.org/onlinepubs/009695399/functions/sscanf.html
[45]: http://www.opengroup.org/onlinepubs/009695399/functions/malloc.html
[46]: http://man7.org/linux/man-pages/man3/malloc.3.html
[47]: https://www.gnu.org/software/gsl/doc/html/lls.html
[48]: https://en.wikipedia.org/wiki/Memory_leak
[49]: http://www.opengroup.org/onlinepubs/009695399/functions/free.html
[50]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[51]: http://www.opengroup.org/onlinepubs/009695399/functions/fprintf.html
[52]: https://opensource.com/sites/default/files/uploads/fit_c99.png (Plot and fit of the dataset obtained with C99)
[53]: https://en.wikipedia.org/wiki/C%2B%2B
[54]: http://www.cplusplus.com/info/history/
[55]: https://en.wikipedia.org/wiki/Object-oriented_programming
[56]: https://en.wikipedia.org/wiki/Sequence_container_%28C%2B%2B%29#Vector
[57]: https://en.wikipedia.org/wiki/C%2B%2B_Standard_Library
[58]: https://opensource.com/sites/default/files/uploads/fit_cpp11.png (Plot and fit of the dataset obtained with C++11)
[59]: https://en.wikipedia.org/wiki/GObject
[60]: http://www.digip.org/jansson/
