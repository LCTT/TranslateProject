[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Demonstrating Perl with Tic-Tac-Toe, Part 3)
[#]: via: (https://fedoramagazine.org/demonstrating-perl-with-tic-tac-toe-part-3/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

Demonstrating Perl with Tic-Tac-Toe, Part 3
======

![][1]

The articles in this series have mainly focused on Perl’s ability to manipulate text. Perl was designed to manipulate and analyze text. But Perl is capable of much more. More complex problems often require working with sets of data objects and indexing and comparing them in elaborate ways to compute some desired result.

For working with sets of data objects, Perl provides [arrays and hashes][2]. Hashes are also known as _associative arrays_ or _dictionaries_. This article will prefer the term _hash_ because it is shorter.

The remainder of this article builds on the previous articles in this series by demonstrating basic use of arrays and hashes in Perl.

### An example Perl program

Copy and paste the below code into a plain text file and use the same one-liner that was provided in [the the first article][3] of this series to strip the leading numbers. Name the version without the line numbers _chip2.pm_ and move it into the _hal_ subdirectory. Use the version of the game that was provided in [the second article][4] so that the below chip will automatically load when placed in the _hal_ subdirectory.

```
00 # advanced operations chip
01
02 package chip2;
03 require chip1;
04
05 use strict;
06 use warnings;
07
08 use constant SCORE=>'
09 ┌───┬───┬───┐
10 │ 3 │ 2 │ 3 │
11 ├───┼───┼───┤
12 │ 2 │ 4 │ 2 │
13 ├───┼───┼───┤
14 │ 3 │ 2 │ 3 │
15 └───┴───┴───┘
16 ';
17
18 sub get_prob {
19    my $game = shift;
20    my @nums;
21    my %odds;
22
23    while ($game =~ /[1-9]/g) {
24       $odds{$&} = substr(SCORE, $-[0], 1);
25    }
26
27    @nums = sort { $odds{$b} <=> $odds{$a} } keys %odds;
28
29    return $nums[0];
30 }
31
32 sub win_move {
33    my $game = shift;
34    my $mark = shift;
35    my $tkns = shift;
36    my @nums = $game =~ /[1-9]/g;
37    my $move;
38
39    TRY: for (@nums) {
40       my $num = $_;
41       my $try = $game =~ s/$num/$mark/r;
42       my $vic = chip1::get_victor $try, $tkns;
43
44       if (defined $vic) {
45          $move = $num;
46          last TRY;
47       }
48    }
49
50    return $move;
51 }
52
53 sub hal_move {
54    my $game = shift;
55    my $mark = shift;
56    my @mark = @{ shift; };
57    my $move;
58
59    $move = win_move $game, $mark, \@mark;
60
61    if (not defined $move) {
62       $mark = ($mark eq $mark[0]) ? $mark[1] : $mark[0];
63       $move = win_move $game, $mark, \@mark;
64    }
65
66    if (not defined $move) {
67       $move = get_prob $game;
68    }
69
70    return $move;
71 }
72
73 sub complain {
74    print "My mind is going. I can feel it.\n";
75 }
76
77 sub import {
78    no strict;
79    no warnings;
80
81    my $p = __PACKAGE__;
82    my $c = caller;
83
84    *{ $c . '::hal_move' } = \&{ $p . '::hal_move' };
85    *{ $c . '::complain' } = \&{ $p . '::complain' };
86 }
87
88 1;
```

### How it works

In the above example Perl module, each position on the Tic-Tac-Toe board is assigned a score based on the number of winning combinations that intersect it. The center square is crossed by four winning combinations – one horizontal, one vertical, and two diagonal. The corner squares each intersect one horizontal, one vertical, and one diagonal combination. The side squares each intersect one horizontal and one vertical combination.

The _get_prob_ subroutine creates a hash named _odds_ (line 21) and uses it to map the numbers on the current game board to their score (line 24). The keys of the hash are then sorted by their score and the resulting list is copied to the _nums_ array (line 27). The _get_prob_ subroutine then returns the first element of the _nums_ array ($nums[0]) which is the number from the original game board that has the highest score.

The algorithm described above is an example of what is called a [heuristic][5] in [artificial intelligence][6] programming. With the addition of this module, the Tic-Tac-Toe game can be considered a very rudimentary artificial intelligence program. It is really just playing the odds though and it is quite beatable. The next module (chip3.pm) will provide an algorithm that actually calculates the best possible move based on the opponent’s counter moves.

The _win_move_ subroutine simply tries placing the provided mark in each available position and passing the resulting game board to chip1’s _get_victor_ subroutine to see if it contains a winning combination. Notice that the **r** flag is being passed to the substitution operation (s/$num/$mark/r) on line 41 so that, rather than modifying the original game board, a new copy of the board containing the substitution is created and returned.

### Arrays

It was mentioned in part one that arrays are variables whose names are prefixed with an at symbol (**@**) when they are created. In Perl, these prefixed symbols are called sigils.

#### Context

In Perl, many things return a different value depending on the context in which they are accessed. The two contexts to be aware of are called _scalar_ context and _list_ context. In the following example, $_value1_ and $_value2_ are different because @_nums_ is accessed first in scalar context and then in list context.

```
$value1 = @nums;
($value2) = @nums;
```

In the above example, it might seem like @_nums_ should return the same value each time it is accessed, but it doesn’t because what is accessing it (the context) is different. $_value1_ is a scalar, so it receives the scalar value of @_nums_ which is its length. ($_value2_) is a list, so it receives the list value of @_nums_. In the above example, $_value2_ will receive the value of the first element of the _nums_ array.

In part one, the below statement from the _get_mark_ subroutine copied the numbers from the current Tic-Tac-Toe board into an array named _nums_.

```
@nums = $game =~ /[1-9]/g
```

Since the _nums_ array in the above statement receives one copy of each board number in each of its elements, the count of the board numbers is equal to the length of the array. In Perl, the length of an array is obtained by accessing it in [scalar context][7].

Next, the following formula was used to compute which mark should be placed on the Tic-Tac-Toe board in the next turn.

```
$indx = (@nums+1) % 2;
```

Because the plus operator requires a single value (a scalar) on its left hand side, not a list of values, the _nums_ array evaluates to its length, not the list of its values. The parenthesis, in the above example, are just being used to set the order of operations so that the addition (+) will happen before the modulo (%).

#### Copying

In Perl you can create a list for immediate use by surrounding the list values with parenthesis and separating them with commas. The following example creates a three-element list and copies its values to an array.

```
@nums = (4, 5, 6);
```

As long as the elements of the list are variables and not constants, you can also copy the elements of an array to a list:

```
($four, $five, $six) = @nums;
```

If there were more elements in the array than the list in the above example, the extra elements would simply be discarded.

#### Different from lists in scalar context

Be aware that lists and arrays are different things in Perl. A _list_ accessed in scalar context returns its last value, not its length. In the following example, $_value3_ receives 3 (the length of @_nums_) while $_value4_ receives 6 (the last element of the list).

```
$value3 = @nums;
$value4 = (4, 5, 6);
```

#### Indexing

To access an individual element of an array or list, suffix it with the desired index in square brackets as shown on line 29 of the above example Perl module.

Notice that the _nums_ array on line 29 is prefixed with the dollar sigil ($) rather than the at sigil (@). This is done because the _get_prob_ subroutine is supposed to return a single value, not a list. If @nums[0] were used instead of $nums[0], the subroutine would return a one-element list. Since a list evaluates to its last element in scalar context, this program would probably work if I had used @nums[0], but if you mean to retrieve a single element from an array, be sure to use the dollar sigil ($), not the at sigil (@).

It is possible to retrieve a subset from an array (or a list) rather than just one value in which case you would use the at sigil and you would provide a series of indexes or a range instead of a single index. This is what is known in Perl as a [list slice][8].

### Hashes

Hashes are variables whose names are prefixed with the percent sigil (%) when they are created. They are subscripted with curly brackets ({}) when accessing individual elements or subsets of elements (hash slices). Like arrays, hashes are variables that can hold multiple discrete data elements. They differ from arrays in the following ways:

  1. Hashes are indexed by strings (or anything that can be converted to a string), not numbers.
  2. Hashes are unordered. If you retrieve a list of their keys, values or key-value pairs, the order of the listing will be random.
  3. The number of elements in the hash will be equal to the number of keys that have been assigned values. If a value is assigned to index 99 of an array that has only three elements (indexes 0-2), the array will grow to a length of 100 elements (indexes 0-99). If a value is assigned to a new key in a hash that has only three elements, the hash will grow by only one element.



As with arrays, if you mean to access (or assign to) a single element of a hash, you should prefix it with the dollar sigil ($). When accessing a single element, Perl will go by the type of the subscript to determine the type of variable being accessed – curly brackets ({}) for hashes or square brackets ([]) for arrays. The _get_prob_ subroutine in the above Perl module demonstrates assigning to and accessing individual elements of a hash.

Perl has two special built-in functions for working with hashes – [keys][9] and [values][10]. The _keys_ function, when provided a hash, returns a list of all the hash’s keys (indexes). Similarly, the _values_ function will return a list of all the hash’s values. Remember though that the order in which the list is returned is random. This randomness can be seen when playing the Tic-Tac-Toe game. If there is more than one move available with the highest score, the computer will chose one at random because the _keys_ function returns the available moves from the _odds_ hash in random order.

On line 27 of the above example Perl module, the _keys_ function is being used to retrieve the list of keys from the _odds_ hash. The keys of the _odds_ hash are the numbers that were found on the current game board. The values of the _odds_ hash are the corresponding probabilities that were retrieved from the _SCORE_ constant on line 24.

Admittedly, this example could have used an array instead of a string to store and retrieve the scores. I chose to use a string simply because I think it presents the layout of the board a little nicer. An array would likely perform better, but with such a small data set, the difference is probably too small to measure.

### Sort

On line 27, the list of keys from the _odds_ hash is being feed to Perl’s built-in [sort][11] function. Beware that Perl’s sort function sorts lexicographically by default, not numerically. For example, provided the list (10, 9, 8, 1), Perl’s sort function will return the list (1, 10, 8, 9).

The behavior of Perl’s sort function can be modified by providing it a code block as its first parameter as demonstrated on line 27. The result of the last statement in the code block should be a number less-than, equal-to, or greater-than zero depending on whether element _$a_ should be placed before, concurrent-with, or after element _$b_ in the resulting list respectively. _$a_ and _$b_ are pairs of elements from the provided list. The code in the block is executed repeatedly with _$a_ and _$b_ set to different pairs of elements from the original list until all the pairs have been compared and sorted.

The **&lt;=&gt;** operator is a special Perl operator that returns -1, 0, or 1 depending on whether the left argument is numerically less-than, equal-to, or greater-than the right argument respectively. By using the **&lt;=&gt;** operator in the code block of the sort function, Perl’s sort function can be made to sort numerically rather than lexicographically.

Notice that rather than comparing _$a_ and _$b_ directly, they are first being passed through the _odds_ hash. Since the values of the _odds_ hash are the probabilities that were retrieved from the _SCORE_ constant, what is being compared is actually the score of _$a_ versus the score of _$b_. Consequently, the numbers from the original game board are being sorted by their score, not their value. Numbers with an equal score are left in the same random order that the _keys_ function returned them.

Notice also that I have reversed the typical order of the parameters to **&lt;=&gt;** in the code block of the _sort_ function (_$b_ on the left and _$a_ on the right). By switching their order in this way, I have caused the _sort_ function to return the elements in reverse order – from greatest to least – so that the number(s) with the highest score will be first in the list.

### References

References provide an indirect means of accessing a variable. They are often used when making copies of the variable is either undesirable or impractical. References are a sort of short cut that allows you to skip performing the copy and instead provide access to the original variable.

#### Why to use references

There is a cost in time and memory associated with making copies of variables. References are sometimes used as a means of reducing that cost. Be aware, however, that recent versions of Perl implement a technology called [copy-on-write][12] that greatly reduces the cost of copying variables. This new optimization should work transparently. You don’t have to do anything special to enable the copy-on-write optimization.

#### Why not to use references

References violate the [action-at-a-distance][13] principle that was mentioned in part one of this series. References are just as bad as global variables in terms of their tendency to trip up programmers by allowing data to be modified outside the local scope. You should generally try to avoid using references. But there are times when they are necessary.

#### How to create references

An example of passing a reference is provided on line 59 of the above Perl module. Rather than placing the _mark_ array directly in the list of parameters to the _win_move_ subroutine, a reference to the array is provided instead by prefixing the variable’s sigil with a backslash (\\).

It is necessary to use a reference (\@mark) on line 59 because if the array were placed directly on the list, it would expand such that the first element of the _mark_ array would become the third parameter to the _win_move_ function, the second element of the _mark_ array would become the fourth parameter to the _win_move_ function, and so on for as many elements as the _mark_ array has. Whereas an array will expand in list context, a reference will not. If the array were passed in expanded form, the receiving subroutine would need to call _shift_ once for each element of the array. Also, the receiving function would not be able to tell how long the original array was.

#### Three ways to dereference references

In the receiving subroutine, the reference has to be dereferenced to get at the original values. An example of dereferencing an array reference is provided on line 56. On line 56, the _shift_ statement has been enclosed in curly brackets and the opening bracket has been prefixed with the array sigil (@).

There is also a shorter form for dereferencing an array reference that is demonstrated on line 43 of [the _chip1.pm_ module][4]. The short form allows you to omit the curly brackets and instead place the array sigil directly in front of the sigil of the scalar that holds the array reference. The short form only works when you have an array reference stored in a scalar. When the array reference is coming from a function, as it is on line 56 of the above Perl module, the long form must be used.

There is yet a third way of dereferencing an array reference that is demonstrated on line 29 of the _game_ script. Line 29 shows the _MARKS_ array reference being dereferenced with the arrow operator (-&gt;) and an index enclosed in square brackets. The _MARKS_ array reference is missing its sigil because it is a constant. You can tell that what is being dereferenced is an array reference because the arrow operator is followed by square brackets ([]). Had the _MARKS_ constant been a hash reference, the arrow operator would have been followed by curly brackets ({}).

There are also corresponding long and short forms for dereferencing hash references that use the hash sigil (%) instead of the array sigil. Note also that hashes, just like arrays, need to be passed by reference to subroutines unless you want them to expand into their constituent elements. The latter is sometimes done in Perl as a clever way of emulating [named parameters][14].

#### A word of caution about references

It was stated earlier that references allow data to be modified outside of their declared scope and, just as with global variables, this non-local manipulation of the data can be confusing to the programmer(s) and thereby lead to unintended bugs. This is an important point to emphasize and explain.

On line 35 of the _win_move_ subroutine, you can see that I did not dereference the provided array reference (\@mark) but rather I chose to store the reference in a scalar named _tkns_. I did this because I do not need to access the individual elements of the provided array in the _win_move_ subroutine. I only need to pass the reference on to the _get_victor_ subroutine. Not making a local copy of the array is a short cut, but it is dangerous. Because $_tkns_ is only a copy of the _reference_, not a copy of the _original_ data being referred to, if I or a later program developer were to write something like _$tkns-&gt;[0] = ‘Y’_ in the _win_move_ subroutine, it would actually modify the value of the _mark_ array in the _hal_move_ subroutine. By passing a reference to its _mark_ array (\@mark) to the _win_move_ subroutine, the _hal_move_ subroutine has granted access to modify its local copy of @_mark_. In this case, it would probably be better to make a local copy of the _mark_ array in the _win_move_ subroutine using syntax similar to what is shown on line 56 rather than preserving the reference as I have done for the purpose of demonstration on line 35.

### Aliases

In addition to references, there is another way that a local variable created with the _my_ or _state_ keyword can leak into the scope of a called subroutine. The list of parameters that you provide to a subroutine is _directly_ accessible in [the @_ array][15].

To demonstrate, the following example script prints **b**, not **a**, because the _inc_ subroutine accesses the first element of **@_** directly rather than first making a local copy of the parameter.

```
#!/usr/bin/perl

sub inc {
   $_[0]++;
}

MAIN: {
   my $var = 'a';
   inc $var;
   print "$var\n";
}
```

Aliases are different from references in that you don’t have to dereference them to get at their values. They really are just alternative names for the same variable. Be aware that aliases occur in a few other places as well. One such place is the list returned from the _sort_ function – if you were to modify an element of the returned list directly, without first copying it to another variable, you would actually be modifying the element in the original list that was provided to the sort function. Other places where aliases occur include the code blocks of functions like [grep][16] and [map][17]. The _grep_ and _map_ functions are not covered in this series of articles. See the provided links if you want to know more about them.

### Final notes

Many of Perl’s built-in functions will operate on the default scalar (**$_**) or default array (**@_**) if they are not explicitly provided a variable to read from or write to. Line 40 of the above Perl module provides an example. The numbers from the _nums_ array are sequentially aliased to **$_** by the _for_ keyword. If you chose to use these variables, in most cases you will probably want to retrieve your data from **$_** or **@_** fairly quickly to prevent it being accidentally overwritten by a subsequent command.

The substitution command (s/…/…/), for example, will manipulate the data stored in **$_** if it is not explicitly bound to another variable by one of the **=~** or **!~** operators. Likewise, the _shift_ function operates on **@_** (or @_ARGV_ if called in the global scope) if it is not explicitly provided an array to operate on. There is no obvious rule to which functions support this shortcut. You will have to consult the documentation for the command you are interested in to see if it will operate on a default variable when not provided one explicitly.

As demonstrated on lines 55 and 56, the same name can be reused for variables of different types. Reusing variable names generally makes the code harder to follow. It is probably better for the sake of readability to avoid variable name reuse.

Beware that making copies of arrays or hashes in Perl (as demonstrated on line 56) is [shallow][18] by default. If any of the elements of the array or hash are references, the corresponding elements in the duplicated array or hash will be references to the same original data. To make deep copies of data structures, use one of the [Clone][19] or [Storable][20] Perl modules. An alternative workaround that may work in the case of multi-dimensional arrays is to [emulate them with a one-dimensional hash][21].

Similar in form to Perl’s syntax for creating lists – (1, 2, 3) – unnamed array references and unnamed hash references can be constructed on the fly by bounding a comma-separated set of elements in square brackets (**[]**) or curly brackets (**{}**) respectively. Line 07 of [the game script][4] demonstrates an unnamed (anonymous) array reference being constructed and assigned to the _MARKS_ constant.

Notice that the _import_ subroutine at the end of the above Perl module (chip2.pm) is assigning to some of the same names in the calling namespace as the previous module (chip1.pm). This is intentional. The _hal_move_ and _complain_ aliases created by chip1’s _import_ subroutine will simply be overridden by the identically named aliases created by chip2’s _import_ subroutine (assuming chip2.pm is loaded after chip1.pm in the calling namespace). Only the aliases are updated/overridden. The original subroutines from chip1 will still exist and can still be called with their full names – _chip1::hal_move_ and _chip1::complain_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/demonstrating-perl-with-tic-tac-toe-part-3/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/perl-tic-tac-toe-816x346.png
[2]: https://perldoc.perl.org/5.30.0/perldsc.html
[3]: https://fedoramagazine.org/demonstrating-perl-with-tic-tac-toe-part-1/
[4]: https://fedoramagazine.org/demonstrating-perl-with-tic-tac-toe-part-2/
[5]: https://en.wikipedia.org/wiki/Heuristic_(computer_science)
[6]: https://en.wikipedia.org/wiki/Artificial_intelligence
[7]: https://perldoc.perl.org/perldata.html#Context
[8]: https://perldoc.perl.org/5.30.0/perldata.html#Slices
[9]: https://perldoc.perl.org/5.30.0/functions/keys.html
[10]: https://perldoc.perl.org/5.30.0/functions/values.html
[11]: https://perldoc.perl.org/5.30.0/functions/sort.html
[12]: https://perldoc.perl.org/perlguts.html#Copy-on-Write
[13]: https://en.wikipedia.org/wiki/Action_at_a_distance_(computer_programming)
[14]: https://perldoc.perl.org/5.12.0/perlbot.html#INSTANCE-VARIABLES
[15]: https://perldoc.perl.org/5.30.0/perlsub.html#DESCRIPTION:~:text=Any%20arguments%20passed%20in%20show%20up%20in%20the%20array%20%40
[16]: https://perldoc.perl.org/5.30.0/functions/grep.html
[17]: https://perldoc.perl.org/5.30.0/functions/map.html
[18]: https://en.wikipedia.org/wiki/Object_copying#Shallow_copy
[19]: https://metacpan.org/pod/Clone
[20]: https://metacpan.org/pod/Storable
[21]: https://perldoc.perl.org/5.30.0/perldata.html#Multi-dimensional-array-emulation
