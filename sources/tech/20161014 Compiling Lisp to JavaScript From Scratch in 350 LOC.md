BriFuture is translating this article

# Compiling Lisp to JavaScript From Scratch in 350 

In this article we will look at a from-scratch implementation of a compiler from a simple LISP-like calculator language to JavaScript. The complete source code can be found [here][7].

We will:

1.  Define our language and write a simple program in it

2.  Implement a simple parser combinator library

3.  Implement a parser for our language

4.  Implement a pretty printer for our language

5.  Define a subset of JavaScript for our usage

6.  Implement a code translator to the JavaScript subset we defined

7.  Glue it all together

Let's start!

### 1\. Defining the language

The main attraction of lisps is that their syntax already represent a tree, this is why they are so easy to parse. We'll see that soon. But first let's define our language. Here's a BNF description of our language's syntax:

```
program ::= expr
expr ::= <integer> | <name> | ([<expr>])
```

Basically, our language let's us define one expression at the top level which it will evaluate. An expression is composed of either an integer, for example `5`, a variable, for example `x`, or a list of expressions, for example `(add x 1)`.

An integer evaluate to itself, a variable evaluates to what it's bound in the current environment, and a list evaluates to a function call where the first argument is the function and the rest are the arguments to the function.

We have some built-in special forms in our language so we can do more interesting stuff:

*   let expression let's us introduce new variables in the environment of the body of the let. The syntax is:

```
let ::= (let ([<letarg>]) <body>)
letargs ::= (<name> <expr>)
body ::= <expr>
```

*   lambda expression: evaluates to an anonymous function definition. The syntax is:

```
lambda ::= (lambda ([<name>]) <body>)
```

We also have a few built in functions: `add`, `mul`, `sub`, `div` and `print`.

Let's see a quick example of a program written in our language:

```
(let
  ((compose
    (lambda (f g)
      (lambda (x) (f (g x)))))
  (square
    (lambda (x) (mul x x)))
  (add1
    (lambda (x) (add x 1))))
  (print ((compose square add1) 5)))
```

This program defines 3 functions: `compose`, `square` and `add1`. And then prints the result of the computation:`((compose square add1) 5)`

I hope this is enough information about the language. Let's start implementing it!

We can define the language in Haskell like this:

```
type Name = String

data Expr
  = ATOM Atom
  | LIST [Expr]
    deriving (Eq, Read, Show)

data Atom
  = Int Int
  | Symbol Name
    deriving (Eq, Read, Show)
```

We can parse programs in the language we defined to an `Expr`. Also, we are giving the new data types `Eq`, `Read`and `Show` instances to aid in testing and debugging. You'll be able to use those in the REPL for example to verify all this actually works.

The reason we did not define `lambda`, `let` and the other built-in functions as part of the syntax is because we can get away with it in this case. These functions are just a more specific case of a `LIST`. So I decided to leave this to a later phase.

Usually, you would like to define these special cases in the abstract syntax - to improve error messages, to unable static analysis and optimizations and such, but we won't do that here so this is enough for us.

Another thing you would like to do usually is add some annotation to the syntax. For example the location: Which file did this `Expr` come from and which row and col in the file. You can use this in later stages to print the location of errors, even if they are not in the parser stage.

*   _Exercise 1_ : Add a `Program` data type to include multiple `Expr` sequentially

*   _Exercise 2_ : Add location annotation to the syntax tree.

### 2\. Implement a simple parser combinator library

First thing we are going to do is define an Embedded Domain Specific Language (or EDSL) which we will use to define our languages' parser. This is often referred to as parser combinator library. The reason we are doing it is strictly for learning purposes, Haskell has great parsing libraries and you should definitely use them when building real software, or even when just experimenting. One such library is [megaparsec][8].

First let's talk about the idea behind our parser library implementation. In it's essence, our parser is a function that takes some input, might consume some or all of the input, and returns the value it managed to parse and the rest of the input it didn't parse yet, or throws an error if it failed. Let's write that down.

```
newtype Parser a
  = Parser (ParseString -> Either ParseError (a, ParseString))

data ParseString
  = ParseString Name (Int, Int) String

data ParseError
  = ParseError ParseString Error

type Error = String

```

Here we defined three main new types.

First, `Parser a`, is the parsing function we described before.

Second, `ParseString` is our input or state we carry along. It has three significant parts:

*   `Name`: This is the name of the source

*   `(Int, Int)`: This is the current location in the source

*   `String`: This is the remaining string left to parse

