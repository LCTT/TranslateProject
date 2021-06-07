用 350 行代码从零开始，将 Lisp 编译成 JavaScript
======

我们将会在本篇文章中看到从零开始实现的编译器，将简单的类 LISP 计算语言编译成 JavaScript。完整的源代码在 [这里][7]。

我们将会：

1.  自定义语言，并用它编写一个简单的程序
2.  实现一个简单的解析器组合器
3.  为该语言实现一个解析器
4.  为该语言实现一个美观的打印器
5.  为我们的用途定义 JavaScript 的一个子集
6.  实现代码转译器，将代码转译成我们定义的 JavaScript 子集
7.  把所有东西整合在一起

开始吧！

### 1、定义语言

Lisp 族语言最迷人的地方在于，它们的语法就是树状表示的，这就是这门语言很容易解析的原因。我们很快就能接触到它。但首先让我们把自己的语言定义好。关于我们语言的语法的范式（BNF）描述如下：

```
program ::= expr
expr ::= <integer> | <name> | ([<expr>])
```

基本上，我们可以在该语言的最顶层定义表达式并对其进行运算。表达式由一个整数（比如 `5`）、一个变量（比如 `x`）或者一个表达式列表（比如 `(add x 1)`）组成。

整数对应它本身的值，变量对应它在当前环境中绑定的值，表达式列表对应一个函数调用，该列表的第一个参数是相应的函数，剩下的表达式是传递给这个函数的参数。

该语言中，我们保留一些内建的特殊形式，这样我们就能做一些更有意思的事情：

* `let` 表达式使我们可以在它的 `body` 环境中引入新的变量。语法如下：

    ```
let ::= (let ([<letarg>]) <body>)
letargs ::= (<name> <expr>)
body ::= <expr>
```

* `lambda` 表达式：也就是匿名函数定义。语法如下：

    ```
lambda ::= (lambda ([<name>]) <body>)
```

还有一些内建函数： `add`、`mul`、`sub`、`div` 和 `print`。

让我们看看用我们这门语言编写的入门示例程序：

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

这个程序定义了 3 个函数：`compose`、`square` 和 `add1`。然后将计算结果的值 `((compose square add1) 5)` 输出出来。

我相信了解这门语言，这些信息就足够了。开始实现它吧。

在 Haskell 中，我们可以这样定义语言：

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

我们可以解析用该语言用 `Expr` 定义的程序。而且，这里我们添加了新数据类型 `Eq`、`Read` 和 `Show` 等实例用于测试和调试。你能够在 REPL 中使用这些数据类型，验证它们确实有用。

我们不在语法中定义 `lambda`、`let` 或其它的内建函数，原因在于，当前情况下我们没必要用到这些东西。这些函数仅仅是 `LIST` （表达式列表）的更加特殊的用例。所以我决定将它放到后面的部分。

一般来说你想要在抽象语法中定义这些特殊用例 —— 用于改进错误信息、禁用静态分析和优化等等，但在这里我们不会这样做，对我们来说这些已经足够了。

另一件你想做的事情可能是在语法中添加一些注释信息。比如定位：`Expr` 是来自哪个文件的，具体到这个文件的哪一行哪一列。你可以在后面的阶段中使用这一特性，打印出错误定位，即使它们不是处于解析阶段。

*   _练习 1_：添加一个 `Program` 数据类型，可以按顺序包含多个 `Expr`
*   _练习 2_：向语法树中添加一个定位注解。

### 2、实现一个简单的解析器组合库

我们要做的第一件事情是定义一个<ruby>嵌入式领域专用语言<rt>Embedded Domain Specific Language</rt></ruby>（EDSL），我们会用它来定义我们的语言解析器。这常常被称为解析器组合库。我们做这件事完全是出于学习的目的，Haskell 里有很好的解析库，在实际构建软件或者进行实验时，你应该使用它们。[megaparsec][8] 就是这样的一个库。

首先我们来谈谈解析库的实现的思路。本质上，我们的解析器就是一个函数，接受一些输入，可能会读取输入的一些或全部内容，然后返回解析出来的值和无法解析的输入部分，或者在解析失败时抛出异常。我们把它写出来。

```
newtype Parser a
  = Parser (ParseString -> Either ParseError (a, ParseString))

data ParseString
  = ParseString Name (Int, Int) String

data ParseError
  = ParseError ParseString Error

type Error = String
```

这里我们定义了三个主要的新类型。

第一个，`Parser a` 是之前讨论的解析函数。

第二个，`ParseString` 是我们的输入或携带的状态。它有三个重要的部分：

*   `Name`: 这是源的名字
*   `(Int, Int)`: 这是源的当前位置
*   `String`: 这是等待解析的字符串

第三个，`ParseError` 包含了解析器的当前状态和一个错误信息。

