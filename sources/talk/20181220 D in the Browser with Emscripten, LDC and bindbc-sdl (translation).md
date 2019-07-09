[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (D in the Browser with Emscripten, LDC and bindbc-sdl (translation))
[#]: via: (https://theartofmachinery.com/2018/12/20/emscripten_d.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

D in the Browser with Emscripten, LDC and bindbc-sdl (translation)
======

Here’s a tutorial about using Emscripten to run D code in a normal web browser. It’s uses a different approach from the [Dscripten game demo][1] and the [dscripten-tools][2] toolchain that’s based on it.

  * Instead of porting the D runtime, it uses a lightweight, runtimeless `-betterC` build.
  * It uses Docker to manage the Emscripten installation.



LDC has recently gained support for [compiling directly to WebAssembly][3], but (unlike the Emscripten approach) that doesn’t automatically get you libraries.

You can find [the complete working code on Github][4]. `./run.sh` starts a shell in a Docker image that contains the development environment. `dub build --build=release` generates the HTML and JavaScript assets and puts them into the `dist/` directory.

[This tutorial is translated from a Japanese post by outlandkarasu][5], who deserves all the credit for figuring this stuff out.

### Background

#### What’s Emscripten?

[Emscripten][6] is a compiler toolchain for asm.js and WebAssembly that comes with ported versions of the libc and SDL2 C libraries. It can compile regular Linux-based applications in languages like C to code that can run in a browser.

### How do you use Emscripten with D?

Emscripten is a toolchain designed for C/C++, but the C/C++ part is just a frontend. The toolchain actually compiles LLVM intermediate representation (IR). You can generate LLVM IR bitcode from D using [LDC][7], so it should be possible to feed that through Emscripten and run D in a browser, just like C/C++.

#### Gotchas using Emscripten

Ideally that’s all it would take, but there are some things that require special attention (or trial and error).

  1. D runtime library features like GC and Phobos can’t be used without an Emscripten port.
  2. It’s not enough to just produce LLVM IR. The code needs to meet Emscripten’s requirements.
    * It needs to use ported libraries.
    * Pointer sizes and data structure binary layouts need to match.
  3. Emscripten bugs need to be worked around.
    * Debug information is particularly problematic.



### Implementation

#### Plan of attack

Here’s the plan for making D+Emscripten development work:

  1. Use `-betterC` and the `@nogc` and `nothrow` attributes to avoid D runtime features.
  2. Use SDL2 functions directly by statically compiling with [`bindbc-sdl`][8].
  3. Keep on trying.



#### Environment setup

Emscripten is based on LLVM, clang and various other libraries, and is hard to set up, so I decided to [do the job with Docker][9]. I wrote a Dockerfile that would also add LDC and other tools at `docker build` time:

```
FROM trzeci/emscripten-slim:sdk-tag-1.38.21-64bit

# Install D and tools, and enable them in the shell by adding them to .bashrc
RUN apt-get -y update && \
    apt-get -y install vim sudo curl && \
    sudo -u emscripten /bin/sh -c "curl -fsS https://dlang.org/install.sh | bash -s ldc-1.12.0" && \
    (echo 'source $(~/dlang/install.sh ldc -a)' >> /home/emscripten/.bashrc)

# dub settings (explained later)
ADD settings.json /var/lib/dub/settings.json
```

Docker makes these big toolchains pretty easy :)

#### Coding

Here’s a basic demo that displays an image:

```
// Import SDL2 and SDL_image
// Both work with Emscripten
import bindbc.sdl;
import bindbc.sdl.image;
import core.stdc.stdio : printf; // printf works in Emscripten, too

// Function declarations for the main loop
alias em_arg_callback_func = extern(C) void function(void*) @nogc nothrow;
extern(C) void emscripten_set_main_loop_arg(em_arg_callback_func func, void *arg, int fps, int simulate_infinite_loop) @nogc nothrow;
extern(C) void emscripten_cancel_main_loop() @nogc nothrow;

// Log output
void logError(size_t line = __LINE__)() @nogc nothrow {
    printf("%d:%s\n", line, SDL_GetError());
}

struct MainLoopArguments {
    SDL_Renderer* renderer;
    SDL_Texture* texture;
}

// Language features restricted with @nogc and nothrow
extern(C) int main(int argc, const char** argv) @nogc nothrow {
    // Initialise SDL
    if(SDL_Init(SDL_INIT_VIDEO) != 0) {
        logError();
        return -1;
    }
    scope(exit) SDL_Quit();

    // Initialise SDL_image (with PNG support)
    if(IMG_Init(IMG_INIT_PNG) != IMG_INIT_PNG) {
        logError();
        return -1;
    }
    scope(exit) IMG_Quit();

    // Make the window and its renderer
    SDL_Window* window;
    SDL_Renderer* renderer;
    if(SDL_CreateWindowAndRenderer(640, 480, SDL_WINDOW_SHOWN, &window, &renderer) != 0) {
        logError();
        return -1;
    }
    scope(exit) {
        SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    }

    // Load image file
    auto dman = IMG_Load("images/dman.png");
    if(!dman) {
        logError();
        return -1;
    }
    scope(exit) SDL_FreeSurface(dman);

    // Make a texture from the image
    auto texture = SDL_CreateTextureFromSurface(renderer, dman);
    if(!texture) {
        logError();
        return -1;
    }
    scope(exit) SDL_DestroyTexture(texture);

    // Start the image main loop
    auto arguments = MainLoopArguments(renderer, texture);
    emscripten_set_main_loop_arg(&mainLoop, &arguments, 60, 1);
    return 0;
}

extern(C) void mainLoop(void* p) @nogc nothrow {
    // Get arguments
    auto arguments = cast(MainLoopArguments*) p;
    auto renderer = arguments.renderer;
    auto texture = arguments.texture;

    // Clear background
    SDL_SetRenderDrawColor(renderer, 0x00, 0x00, 0x00, 0x00);
    SDL_RenderClear(renderer);

    // Texture image
    SDL_RenderCopy(renderer, texture, null, null);
    SDL_RenderPresent(renderer);

    // End of loop iteration
    emscripten_cancel_main_loop();
}
```

#### Building

Now building is the tricky bit.

##### `dub.json`

Here’s the `dub.json` I made through trial and error. It runs the whole build from D to WebAssembly.

```
{
    "name": "emdman",
    "authors": [
        "outland.karasu@gmail.com"
    ],
    "description": "A minimal emscripten D man demo.",
    "copyright": "Copyright © 2018, outland.karasu@gmail.com",
    "license": "BSL-1.0",
    "dflags-ldc": ["--output-bc", "-betterC"], // Settings for bitcode output
    "targetName": "app.bc",
    "dependencies": {
        "bindbc-sdl": "~>0.4.1"
    },
    "subConfigurations": {
        "bindbc-sdl": "staticBC" // Statically-linked, betterC build
    },
    "versions": ["BindSDL_Image"], // Use SDL_image

    // Run the Emscripten compiler after generating bitcode
    // * Disable optimisations
    // * Enable WebAssembly
    // * Use SDL+SDL_image (with PNG)
    // * Set web-only as the environment
    // * Embed image file(s)
    // * Generate HTML for running in browser
    "postBuildCommands": ["emcc -v -O0 -s WASM=1 -s USE_SDL=2 -s USE_SDL_IMAGE=2 -s SDL2_IMAGE_FORMATS='[\"png\"]' -s ENVIRONMENT=web --embed-file images -o dist/index.html app.bc"]
}
```

##### Switch to 32b (x86) code generation

Compiling with 64b “worked” but I got a warning about different data layouts:

```
warning: Linking two modules of different data layouts: '/tmp/emscripten_temp_WwvmL5_archive_contents/mulsc3_20989819.c.o' is 'e-p:32:32-i64:64-v128:32:128-n32-S128' whereas '/src/app.bc' is 'e-m:e-i64:64-f80:128-n8:16:32:64-S128'

warning: Linking two modules of different target triples: /tmp/emscripten_temp_WwvmL5_archive_contents/mulsc3_20989819.c.o' is 'asmjs-unknown-emscripten' whereas '/src/app.bc' is 'x86_64-unknown-linux-gnu'
```

Apparently Emscripten is basically for 32b code. Using mismatched pointer sizes sounds like a pretty bad idea, so I added this `/var/lib/dub/settings.json` to the Dockerfile:

```
{
        "defaultArchitecture": "x86", // Set code generation to 32b
        "defaultCompiler": "ldc" // Use LDC by default
}
```

There’s an [open issue for documenting `dub`’s `settings.json`][10].

##### Remove debug information

Emscripten gave the following error when I ran a normal build with `dub`:

```
shared:ERROR: Failed to run llvm optimizations:
```

It looks like there’s [an issue related to debugging information][11]. I worked around it by using `dub --build=release`.

### Results

After lots of trial and error, I finally succeeded in getting my demo to run in a browser. Here’s how it looks:

![Meet D-Man \(Demo\)][12]

The Emscripten+D dev environment isn’t as stable as a normal dev environment. For example, rendering didn’t work if I used `SDL_LowerBlit` instead. But here’s D-Man in a browser.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2018/12/20/emscripten_d.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://github.com/Ace17/dscripten
[2]: https://github.com/CyberShadow/dscripten-tools
[3]: https://wiki.dlang.org/Generating_WebAssembly_with_LDC
[4]: https://github.com/outlandkarasu-sandbox/emdman
[5]: https://qiita.com/outlandkarasu@github/items/15e0f4b6d1b2a0eab846
[6]: http://kripken.github.io/emscripten-site/
[7]: https://wiki.dlang.org/LDC
[8]: https://github.com/BindBC/bindbc-sdl
[9]: https://hub.docker.com/r/trzeci/emscripten/
[10]: https://github.com/dlang/dub/issues/1463
[11]: https://github.com/kripken/emscripten/issues/4078
[12]: /images/emscripten_d/d-man-browser.png
