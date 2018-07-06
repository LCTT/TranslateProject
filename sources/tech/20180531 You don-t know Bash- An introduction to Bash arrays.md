You don't know Bash: An introduction to Bash arrays
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming-code-keyboard-laptop.png?itok=pGfEfu2S)

Although software engineers regularly use the command line for many aspects of development, arrays are likely one of the more obscure features of the command line (although not as obscure as the regex operator `=~`). But obscurity and questionable syntax aside, [Bash][1] arrays can be very powerful.

### Wait, but why?

Writing about Bash is challenging because it's remarkably easy for an article to devolve into a manual that focuses on syntax oddities. Rest assured, however, the intent of this article is to avoid having you RTFM.

#### A real (actually useful) example

To that end, let's consider a real-world scenario and how Bash can help: You are leading a new effort at your company to evaluate and optimize the runtime of your internal data pipeline. As a first step, you want to do a parameter sweep to evaluate how well the pipeline makes use of threads. For the sake of simplicity, we'll treat the pipeline as a compiled C++ black box where the only parameter we can tweak is the number of threads reserved for data processing: `./pipeline --threads 4`.

### The basics

`--threads` parameter that we want to test:
```
allThreads=(1 2 4 8 16 32 64 128)

```

The first thing we'll do is define an array containing the values of theparameter that we want to test:

In this example, all the elements are numbers, but it need not be the case—arrays in Bash can contain both numbers and strings, e.g., `myArray=(1 2 "three" 4 "five")` is a valid expression. And just as with any other Bash variable, make sure to leave no spaces around the equal sign. Otherwise, Bash will treat the variable name as a program to execute, and the `=` as its first parameter!

Now that we've initialized the array, let's retrieve a few of its elements. You'll notice that simply doing `echo $allThreads` will output only the first element.

To understand why that is, let's take a step back and revisit how we usually output variables in Bash. Consider the following scenario:
```
type="article"

echo "Found 42 $type"

```

Say the variable `$type` is given to us as a singular noun and we want to add an `s` at the end of our sentence. We can't simply add an `s` to `$type` since that would turn it into a different variable, `$types`. And although we could utilize code contortions such as `echo "Found 42 "$type"s"`, the best way to solve this problem is to use curly braces: `echo "Found 42 ${type}s"`, which allows us to tell Bash where the name of a variable starts and ends (interestingly, this is the same syntax used in JavaScript/ES6 to inject variables and expressions in [template literals][2]).

So as it turns out, although Bash variables don't generally require curly brackets, they are required for arrays. In turn, this allows us to specify the index to access, e.g., `echo ${allThreads[1]}` returns the second element of the array. Not including brackets, e.g.,`echo $allThreads[1]`, leads Bash to treat `[1]` as a string and output it as such.