现在我们想让这个解析器更灵活，我们将会定义一些常用类型的实例。这些实例让我们能够将小巧的解析器和复杂的解析器结合在一起（因此它的名字叫做 “解析器组合器”）。

第一个是 `Functor` 实例。我们需要 `Functor` 实例，因为我们要能够对解析值应用函数从而使用不同的解析器。当我们定义自己语言的解析器时，我们将会看到关于它的示例。

```
instance Functor Parser where
  fmap f (Parser parser) =
    Parser (\str -> first f <$> parser str)
```

第二个是 `Applicative` 实例。该实例的常见用例是在多个解析器中实现一个纯函数。

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

（注意：_我们还会实现一个 Monad 实例，这样我们才能使用符号_）

第三个是 `Alternative` 实例。万一前面的解析器解析失败了，我们要能够提供一个备用的解析器。

```
instance Alternative Parser where
  empty = Parser (`throwErr` "Failed consuming input")
  (Parser p1) <|> (Parser p2) =
    Parser $
      \pstr -> case p1 pstr of
        Right result -> Right result
        Left  _      -> p2 pstr
```

第四个是 `Monad` 实例。这样我们就能链接解析器。

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

接下来，让我们定义一种的方式，用于运行解析器和防止失败的助手函数：

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

现在我们将会开始实现组合器，这是 EDSL 的 API，也是它的核心。

首先，我们会定义 `oneOf`。如果输入列表中的字符后面还有字符的话，`oneOf` 将会成功，否则就会失败。

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

`optional` 将会抛出异常，停止解析器。失败时它仅仅会返回 `Nothing`。

```
optional :: Parser a -> Parser (Maybe a)
optional (Parser parser) =
  Parser $
    \pstr -> case parser pstr of
      Left _ -> Right (Nothing, pstr)
      Right (x, rest) -> Right (Just x, rest)
```

`many` 将会试着重复运行解析器，直到失败。当它完成的时候，会返回成功运行的解析器列表。`many1` 做的事情是一样的，但解析失败时它至少会抛出一次异常。

```
many :: Parser a -> Parser [a]
many parser = go []
  where go cs = (parser >>= \c -> go (c:cs)) <|> pure (reverse cs)

many1 :: Parser a -> Parser [a]
many1 parser =
  (:) <$> parser <*> many parser
```

下面的这些解析器通过我们定义的组合器来实现一些特殊的解析器：

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

现在为该门语言定义解析器所需要的所有东西都有了。

* _练习_ ：实现一个 EOF（end of file/input，即文件或输入终止符）解析器组合器。

### 3、为我们的语言实现解析器

我们会用自顶而下的方法定义解析器。

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

注意到这四个函数是在我们这门语言中属于高阶描述。这解释了为什么 Haskell 执行解析工作这么棒。在定义完高级部分后，我们还需要定义低级别的 `parseName` 和 `parseInt`。

我们能在这门语言中用什么字符作为名字呢？用小写的字母、数字和下划线吧，而且名字的第一个字符必须是字母。

```
parseName :: Parser Name
parseName = do
  c  <- oneOf ['a'..'z']
  cs <- many $ oneOf $ ['a'..'z'] ++ "0123456789" ++ "_"
  pure (c:cs)
```

整数是一系列数字，数字前面可能有负号 `-`：

```
parseInt :: Parser Atom
parseInt = do
  sign <- optional $ char '-'
  num  <- many1 $ oneOf "0123456789"
  let result = read $ maybe num (:num) sign of
  pure $ Int result
```

最后，我们会定义用来运行解析器的函数，返回值可能是一个 `Expr` 或者是一条错误信息。

```
runExprParser :: Name -> String -> Either String Expr
runExprParser name str =
  case runParser name str (withSpaces parseExpr) of
    Left (ParseError _ errMsg) -> Left errMsg
    Right (result, _) -> Right result
```

*   _练习 1_ ：为第一节中定义的 `Program` 类型编写一个解析器
*   _练习 2_ ：用 Applicative 的形式重写 `parseName`
*   _练习 3_ ：`parseInt` 可能出现溢出情况，找到处理它的方法，不要用 `read`。

### 4、为这门语言实现一个更好看的输出器

我们还想做一件事，将我们的程序以源代码的形式打印出来。这对完善错误信息很有用。

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

*   _练习_ ：为第一节中定义的 `Program` 类型编写一个美观的输出器

好，目前为止我们写了近 200 行代码，这些代码一般叫做编译器的前端。我们还要写大概 150 行代码，用来执行三个额外的任务：我们需要根据需求定义一个 JS 的子集，定义一个将我们的语言转译成这个子集的转译器，最后把所有东西整合在一起。开始吧。

### 5、根据需求定义 JavaScript 的子集

首先，我们要定义将要使用的 JavaScript 的子集：

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