Third, `ParseError` contains the current state of the parser and an error message.

Now we want our parser to be flexible, so we will define a few instances for common type classes for it. These instances will allow us to combine small parsers to make bigger parsers (hence the name 'parser combinators').

The first one is a `Functor` instance. We want a `Functor` instance because we want to be able to define a parser using another parser simply by applying a function on the parsed value. We will see an example of this when we define the parser for our language.

```
instance Functor Parser where
  fmap f (Parser parser) =
    Parser (\str -> first f <$> parser str)
```

The second instance is an `Applicative` instance. One common use case for this instance instance is to lift a pure function on multiple parsers.

```
instance Applicative Parser where
  pure x = Parser (\str -> Right (x, str))
  (Parser p1) <*> (Parser p2) =
    Parser $
      \str -> do
        (f, rest)  <- p1 str
        (x, rest') <- p2 rest
        pure (f x, rest')

```

(Note:  _We will also implement a Monad instance so we can use do notation here._ )

The third instance is an `Alternative` instance. We want to be able to supply an alternative parser in case one fails.

```
instance Alternative Parser where
  empty = Parser (`throwErr` "Failed consuming input")
  (Parser p1) <|> (Parser p2) =
    Parser $
      \pstr -> case p1 pstr of
        Right result -> Right result
        Left  _      -> p2 pstr
```

The forth instance is a `Monad` instance. So we'll be able to chain parsers.

```
instance Monad Parser where
  (Parser p1) >>= f =
    Parser $
     \str -> case p1 str of
       Left err -> Left err
       Right (rs, rest) ->
         case f rs of
           Parser parser -> parser rest

```

Next, let's define a way to run a parser and a utility function for failure:

```

runParser :: String -> String -> Parser a -> Either ParseError (a, ParseString)
runParser name str (Parser parser) = parser $ ParseString name (0,0) str

throwErr :: ParseString -> String -> Either ParseError a
throwErr ps@(ParseString name (row,col) _) errMsg =
  Left $ ParseError ps $ unlines
    [ "*** " ++ name ++ ": " ++ errMsg
    , "* On row " ++ show row ++ ", column " ++ show col ++ "."
    ]

```

Now we'll start implementing the combinators which are the API and heart of the EDSL.

First, we'll define `oneOf`. `oneOf` will succeed if one of the characters in the list supplied to it is the next character of the input and will fail otherwise.

```
oneOf :: [Char] -> Parser Char
oneOf chars =
  Parser $ \case
    ps@(ParseString name (row, col) str) ->
      case str of
        []     -> throwErr ps "Cannot read character of empty string"
        (c:cs) ->
          if c `elem` chars
          then Right (c, ParseString name (row, col+1) cs)
          else throwErr ps $ unlines ["Unexpected character " ++ [c], "Expecting one of: " ++ show chars]
```

`optional` will stop a parser from throwing an error. It will just return `Nothing` on failure.

```
optional :: Parser a -> Parser (Maybe a)
optional (Parser parser) =
  Parser $
    \pstr -> case parser pstr of
      Left _ -> Right (Nothing, pstr)
      Right (x, rest) -> Right (Just x, rest)
```

`many` will try to run a parser repeatedly until it fails. When it does, it'll return a list of successful parses. `many1`will do the same, but will throw an error if it fails to parse at least once.

```
many :: Parser a -> Parser [a]
many parser = go []
  where go cs = (parser >>= \c -> go (c:cs)) <|> pure (reverse cs)

many1 :: Parser a -> Parser [a]
many1 parser =
  (:) <$> parser <*> many parser

```

These next few parsers use the combinators we defined to make more specific parsers:

```
char :: Char -> Parser Char
char c = oneOf [c]

string :: String -> Parser String
string = traverse char

space :: Parser Char
space = oneOf " \n"

spaces :: Parser String
spaces = many space

spaces1 :: Parser String
spaces1 = many1 space

withSpaces :: Parser a -> Parser a
withSpaces parser =
  spaces *> parser <* spaces

parens :: Parser a -> Parser a
parens parser =
     (withSpaces $ char '(')
  *> withSpaces parser
  <* (spaces *> char ')')

sepBy :: Parser a -> Parser b -> Parser [b]
sepBy sep parser = do
  frst <- optional parser
  rest <- many (sep *> parser)
  pure $ maybe rest (:rest) frst

```

Now we have everything we need to start defining a parser for our language.

*   _Exercise_ : implement an EOF (end of file/input) parser combinator.

