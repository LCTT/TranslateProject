[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Program the real world using Rust on Raspberry Pi)
[#]: via: (https://opensource.com/article/19/3/physical-computing-rust-raspberry-pi)
[#]: author: (Rahul Thakoor https://opensource.com/users/rahul27)

Program the real world using Rust on Raspberry Pi
======

rust_gpizero uses the Rust programming language to do physical computing on the Raspberry Pi.

![][1]

If you own a Raspberry Pi, chances are you may already have experimented with physical computing—writing code to interact with the real, physical world, like blinking some LEDs or [controlling a servo motor][2]. You may also have used [GPIO Zero][3], a Python library that provides a simple interface to GPIO devices from Raspberry Pi with a friendly Python API. GPIO Zero is developed by [Opensource.com][4] community moderator [Ben Nuttall][5].

I am working on [**rust_gpiozero**][6], a port of the awesome GPIO Zero library that uses the Rust programming language. It is still a work in progress, but it already includes some useful components.

[Rust][7] is a systems programming language developed at Mozilla. It is focused on performance, reliability, and productivity. The Rust website has [great resources][8] if you'd like to learn more about it.

### Getting started

Before starting with rust_gpiozero, it's smart to have a basic grasp of the Rust programming language. I recommend working through at least the first three chapters in [The Rust Programming Language][9] book.

I recommend [installing Rust][10] on your Raspberry Pi using [**rustup**][11]. Alternatively, you can set up a cross-compilation environment using [cross][12] (which works only on an x86_64 Linux host) or [this how-to][13].

After you've installed Rust, create a new Rust project by entering:

```
cargo new rust_gpiozero_demo
```

Add **rust_gpiozero** as a dependency (currently in v0.2.0) by adding the following to the dependencies section in your **Cargo.toml** file

```
rust_gpiozero = "0.2.0"
```

Next, blink an LED—the "hello world" of physical computing by modifying the **main.rs** file with the following:
```
use rust_gpiozero::*;
use std::thread;
use std::time::Duration;

fn main() {
    // Create a new LED attached to Pin 17
    let led = LED::new(17);

    // Blink the LED 5 times
    for  _ in  0.. 5{
       led.on();
        thread::sleep(Duration::from_secs(1));
        led.off();
        thread::sleep(Duration::from_secs(1));
    }
}
```

rust_gpiozero provides an easier interface for blinking an LED. You can use the blink method, providing the number of seconds it should stay on and off. This simplifies the code to the following:
```
use rust_gpiozero::*;
fn main() {
    // Create a new LED attached to Pin 17
    let mut led = LED::new(17);

    // on_time = 2 secs, off_time=3 secs
    led.blink(2.0,3.0);

    // prevent program from exiting immediately
    led.wait();
}
```

### Other components

rust_gpiozero provides several components that are similar to GPIO Zero for controlling output and input devices. These include [LED][14], [Buzzer][15], [Motor][16], Pulse Width Modulation LED ([PWMLED][17]), [Servo][18], and [Button][19].

Support for other components, sensors, and devices will be added eventually. You can refer to the [documentation][20] for further usage information.

### More resources

rust_gpiozero is still a work in progress. If you need more resources for getting started with Rust on your Raspberry Pi, here are some useful links:

#### Raspberry Pi Peripheral Access Library (RPPAL)

Similar to GPIO Zero, which is based on the [RPi.GPIO][21] library, rust_gpiozero builds upon the awesome **[RPPAL][22]** library by [Rene van der Meer][23]. If you want more control for your projects using Rust, you should definitely try RPPAL. It has support for GPIO, Inter-Integrated Circuit (I 2C), hardware and software Pulse Width Modulation (PWM), and Serial Peripheral Interface (SPI). Universal asynchronous receiver-transmitter (UART) support is currently in development.

#### Sense HAT support

**[Sensehat-rs][24]** is a library by [Jonathan Pallant][25] ([@therealjpster][26]) that provides Rust support for the Raspberry Pi [Sense HAT][27] add-on board. Jonathan also has a [starter workshop][28] for using the library and he wrote a beginner's intro to use Rust on Raspberry Pi, "Read Sense HAT with Rust," in [Issue 73 of _The MagPi_][29] magazine.

### Wrap Up

Hopefully, this has inspired you to use the Rust programming language for physical computing on your Raspberry Pi. rust_gpiozero is a library which provides useful components such as LED, Buzzer, Motor, PWMLED, Servo, and Button. More features are planned and you can follow me on [twitter][30] or check out [my blog][31] to stay tuned.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/physical-computing-rust-raspberry-pi

作者：[Rahul Thakoor][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003784_02_os.comcareers_os_rh2x.png?itok=jbRfXinl
[2]: https://projects.raspberrypi.org/en/projects/grandpa-scarer/4
[3]: https://gpiozero.readthedocs.io/en/stable/#
[4]: http://Opensource.com
[5]: https://opensource.com/users/bennuttall
[6]: https://crates.io/crates/rust_gpiozero
[7]: https://www.rust-lang.org/
[8]: https://www.rust-lang.org/learn
[9]: https://doc.rust-lang.org/book/
[10]: https://www.rust-lang.org/tools/install
[11]: https://rustup.rs/
[12]: https://github.com/rust-embedded/cross
[13]: https://github.com/kunerd/clerk/wiki/How-to-use-HD44780-LCD-from-Rust#setting-up-the-cross-toolchain
[14]: https://docs.rs/rust_gpiozero/0.2.0/rust_gpiozero/output_devices/struct.LED.html
[15]: https://docs.rs/rust_gpiozero/0.2.0/rust_gpiozero/output_devices/struct.Buzzer.html
[16]: https://docs.rs/rust_gpiozero/0.2.0/rust_gpiozero/output_devices/struct.Motor.html
[17]: https://docs.rs/rust_gpiozero/0.2.0/rust_gpiozero/output_devices/struct.PWMLED.html
[18]: https://docs.rs/rust_gpiozero/0.2.0/rust_gpiozero/output_devices/struct.Servo.html
[19]: https://docs.rs/rust_gpiozero/0.2.0/rust_gpiozero/input_devices/struct.Button.html
[20]: https://docs.rs/rust_gpiozero/
[21]: https://pypi.org/project/RPi.GPIO/
[22]: https://github.com/golemparts/rppal
[23]: https://twitter.com/golemparts
[24]: https://crates.io/crates/sensehat
[25]: https://github.com/thejpster
[26]: https://twitter.com/therealjpster
[27]: https://www.raspberrypi.org/products/sense-hat/
[28]: https://github.com/thejpster/pi-workshop-rs/
[29]: https://www.raspberrypi.org/magpi/issues/73/
[30]: https://twitter.com/rahulthakoor
[31]: https://rahul-thakoor.github.io/