这个数据类型表示 JavaScript 表达式。我们有两个原子类型 `JSInt` 和 `JSSymbol`，它们是由我们这个语言中的 `Atom` 转译来的，我们用 `JSBinOp` 来表示二元操作，比如 `+` 或 `*`，用 `JSLambda` 来表示匿名函数，和我们语言中的 `lambda expression（lambda 表达式）` 一样，我们将会用 `JSFunCall` 来调用函数，用 `let` 来引入新名字，用 `JSReturn` 从函数中返回值，在 JavaScript 中是需要返回值的。

`JSExpr` 类型是对 JavaScript 表达式的 **抽象表示**。我们会把自己语言中表达式的抽象表示 `Expr` 转译成 JavaScript 表达式的抽象表示 `JSExpr`。但为了实现这个功能，我们需要实现 `JSExpr` ，并从这个抽象表示中生成 JavaScript 代码。我们将通过递归匹配 `JSExpr` 实现，将 JS 代码当作 `String` 来输出。这和我们在 `printExpr` 中做的基本上是一样的。我们还会追踪元素的作用域，这样我们才可以用合适的方式缩进生成的代码。

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

*   _练习 1_ ：添加 `JSProgram` 类型，它可以包含多个 `JSExpr` ，然后创建一个叫做 `printJSExprProgram` 的函数来生成代码。
*   _练习 2_ ：添加 `JSExpr` 的新类型：`JSIf`，并为其生成代码。

### 6、实现到我们定义的 JavaScript 子集的代码转译器

我们快做完了。这一节将会创建函数，将 `Expr` 转译成 `JSExpr`。

基本思想很简单，我们会将 `ATOM` 转译成 `JSSymbol` 或者 `JSInt`，然后会将 `LIST` 转译成一个函数调用或者转译的特例。

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

`builtins` 是一系列要转译的特例，就像 `lambada` 和 `let`。每一种情况都可以获得一系列参数，验证它是否合乎语法规范，然后将其转译成等效的 `JSExpr`。

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

我们这种情况，会将内建的特殊形式当作特殊的、非第一类的进行对待，因此不可能将它们当作第一类函数。

我们会把 Lambda 表达式转译成一个匿名函数：

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

我们会将 `let` 转译成带有相关名字参数的函数定义，然后带上参数调用函数，因此会在这一作用域中引入变量：

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

我们会将可以在多个参数之间执行的操作符转译成一系列二元操作符。比如：`(add 1 2 3)` 将会变成 `1 + (2 + 3)`。

```
transBinOp :: Name -> Name -> [Expr] -> Either TransError JSExpr
transBinOp f _ []   = Left $ "Syntax error: '" ++ f ++ "' expected at least 1 argument, got: 0"
transBinOp _ _ [x]  = translateToJS x
transBinOp _ f list = foldl1 (JSBinOp f) <$> traverse translateToJS list
```

然后我们会将 `print` 转换成对 `console.log` 的调用。

```
transPrint :: [Expr] -> Either TransError JSExpr
transPrint [expr] = JSFunCall (JSSymbol "console.log") . (:[]) <$> translateToJS expr
transPrint xs     = Left $ "Syntax error. print expected 1 arguments, got: " ++ show (length xs)
```

注意，如果我们将这些代码当作 `Expr` 的特例进行解析，那我们就可能会跳过语法验证。

*   _练习 1_ ：将 `Program` 转译成 `JSProgram`
*   _练习 2_ ：为 `if Expr Expr Expr` 添加一个特例，并将它转译成你在上一次练习中实现的 `JSIf` 条件语句。

### 7、把所有东西整合到一起

最终，我们将会把所有东西整合到一起。我们会：

1.  读取文件
2.  将文件解析成 `Expr`
3.  将文件转译成 `JSExpr`
4.  将 JavaScript 代码发送到标准输出流

我们还会启用一些用于测试的标志位：

*   `--e` 将进行解析并打印出表达式的抽象表示（`Expr`）
*   `--pp` 将进行解析，美化输出
*   `--jse` 将进行解析、转译、并打印出生成的 JS 表达式（`JSExpr`）的抽象表示
*   `--ppc` 将进行解析，美化输出并进行编译

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

大功告成。将自己的语言编译到 JS 子集的编译器已经完成了。再说一次，你可以在 [这里][9] 看到完整的源文件。

用我们的编译器运行第一节的示例，产生的 JavaScript 代码如下：

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

如果你在自己电脑上安装了 node.js，你可以用以下命令运行这段代码：

```
$ runhaskell Lisp.hs example.lsp | node -p
36
undefined
```

*   _最终练习_ : 编译有多个表达式的程序而非仅编译一个表达式。

--------------------------------------------------------------------------------

via: https://gilmi.me/blog/post/2016/10/14/lisp-to-js

作者：[Gil Mizrahi][a]
选题：[oska874][b]
译者：[BriFuture](https://github.com/BriFuture)
校对：[wxy](https://github.com/wxy)

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