### 3\. Implementing a parser for our language

To define our parser, we'll use the top-bottom method.

```
parseExpr :: Parser Expr
parseExpr = fmap ATOM parseAtom <|> fmap LIST parseList

parseList :: Parser [Expr]
parseList = parens $ sepBy spaces1 parseExpr

parseAtom :: Parser Atom
parseAtom = parseSymbol <|> parseInt

parseSymbol :: Parser Atom
parseSymbol = fmap Symbol parseName

```

Notice that these four function are a very high-level description of our language. This demonstrate why Haskell is so nice for parsing. Still, after defining the high-level parts, we still need to define the lower-level `parseName` and `parseInt`.

What characters can we use as names in our language? Let's decide to use lowercase letters, digits and underscores, where the first character must be a letter.

```
parseName :: Parser Name
parseName = do
  c  <- oneOf ['a'..'z']
  cs <- many $ oneOf $ ['a'..'z'] ++ "0123456789" ++ "_"
  pure (c:cs)
```

For integers, we want a sequence of digits optionally preceding by '-':

```
parseInt :: Parser Atom
parseInt = do
  sign <- optional $ char '-'
  num  <- many1 $ oneOf "0123456789"
  let result = read $ maybe num (:num) sign of
  pure $ Int result
```

Lastly, we'll define a function to run a parser and get back an `Expr` or an error message.

```
runExprParser :: Name -> String -> Either String Expr
runExprParser name str =
  case runParser name str (withSpaces parseExpr) of
    Left (ParseError _ errMsg) -> Left errMsg
    Right (result, _) -> Right result
```

*   _Exercise 1_ : Write a parser for the `Program` type you defined in the first section

*   _Exercise 2_ : Rewrite `parseName` in Applicative style

*   _Exercise 3_ : Find a way to handle the overflow case in `parseInt` instead of using `read`.

### 4\. Implement a pretty printer for our language

One more thing we'd like to do is be able to print our programs as source code. This is useful for better error messages.

```
printExpr :: Expr -> String
printExpr = printExpr' False 0

printAtom :: Atom -> String
printAtom = \case
  Symbol s -> s
  Int i -> show i

printExpr' :: Bool -> Int -> Expr -> String
printExpr' doindent level = \case
  ATOM a -> indent (bool 0 level doindent) (printAtom a)
  LIST (e:es) ->
    indent (bool 0 level doindent) $
      concat
        [ "("
        , printExpr' False (level + 1) e
        , bool "\n" "" (null es)
        , intercalate "\n" $ map (printExpr' True (level + 1)) es
        , ")"
        ]

indent :: Int -> String -> String
indent tabs e = concat (replicate tabs "  ") ++ e
```

*   _Exercise_ : Write a pretty printer for the `Program` type you defined in the first section

Okay, we wrote around 200 lines so far of what's typically called the front-end of the compiler. We have around 150 more lines to go and three more tasks: We need to define a subset of JS for our usage, define the translator from our language to that subset, and glue the whole thing together. Let's go!

### 5\. Define a subset of JavaScript for our usage

First, we'll define the subset of JavaScript we are going to use:

```
data JSExpr
  = JSInt Int
  | JSSymbol Name
  | JSBinOp JSBinOp JSExpr JSExpr
  | JSLambda [Name] JSExpr
  | JSFunCall JSExpr [JSExpr]
  | JSReturn JSExpr
    deriving (Eq, Show, Read)

type JSBinOp = String
```

This data type represent a JavaScript expression. We have two atoms - `JSInt` and `JSSymbol` to which we'll translate our languages' `Atom`, We have `JSBinOp` to represent a binary operation such as `+` or `*`, we have `JSLambda`for anonymous functions same as our `lambda expression`, We have `JSFunCall` which we'll use both for calling functions and introducing new names as in `let`, and we have `JSReturn` to return values from functions as that's required in JavaScript.

This `JSExpr` type is an **abstract representation** of a JavaScript expression. We will translate our own `Expr`which is an abstract representation of our languages' expression to `JSExpr` and from there to JavaScript. But in order to do that we need to take this `JSExpr` and produce JavaScript code from it. We'll do that by pattern matching on `JSExpr` recursively and emit JS code as a `String`. This is basically the same thing we did in `printExpr`. We'll also track the scoping of elements so we can indent the generated code in a nice way.

