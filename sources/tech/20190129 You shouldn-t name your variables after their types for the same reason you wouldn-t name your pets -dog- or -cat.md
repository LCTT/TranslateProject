[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (You shouldn’t name your variables after their types for the same reason you wouldn’t name your pets “dog” or “cat”)
[#]: via: (https://dave.cheney.net/2019/01/29/you-shouldnt-name-your-variables-after-their-types-for-the-same-reason-you-wouldnt-name-your-pets-dog-or-cat)
[#]: author: (Dave Cheney https://dave.cheney.net/author/davecheney)

You shouldn’t name your variables after their types for the same reason you wouldn’t name your pets “dog” or “cat”
======

The name of a variable should describe its contents, not the _type_ of the contents. Consider this example:

```
var usersMap map[string]*User
```

What are some good properties of this declaration? We can see that it’s a map, and it has something to do with the `*User` type, so that’s probably good. But `usersMap` _is_ a map and Go, being a statically typed language, won’t let us accidentally use a map where a different type is required, so the `Map` suffix as a safety precaution is redundant.

Now, consider what happens if we declare other variables using this pattern:

```
var (
        companiesMap map[string]*Company
        productsMap  map[string]*Products
)
```

Now we have three map type variables in scope, `usersMap`, `companiesMap`, and `productsMap`, all mapping `string`s to different `struct` types. We know they are maps, and we also know that their declarations prevent us from using one in place of another—​the compiler will throw an error if we try to use `companiesMap` where the code is expecting a `map[string]*User`. In this situation it’s clear that the `Map` suffix does not improve the clarity of the code, its just extra boilerplate to type.

My suggestion is avoid any suffix that resembles the _type_ of the variable. Said another way, if `users` isn’t descriptive enough, then `usersMap` won’t be either.

This advice also applies to function parameters. For example:

```
type Config struct {
        //
}

func WriteConfig(w io.Writer, config *Config)
```

Naming the `*Config` parameter `config` is redundant. We know it’s a pointer to a `Config`, it says so right there in the declaration. Instead consider if `conf` will do, or maybe just `c` if the lifetime of the variable is short enough.

This advice is more than just a desire for brevity. If there is more that one `*Config` in scope at any one time, calling them `config1` and `config2` is less descriptive than calling them `original` and `updated` . The latter are less likely to be accidentally transposed—something the compiler won’t catch—while the former differ only in a one character suffix.

Finally, don’t let package names steal good variable names. The name of an imported identifier includes its package name. For example the `Context` type in the `context` package will be known as `context.Context` when imported into another package . This makes it impossible to use `context` as a variable or type, unless of course you rename the import, but that’s throwing good after bad. This is why the local declaration for `context.Context` types is traditionally `ctx`. eg.

```
func WriteLog(ctx context.Context, message string)
```

* * *

A variable’s name should be independent of its type. You shouldn’t name your variables after their types for the same reason you wouldn’t name your pets “dog” or “cat”. You shouldn’t include the name of your type in the name of your variable for the same reason.

### Related posts:

  1. [On declaring variables][1]
  2. [Go, without package scoped variables][2]
  3. [A whirlwind tour of Go’s runtime environment variables][3]
  4. [Declaration scopes in Go][4]



--------------------------------------------------------------------------------

via: https://dave.cheney.net/2019/01/29/you-shouldnt-name-your-variables-after-their-types-for-the-same-reason-you-wouldnt-name-your-pets-dog-or-cat

作者：[Dave Cheney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://dave.cheney.net/author/davecheney
[b]: https://github.com/lujun9972
[1]: https://dave.cheney.net/2014/05/24/on-declaring-variables (On declaring variables)
[2]: https://dave.cheney.net/2017/06/11/go-without-package-scoped-variables (Go, without package scoped variables)
[3]: https://dave.cheney.net/2015/11/29/a-whirlwind-tour-of-gos-runtime-environment-variables (A whirlwind tour of Go’s runtime environment variables)
[4]: https://dave.cheney.net/2016/12/15/declaration-scopes-in-go (Declaration scopes in Go)
