Translating by qhwdw
How to build a plotter with Arduino
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_Arduino_520x292.png?itok=joCojk4e)
Back in school, there was an HP plotter well hidden in a closet in the science department. I got to play with it for a while and always wanted to have one of my own. Fast forward many, many years. Stepper motors are easily available, I am back into doing stuff with electronics and micro-controllers, and I recently saw someone creating displays with engraved acrylic. This triggered me to finally build my own plotter.


![The plotter in action ][2]

The DIY plotter; see it in action in this [video][3].

As an old-school 5V guy, I really like the original [Arduino Uno][4]. Here's a list of the other components I used (fyi, I am not affiliated with any of these companies):

  * [FabScan shield][5]: Physically hosts the stepper motor drivers.
  * [SilentStepSticks][6]: Motor drivers, as the Arduino on its own can't handle the voltage and current that a stepper motor needs. I am using ones with a Trinamic TMC2130 chip, but in standalone mode for now. Those are replacements for the Pololu 4988, but allow for much quieter operation.
  * [SilentStepStick protectors][7]: Diodes that prevent the turning motor from frying your motor drivers (you want them, believe me).
  * Stepper motors: I selected NEMA 17 motors with 12V (e.g., models from [Watterott][8] and [SparkFun][9]).
  * [Linear guide rails][10]
  * Wooden base plate
  * Wood screws
  * GT2 belt
  * [GT2 timing pulley][11]



This is a work in progress that I created as a personal project. If you are looking for a ready-made kit, then check out the [MaXYposi][12] from German Make magazine.

### Hardware setup