```
printJSOp :: JSBinOp -> String
printJSOp op = op

printJSExpr :: Bool -> Int -> JSExpr -> String
printJSExpr doindent tabs = \case
  JSInt    i     -> show i
  JSSymbol name  -> name
  JSLambda vars expr -> (if doindent then indent tabs else id) $ unlines
    ["function(" ++ intercalate ", " vars ++ ") {"
    ,indent (tabs+1) $ printJSExpr False (tabs+1) expr
    ] ++ indent tabs "}"
  JSBinOp  op e1 e2  -> "(" ++ printJSExpr False tabs e1 ++ " " ++ printJSOp op ++ " " ++ printJSExpr False tabs e2 ++ ")"
  JSFunCall f exprs  -> "(" ++ printJSExpr False tabs f ++ ")(" ++ intercalate ", " (fmap (printJSExpr False tabs) exprs) ++ ")"
  JSReturn expr      -> (if doindent then indent tabs else id) $ "return " ++ printJSExpr False tabs expr ++ ";"
```

*   _Exercise 1_ : Add a `JSProgram` type that will hold multiple `JSExpr` and create a function `printJSExprProgram` to generate code for it.

*   _Exercise 2_ : Add a new type of `JSExpr` - `JSIf`, and generate code for it.

### 6\. Implement a code translator to the JavaScript subset we defined

We are almost there. In this section we'll create a function to translate `Expr` to `JSExpr`.

The basic idea is simple, we'll translate `ATOM` to `JSSymbol` or `JSInt` and `LIST` to either a function call or a special case we'll translate later.

```
type TransError = String

translateToJS :: Expr -> Either TransError JSExpr
translateToJS = \case
  ATOM (Symbol s) -> pure $ JSSymbol s
  ATOM (Int i)    -> pure $ JSInt i
  LIST xs -> translateList xs

translateList :: [Expr] -> Either TransError JSExpr
translateList = \case
  []     -> Left "translating empty list"
  ATOM (Symbol s):xs
    | Just f <- lookup s builtins ->
      f xs
  f:xs ->
    JSFunCall <$> translateToJS f <*> traverse translateToJS xs

```

`builtins` is a list of special cases to translate, like `lambda` and `let`. Every case gets the list of arguments for it, verify that its syntactically valid and translates it to the equivalent `JSExpr`.

```
type Builtin  = [Expr] -> Either TransError JSExpr
type Builtins = [(Name, Builtin)]

builtins :: Builtins
builtins =
  [("lambda", transLambda)
  ,("let", transLet)
  ,("add", transBinOp "add" "+")
  ,("mul", transBinOp "mul" "*")
  ,("sub", transBinOp "sub" "-")
  ,("div", transBinOp "div" "/")
  ,("print", transPrint)
  ]

```

In our case, we treat built-in special forms as special and not first class, so will not be able to use them as first class functions and such.

We'll translate a Lambda to an anonymous function:

```
transLambda :: [Expr] -> Either TransError JSExpr
transLambda = \case
  [LIST vars, body] -> do
    vars' <- traverse fromSymbol vars
    JSLambda vars' <$> (JSReturn <$> translateToJS body)

  vars ->
    Left $ unlines
      ["Syntax error: unexpected arguments for lambda."
      ,"expecting 2 arguments, the first is the list of vars and the second is the body of the lambda."
      ,"In expression: " ++ show (LIST $ ATOM (Symbol "lambda") : vars)
      ]

fromSymbol :: Expr -> Either String Name
fromSymbol (ATOM (Symbol s)) = Right s
fromSymbol e = Left $ "cannot bind value to non symbol type: " ++ show e

```

We'll translate let to a definition of a function with the relevant named arguments and call it with the values, Thus introducing the variables in that scope:

```
transLet :: [Expr] -> Either TransError JSExpr
transLet = \case
  [LIST binds, body] -> do
    (vars, vals) <- letParams binds
    vars' <- traverse fromSymbol vars
    JSFunCall . JSLambda vars' <$> (JSReturn <$> translateToJS body) <*> traverse translateToJS vals
   where
    letParams :: [Expr] -> Either Error ([Expr],[Expr])
    letParams = \case
      [] -> pure ([],[])
      LIST [x,y] : rest -> ((x:) *** (y:)) <$> letParams rest
      x : _ -> Left ("Unexpected argument in let list in expression:\n" ++ printExpr x)

  vars ->
    Left $ unlines
      ["Syntax error: unexpected arguments for let."
      ,"expecting 2 arguments, the first is the list of var/val pairs and the second is the let body."
      ,"In expression:\n" ++ printExpr (LIST $ ATOM (Symbol "let") : vars)
      ]
```

