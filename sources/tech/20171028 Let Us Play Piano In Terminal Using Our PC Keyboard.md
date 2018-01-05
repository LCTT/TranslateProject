translating by lujun9972
Let Us Play Piano In Terminal Using Our PC Keyboard
======
Feel bored at work? Come on guys, let us play Piano! Yeah, you read it right. Who needs a real Piano? We can now play or learn how to play Piano from command line using our PC keyboard. Meet **Piano-rs** - a simple utility, written in Rust programming language, that allows you to play the Piano in Terminal using PC keyboard. It is free, open source and licensed under MIT license. You can use it on any operating systems that supports Rust.

### Piano-rs : Play Piano In Terminal Using Our PC Keyboard

#### Installation

Make sure your system have Rust programming language installed. If you haven't installed Rust already, run the following command to install it.
```
curl https://sh.rustup.rs -sSf | sh
```

The installer will ask whether you want to proceed the installation with default values or customize the installation or cancel the installation. I want to install it with default values, so I typed **1** (Number one).
```
info: downloading installer

Welcome to Rust!

This will download and install the official compiler for the Rust programming
language, and its package manager, Cargo.

It will add the cargo, rustc, rustup and other commands to Cargo's bin
directory, located at:

/home/sk/.cargo/bin

This path will then be added to your PATH environment variable by modifying the
profile files located at:

/home/sk/.profile
/home/sk/.bash_profile

You can uninstall at any time with rustup self uninstall and these changes will
be reverted.

Current installation options:

default host triple: x86_64-unknown-linux-gnu
 default toolchain: stable
 modify PATH variable: yes

1) Proceed with installation (default)
2) Customize installation
3) Cancel installation
**1**

info: syncing channel updates for 'stable-x86_64-unknown-linux-gnu'
223.6 KiB / 223.6 KiB (100 %) 215.1 KiB/s ETA: 0 s
info: latest update on 2017-10-12, rust version 1.21.0 (3b72af97e 2017-10-09)
info: downloading component 'rustc'
 38.5 MiB / 38.5 MiB (100 %) 459.3 KiB/s ETA: 0 s
info: downloading component 'rust-std'
 56.7 MiB / 56.7 MiB (100 %) 220.6 KiB/s ETA: 0 s
info: downloading component 'cargo'
 3.7 MiB / 3.7 MiB (100 %) 173.5 KiB/s ETA: 0 s
info: downloading component 'rust-docs'
 4.1 MiB / 4.1 MiB (100 %) 224.0 KiB/s ETA: 0 s
info: installing component 'rustc'
info: installing component 'rust-std'
info: installing component 'cargo'
info: installing component 'rust-docs'
info: default toolchain set to 'stable'

stable installed - rustc 1.21.0 (3b72af97e 2017-10-09)

Rust is installed now. Great!

To get started you need Cargo's bin directory ($HOME/.cargo/bin) in your PATH
environment variable. Next time you log in this will be done automatically.

To configure your current shell run source $HOME/.cargo/env
```

Log out or reboot your system to get updated the cargo's bin directory in your PATH variable.

Verify if Rust has been properly installed or not:
```
$ rustc --version
rustc 1.21.0 (3b72af97e 2017-10-09)
```

Great! Rust is installed successfully. It is time build piano-rs application.

Git clone the Piano-rs repository using the following command:
```
git clone https://github.com/ritiek/piano-rs
```

The above command will create a directory called "piano-rs" in the current working directory and download all contents in it. Change to that directory:
```
cd piano-rs
```

Finally, run the following command to build Piano-rs:
```
cargo build --release
```

The compiling process will take a while.

#### Usage

Once the compilation process finished, run the following command from **piano-rs** directory:
```
./target/release/piano-rs
```

Here is our Piano keyboard in Terminal! It is time play some notes. Press the keys to play the notes. Use **LEFT/RIGHT** arrow keys to adjust note frequency while playing. And, use **UP/Down** arrows to adjust note duration while playing.

[![][1]][2]

Piano-rs uses the same notes and key bindings as [**multiplayerpiano.com**][3]. Alternatively, use [**these notes**][4] to learn to play various popular songs.

To view the help section. type:
```
$ ./target/release/piano-rs -h
```
```
piano-rs 0.1.0
Ritiek Malhotra <ritiekmalhotra123@gmail.com>
Play piano in the terminal using PC keyboard.

USAGE:
 piano-rs [OPTIONS]

FLAGS:
 -h, --help Prints help information
 -V, --version Prints version information

OPTIONS:
 -c, --color <COLOR> Color of block to generate when a note is played (Default: "red")
 -d, --duration <DURATION> Duration to play each note for, where 0 means till the end of note (Default: 0)
 -s, --sequence <SEQUENCE> Frequency sequence from 0 to 5 to begin with (Default: 2)
```

I must admit that it is a super cool project. For those who couldn't afford to buy a Piano, use this application.

Have fun and happy weekend!!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/let-us-play-piano-terminal-using-pc-keyboard/

作者：[SK][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2017/10/Piano.png ()
[3]:http://www.multiplayerpiano.com/
[4]:https://pastebin.com/CX1ew0uB
