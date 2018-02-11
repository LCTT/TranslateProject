Shell Scripting: Dungeons, Dragons and Dice
======
In my [last article][1], I talked about a really simple shell script for a game called Bunco, which is a dice game played in rounds where you roll three dice and compare your values to the round number. Match all three and match the round number, and you just got a bunco for 25 points. Otherwise, any die that match the round are worth one point each. It's simple—a game designed for people who are getting tipsy at the local pub, and it also is easy to program.

The core function in the Bunco program was one that produced a random number between 1–6 to simulate rolling a six-sided die. It looked like this:

```

rolldie()
{
   local result=$1
   rolled=$(( ( $RANDOM % 6 ) + 1 ))
   eval $result=$rolled
}

```

It's invoked with a variable name as the single argument, and it will load a random number between 1–6 into that value—for example:

```

rolldie die1

```

will assign a value 1..6 to $die1\. Make sense?

If you can do that, however, what's to stop you from having a second argument that specifies the number of sides of the die you want to "roll" with the function? Something like this:

```

rolldie()
{
   local result=$1 sides=$2
   rolled=$(( ( $RANDOM % $sides ) + 1 ))
   eval $result=$rolled
}

```

To test it, let's just write a tiny wrapper that simply asks for a 20-sided die (d20) result:

```

rolldie die 20
echo resultant roll is $die

```

Easy enough. To make it a bit more useful, let's allow users to specify a sequence of dice rolls, using the standard D&D notation of nDm—that is, n m-sided dice. Bunco would have been done with 3d6, for example (three six-sided die). Got it?

Since you might well have starting flags too, let's build that into the parsing loop using the ever handy getopt:

```

while getopts "h" arg
do
  case "$arg" in
    * ) echo "dnd-dice NdM {NdM}"
        echo "NdM = N M-sided dice"; exit 0 ;;
  esac
done
shift $(( $OPTIND - 1 ))
for request in $* ; do
  echo "Rolling: $request"
done

```

With a well formed notation like 3d6, it's easy to break up the argument into its component parts, like so:

```

dice=$(echo $request | cut -dd -f1)
sides=$(echo $request | cut -dd -f2)
echo "Rolling $dice $sides-sided dice"

```

To test it, let's give it some arguments and see what the program outputs:

```

$ dnd-dice 3d6 1d20 2d100 4d3 d5
Rolling 3 6-sided dice
Rolling 1 20-sided dice
Rolling 2 100-sided dice
Rolling 4 3-sided dice
Rolling  5-sided dice

```

Ah, the last one points out a mistake in the script. If there's no number of dice specified, the default should be 1\. You theoretically could default to a six-sided die too, but that's not anywhere near so safe an assumption.

With that, you're close to a functional program because all you need is a loop to process more than one die in a request. It's easily done with a while loop, but let's add some additional smarts to the script:

```

for request in $* ; do
  dice=$(echo $request | cut -dd -f1)
  sides=$(echo $request | cut -dd -f2)
  echo "Rolling $dice $sides-sided dice"
  sum=0  # reset
  while [ ${dice:=1} -gt 0 ] ; do
    rolldie die $sides
    echo "     dice roll = $die"
    sum=$(( $sum + $die ))
    dice=$(( $dice - 1 ))
  done
  echo "  sum total = $sum"
done

```

This is pretty solid actually, and although the output statements need to be cleaned up a bit, the code's basically fully functional:

```

$ dnd-dice 3d6 1d20 2d100 4d3 d5
Rolling 3 6-sided dice
     dice roll = 5
     dice roll = 6
     dice roll = 5
  sum total = 16
Rolling 1 20-sided dice
     dice roll = 16
  sum total = 16
Rolling 2 100-sided dice
     dice roll = 76
     dice roll = 84
  sum total = 160
Rolling 4 3-sided dice
     dice roll = 2
     dice roll = 2
     dice roll = 1
     dice roll = 3
  sum total = 8
Rolling  5-sided dice
     dice roll = 2
  sum total = 2

```

Did you catch that I fixed the case when $dice has no value? It's tucked into the reference in the while statement. Instead of referring to it as $dice, I'm using the notation ${dice:=1}, which uses the value specified unless it's null or no value, in which case the value 1 is assigned and used. It's a handy and a perfect fix in this case.

In a game, you generally don't care much about individual die values; you just want to sum everything up and see what the total value is. So if you're rolling 4d20, for example, it's just a single value you calculate and share with the game master or dungeon master.

A bit of output statement cleanup and you can do that:

```

$ dnd-dice.sh 3d6 1d20 2d100 4d3 d5
3d6 = 16
1d20 = 13
2d100 = 74
4d3 = 8
d5 = 2

```

Let's run it a second time just to ensure you're getting different values too:

```

3d6 = 11
1d20 = 10
2d100 = 162
4d3 = 6
d5 = 3

```

There are definitely different values, and it's a pretty useful script, all in all.

You could create a number of variations with this as a basis, including what some gamers enjoy called "exploding dice". The idea is simple: if you roll the best possible value, you get to roll again and add the second value too. Roll a d20 and get a 20? You can roll again, and your result is then 20 + whatever the second value is. Where this gets crazy is that you can do this for multiple cycles, so a d20 could become 30, 40 or even 50.

And, that's it for this article. There isn't much else you can do with dice at this point. In my next article, I'll look at...well, you'll have to wait and see! Don't forget, if there's a topic you'd like me to tackle, please send me a note!


--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/shell-scripting-dungeons-dragons-and-dice

作者：[Dave Taylor][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/dave-taylor
[1]:http://www.linuxjournal.com/content/shell-scripting-bunco-game