We'll translate an operation that can work on multiple arguments to a chain of binary operations. For example: `(add 1 2 3)` will become `1 + (2 + 3)`

```
transBinOp :: Name -> Name -> [Expr] -> Either TransError JSExpr
transBinOp f _ []   = Left $ "Syntax error: '" ++ f ++ "' expected at least 1 argument, got: 0"
transBinOp _ _ [x]  = translateToJS x
transBinOp _ f list = foldl1 (JSBinOp f) <$> traverse translateToJS list
```

And we'll translate a `print` as a call to `console.log`

```
transPrint :: [Expr] -> Either TransError JSExpr
transPrint [expr] = JSFunCall (JSSymbol "console.log") . (:[]) <$> translateToJS expr
transPrint xs     = Left $ "Syntax error. print expected 1 arguments, got: " ++ show (length xs)

```

Notice that we could have skipped verifying the syntax if we'd parse those as special cases of `Expr`.

*   _Exercise 1_ : Translate `Program` to `JSProgram`

*   _Exercise 2_ : add a special case for `if Expr Expr Expr` and translate it to the `JSIf` case you implemented in the last exercise

### 7\. Glue it all together

Finally, we are going to glue this all together. We'll:

1.  Read a file

2.  Parse it to `Expr`

3.  Translate it to `JSExpr`

4.  Emit JavaScript code to the standard output

We'll also enable a few flags for testing:

*   `--e` will parse and print the abstract representation of the expression (`Expr`)

*   `--pp` will parse and pretty print

*   `--jse` will parse, translate and print the abstract representation of the resulting JS (`JSExpr`)

*   `--ppc` will parse, pretty print and compile

```
main :: IO ()
main = getArgs >>= \case
  [file] ->
    printCompile =<< readFile file
  ["--e",file] ->
    either putStrLn print . runExprParser "--e" =<< readFile file
  ["--pp",file] ->
    either putStrLn (putStrLn . printExpr) . runExprParser "--pp" =<< readFile file
  ["--jse",file] ->
    either print (either putStrLn print . translateToJS) . runExprParser "--jse" =<< readFile file
  ["--ppc",file] ->
    either putStrLn (either putStrLn putStrLn) . fmap (compile . printExpr) . runExprParser "--ppc" =<< readFile file
  _ ->
    putStrLn $ unlines
      ["Usage: runghc Main.hs [ --e, --pp, --jse, --ppc ] <filename>"
      ,"--e     print the Expr"
      ,"--pp    pretty print Expr"
      ,"--jse   print the JSExpr"
      ,"--ppc   pretty print Expr and then compile"
      ]

printCompile :: String -> IO ()
printCompile = either putStrLn putStrLn . compile

compile :: String -> Either Error String
compile str = printJSExpr False 0 <$> (translateToJS =<< runExprParser "compile" str)

```

That's it. We have a compiler from our language to JS. Again, you can view the full source file [here][9].

Running our compiler with the example from the first section yields this JavaScript code:

```
$ runhaskell Lisp.hs example.lsp
(function(compose, square, add1) {
  return (console.log)(((compose)(square, add1))(5));
})(function(f, g) {
  return function(x) {
    return (f)((g)(x));
  };
}, function(x) {
  return (x * x);
}, function(x) {
  return (x + 1);
})
```

If you have node.js installed on your computer, you can run this code by running:

```
$ runhaskell Lisp.hs example.lsp | node -p
36
undefined
```

*   _Final exercise_ : instead of compiling an expression, compile a program of multiple expressions.

--------------------------------------------------------------------------------

via: https://gilmi.me/blog/post/2016/10/14/lisp-to-js

作者：[ Gil Mizrahi ][a]
选题：[oska874][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://gilmi.me/home
[b]:https://github.com/oska874
[1]:https://gilmi.me/blog/authors/Gil
[2]:https://gilmi.me/blog/tags/compilers
[3]:https://gilmi.me/blog/tags/fp
[4]:https://gilmi.me/blog/tags/haskell
[5]:https://gilmi.me/blog/tags/lisp
[6]:https://gilmi.me/blog/tags/parsing
[7]:https://gist.github.com/soupi/d4ff0727ccb739045fad6cdf533ca7dd
[8]:https://mrkkrp.github.io/megaparsec/
[9]:https://gist.github.com/soupi/d4ff0727ccb739045fad6cdf533ca7dd
[10]:https://gilmi.me/blog/post/2016/10/14/lisp-to-js