As you can see here, I started out much too large. This plotter can't comfortably sit on my desk, but it's okay, as I did it for learning purposes (and, as I have to re-do some things, next time I'll use smaller beams).


![Plotter base plate with X-axis and Y-axis rails][14]

Plotter base plate with X-axis and Y-axis rails

The belt is mounted on both sides of the rail and then slung around the motor with some helper wheels:


![The belt routing on the motor][16]

The belt routing on the motor

I've stacked several components on top of the Arduino. The Arduino is on the bottom, above that is the FabScan shield, next is a StepStick protector on motor slots 1+2, and the SilentStepStick is on top. Note that the SCK and SDI pins are not connected.


![Arduino and Shield][18]

Arduino stack setup ([larger image][19])

Be careful to correctly attach the wires to the motor. When in doubt, look at the data sheet or an ohmmeter to figure out which wires belong together.

### Software setup

#### The basics

While software like [grbl][20] can interpret so-called G-codes for tool movement and other things, and I could have just flashed it to the Arduino, I am curious and wanted to better understand things. (My X-Y plotter software is available at [GitHub][21] and comes without any warranty.)

To drive a stepper motor with the StepStick (or compatible) driver, you basically need to send a high and then a low signal to the respective pin. Or in Arduino terms:
```
digitalWrite(stepPin, HIGH);

delayMicroseconds(30);

digitalWrite(stepPin, LOW);

```

Where `stepPin` is the pin number for the stepper: 3 for motor 1 and 6 for motor 2.

Before the stepper does any work, it must be enabled.
```
digitalWrite(enPin, LOW);

```

Actually, the StepStick knows three states for the pin:

  * Low: Motor is enabled
  * High: Motor is disabled
  * Pin not connected: Motor is enabled but goes into an energy-saving mode after a while



When a motor is enabled, its coils are powered and it keeps its position. It is almost impossible to manually turn its axis. This is good for precision purposes, but it also means that both motors and driver chips are "flooded" with power and will warm up.

And last, but not least, we need a way to determine the plotter's direction:
```
digitalWrite(dirPin, direction);

```

The following table lists the functions and the pins

Function Motor1 Motor2 Enable 2 5 Direction 4 7 Step 3 6

Before we can use the pins, we need to set them to `OUTPUT` mode in the `setup()` section of the code
```
pinMode(enPin1, OUTPUT);

pinMode(stepPin1, OUTPUT);

pinMode(dirPin1, OUTPUT);

digitalWrite(enPin1, LOW);

```

With this knowledge, we can easily get the stepper to move around:
```
    totalRounds = ...

    for (int rounds =0 ; rounds < 2*totalRounds; rounds++) {

       if (dir==0){ // set direction

         digitalWrite(dirPin2, LOW);

       } else {

         digitalWrite(dirPin2, HIGH);

       }

       delay(1); // give motors some breathing time

       dir = 1-dir; // reverse direction

       for (int i=0; i < 6400; i++) {

         int t = abs(3200-i) / 200;

         digitalWrite(stepPin2, HIGH);

         delayMicroseconds(70 + t);

         digitalWrite(stepPin2, LOW);

         delayMicroseconds(70 + t);

       }

    }

```

This will make the slider move left and right. This code deals with one stepper, but for an X-Y plotter, we have two axes to consider.

#### Command interpreter

I started to implement a simple command interpreter to use path specifications, such as:
```
"X30|Y30|X-30 Y-30|X-20|Y-20|X20|Y20|X-40|Y-25|X40 Y25

```

to describe relative movements in millimeters (1mm equals 80 steps).

The plotter software implements a _continuous mode_ , which allows a PC to feed large paths (in chunks) to the plotter. (This how I plotted the Hilbert curve in this [video][22].)

### Building a better pen holder

In the first image above, the pen was tied to the Y-axis with some metal string. This was not precise and also did not enable the software to raise and lower the hand (this explains the big black dots).

I have since created a better, more precise pen holder that uses a servo to raise and lower the pen. This new, improved holder can be seen in this picture and in the Hilbert curve video linked above.

![Servo to raise/lower the pen ][24]

Close-up view of the servo arm in the upper position raising the pen

The pen is attached with a little clamp (the one shown is a size 8 clamp typically used to attach cables to walls). The servo arm can raise the pen; when the arm goes down, gravity will lower the pen.

#### Driving the servo

Driving the servo is relatively straightforward: Just provide the position and the servo does all the work.
```
#include <Servo.h>



// Servo pin

#define servoData PIN_A1



// Positions

#define PEN_UP 10

#define PEN_DOWN 50



Servo penServo;



void setup() {

  // Attach to servo and raise pen

  penServo.attach(servoData);

  penServo.write(PEN_UP);

}

```

I am using the servo headers on the Motor 4 place of the FabScan shield, so I've used analog pin 1.

Lowering the pen is as easy as:
```
  penServo.write(PEN_DOWN);

```

### Next steps

One of my next steps will be to add some end detectors, but I may skip them and use the StallGuard mode of the TMC2130 instead. Those detectors can also be used to implement a `home` command.

And perhaps in the future I'll add a real Z-axis that can hold an engraver to do wood milling, or PCB drilling, or acrylic engraving, or ... (a laser comes to mind as well).

This was originally published on the [Some Things to Remember][25] blog and is reprinted with permission.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/diy-plotter-arduino

作者：[Heiko W.Rupp][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/pilhuhn
[1]:https://opensource.com/file/384786
[2]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/plotter-in-action.png?itok=q9oHrJGr (The plotter in action )
[3]:https://twitter.com/pilhuhn/status/948205323726344193
[4]:https://en.wikipedia.org/wiki/Arduino#Official_boards
[5]:http://www.watterott.com/de/Arduino-FabScan-Shield
[6]:http://www.watterott.com/de/SilentStepStick-TMC2130
[7]:http://www.watterott.com/de/SilentStepStick-Protector
[8]:http://www.watterott.com/de/Schrittmotor-incl-Anschlusskabel
[9]:https://www.sparkfun.com/products/9238
[10]:https://www.ebay.de/itm/CNC-Set-12x-600mm-Linearfuhrung-Linear-Guide-Rail-Stage-3D-/322917927292?hash=item4b2f68897c
[11]:http://www.watterott.com/de/OpenBuilds-GT2-2mm-Aluminium-Timing-Pulley
[12]:https://www.heise.de/make/artikel/MaXYposi-Projektseite-zum-universellen-XY-Portalroboter-von-Make-3676050.html
[13]:https://opensource.com/file/384776
[14]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/entire_plotter.jpg?itok=40iSEs5K (Plotter base plate with X-axis and Y-axis rails)
[15]:https://opensource.com/file/384791
[16]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/y_motor_detail.jpg?itok=SICJBdRv (The belt routing on the motor)
[17]:https://opensource.com/file/384771
[18]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/arduino_and_shield.jpg?itok=OFumhpJm
[19]:https://www.dropbox.com/s/7bp3bo5g2ujser8/IMG_20180103_110111.jpg?dl=0
[20]:https://github.com/gnea/grbl
[21]:https://github.com/pilhuhn/xy-plotter
[22]:https://twitter.com/pilhuhn/status/949737734654124032
[23]:/https://opensource.comfile/384781
[24]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pen_servo.jpg?itok=b2cnwB3P (Servo to raise/lower the pen )
[25]:http://pilhuhn.blogspot.com/2018/01/homegrown-xy-plotter-with-arduino.html