Yes, Bash arrays have odd syntax, but at least they are zero-indexed, unlike some other languages (I'm looking at you, `R`).

### Looping through arrays

Although in the examples above we used integer indices in our arrays, let's consider two occasions when that won't be the case: First, if we wanted the `$i`-th element of the array, where `$i` is a variable containing the index of interest, we can retrieve that element using: `echo ${allThreads[$i]}`. Second, to output all the elements of an array, we replace the numeric index with the `@` symbol (you can think of `@` as standing for `all`): `echo ${allThreads[@]}`.

#### Looping through array elements

With that in mind, let's loop through `$allThreads` and launch the pipeline for each value of `--threads`:
```
for t in ${allThreads[@]}; do

  ./pipeline --threads $t

done

```

#### Looping through array indices

Next, let's consider a slightly different approach. Rather than looping over array elements, we can loop over array indices:
```
for i in ${!allThreads[@]}; do

  ./pipeline --threads ${allThreads[$i]}

done

```

Let's break that down: As we saw above, `${allThreads[@]}` represents all the elements in our array. Adding an exclamation mark to make it `${!allThreads[@]}` will return the list of all array indices (in our case 0 to 7). In other words, the `for` loop is looping through all indices `$i` and reading the `$i`-th element from `$allThreads` to set the value of the `--threads` parameter.

This is much harsher on the eyes, so you may be wondering why I bother introducing it in the first place. That's because there are times where you need to know both the index and the value within a loop, e.g., if you want to ignore the first element of an array, using indices saves you from creating an additional variable that you then increment inside the loop.

### Populating arrays

So far, we've been able to launch the pipeline for each `--threads` of interest. Now, let's assume the output to our pipeline is the runtime in seconds. We would like to capture that output at each iteration and save it in another array so we can do various manipulations with it at the end.

#### Some useful syntax

But before diving into the code, we need to introduce some more syntax. First, we need to be able to retrieve the output of a Bash command. To do so, use the following syntax: `output=$( ./my_script.sh )`, which will store the output of our commands into the variable `$output`.

The second bit of syntax we need is how to append the value we just retrieved to an array. The syntax to do that will look familiar:
```
myArray+=( "newElement1" "newElement2" )

```

#### The parameter sweep

Putting everything together, here is our script for launching our parameter sweep:
```
allThreads=(1 2 4 8 16 32 64 128)

allRuntimes=()

for t in ${allThreads[@]}; do

  runtime=$(./pipeline --threads $t)

  allRuntimes+=( $runtime )

done

```

And voilà!

### What else you got?

In this article, we covered the scenario of using arrays for parameter sweeps. But I promise there are more reasons to use Bash arrays—here are two more examples.

#### Log alerting

In this scenario, your app is divided into modules, each with its own log file. We can write a cron job script to email the right person when there are signs of trouble in certain modules:``
```
# List of logs and who should be notified of issues

logPaths=("api.log" "auth.log" "jenkins.log" "data.log")

logEmails=("jay@email" "emma@email" "jon@email" "sophia@email")



# Look for signs of trouble in each log

for i in ${!logPaths[@]};

do

  log=${logPaths[$i]}

  stakeholder=${logEmails[$i]}

  numErrors=$( tail -n 100 "$log" | grep "ERROR" | wc -l )



  # Warn stakeholders if recently saw > 5 errors

  if [[ "$numErrors" -gt 5 ]];

  then

    emailRecipient="$stakeholder"

    emailSubject="WARNING: ${log} showing unusual levels of errors"

    emailBody="${numErrors} errors found in log ${log}"

    echo "$emailBody" | mailx -s "$emailSubject" "$emailRecipient"

  fi

done

```

#### API queries

Say you want to generate some analytics about which users comment the most on your Medium posts. Since we don't have direct database access, SQL is out of the question, but we can use APIs!

To avoid getting into a long discussion about API authentication and tokens, we'll instead use [JSONPlaceholder][3], a public-facing API testing service, as our endpoint. Once we query each post and retrieve the emails of everyone who commented, we can append those emails to our results array:
```
endpoint="https://jsonplaceholder.typicode.com/comments"

allEmails=()



# Query first 10 posts

for postId in {1..10};

do

  # Make API call to fetch emails of this posts's commenters

  response=$(curl "${endpoint}?postId=${postId}")



  # Use jq to parse the JSON response into an array

  allEmails+=( $( jq '.[].email' <<< "$response" ) )

done

```

Note here that I'm using the [`jq` tool][4] to parse JSON from the command line. The syntax of `jq` is beyond the scope of this article, but I highly recommend you look into it.

As you might imagine, there are countless other scenarios in which using Bash arrays can help, and I hope the examples outlined in this article have given you some food for thought. If you have other examples to share from your own work, please leave a comment below.

### But wait, there's more!

Since we covered quite a bit of array syntax in this article, here's a summary of what we covered, along with some more advanced tricks we did not cover:

Syntax Result `arr=()` Create an empty array `arr=(1 2 3)` Initialize array `${arr[2]}` Retrieve third element `${arr[@]}` Retrieve all elements `${!arr[@]}` Retrieve array indices `${#arr[@]}` Calculate array size `arr[0]=3` Overwrite 1st element `arr+=(4)` Append value(s) `str=$(ls)` Save `ls` output as a string `arr=( $(ls) )` Save `ls` output as an array of files `${arr[@]:s:n}` Retrieve elements at indices `n` to `s+n`

### One last thought

As we've discovered, Bash arrays sure have strange syntax, but I hope this article convinced you that they are extremely powerful. Once you get the hang of the syntax, you'll find yourself using Bash arrays quite often.

#### Bash or Python?

Which begs the question: When should you use Bash arrays instead of other scripting languages such as Python?

To me, it all boils down to dependencies—if you can solve the problem at hand using only calls to command-line tools, you might as well use Bash. But for times when your script is part of a larger Python project, you might as well use Python.

For example, we could have turned to Python to implement the parameter sweep, but we would have ended up just writing a wrapper around Bash:
```
import subprocess



all_threads = [1, 2, 4, 8, 16, 32, 64, 128]

all_runtimes = []



# Launch pipeline on each number of threads

for t in all_threads:

  cmd = './pipeline --threads {}'.format(t)



  # Use the subprocess module to fetch the return output

  p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)

  output = p.communicate()[0]

  all_runtimes.append(output)

```

Since there's no getting around the command line in this example, using Bash directly is preferable.

#### Time for a shameless plug

If you enjoyed this article, there's more where that came from! [Register here to attend OSCON][5], where I'll be presenting the live-coding workshop [You Don't Know Bash][6] on July 17, 2018. No slides, no clickers—just you and me typing away at the command line, exploring the wondrous world of Bash.

This article originally appeared on [Medium][7] and is republished with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays

作者：[Robert Aboukhalil][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/robertaboukhalil
[1]:https://opensource.com/article/17/7/bash-prompt-tips-and-tricks
[2]:https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals
[3]:https://github.com/typicode/jsonplaceholder
[4]:https://stedolan.github.io/jq/
[5]:https://conferences.oreilly.com/oscon/oscon-or
[6]:https://conferences.oreilly.com/oscon/oscon-or/public/schedule/detail/67166
[7]:https://medium.com/@robaboukhalil/the-weird-wondrous-world-of-bash-arrays-a86e5adf2c69
