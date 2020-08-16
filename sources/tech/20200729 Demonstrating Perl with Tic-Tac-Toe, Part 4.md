[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Demonstrating Perl with Tic-Tac-Toe, Part 4)
[#]: via: (https://fedoramagazine.org/demonstrating-perl-with-tic-tac-toe-part-4/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

Demonstrating Perl with Tic-Tac-Toe, Part 4
======

![][1]

This is the final article to the series demonstrating Perl with Tic-Tac-Toe. This article provides a module that can compute better game moves than the previously presented modules. For fun, the modules _chip1.pm_ through _chip3.pm_ can be incrementally moved out of the _hal_ subdirectory in reverse order. With each chip that is removed, the game will become easier to play. The game must be restarted each time a chip is removed.

### An example Perl program

Copy and paste the below code into a plain text file and use the same one-liner that was provided in the [the first article][2] of this series to strip the leading numbers. Name the version without the line numbers _chip3.pm_ and move it into the _hal_ subdirectory. Use the version of the game that was provided in [the second article][3] so that the below chip will automatically load when placed in the _hal_ subdirectory. Be sure to also include both _chip1.pm_ and _chip2.pm_ from the second [and third][4] articles, respectively, in the _hal_ subdirectory.

```
00 # artificial intelligence chip
01
02 package chip3;
03 require chip2;
04 require chip1;
05
06 use strict;
07 use warnings;
08
09 sub moverama {
10    my $game = shift;
11    my @nums = $game =~ /[1-9]/g;
12    my $rama = qr/[1973]/;
13    my %best;
14
15    for (@nums) {
16       my $ra = $_;
17       next unless $ra =~ $rama;
18       $best{$ra} = 0;
19       for (@nums) {
20          my $ma = $_;
21          next unless $ma =~ $rama;
22          if (($ra-$ma)*(10-$ra-$ma)) {
23             $best{$ra} += 1;
24          }
25       }
26    }
27
28    @nums = sort { $best{$b} <=> $best{$a} } keys %best;
29
30    return $nums[0];
31 }
32
33 sub hal_move {
34    my $game = shift;
35    my $mark = shift;
36    my @mark = @{ shift; };
37    my $move;
38
39    $move = chip2::win_move $game, $mark, \@mark;
40
41    if (not defined $move) {
42       $mark = ($mark eq $mark[0]) ? $mark[1] : $mark[0];
43       $move = chip2::win_move $game, $mark, \@mark;
44    }
45
46    if (not defined $move) {
47       $move = moverama $game;
48    }
49
50    if (not defined $move) {
51       $move = chip1::hal_move $game;
52    }
53
54    return $move;
55 }
56
57 sub complain {
58    print 'Just what do you think you\'re doing, ',
59    ((getpwnam($ENV{'USER'}))[6]||$ENV{'USER'}) =~ s! .*!!r, "?\n";
60 }
61
62 sub import {
63    no strict;
64    no warnings;
65
66    my $p = __PACKAGE__;
67    my $c = caller;
68
69    *{ $c . '::hal_move' } = \&{ $p . '::hal_move' };
70    *{ $c . '::complain' } = \&{ $p . '::complain' };
71
72    if (&::MARKS->[0] ne &::HAL9K) {
73       @{ &::MARKS } = reverse @{ &::MARKS };
74    }
75 }
76
77 1;
```

### How it works

Rather than making a random move or making a move based on probability, this final module to the Perl Tic-Tac-Toe game uses a more [deterministic][5] algorithm to calculate the best move.

The big takeaway from this Perl module is that it is yet another example of how references can be misused or abused, and as a consequence lead to unexpected program behavior. With the addition of this chip, the computer learns to cheat. Can you figure out how it is cheating? Hints:

  1. Constants [are implemented as subroutines][6].
  2. References allow data to be modified out of scope.



### Final notes

Line 12 demonstrates that a regular expression can be [pre-compiled][7] and stored in a scalar for later use. This is useful as performance optimization when you intend to re-use the same regular expression many times over.

Line 59 demonstrates that [some system library calls][8] are available directly in Perl’s built-in core functionality. Using the built-in functions alleviates some overhead that would otherwise be required to launch an external program and setup the I/O channels to communicate with it.

Lines 72 and 73 demonstrate the use of **&amp;::** as [a shorthand for **&amp;main::**][9].

The full source code for this Perl game can be cloned from the git repository available here: <https://pagure.io/tic-tac-toe.git>

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/demonstrating-perl-with-tic-tac-toe-part-4/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/02/perl-tic-tac-toe-816x346.png
[2]: https://fedoramagazine.org/demonstrating-perl-with-tic-tac-toe-part-1/
[3]: https://fedoramagazine.org/demonstrating-perl-with-tic-tac-toe-part-2/
[4]: https://fedoramagazine.org/demonstrating-perl-with-tic-tac-toe-part-3/
[5]: https://en.wikipedia.org/wiki/Deterministic_system
[6]: https://perldoc.perl.org/5.32.0/constant.html#TECHNICAL-NOTES
[7]: https://perldoc.perl.org/5.8.2/perlretut.html#Compiling-and-saving-regular-expressions
[8]: https://perldoc.perl.org/5.8.2/functions/getpwnam.html
[9]: https://perldoc.perl.org/perlmod.html#Packages
