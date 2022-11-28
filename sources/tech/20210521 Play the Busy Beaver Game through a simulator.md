[#]: subject: (Play the Busy Beaver Game through a simulator)
[#]: via: (https://opensource.com/article/21/5/busy-beaver-game-c)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Play the Busy Beaver Game through a simulator
======
A simulator written in C helps solve one of the most complex games in
mathematics.
![Woman sitting in front of her computer][1]

It's hard to find a game that combines the difficulty of, say, [Dark Souls][2] with the elegance of Conway's [Game of Life][3]. In a 1962 paper, Hungarian mathematician Tibor Radó came up with just such a game, which he called the Busy Beaver Game (BBG).

To play BBG is to create a program that writes **1**s on a machine's tape whose cells initially hold **0**s; the **1**s need not be consecutive, but the program must halt for the **1**s to count. The winning program has the most **1**s on its tape after halting.

I'll start with an overview of the machine, its programming language, and the game's constraints.

### The BBG machine, language, and game constraints

Imagine an abstract computing machine (indeed, a Turing machine) with these features:

  * A two-character alphabet. In general, any two characters will do for a Turing machine; by tradition, BBG uses **0** and **1**.
  * A tape of cells laid out horizontally. Each cell holds a single character from the alphabet. The tape is initialized to **0**s, which counts as a blank tape. A Turing machine's tape must be unbounded in at least one direction (typically the right), which is computationally equivalent to a tape unbounded in both directions. Again by tradition, the BBG uses a tape that is unbounded in both directions: [code]    +-+-+-+-+-+
...|0|0|0|0|0|...
   +-+-+-+-+-+ [/code] The tape is the machine's memory.
  * A read-write marker, which identifies the current memory cell. During each step in a computation, the machine reads and then overwrites the current cell's contents. The machine can replace a **0** with a **1**, a **1** with a **0**, or either character with the same one. The caret **^** beneath a cell represents the marker: [code]    +-+-+-+-+-+
...|0|0|0|0|0|...
   +-+-+-+-+-+
        ^ [/code] The marker (here beneath the middle cell) acts as an index into the machine's memory. A Turing machine has only linear rather than random access to memory cells because it moves just one cell, either left or right, per executed instruction.



A BBG program, like any Turing program, consists of instructions such as **a0b1L**, which are known as quintuples for the number of parts; in BBG, there is one character per part. A quintuple's first two characters (in this example, **a0**) represent a condition that captures two aspects of the computation:

  * The current state of the computation, which is **a** in the **a0b1L** example; BBG uses single letters (in my examples, lowercase ones) to identify the state
  * The contents of the currently marked cell: **0** or **1**



The condition **a0** means "in state **a** scanning a **0**," whereas **h1** means "in state **h** scanning a **1**."

The last three characters in a quintuple specify the action to be taken if the condition is satisfied.

Here are two examples (with ## introducing my comments):


```
a0b1R ## in state a scanning a 0: transition to state b, write a 1, and move one cell right
p1p1L ## in state p scanning a 1: stay in state p, write a 1, and move one cell left
```

Quintuples can be visualized as rules with an arrow separating the condition from the action:


```
`a0-->b1R`
```

If condition **a0** is satisfied, then action **b1R** occurs. By tradition, **a** is the start state and, therefore, **a0** is the start condition. Forward-chaining rule systems such as [OPS5][4] use a similar flow-of-control mechanism.

In summary, the quintuples in a BBG program can occur in any order because condition-matching determines which instruction executes next. No two quintuples in a program should have the same condition.

### The halting problem

A BBC program executes until reaching a halt state—a state that does not occur in the matched condition of any instruction. Consider the program below, which is the BBG winner for a program with two non-halting states, **a** and **b**:


```
# bb2 winner
a0b1R  ## a0--&gt;b1R
a1b1L  ## a1--&gt;b1L
b0a1L  ## b0--&gt;a1L
b1h1R  ## b1--&gt;b1h1R (halt state)
```

The last instruction **b1h1R** contains the traditional halt state **h** in the action. (There can be multiple halt states but one is enough.) If the condition **b1** is satisfied, then **h** becomes the new state when instruction **b1h1R** executes. However, no instruction in the program has a condition that begins with **h**, which means that the machine halts in state **h**. Reaching a halt state **h** represents normal program termination.

For a BBG, as for Turing computations in general, a program must halt for the computation to complete. For example, this instruction would write infinitely many **1**s to the right on an initially blank tape:


```
`a0a1R ## "infinitely touring" instruction on a blank tape`
```

Scanning a **0** in state **a**, the machine stays in state **a**, overwrites the **0** with a **1**, and moves right to another **0**; hence, instruction **a0a1R** executes again. A program in which this instruction executes, with only **0**s to the right, would never halt and, therefore, could not qualify as a BBG winner.

Among the legendary unsolvable problems in computing is whether a Turing machine halts when executing a given program on given data inputs—the _halting problem_. Accordingly, there is no way to know whether a given BBG program will halt. My simulator (introduced below) suspects "infinite touring" after executing a million instructions and therefore exits.

### From BBG to BBG-N

BBG covers an indefinitely large set of games, each with a number that identifies how many non-halting states a game-playing program may use. For example, the sample program shown earlier is the winner of the BBG-2 game because the program is restricted to two non-halting states, **a** and **b**. (The BBG-2 winner produces four **1**s on an initially blank tape.) The BBG-3 game uses three non-halting states, whereas the BBG-744 game uses 744 non-halting states.

In summary, a BBG-N winner produces the most **1**s, given _N_ non-halting states and starting on a blank tape. The winner must halt. Proving that a contender wins the BBG-N game is non-trivial. At present, there are proven winners of the BBG-1 through the BBG-4 games, but none for games with more than four non-halting states. For example, the BBG-5 game has only a best contender. Running some BBG winners and the BBG-5 best contender on the simulator should clarify the computation in detail and underscore how ingenious the winning and contending programs are.

### BBG-N examples on the simulator

I'll start with the winner of the trivial BBG-1 game:


```
# bb1 winner
a0h1R  ## a is the single non-halting state
```

Here's how the simulator's tape looks to begin, with the computation in start state **a** scanning a **0**:


```
Current state: a
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                    ^
```

The program's single instruction transitions to the halting state **h**, writes a **1**, and moves one cell to the right:


```
Current state: h
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                    ^
```

The winner thus produces a single **1** in one step, using one non-halting state. No BBG-1 program can do better. An equivalent BBG-1 program might move left instead of right after writing a **1**, but the winning total of one **1** would be the same.

The winner of the more interesting BBG-2 game is this program (shown earlier), which has two non-halting states, **a** and **b**:


```
# bb2 winner
a0b1R  ## a0--&gt;b1R
a1b1L  ## a1--&gt;b1L
b0a1L  ## b0--&gt;a1L
b1h1R  ## b1--&gt;h1R  (halt state)
```

The program produces four **1**s in six steps:


```
Current state: h
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                  ^
```

 Let's examine the BBG-3 winner in detail:


```
# bb3 winner
a0b1R
a1h1R # (halt state)
b0c0R
b1b1R
c0c1L
c1a1L
```

The program produces six **1**s in 14 steps and has three non-halting states: **a**, **b**, and **c**. A trace from the simulator clarifies how the computation works, and in particular, how it loops.

As usual, the tape is initially blank. The marker is in the middle, and the machine is in start state **a** and scanning a **0**. The instruction with the matching condition **a0** is the first one, **a0b1R**. This instruction transitions to state **b**, writes a **1**, and moves one cell to the right:


```
Current state: b
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                    ^
```

The condition is now **b0**, which identifies instruction **b0c0R**. The machine accordingly transitions to state **c**, writes a **0**, and moves one cell to the right:


```
Current state: c
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                      ^
```

The new condition is **c0** with **c0c1L** as the matching instruction. The machine thus overwrites the currently scanned **0** with a **1**, remains in state **c**, and moves one cell to the left:


```
Current state: c
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                    ^
```

The condition remains **c0** and the matching instruction remains **c0c1L**; the action, therefore, writes another **1** between the other two. The state stays the same but the left move places the marker on a **1** rather than a **0**. Accordingly, the condition changes to **c1** and the matching instruction to **c1a1L**. The action for this instruction moves the marker to the **0** cell immediately to the left of the leftmost **1** with **a** as the new state:


```
Current state: a
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                ^
```

Now the condition is **a0** just as it was at the start of the computation—the program is, in effect, looping. The full instruction is **a0b1R**, which transitions the machine to state **b**, writes a fourth **1** on the left of the other three, and then moves right. The machine keeps moving right (and overwriting **1**s with **1**s) via instruction **b1b1R** until hitting the first **0** to the right:


```
Current state: b
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                        ^
```

In state **b** and scanning a **0**, the machine executes instruction **b0c0R** once again, thereby transitioning to state **c**, overwriting a **0** with a **0**, and moving right to another blank cell:


```
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                          ^
```

In state **c** and scanning a **0**, the machine now executes instruction **c0c1L** twice in a row to produce a tape with six consecutive **1**s. Also, the machine has transitioned into state **a**:


```
Current state: a
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                    ^
```

At this point, the matching instruction **a1h1R** transitions the machine into halt state **h** and moves one cell to the right. The final tape configuration is thus:


```
Current state: h
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                      ^
```

The BBG-3 winner produces six **1**s in 14 steps.

How can we be sure that these winners deserve the title? There are rigorous mathematical proofs that the winning BBG-1, BBG-2, BBG-3, and BBG-4 programs cannot be bested. The creator of the BBG once believed it impossible to prove a winner for BBG-4, but eventually, there was a [proof for the BBG-4 winner][5]. Here's the proven BBG-4 winner:


```
# bb4 winner
a0b1R
a1b1L
b0a1L
b1c0L
c0h1R # (halt state)
c1d1L
d0d1R
d1a0R
```

This program takes 107 steps to produce 13 **1**s, which are not consecutive:


```
Current state: h
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
...|0|0|0|0|0|1|0|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|...
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                ^
```

For games BBG-5 and beyond, there are best contenders rather than proven winners. Long-lived fame (but probably not fortune) awaits anyone who can prove a BBG-5 winner. For reference, here's the BBG-5 best contender:


```
# bb5 best contender
a0b1R
a1c1L
b0c1R
b1b1R
c0d1R
c1e0L
d0a1L
d1d1L
e0h1R # (halt state)
e1a0L
```

As shown below, this program produces 4,098 non-consecutive **1**s in an astonishing 47,176,870 steps—a mind-boggling caution about just how hard BBG-N games become for _N_&gt;4\. Might there be a better contender for BBG-5 or even a proof that this program wins BBG-5? To date, these questions are open, and the experts expect them to remain so.

### Running the simulator

The Turing program (written in C) simulates a single-tape Universal Turing Machine (UTM) by being general-purpose: the simulator can play BBG games but also, for example, perform mathematical operations such as multiplication and exponentiation on values represented in unary, given the appropriate program as an input. The UTM simulator presents the tape as if it were unbounded in both directions. The unavoidable shortcoming of any UTM simulator is finite tape size, of course; the abstract UTM has unbounded memory, a magical feature that no simulator can capture.

The simulator, together with the BBG programs discussed so far, is available from [my website][6]. For reference, here's the C source code for the simulator:


```
.Turing machine simulator
=========================
\-----
#include &lt;stdio.h&gt;
#include &lt;stdlib.h&gt;
#include &lt;string.h&gt;

#define MaxQuintuples     128 /* expand as needed */
#define QuintupleLen        5
#define MaxBuffer         128
#define MaxTape            33 /* expand as needed: 1 line of display */
#define MaxSteps      1000000 /* assume 'infinite looping' thereafter */
#define Blank            '0'  /* 2-character alphabet: 0 and 1 */
#define StartState       'a'

#define TapeBorder       "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+"
#define CellSide         '|'
#define Ellipsis         "..."
#define CellLen          2  

enum { NewState = 2, NewSymbol = 3, Direction = 4 };
char quintuples[MaxQuintuples][QuintupleLen + 1]; /* array of strings */
unsigned qlen = 0;        /* number of entries from input file */
unsigned displayFlag = 1; /* 2nd command-line arg turns this off */

char tape[MaxTape];
unsigned currentCell = MaxTape / 2; /* tape middle */
char currentState = StartState;
unsigned instructionsExecuted = 0;

void die(const char* msg) {
  [puts][7](msg);
  [exit][8](EXIT_FAILURE);
}

void print_cell(unsigned ind) {
  [putchar][9](CellSide);
  [putchar][9](tape[ind]);
}

void pause() {
  [puts][7]("Hit RETURN to continue...");
  [getchar][10]();
}

void display_tape() {
  [printf][11]("\nCurrent state: %c\n", currentState);
  [printf][11]("   %s\n", TapeBorder);
  [printf][11]("%s", Ellipsis);
 
  unsigned i;
  for (i = 0; i &lt; MaxTape; i++) print_cell(i);
  [printf][11]("%c%s\n   %s\n", CellSide, Ellipsis, TapeBorder);

  i = (CellLen * currentCell) + 2;
  [printf][11]("%*s%c\n", i, "", '^');
  pause();
}

int comp(const void* e1, const void* e2) { /* qsort and bsearch callback */
  const char* s1 = (char*) e1;
  const char* s2 = (char*) e2;
  return [strncmp][12](s1, s2, 2); /* &lt; 0 = s1 &lt; s2; 0 = s1 == s2; &gt; 0 = s1 &gt; s2 */
}

void read_program(const char* file) {
  FILE* infile = [fopen][13](file, "r");
  char buff[MaxBuffer + 1];
  if (NULL == infile) {
    [sprintf][14](buff, "Can't open program file %s", file);
    die(buff);
  }
   
  while ([fgets][15](buff, MaxBuffer, infile)) { /* read until end-of-file */
    if ('#' == buff[0]) continue;              /* ignore comments */
    if ([strlen][16](buff) &lt; QuintupleLen) continue; /* ignore faulty lines */
    [strncpy][17](quintuples[qlen], buff, QuintupleLen);
    qlen++;
  }
  [fclose][18](infile);

  [qsort][19](quintuples, qlen, sizeof(quintuples[0]), comp); /* sort for easy access */
  [memset][20](tape, Blank, MaxTape); /* blank out the tape */
}

void report() {
  /* Show instructions. */
  [printf][11]("%i instructions:\n", qlen);
  unsigned i, count = 0;
  for (i = 0; i &lt; qlen; i++) [puts][7](quintuples[i]);
  for (i = 0; i &lt; MaxTape; i++) if ('1' == tape[i]) count++;
  [printf][11]("Total 1s on tape:      %8i\n", count);
  [printf][11]("Instructions executed: %8i\n", instructionsExecuted);
}

void check_for_errors(const char* action) {
  if (0 == (currentCell - 1) &amp;&amp; 'L' == action[Direction]) die("Can't move left...");
  if (currentCell &gt;= MaxTape - 1 &amp;&amp; 'R' == action[Direction]) die("Can't move right...");
  if (instructionsExecuted &gt;= MaxSteps) die("Seems to be infinitely touring...");
}

void run_simulation() {
  while (1) {
     if (displayFlag) display_tape();
 
    /* Get the action for the current key. */
    char key[3];
    [sprintf][14](key, "%c%c", currentState, tape[currentCell - 1]);
    char* action = [bsearch][21](key, quintuples, qlen, sizeof(quintuples[0]), comp);
    if (NULL == action) break; /* no match == normal termination */

    check_for_errors(action);

    /* Update system. */
    currentState = action[NewState];
    tape[currentCell - 1] = action[NewSymbol];
    if ('L' == action[Direction]) currentCell--; /* move left */
    else currentCell++;                          /* move right */
    instructionsExecuted++;                      /* update step counter */
  }
}

int main(int argc, char* argv[]) {
  if (argc &lt; 2) die("Usage: turing &lt;program file&gt;");
  if (argc &gt; 2 &amp;&amp; 0 == [strcmp][22](argv[2], "off")) displayFlag = 0;
 
  read_program(argv[1]);
  run_simulation();
  report();
  return 0;
}
```

The code is straightforward and there are about 130 lines of it. Here's a summary of the control flow:

  * The Turing program reads from an input file (given as a command-line argument), that contains quintuples (one per line), as in the BBG-N examples.
  * The simulator then loops until one of these conditions occurs:
    * If the input program reaches a halt state, the simulator exits normally after reporting on the program's instructions, the number of **1**s produced, and the number of steps required to do so.
    * If the computation tries to move either left from the leftmost cell or right from the rightmost cell, the simulator exits with an error message. The tape is not big enough for the computation.
    * If the computation hits **MaxSteps** (currently set at a million), the simulator terminates on suspicion of "infinite touring."



The simulator expects, as a command-line argument, the name of a file that contains a BBG-N or other program. With **%** as the command-line prompt, this command runs the simulator on the **bb4.prog** file introduced earlier:


```
`% ./turing bb4.prog`
```

By default, the simulator displays the tape and pauses after each instruction executes. However, the displays can be turned off from the command line:


```
`% ./turing bb5.prog off  `
```

This produces a report on the BBG-5 best contender, which takes more than 47 million steps before halting:


```
10 instructions:
a0b1R
a1c1L
b0c1R
b1b1R
c0d1R
c1e0L
d0a1L
d1d1L
e0h1R
e1a0L
Total 1s on tape:          4098
Instructions executed: 47176870
```

A program file should terminate each line, including the last one, with a newline; otherwise, the simulator may fail to read the line. The simulator ignores comments (which start with a **#**) and empty lines. Here, for review, is the **bb4.prog** input file:


```
# bb4 winner
a0b1R
a1b1L
b0a1L
b1c0L
c0h1R # (halt state)
c1d1L
d0d1R
d1a0R
```

At the top of the Turing source file are various macros (in C, **#define** directives) that specify sizes. These are of particular interest:


```
#define MaxQuintuples  128 /* expand as needed */
#define MaxTape         33 /* expand as needed */
#define MaxSteps   1000000 /* assume 'infinite touring' thereafter */
```

The specified sizes can be increased as needed, but even the best BBG-5 contender has only 10 instructions. The tape for a contender such as BBG-5 must be very big, and this contender requires more than 47 million steps to complete the computation. These settings would suffice:


```
#define MaxTape     100000000 /* 100M */
#define MaxSteps    100000000 /* 100M */
```

BBG-5 and other best contenders should be run with the **off** flag because the simulator, at present, displays the **MaxTape** cells on a single line.

### Wrapping up

BBGs should appeal to recreational problem solvers and especially programmers. To program a BBG is to work in the machine language of the abstract computer—the Turing machine—that defines what _computable_ means. One way to get started is by composing the BBG-2 and the BBG-3 winners from scratch. These exercises help to reveal the programming patterns used in the truly daunting challenges such as the BBG-4 winner and the BBG-5 best contender.

Another starting exercise is to write a program that first initializes a tape to two numeric values (in unary) separated by a **0**:


```
   +-+-+-+-+-+-+-+-+
...|0|1|1|0|1|1|1|0|...  ## two and three in unary
   +-+-+-+-+-+-+-+-+
          ^
```

The program then computes, for example, the product in unary. Other arithmetic examples abound.

BBGs also are of ongoing interest to theoreticians in logic, mathematics, and computer science. For a brief history and overview of them, see [_How the slowest computer programs illuminate math's fundamental limits_][23].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/busy-beaver-game-c

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_2.png?itok=JPlR5aCA (Woman sitting in front of her computer)
[2]: https://en.wikipedia.org/wiki/Dark_Souls
[3]: https://opensource.com/article/21/4/game-life-simulation-webassembly
[4]: https://en.wikipedia.org/wiki/OPS5
[5]: https://www.ams.org/journals/mcom/1983-40-162/S0025-5718-1983-0689479-6/S0025-5718-1983-0689479-6.pdf
[6]: https://condor.depaul.edu/mkalin
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/putchar.html
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/getchar.html
[11]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[12]: http://www.opengroup.org/onlinepubs/009695399/functions/strncmp.html
[13]: http://www.opengroup.org/onlinepubs/009695399/functions/fopen.html
[14]: http://www.opengroup.org/onlinepubs/009695399/functions/sprintf.html
[15]: http://www.opengroup.org/onlinepubs/009695399/functions/fgets.html
[16]: http://www.opengroup.org/onlinepubs/009695399/functions/strlen.html
[17]: http://www.opengroup.org/onlinepubs/009695399/functions/strncpy.html
[18]: http://www.opengroup.org/onlinepubs/009695399/functions/fclose.html
[19]: http://www.opengroup.org/onlinepubs/009695399/functions/qsort.html
[20]: http://www.opengroup.org/onlinepubs/009695399/functions/memset.html
[21]: http://www.opengroup.org/onlinepubs/009695399/functions/bsearch.html
[22]: http://www.opengroup.org/onlinepubs/009695399/functions/strcmp.html
[23]: https://www.quantamagazine.org/the-busy-beaver-game-illuminates-the-fundamental-limits-of-math-20201210/
