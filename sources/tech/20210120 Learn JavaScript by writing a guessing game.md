[#]: collector: (lujun9972)
[#]: translator: (amwps290)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learn JavaScript by writing a guessing game)
[#]: via: (https://opensource.com/article/21/1/learn-javascript)
[#]: author: (Mandy Kendall https://opensource.com/users/mkendall)

Learn JavaScript by writing a guessing game
======
Take the first steps toward creating interactive, dynamic web content by
practicing some basic JavaScript concepts with a simple game.
![Javascript code close-up with neon graphic overlay][1]

It's pretty safe to say that most of the modern web would not exist without [JavaScript][2]. It's one of the three standard web technologies (along with HTML and CSS) and allows anyone to create much of the interactive, dynamic content we have come to expect in our experiences with the World Wide Web. From frameworks like [React][3] to data visualization libraries like [D3][4], it's hard to imagine the web without it.

There's a lot to learn, and a great way to begin learning this popular language is by writing a simple application to become familiar with some concepts. Recently, some Opensource.com correspondents have written about how to learn their favorite language by writing a simple guessing game, so that's a great place to start!

### Getting started

JavaScript comes in many flavors, but I'll start with the basic version, commonly called "Vanilla JavaScript." JavaScript is primarily a client-side scripting language, so it can run in any standard browser without installing anything. All you need is a code editor ([Brackets][5] is a great one to try) and the web browser of your choice.

### HTML user interface

JavaScript runs in a web browser and interacts with the other standard web technologies, HTML and CSS. To create this game, you'll first use HTML (Hypertext Markup Language) to create a simple interface for your players to use. In case you aren't familiar, HTML is a markup language used to provide structure to content on the web.

To start, create an HTML file for your code. The file should have the `.html` extension to let the browser know that it is an HTML document. You can call your file `guessingGame.html`.

Use a few basic HTML tags in this file to display the game's title, instructions for how to play, interactive elements for the player to use to enter and submit their guesses, and a placeholder for providing feedback to the player:


```
&lt;!DOCTYPE&gt;
  &lt;[html][6]&gt;
    &lt;[head][7]&gt;
      &lt;[meta][8] charset="UTF-8" /&gt;
      &lt;[title][9]&gt; JavaScript Guessing Game &lt;/[title][9]&gt;
    &lt;/[head][7]&gt;
    &lt;[body][10]&gt;
      &lt;[h1][11]&gt;Guess the Number!&lt;/[h1][11]&gt;
      &lt;[p][12]&gt;I am thinking of a number between 1 and 100. Can you guess what it is?&lt;/[p][12]&gt;
   
      &lt;[label][13] for="guess"&gt;My Guess&lt;/[label][13]&gt;
      &lt;[input][14] type="number" id="guess"&gt;
      &lt;[input][14] type="submit" id="submitGuess" value="Check My Guess"&gt;
   
      &lt;[p][12] id="feedback"&gt;&lt;/[p][12]&gt;
    &lt;/[body][10]&gt;
  &lt;/[html][6]&gt;
```

The `<h1>` and `<p>` elements let the browser know what type of text to display on the page. The set of `<h1>` tags signifies that the text between those two tags (`Guess the Number!`) is a heading. The set of `<p>` tags that follow signify that the short block of text with the instructions is a paragraph. The empty set of `<p>` tags at the end of this code block serve as a placeholder for the feedback the game will give the player based on their guess.

### The &lt;script&gt; tag

There are many ways to include JavaScript in a web page, but for a short script like this one, you can use a set of `<script>` tags and write the JavaScript directly in the HTML file. Those `<script>` tags should go right before the closing `</body>` tag near the end of the HTML file.

Now, you can start to write your JavaScript between these two script tags. The final file looks like this:


```
&lt;!DOCTYPE&gt;
&lt;[html][6]&gt;

&lt;[head][7]&gt;
  &lt;[meta][8] charset="UTF-8" /&gt;
  &lt;[title][9]&gt; JavaScript Guessing Game &lt;/[title][9]&gt;
&lt;/[head][7]&gt;

&lt;[body][10]&gt;
  &lt;[h1][11]&gt;Guess the Number!&lt;/[h1][11]&gt;
  &lt;[p][12]&gt;I am thinking of a number between 1 and 100. Can you guess what it is?&lt;/[p][12]&gt;

  &lt;[form][15]&gt;
    &lt;[label][13] for="guess"&gt;My Guess&lt;/[label][13]&gt;
    &lt;[input][14] type="number" id="guess"&gt;
    &lt;[input][14] type="submit" id="submitGuess" value="Check My Guess"&gt;
  &lt;/[form][15]&gt;

  &lt;[p][12] id="feedback"&gt;&lt;/[p][12]&gt;

  &lt;[script][16]&gt;
    const randomNumber = Math.floor(Math.random() * 100) + 1
    console.log('Random Number', randomNumber)

    function checkGuess() {
      let myGuess = guess.value
      if (myGuess === randomNumber) {
        feedback.textContent = "You got it right!"
      } else if (myGuess &gt; randomNumber) {
        feedback.textContent = "Your guess was " + myGuess + ". That's too high. Try Again!"
      } else if (myGuess &lt; randomNumber) {
       feedback.textContent = "Your guess was " + myGuess + ". That's too low. Try Again!"
     }
   }
   submitGuess.addEventListener('click', checkGuess)
 &lt;/[script][16]&gt;

&lt;/[body][10]&gt;

&lt;/[html][6]&gt;
```

To run this in the browser, either double-click on the file or go to the menu in your favorite web browser and choose **File &gt; Open File**. (If you are using Brackets, you can also use the lightning-bolt symbol in the corner to open the file in the browser).

### Pseudo-random number generation

The first step in the guessing game is to generate a number for the player to guess. JavaScript includes several built-in global objects that help you write code. To generate your random number, use the Math object.

[Math][17] has properties and functions for working with mathematical concepts in JavaScript. You will use two Math functions to generate the random number for your player to guess.

Start with [Math.random()][18], which generates a pseudo-random number between 0 and 1. (Math.random is inclusive of 0 but exclusive of 1. This means that the function could generate a zero, but it will never generate a 1.)

For this game, set the random number between 1 and 100 to narrow down the player's options. Take the decimal you just generated and multiply it by 100 to produce a decimal between 0 and…not quite 100. But you'll take care of that in a few more steps.

Right now, your number is still a decimal, and you want it to be a whole number. For that, you can use another function that is part of the Math object, [Math.floor()][19]. Math.floor()'s purpose is to return the largest integer that is less than or equal to the number you give it as an argument—which means it rounds down to the nearest whole number:


```
`Math.floor(Math.random() * 100)`
```

That leaves you with a whole number between 0 and 99, which isn't quite the range you want. You can fix that with your last step, which is to add 1 to the result. Voila! Now you have a (somewhat) randomly generated number between 1 and 100:


```
`Math.floor(Math.random() * 100) + 1`
```

### Variables

Now you need to store the randomly generated number so that you can compare it to your player's guesses. To do that, you can assign it to a **variable**.

JavaScript has different types of variables you can choose, depending on how you want to use the variable. For this game, use const and let.

  * **let** is used for variables if their value can change throughout the code.
  * **const** is used for variables if their value should not be changed.



There's a little more to const and let, but this is all you need to know for now.

The random number is generated only once in the game, so you will use a const variable to hold the value. You want to give the variable a name that makes it clear what value is being stored, so name it `randomNumber`:


```
`const randomNumber`
```

_A note on naming: Variables and function names in JavaScript are written in camel case. If there is just one word, it is written in all lower case. If there is more than one word, the first word is all lower case, and any additional words start with a capital letter with no spaces between the words._

### Logging to the console

Normally, you don't want to show anyone the random number, but developers may want to know the number that was generated to use it to help debug the code. With JavaScript, you can use another built-in function, [console.log()][20], to output the number to the console in your browser.

Most browsers include Developer Tools that you can open by pressing the **F12** key on your keyboard. From there, you should see a tab labeled **Console**. Any information logged to the console will appear here. Since the code you have written so far will run as soon as the browser loads, if you look at the console, you should see the random number that you just generated! Hooray!

![Javascript game with console][21]

### Functions

Next, you need a way to get the player's guess from the number input field, compare it to the random number you just generated, and give the player feedback to let them know if they guessed correctly. To do that, write a function. A **function** is code that is grouped to perform a task. Functions are reusable, which means if you need to run the same code multiple times, you can call the function instead of rewriting all of the steps needed to perform the task.

Depending on the JavaScript version you are using, there are many different ways to write, or declare, a function. Since this is an introduction to the language, declare your function using the basic function syntax.

Start with the keyword `function` and then give the function a name. It's good practice to use a name that is an action that describes what the function does. In this case, you are checking the player's guess, so an appropriate name for this function would be `checkGuess`. After the function name, write a set of parentheses and then a set of curly braces. You will write the body of the function between these curly braces:


```
`function checkGuess() {}`
```

### Access the DOM

One of the purposes of JavaScript is to interact with HTML on a webpage. It does this through the Document Object Model (DOM), which is an object JavaScript uses to access and change the information on a web page. Right now, you need to get the player's guess from the number input field you set up in the HTML. You can do that using the `id` attribute you assigned to the HTML elements, which in this case is `guess`:


```
`<input type="number" id="guess">`
```

JavaScript can get the number the player enters into the number input field by accessing its value. You can do this by referring to the element's id and adding `.value` to the end. This time, use a `let` variable to hold the value of the user's guess:


```
`let myGuess = guess.value`
```

Whatever number the player enters into the number input field will be assigned to the `myGuess` variable in the `checkGuess` function.

### Conditional statements

The next step is to compare the player's guess with the random number the game generates. You also want to give the player feedback to let them know if their guess was too high, too low, or correct.

You can decide what feedback the player will receive by using a series of conditional statements. A **conditional statement** checks to see if a condition is met before running a code block. If the condition is not met, the code stops, moves on to check the next condition, or continues with the rest of the code without running the code in the conditional block:


```
if (myGuess === randomNumber){
  feedback.textContent = "You got it right!"
}
else if(myGuess &gt; randomNumber) {
  feedback.textContent = "Your guess was " + myGuess + ". That's too high. Try Again!"
}
else if(myGuess &lt; randomNumber) {
  feedback.textContent = "Your guess was " + myGuess + ". That's too low. Try Again!"
}
```

The first conditional block compares the player's guess to the random number the game generates using a comparison operator `===`. The comparison operator checks the value on the right, compares it to the value on the left, and returns the boolean `true` if they match and `false` if they don't.

If the number matches (yay!), make sure the player knows. To do this, manipulate the DOM by adding text to the `<p>` tag that has the id attribute "feedback." This works just like `guess.value` above, except instead of getting information from the DOM, it changes the information in it. `<p>` elements don't have a value like `<input>` elements—they have text instead, so use `.textContent` to access the element and set the text you want to display:


```
`feedback.textContent = "You got it right!"`
```

Of course, there is a good chance that the player didn't guess right on the first try, so if `myGuess` and `randomNumber` don't match, give the player a clue to help them narrow down their guesses. If the first conditional fails, the code will skip the code block in that `if` statement and check to see if the next condition is true. That brings you to your `else if` blocks:


```
else if(myGuess &gt; randomNumber) {
  feedback.textContent = "Your guess was " + myGuess + ". That's too high. Try Again!"
}
```

If you were to read this as a sentence, it might be something like this: "If the player's guess is equal to the random number, let them know they got it right. Otherwise (else), check if the player's guess is greater than `randomNumber`, and if it is, display the player's guess and tell them it was too high."

The last possibility is that the player's guess was lower than the random number. To check that, add one more `else if` block:


```
else if(myGuess &lt; randomNumber) {
  feedback.textContent = "Your guess was " + myGuess + ". That's too low. Try Again!"
}
```

### User events and event listeners

If you look at your script, you'll see that some of the code runs automatically when the page loads, but some of it does not. You want to generate the random number before the game is played, but you don't want to check the player's guess until they have entered it into the number input field and are ready to check it.

The code to generate the random number and log it to the console is outside of a function, so it will run automatically when the browser loads your script. However, for the code inside your function to run, you have to call it.

There are several ways to call a function. Here, you want the function to run when the player clicks on the "Check My Guess" button. Clicking a button creates a user event, which the JavaScript code can then "listen" for so that it knows when it needs to run a function.

The last line of code adds an event listener to the button to "listen" for when the button is clicked. When it "hears" that event, it will run the function assigned to the event listener:


```
`submitGuess.addEventListener('click', checkGuess)`
```

Just like the other instances where you access DOM elements, you can use the button's id to tell JavaScript which element to interact with. Then you can use the built-in `addEventListener` function to tell JavaScript what event to listen for.

You have already seen a function that takes parameters, but take a moment to look at how this works. Parameters are information that a function needs to perform its task. Not all functions need parameters, but the `addEventListener` function needs two. The first parameter it takes is the name of the user event for which it will listen. The user can interact with the DOM in many ways, like typing, moving the mouse, tabbing with the keyboard, or copying and pasting text. In this case, the user event you are listening for is a button click, so the first parameter will be `click`.

The second piece of information `addEventListener` needs is the name of the function to run when the user clicks the button. In this case, it's the `checkGuess` function.

Now, when the player presses the "Check My Guess" button, the `checkGuess` function will get the value they entered in the number input field, compare it to the random number, and display feedback in the browser to let the player know how they did. Awesome! Your game is ready to play.

### Learn JavaScript for fun and profit

This bit of Vanilla JavaScript is just a small taste of what this vast ecosystem has to offer. It's a language well worth investing time into learning, and I encourage you to continue to dig in and learn more.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/learn-javascript

作者：[Mandy Kendall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkendall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_javascript.jpg?itok=60evKmGl (Javascript code close-up with neon graphic overlay)
[2]: https://opensource.com/tags/javascript
[3]: https://opensource.com/article/20/11/reactjs-tutorial
[4]: https://opensource.com/article/18/9/open-source-javascript-chart-libraries
[5]: https://opensource.com/article/20/12/brackets
[6]: http://december.com/html/4/element/html.html
[7]: http://december.com/html/4/element/head.html
[8]: http://december.com/html/4/element/meta.html
[9]: http://december.com/html/4/element/title.html
[10]: http://december.com/html/4/element/body.html
[11]: http://december.com/html/4/element/h1.html
[12]: http://december.com/html/4/element/p.html
[13]: http://december.com/html/4/element/label.html
[14]: http://december.com/html/4/element/input.html
[15]: http://december.com/html/4/element/form.html
[16]: http://december.com/html/4/element/script.html
[17]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math
[18]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
[19]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor
[20]: https://developer.mozilla.org/en-US/docs/Web/API/Console/log
[21]: https://opensource.com/sites/default/files/javascript-game-with-console.png (Javascript game with console)
