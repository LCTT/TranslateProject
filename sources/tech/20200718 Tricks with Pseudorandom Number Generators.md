[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tricks with Pseudorandom Number Generators)
[#]: via: (https://theartofmachinery.com/2020/07/18/prng_tricks.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

Tricks with Pseudorandom Number Generators
======

Pseudorandom number generators (PRNGs) are often treated like a compromise: their output isn’t as good as real random number generators, but they’re cheap and easy to use on computer hardware. But a special feature of PRNGs is that they’re _reproducible_ sources of random-looking data:

```
import std.random;
import std.stdio;

void main()
{
    // Seed a PRNG and generate 10 pseudo-random numbers
    auto rng = Random(42);
    foreach (_; 0..10) write(uniform(0, 10, rng), ' ');
    writeln();
    // Reset the PRNG, and the same sequence is generated again
    rng = Random(42);
    foreach (_; 0..10) write(uniform(0, 10, rng), ' ');
    writeln();

    // Output:
    // 2 7 6 4 6 5 0 4 0 3
    // 2 7 6 4 6 5 0 4 0 3
}
```

This simple fact enables a few neat tricks.

A couple of famous examples come from the gaming industry. The classic example is the space trading game Elite, which was originally written for 8b BBC Micros in the early 80s. It was a totally revolutionary game, but just one thing that amazed fans was its complex universe of thousands of star systems. That was something you just didn’t normally get in games written for machines with kilobytes of RAM total. The trick was to generate the universe with a PRNG seeded with a small value. There was no need to store the universe in memory because the game could regenerate each star system on demand, repeatedly and deterministically.

PRNGs are now widely exploited for recording games for replays. You don’t need to record every frame of the game world if you can just record the PRNG seed and all the player actions. (Like most things in software, [actually implementing that can be surprisingly challenging][1].)

### Random mappings

In machine learning, you often need a mapping from things to highly dimensional random unit vectors (random vectors of length 1). Let’s get more specific and say you’re processing documents for topic/sentiment analysis or similarity. In this case you’ll generate a random vector for each word in the dictionary. Then you can create a vector for each document by adding up the vectors for each word in it (with some kind of weighting scheme, in practice). Similar documents will end up with similar vectors, and you can use linear algebra tricks to uncover deeper patterns (read about [latent semantic analysis][2] if you’re interested).

An obvious way to get a mapping between words and random vectors is to just initially generate a vector for each word, and create a hash table for looking them up later. Another way is to generate the random vectors on demand using a PRNG seeded by a hash of the word. Here’s a toy example:

```
/+ dub.sdl:
    name "prngvecdemo"
    dependency "mir-random" version="~>2.2.14"
+/
// Demo of mapping words to random vectors with PRNGs
// Run me with "dub prngvecdemo.d"

import std.algorithm;
import std.stdio;

// Using the Mir numerical library https://www.libmir.org/
import mir.random.engine.xoshiro;
import mir.random.ndvariable;

enum kNumDims = 512;
alias RNG = Xoroshiro128Plus;
// D's built-in hash happens to be MurmurHash, but we just need it to be suitable for seeding the PRNG
static assert("".hashOf.sizeof == 8);

void main()
{
    auto makeUnitVector = sphereVar!float();
    auto doc = "a lot of words";

    float[kNumDims] doc_vec, word_vec;

    doc_vec[] = 0.0;
    foreach (word; doc.splitter)  // Not bothering with whitening or stop word filtering for this demo
    {
        // Create a PRNG seeded with the hash of the word
        auto rng = RNG(word.hashOf);
        // Generate a unit vector for the word using the PRNG
        // We'll get the same vector every time we see the same word
        makeUnitVector(rng, word_vec);
        // Add it to the document vector (no weighting for simplicity)
        doc_vec[] += word_vec[];
    }

    writeln(doc_vec);
}
```

This kind of trick isn’t the answer to everything, but it has some uses. Obviously, it can be useful if you’re working with more data than you have RAM (though you might still cache some of the generated data). Another use case is processing a large dataset with parallel workers. In the document example, you can get workers to “agree” on what the vector for each word should be, without data synchronisation, and without needing to do an initial pass over the data to build a dictionary of words. I’ve used this trick with experimental code, just because I was too lazy to add an extra stage to the data pipeline. In some applications, recomputing data on the fly can even be faster than fetching it from a very large lookup table.

### An ode to Xorshift

You might have noticed I used `Xoroshiro128Plus`, a variant of the Xorshift PRNG. The Mersenne Twister is a de facto standard PRNG in some computing fields, but I’m a bit of a fan of the Xorshift family. The basic Xorshift engines are fast and pretty good, and there are variants that are still fast and have excellent output quality. But the big advantage compared to the Mersenne Twister is the state size. The Mersenne Twister uses a pool of 2496 bytes of state, whereas most of the Xorshift PRNGs can fit into one or two machine `int`s.

The small state size has a couple of advantages for this kind of “on demand” PRNG usage: One is that thoroughly initialising a big state from a small seed takes work (some people “warm up” a Mersenne Twister by throwing away several of the initial outputs, just to be sure). The second is that the small size of the PRNGs makes them cheap enough to use in places you wouldn’t think of using a Mersenne Twister.

### Random data structures made reliable

Some data structures and algorithms use randomisation. An example is a treap, which is a binary search tree that uses a randomised heap for balancing. Treaps are much less popular than AVL trees or red-black trees, but they’re easier to implement correctly because you end up with fewer edge cases. They’re also good enough for most use cases. That makes them a good choice for application-specific “augmented” BSTs. But for argument purposes, it’s just a real example of a data structure that happens to use randomness as an implementation detail.

Randomisation comes with a major drawback: it’s a pain when testing and debugging. Test failures aren’t reproducible for debugging if real randomness is used. If you have any experience with testing, you’ll have seen this and you’ll know it’s a good idea to use a PRNG instead.

Using a global PRNG mostly works, but it couples the treaps through one shared PRNG. That accidental coupling can lead to test flakes if you’re running several tests at once, unless you’re careful to use one PRNG per thread and reset it for every test. Even then you can get Heisenbugs in your non-test code.

What about dependency injection? Making every treap method require a reference to a PRNG works, but it leaks the implementation detail throughout your code. You could make the treap take a reference to a PRNG in its constructor, but that implies adding an extra pointer to the data structure. If you’re going to do that, why not just make every treap embed its own 32b or 64b Xorshift PRNG? Embedding the PRNG into the treap makes it deterministic and reproducible in a way that’s encapsulated and decoupled from everything else.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2020/07/18/prng_tricks.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://technology.riotgames.com/news/determinism-league-legends-introduction
[2]: https://en.wikipedia.org/wiki/Latent_semantic_analysis
