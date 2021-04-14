[#]: subject: (Make Conway's Game of Life in WebAssembly)
[#]: via: (https://opensource.com/article/21/4/game-life-simulation-webassembly)
[#]: author: (Mohammed Saud https://opensource.com/users/saud)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Make Conway's Game of Life in WebAssembly
======
WebAssembly is a good option for computationally expensive tasks due to
its predefined execution environment and memory granularity.
![Woman sitting in front of her computer][1]

Conway's [Game of Life][2] is a popular programming exercise to create a [cellular automaton][3], a system that consists of an infinite grid of cells. You don't play the game in the traditional sense; in fact, it is sometimes referred to as a game for zero players.

Once you start the Game of Life, the game plays itself to multiply and sustain "life." In the game, digital cells representing lifeforms are allowed to change states as defined by a set of rules. When the rules are applied to cells through multiple iterations, they exhibit complex behavior and interesting patterns.

The Game of Life simulation is a very good candidate for a WebAssembly implementation because of how computationally expensive it can be; every cell's state in the entire grid must be calculated for every iteration. WebAssembly excels at computationally expensive tasks due to its predefined execution environment and memory granularity, among many other features.

### Compiling to WebAssembly

Although it's possible to write WebAssembly by hand, it is very unintuitive and error-prone as complexity increases. Most importantly, it's not intended to be written that way. It would be the equivalent of manually writing [assembly language][4] instructions.

Here's a simple WebAssembly function to add two numbers:


```
(func $Add (param $0 i32) (param $1 i32) (result i32)
    local.get $0
    local.get $1
    i32.add
)
```

It is possible to compile WebAssembly modules using many existing languages, including C, C++, Rust, Go, and even interpreted languages like Lua and Python. This [list][5] is only growing.

One of the problems with using existing languages is that WebAssembly does not have much of a runtime. It does not know what it means to [free a pointer][6] or what a [closure][7] is. All these language-specific runtimes have to be included in the resulting WebAssembly binaries. Runtime size varies by language, but it has an impact on module size and execution time.

### AssemblyScript

[AssemblyScript][8] is one language that is trying to overcome some of these challenges with a different approach. AssemblyScript is designed specifically for WebAssembly, with a focus on providing low-level control, producing smaller binaries, and reducing the runtime overhead.

AssemblyScript uses a strictly typed variant of [TypeScript][9], a superset of JavaScript. Developers familiar with TypeScript do not have to go through the trouble of learning an entirely new language.

### Getting started

The AssemblyScript compiler can easily be installed through [Node,js][10]. Start by initializing a new project in an empty directory:


```
npm init
npm install --save-dev assemblyscript
```

If you don't have Node installed locally, you can play around with AssemblyScript on your browser using the nifty [WebAssembly Studio][11] application.

AssemblyScript comes with `asinit`, which should be installed when you run the installation command above. It is a helpful utility to quickly set up an AssemblyScript project with the recommended directory structure and configuration files:


```
`npx asinit .`
```

The newly created `assembly` directory will contain all the AssemblyScript code, a simple example function in `assembly/index.ts`, and the `asbuild` command inside `package.json`. `asbuild`, which compiles the code into WebAssembly binaries.

When you run `npm run asbuild` to compile the code, it creates files inside `build`. The `.wasm` files are the generated WebAssembly modules. The `.wat` files are the modules in text format and are generally used for debugging and inspection.

You have to do a little bit of work to get the binaries to run on a browser.

First, create a simple HTML file, `index.html`:


```
&lt;[html][12]&gt;
    &lt;[head][13]&gt;
        &lt;[meta][14] charset=utf-8&gt;
        &lt;[title][15]&gt;Game of life&lt;/[title][15]&gt;
    &lt;/[head][13]&gt;
   
    &lt;[body][16]&gt;
        &lt;[script][17] src='./index.js'&gt;&lt;/[script][17]&gt;
    &lt;/[body][16]&gt;
&lt;/[html][12]&gt;
```

Next, replace the contents of `index.js` with the code snippet below to load the WebAssembly modules:


```
const runWasm = async () =&gt; {
  const module = await WebAssembly.instantiateStreaming(fetch('./build/optimized.wasm'));
  const exports = module.instance.exports;

  console.log('Sum = ', exports.add(20, 22));
};

runWasm();
```

This `fetches` the binary and passes it to `WebAssembly.instantiateStreaming`, the browser API that compiles a module into a ready-to-use instance. This is an asynchronous operation, so it is run inside an async function so that await can be used to wait for it to finish compiling.

The `module.instance.exports` object contains all the functions exported by AssemblyScript. Use the example function in `assembly/index.ts` and log the result.

You will need a simple development server to host these files. There are a lot of options listed in this [gist][18]. I used [node-static][19]:


```
npm install -g node-static
static
```

You can view the result by pointing your browser to `localhost:8080` and opening the console.

![console output][20]

(Mohammed Saud, [CC BY-SA 4.0][21])

### Drawing to a canvas

You will be drawing all the cells onto a `<canvas>` element:


```
&lt;[body][16]&gt;
    &lt;[canvas][22] id=canvas&gt;&lt;/[canvas][22]&gt;

    ...
&lt;/[body][16]&gt;
```

Add some CSS:


```
&lt;[head][13]&gt;
    ...

    &lt;[style][23] type=text/css&gt;
    body {
      background: #ccc;
    }
    canvas {
      display: block;
      padding: 0;
      margin: auto;
      width: 40%;

      image-rendering: pixelated;
      image-rendering: crisp-edges;
    }
    &lt;/[style][23]&gt;
&lt;/[head][13]&gt;
```

The `image-rendering` styles are used to prevent the canvas from smoothing and blurring out pixelated images.

You will need a canvas drawing context in `index.js`:


```
const canvas = document.getElementById('canvas');
const ctx = canvas.getContext('2d');
```

There are many functions in the [Canvas API][24] that you could use for drawing—but you need to draw using WebAssembly, not JavaScript.

Remember that WebAssembly does NOT have access to the browser APIs that JavaScript has, and any call that needs to be made should be interfaced through JavaScript. This also means that your WebAssembly module will run the fastest if there is as little communication with JavaScript as possible.

One method is to create [ImageData][25] (a data type for the underlying pixel data of a canvas), fill it up with the WebAssembly module's memory, and draw it on the canvas. This way, if the memory buffer is updated inside WebAssembly, it will be immediately available to the `ImageData`.

Define the pixel count of the canvas and create an `ImageData` object:


```
const WIDTH = 10, HEIGHT = 10;

const runWasm = async () =&gt; {
...

canvas.width = WIDTH;
canvas.height = HEIGHT;

const ctx = canvas.getContext('2d');
const memoryBuffer = exports.memory.buffer;
const memoryArray = new Uint8ClampedArray(memoryBuffer)

const imageData = ctx.createImageData(WIDTH, HEIGHT);
imageData.data.set(memoryArray.slice(0, WIDTH * HEIGHT * 4));
ctx.putImageData(imageData, 0, 0);
```

The memory of a WebAssembly module is provided in `exports.memory.buffer` as an [ArrayBuffer][26]. You need to use it as an array of 8-bit unsigned integers or `Uint8ClampedArray`. Now you can fill up the module's memory with some pixels. In `assembly/index.ts`, you first need to grow the available memory:


```
`memory.grow(1);`
```

WebAssembly does not have access to memory by default and needs to request it from the browser using the `memory.grow` function. Memory grows in chunks of 64Kb, and the number of required chunks can be specified when calling it. You will not need more than one chunk for now.

Keep in mind that memory can be requested multiple times, whenever needed, and once acquired, memory cannot be freed or given back to the browser.

Writing to the memory:


```
`store<u32>(0, 0xff101010);`
```

A pixel is represented by 32 bits, with the RGBA values taking up 8 bits each. Here, RGBA is defined in reverse—ABGR—because WebAssembly is [little-endian][27].

The `store` function stores the value `0xff101010` at index `0`, taking up 32 bits. The alpha value is `0xff` so that the pixel is fully opaque.

![Byte order for a pixel's color][28]

(Mohammed Saud, [CC BY-SA 4.0][21])

Build the module again with `npm run asbuild` before refreshing the page to see your first pixel on the top-left of the canvas.

### Implementing rules

Let's review the rules. The [Game of Life Wikipedia page][29] summarizes them nicely:

  1. Any live cell with fewer than two live neighbors dies, as if by underpopulation.
  2. Any live cell with two or three live neighbors lives on to the next generation.
  3. Any live cell with more than three live neighbors dies, as if by overpopulation.
  4. Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.



You need to iterate through all the rows, implementing these rules on each cell. You do not know the width and height of the grid, so write a little function to initialize the WebAssembly module with this information:


```
let universe_width: u32;
let universe_height: u32;
let alive_color: u32;
let dead_color: u32;
let chunk_offset: u32;

export function init(width: u32, height: u32): void {
  universe_width = width;
  universe_height = height;
  chunk_offset = width * height * 4;

  alive_color = 0xff101010;
  dead_color = 0xffefefef;
}
```

Now you can use this function in `index.js` to provide data to the module:


```
`exports.init(WIDTH, HEIGHT);`
```

Next, write an `update` function to iterate over all the cells, count the number of active neighbors for each, and set the current cell's state accordingly:


```
export function update(): void {
  for (let x: u32 = 0; x &lt; universe_width; x++) {
    for (let y: u32 = 0; y &lt; universe_height; y++) {

      const neighbours = countNeighbours(x, y);

      if (neighbours &lt; 2) {
        // less than 2 neighbours, cell is no longer alive
        setCell(x, y, dead_color);
      } else if (neighbours == 3) {
        // cell will be alive
        setCell(x, y, alive_color);
      } else if (neighbours &gt; 3) {
        // cell dies due to overpopulation
        setCell(x, y, dead_color);
      }
    }
  }

  copyToPrimary();
}
```

You have two copies of cell arrays, one representing the current state and the other for calculating and temporarily storing the next state. After the calculation is done, the second array is copied to the first for rendering.

The rules are fairly straightforward, but the `countNeighbours()` function looks interesting. Take a closer look:


```
function countNeighbours(x: u32, y: u32): u32 {
  let neighbours = 0;

  const max_x = universe_width - 1;
  const max_y = universe_height - 1;

  const y_above = y == 0 ? max_y : y - 1;
  const y_below = y == max_y ? 0 : y + 1;
  const x_left = x == 0 ? max_x : x - 1;
  const x_right = x == max_x ? 0 : x + 1;

  // top left
  if(getCell(x_left, y_above) == alive_color) {
    neighbours++;
  }

  // top
  if(getCell(x, y_above) == alive_color) {
    neighbours++;
  }

  // top right
  if(getCell(x_right, y_above) == alive_color) {
    neighbours++;
  }

  ...

  return neighbours;
}
```

![Coordinates of a cell's neighbors][30]

(Mohammed Saud, [CC BY-SA 4.0][21])

Every cell has eight neighbors, and you can check if each one is in the `alive_color` state. The important situation handled here is if a cell is exactly on the edge of the grid. Cellular automata are generally assumed to be on an infinite space, but since infinitely large displays haven't been invented yet, stick to warping at the edges. This means when a cell goes off the top, it comes back in its corresponding position on the bottom. This is commonly known as [toroidal space][31].

The `getCell` and `setCell` functions are wrappers to the `store` and `load` functions to make it easier to interact with memory using 2D coordinates:


```
@inline
function getCell(x: u32, y: u32): u32 {
  return load&lt;u32&gt;((x + y * universe_width) &lt;&lt; 2);
}

@inline
function setCell(x: u32, y: u32, val: u32): void {
  store&lt;u32&gt;(((x + y * universe_width) &lt;&lt; 2) + chunk_offset, val);
}

function copyToPrimary(): void {
  memory.copy(0, chunk_offset, chunk_offset);
}
```

The `@inline` is an [annotation][32] that requests that the compiler convert calls to the function with the function definition itself.

Call the update function on every iteration from `index.js` and render the image data from the module memory:


```
const FPS = 5;

const runWasm = async () =&gt; {
  ...

  const step = () =&gt; {
    exports.update();
 
    imageData.data.set(memoryArray.slice(0, WIDTH * HEIGHT * 4));
    ctx.putImageData(imageData, 0, 0);
 
    setTimeout(step, 1000 / FPS);
  };
  step();
```

At this point, if you compile the module and load the page, it shows nothing. The code works fine, but since you don't have any living cells initially, there are no new cells coming up.

Create a new function to randomly add cells during initialization:


```
function fillUniverse(): void {
  for (let x: u32 = 0; x &lt; universe_width; x++) {
    for (let y: u32 = 0; y &lt; universe_height; y++) {
      setCell(x, y, Math.random() &gt; 0.5 ? alive_color : dead_color);
    }
  }

  copyToPrimary();
}

export function init(width: u32, height: u32): void {
  ...

  fillUniverse();
```

Since `Math.random` is used to determine the initial state of a cell, the WebAssembly module needs a seed function to derive a random number from.

AssemblyScript provides a convenient [module loader][33] that does this and a lot more, like wrapping the browser APIs for module loading and providing functions for more fine-grained memory control. You will not be using it here since it abstracts away many details that would otherwise help in learning the inner workings of WebAssembly, so pass in a seed function instead:


```
  const importObject = {
    env: {
      seed: Date.now,
      abort: () =&gt; console.log('aborting!')
    }
  };
  const module = await WebAssembly.instantiateStreaming(fetch('./build/optimized.wasm'), importObject);
```

`instantiateStreaming` can be called with an optional second parameter, an object that exposes JavaScript functions to WebAssembly modules. Here, use `Date.now` as the seed to generate random numbers.

It should now be possible to run the `fillUniverse` function and finally have life on your grid!

You can also play around with different `WIDTH`, `HEIGHT`, and `FPS` values and use different cell colors.

![Game of Life result][34]

(Mohammed Saud, [CC BY-SA 4.0][21])

### Try the game

If you use large sizes, make sure to grow the memory accordingly.

Here's the [complete code][35].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/game-life-simulation-webassembly

作者：[Mohammed Saud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/saud
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_women_computing_3.png?itok=qw2A18BM (Woman sitting in front of her computer)
[2]: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life
[3]: https://en.wikipedia.org/wiki/Cellular_automaton
[4]: https://en.wikipedia.org/wiki/Assembly_language
[5]: https://github.com/appcypher/awesome-wasm-langs
[6]: https://en.wikipedia.org/wiki/C_dynamic_memory_allocation
[7]: https://en.wikipedia.org/wiki/Closure_(computer_programming)
[8]: https://www.assemblyscript.org
[9]: https://www.typescriptlang.org/
[10]: https://nodejs.org/en/download/
[11]: https://webassembly.studio
[12]: http://december.com/html/4/element/html.html
[13]: http://december.com/html/4/element/head.html
[14]: http://december.com/html/4/element/meta.html
[15]: http://december.com/html/4/element/title.html
[16]: http://december.com/html/4/element/body.html
[17]: http://december.com/html/4/element/script.html
[18]: https://gist.github.com/willurd/5720255
[19]: https://www.npmjs.com/package/node-static
[20]: https://opensource.com/sites/default/files/uploads/console_log.png (console output)
[21]: https://creativecommons.org/licenses/by-sa/4.0/
[22]: http://december.com/html/4/element/canvas.html
[23]: http://december.com/html/4/element/style.html
[24]: https://developer.mozilla.org/en-US/docs/Web/API/Canvas_API
[25]: https://developer.mozilla.org/en-US/docs/Web/API/ImageData
[26]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/ArrayBuffer
[27]: https://en.wikipedia.org/wiki/Endianness
[28]: https://opensource.com/sites/default/files/uploads/color_bits.png (Byte order for a pixel's color)
[29]: https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Rules
[30]: https://opensource.com/sites/default/files/uploads/count_neighbours.png (Coordinates of a cell's neighbors)
[31]: https://en.wikipedia.org/wiki/Torus
[32]: https://www.assemblyscript.org/peculiarities.html#annotations
[33]: https://www.assemblyscript.org/loader.html
[34]: https://opensource.com/sites/default/files/uploads/life.png (Game of Life result)
[35]: https://github.com/rottencandy/game-of-life-wasm
