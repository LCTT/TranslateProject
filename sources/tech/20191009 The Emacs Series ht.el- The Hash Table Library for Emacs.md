[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Emacs Series ht.el: The Hash Table Library for Emacs)
[#]: via: (https://opensourceforu.com/2019/10/the-emacs-series-ht-el-the-hash-table-library-for-emacs/)
[#]: author: (Shakthi Kannan https://opensourceforu.com/author/shakthi-kannan/)

The Emacs Series ht.el: The Hash Table Library for Emacs
======

[![][1]][2]

_In this article, we explore the various hash table functions and macros provided by the ht.el library._

The ht.el hash table library for Emacs has been written by Wilfred Hughes. The latest tagged release is version 2.2 and the software is released under the GNU General Public License v3. The source code is available at _<https://github.com/Wilfred/ht.el>_. It provides a comprehensive list of hash table operations and a very consistent API. For example, any mutation function will always return nil.

**Installation**
The Milkypostman’s Emacs Lisp Package Archive (MELPA) and Marmalade repositories have ht.el available for installation. You can add the following command to your Emacs init.el configuration file:

```
(require ‘package)
(add-to-list ‘package-archives ‘(“melpa” . “https://melpa.org/packages/”) t)
```

You can then run _M-x package &lt;RET&gt; ht &lt;RET&gt;_ to install the _ht.el_ library. If you are using Cask, then you simply add the following code to your Cask file:

```
(depends-on “ht”)
```

You will need the ht library in your Emacs environment before using the API functions.

```
(require ‘ht)
```

**Usage**
Let us now explore the various API functions provided by the _ht.el_ library. The _ht-create_ function will return a hash table that can be assigned to a hash table variable. You can also verify that the variable is a hash table using the type-of function as shown below:

```
(let ((greetings (ht-create)))
(type-of greetings))

hash-table
```

You can add an item to the hash table using the ht-set! function, which takes the hash table, key and value as arguments. The entries in the hash table can be listed using the _ht-items_ function as illustrated below:

```
(ht-set! hash-table key value) ;; Syntax
(ht-items hash-table) ;; Syntax

(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-items greetings))

((“Adam” “Hello Adam!”))
```

The keys present in a hash table can be retrieved using the _ht-keys_ function, while the values in a hash table can be obtained using the _ht-values_ function, as shown in the following examples:

```
(ht-keys hash-table) ;; Syntax
(ht-values hash-table) ;; Syntax

(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-keys greetings))

(“Adam”)

(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-values greetings))

(“Hello Adam!”)
```

The “ht-clear!” function can be used to clear all the items in a hash-table. For example:

```
(ht-clear! hash-table) ;; Syntax

(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-clear! greetings)
(ht-items greetings))

nil
```

An entire hash table can be copied to another hash table using the _ht-copy_ API as shown below:

```
(ht-copy hash-table) ;; Syntax

(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-items (ht-copy greetings)))

((“Adam” “Hello Adam!”))
```

The _ht-merge_ function can combine two different hash tables into one. In the following example, the items in the _english_ and _numbers_ hash tables are merged together.

```
(ht-merge hash-table1 hash-table2) ;; Syntax

(let ((english (ht-create))
(numbers (ht-create)))
(ht-set! english “a” “A”)
(ht-set! numbers “1” “One”)
(ht-items (ht-merge english numbers)))

((“1” “One”) (“a” “A”))
```

You can make modifications to an existing hash table. For example, you can remove an item in the hash table using the _ht-remove!_ function, which takes as input a hash table and a key as shown below:

```
(ht-remove hash-table key) ;; Syntax

(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-set! greetings “Eve” “Hello Eve!”)
(ht-remove! greetings “Eve”)
(ht-items greetings))

((“Adam” “Hello Adam!”))
```

You can do an in-place modification to an item in the hash table using the _ht-update!_ function. An example is given below:

```
(ht-update! hash-table key value) ;; Syntax

(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-update! greetings (ht (“Adam” “Howdy Adam!”)))
(ht-items greetings))

((“Adam” “Howdy Adam!”))
```

A number of predicate functions are available in _ht.el_ that can be used to check for conditions in a hash table. The _ht_? function checks to see if the input argument is a hash table. It returns t if the argument is a hash table and _nil_ otherwise.

```
(ht? hash-table) ;; Syntax

(ht? nil)

nil

(let ((greetings (ht-create)))
(ht? greetings))

t
```

You can verify if a key is present in a hash table using the _ht-contains_? API, which takes a hash table and key as arguments. It returns t if the item exists in the hash table. Otherwise, it simply returns _nil_.

```
(ht-contains? hash-table key) ;; Syntax

(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-contains? greetings “Adam”))

t

(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-contains? greetings “Eve”))

nil
```

The _ht-empty?_ function can be used to check if the input hash-table is empty or not. A couple of examples are shown below:

```
(ht-empty? hash-table) ;; Syntax

(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-empty? greetings))

nil

(let ((greetings (ht-create)))
(ht-empty? greetings))

t
```

The equality check can be used on a couple of hash tables to verify if they are the same, using the _ht-equal_? function as illustrated below:

```
(ht-equal? hash-table1 hash-table2) ;; Syntax

(let ((english (ht-create))
(numbers (ht-create)))
(ht-set! english “a” “A”)
(ht-set! numbers “1” “One”)
(ht-equal? english numbers))

nil
```

A few of the ht.el library functions accept a function as an argument and apply it to the items of the list. For example, the ht-map function takes a function with a key and value as arguments, and applies the function to each item in the hash table. For example:

```
(ht-map function hash-table) ;; Syntax

(let ((numbers (ht-create)))
(ht-set! numbers 1 “One”)
(ht-map (lambda (x y) (* x 2)) numbers))

(2)
```

You can also use the _ht-each_ API to iterate through each item in the hash-table. In the following example, the sum of all the values is calculated and finally printed in the output.

```
(ht-each function hash-table) ;; Syntax

(let ((numbers (ht-create))
(sum 0))
(ht-set! numbers “A” 1)
(ht-set! numbers “B” 2)
(ht-set! numbers “C” 3)
(ht-each (lambda (key value) (setq sum (+ sum value))) numbers)
(print sum))

6
```

The _ht-select_ function can be used to match and pick a specific set of items in the list. For example:

```
(ht-select function hash-table) ;; Syntax

(let ((numbers (ht-create)))
(ht-set! numbers 1 “One”)
(ht-set! numbers 2 “Two”)
(ht-items (ht-select (lambda (x y) (= x 2)) numbers)))

((“2” “Two”))
```

You can also reject a set of values by passing a filter function to the _ht-reject API_, and retrieve those items from the hash table that do not match the predicate function. In the following example, key 2 is rejected and the item with key 1 is returned.

```
(ht-reject function hash-table) ;; Syntax

(let ((numbers (ht-create)))
(ht-set! numbers 1 “One”)
(ht-set! numbers 2 “Two”)
(ht-items (ht-reject (lambda (x y) (= x 2)) numbers)))

((“1” “One”))
```

If you want to mutate the existing hash table and remove the items that match a filter function, you can use the _ht-reject_! function as shown below:

```
(ht-reject! function hash-table) ;; Syntax

(let ((numbers (ht-create)))
(ht-set! numbers 1 “One”)
(ht-set! numbers 2 “Two”)
(ht-reject! (lambda (x y) (= x 2)) numbers)
(ht-items numbers))

((“1” “One”))
```

The _ht-find_ function accepts a function and a hash table, and returns the items that satisfy the input function. For example:

```
(ht-find function hash-table) ;; Syntax

(let ((numbers (ht-create)))
(ht-set! numbers 1 “One”)
(ht-set! numbers 2 “Two”)
(ht-find (lambda (x y) (= x 2)) numbers))

(2 “Two”)
```

You can retrieve the items in the hash table using a specific set of keys with the _ht-select-keys_ API, as illustrated below:

```
(ht-select-keys hash-table keys) ;; Syntax

(let ((numbers (ht-create)))
(ht-set! numbers 1 “One”)
(ht-set! numbers 2 “Two”)
(ht-items (ht-select-keys numbers ‘(1))))

((1 “One”))
```

The following two examples are more comprehensive in using the hash table library functions. The _say-hello_ function returns a greeting based on the name as shown below:

```
(defun say-hello (name)
(let ((greetings (ht-create)))
(ht-set! greetings “Adam” “Hello Adam!”)
(ht-set! greetings “Eve” “Hello Eve!”)
(ht-get greetings name “Hello stranger!”)))

(say-hello “Adam”)
“Hello Adam!”

(say-hello “Eve”)
“Hello Eve!”

(say-hello “Bob”)
“Hello stranger!”
```

The _ht_ macro returns a hash table and we create nested hash tables in the following example:

```
(let ((alphabets (ht (“Greek” (ht (1 (ht (‘letter “α”)
(‘name “alpha”)))
(2 (ht (‘letter “β”)
(‘name “beta”)))))
(“English” (ht (1 (ht (‘letter “a”)
(‘name “A”)))
(2 (ht (‘letter “b”)
(‘name “B”))))))))
(ht-get* alphabets “Greek” 1 ‘letter))

“α”
```

**Testing**
The _ht.el_ library has built-in tests that you can execute to validate the API functions. You first need to clone the repository using the following commands:

```
$ git clone git@github.com:Wilfred/ht.el.git

Cloning into ‘ht.el’...
remote: Enumerating objects: 1, done.
remote: Counting objects: 100% (1/1), done.
Receiving objects: 100% (471/471), 74.58 KiB | 658.00 KiB/s, done.
remote: Total 471 (delta 0), reused 1 (delta 0), pack-reused 470
Resolving deltas: 100% (247/247), done.
```

If you do not have Cask, install the same using the instructions provided in the _README_ file at _<https://github.com/cask/cask>_.
You can then change the directory into the cloned ‘_ht.el_’ folder and run _cask install_. This will locally install the required dependencies for running the tests.

```
$ cd ht.el/
$ cask install
Loading package information... Select coding system (default utf-8):
done
Package operations: 4 installs, 0 removals
- Installing [ 1/4] dash (2.12.0)... done
- Installing [ 2/4] ert-runner (latest)... done
- Installing [ 3/4] cl-lib (latest)... already present
- Installing [ 4/4] f (latest)... already present
```

A _Makefile_ exists in the top-level directory and you can simply run ‘make’ to run the tests, as shown below:

```
$ make
rm -f ht.elc
make unit
make[1]: Entering directory ‘/home/guest/ht.el’
cask exec ert-runner
.........................................

Ran 41 tests in 0.016 seconds
make[1]: Leaving directory ‘/home/guest/ht.el’
make compile
make[1]: Entering directory ‘/home/guest/ht.el’
cask exec emacs -Q -batch -f batch-byte-compile ht.el
make[1]: Leaving directory ‘/home/guest/ht.el’
make unit
make[1]: Entering directory ‘/home/guest/ht.el’
cask exec ert-runner
.........................................

Ran 41 tests in 0.015 seconds
make[1]: Leaving directory ‘/home/guest/ht.el’
make clean-elc
make[1]: Entering directory ‘/home/guest/ht.el’
rm -f ht.elc
make[1]: Leaving directory ‘/home/guest/ht.el’
```

You are encouraged to read the ht.el _README_ file from the GitHub repository at _<https://github.com/Wilfred/ht.el/blob/master/README.md>_ for more information.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/the-emacs-series-ht-el-the-hash-table-library-for-emacs/

作者：[Shakthi Kannan][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/shakthi-kannan/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/GPL-3.jpg?resize=696%2C351&ssl=1 (GPL 3)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/GPL-3.jpg?fit=998%2C503&ssl=1
