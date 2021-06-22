[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Expand your Raspberry Pi with Arduino ports)
[#]: via: (https://opensource.com/article/20/7/arduino-raspberry-pi)
[#]: author: (Patrick Martins de Lima https://opensource.com/users/pattrickx)

Expand your Raspberry Pi with Arduino ports
======
For this project, explore Raspberry Pi port expansions using Java,
serial, and Arduino.
![Parts, modules, containers for software][1]

As members of the maker community, we are always looking for creative ways to use hardware and software. This time, [Patrick Lima][2] and I decided we wanted to expand the Raspberry Pi's ports using an Arduino board, so we could access more functionality and ports and add a layer of protection to the device. There are a lot of ways to use this setup, such as building a solar panel that follows the sun, a home weather station, joystick interaction, and more.

We decided to start by building a dashboard that allows the following serial port interactions:

  * Control three LEDs to turn them on and off
  * Control three LEDs to adjust their light intensity
  * Identify which ports are being used
  * Show input movements on a joystick
  * Measure temperature



We also want to show all the interactions between ports, hardware, and sensors in a nice user interface (UI) like this:

![UI dashboard][3]

(Bruno Muniz, [CC BY-SA 4.0][4])

You can use the concepts in this article to build many different projects that use many different components. Your imagination is the limit!

### 1\. Get started

![Raspberry Pi and Arduino logos][5]

(Bruno Muniz, [CC BY-SA 4.0][4])

The first step is to expand the Raspberry Pi's ports to also use Arduino ports. This is possible using Linux ARM's native serial communication implementation that enables you to use an Arduino's digital, analogical, and Pulse Width Modulation (PWM) ports to run an application on the Raspberry Pi.

This project uses [TotalCross][6], an open source software development kit for building UIs for embedded devices, to execute external applications through the terminal and use the native serial communication. There are two classes you can use to achieve this: [Runtime.exec][7] and [PortConnector][8]. They represent different ways to execute these actions, so we will show how to use both in this tutorial, and you can decide which way is best for you.

To start this project, you need:

  * 1 Raspberry Pi 3
  * 1 Arduino Uno
  * 3 LEDs
  * 2 resistors between 1K and 2.2K ohms
  * 1 push button
  * 1 potentiometer between 1K and 50K ohms
  * 1 protoboard (aka breadboard)
  * Jumpers



### 2\. Set up the Arduino

Create a communication protocol to receive messages, process them, execute the request, and send a response between the Raspberry Pi and the Arduino. This is done on the Arduino.

#### 2.1 Define the message format

Every message received will have the following format:

  * Indication of the function called
  * Port used
  * A char separator, if needed
  * A value to be sent, if needed
  * Indication of the message's end



The following table presents the list of characters with their respective functions, example values, and descriptions of the example. The choice of characters used in this example is arbitrary and can be changed anytime.

Characters | Function | Example | Description of the example
---|---|---|---
* | End of the instruction | - | -
, | Separator | - | -
# | Set mode | #8,0* | Pin 8 input mode
&lt; | Set digital value | &lt;1,0* | Set pin 1 low
&gt; | Get digital value | &gt;13* | Get value pin 13
+ | Get PWM value | +6,250* | Set pin 6 value 250
- | Get analogic value | -14* | Get value pin A0

#### 2.2 Source code

The following source code implements the communication protocol specified above. It must be sent to the Arduino, so it can interpret and execute messages' commands:


```
void setup() {
 Serial.begin(9600);
 Serial.println("Connected");
 Serial.println("Waiting command...");
}

void loop() {
String text="";
char character;
String pin="";
String value="0";
char separator='.';
char inst='.';

 while(Serial.available()){ // verify RX is getting data
   delay(10);
   character= Serial.read();
   if(character=='*'){
     action(inst,pin,value);
     break;
    }
    else {
     text.concat(character);}

   if(character==',') {
     separator=character;
   
   if(inst=='.'){
     inst = character;}
   else if(separator!=',' &amp;&amp; character!=inst ){
     pin.concat(character);}
   else if (character!=separator &amp;&amp; character!=inst ){
     value.concat(character);}
 }
}

void action(char instruction, String pin, String value){
 if (instruction=='#'){//pinMode
   pinMode(pin.toInt(),value.toInt());
 }

 if (instruction=='&lt;'){//digitalWrite
   digitalWrite(pin.toInt(),value.toInt());
 }

 if (instruction=='&gt;'){ //digitalRead
   String aux= pin+':'+String(digitalRead(pin.toInt()));
   Serial.println(aux);
 }

 if (instruction=='+'){ // analogWrite = PWM
   analogWrite(pin.toInt(),value.toInt());
 }

 if (instruction=='-'){ // analogRead
   String aux= pin+':'+String(analogRead(pin.toInt()));
   Serial.println(aux);
 }
}
```

#### 2.3 Build the electronics

Define what you need to test to check communication with the Arduino and ensure the inputs and outputs are responding as expected:

  * LEDs are connected with positive logic. Connect to the GND pin through a resistor and activate it with the digital port I/O 2 and PWM 3.
  * The button has a pull-down resistor connected to the digital port I/O 4, which sends a signal of 0 if not pressed and 1 if pressed.
  * The potentiometer is connected with the central pin to the analog input A0 with one of the side pins on the positive and the other on the negative.



![Connecting the hardware][9]

(Bruno Muniz, [CC BY-SA 4.0][4])

#### 2.4 Test communications

Send the code in section 2.2 to the Arduino. Open the serial monitor and check the communication protocol by sending the commands below:


```
#2,1*&lt;2,1*&gt;2*
#3,1*+3,10*
#4,0*&gt;4*
#14,0*-14*
```

This should be the result in the serial monitor:

![Testing communications in Arduino][10]

(Bruno Muniz, [CC BY-SA 4.0][4])

One LED on the device should be on at maximum intensity and the other at a lower intensity.

![LEDs lit on board][11]

(Bruno Muniz, [CC BY-SA 4.0][4])

Pressing the button and changing the position of the potentiometer when sending reading commands will display different values. For example, turn the potentiometer to the positive side and press the button. With the button still pressed, send the commands:


```
&gt;4*
-14*
```

Two lines should appear:

![Testing communications in Arduino][12]

(Bruno Muniz, [CC BY-SA 4.0][4])

### 3\. Set up the Raspberry Pi

Use a Raspberry Pi to access the serial port via the terminal using the `cat` command to read the entries and the `echo` command to send the message.

#### 3.1 Do a serial test

Connect the Arduino to one of the USB ports on the Raspberry Pi, open the terminal, and execute this command:


```
`cat /dev/ttyUSB0 9600`
```

This will initiate the connection with the Arduino and display what is returned to the serial.

![Testing serial on Arduino][13]

(Bruno Muniz, [CC BY-SA 4.0][4])

To test sending commands, open a new terminal window (keeping the previous one open), and send this command:


```
`echo "command" > /dev/ttyUSB0 9600`
```

You can send the same commands used in section 2.4.

You should see feedback in the first terminal along with the same result you got in section 2.4:

![Testing serial on Arduino][14]

(Bruno Muniz, [CC BY-SA 4.0][4])

### 4\. Create the graphical user interface

The UI for this project will be simple, as the objective is just to show the ports expansion using the serial. Another article will use TotalCross to create a high-quality GUI for this project and start the application backend (working with sensors), as shown in the dashboard image at the top of this article.

This first part uses two UI components: a Listbox and an Edit. These build a connection between the Raspberry Pi and the Arduino and test that everything is working as expected.

Simulate the terminal where you put the commands and watch for answers:

  * Edit is used to send messages. Place it at the bottom with a FILL width that extends the component to the entire width of the screen.
  * Listbox is used to show results, e.g., in the terminal. Add it at the TOP position, starting at the LEFT side, with a width equal to Edit and a FIT height to vertically occupy all space not filled by Edit.




```
package com.totalcross.sample.serial;

import totalcross.sys.Settings;
import totalcross.ui.Edit;
import totalcross.ui.ListBox;
import totalcross.ui.MainWindow;
import totalcross.ui.gfx.Color;

public class SerialSample extends MainWindow {
   ListBox Output;
   Edit Input;
   public SerialSample() {
       setUIStyle(Settings.MATERIAL_UI);
   }

   @Override
   public void initUI() {
       Input = new Edit();
       add(Input, LEFT, BOTTOM, FILL, PREFERRED);
       Output = new ListBox();
       Output.setBackForeColors([Color][15].BLACK, [Color][15].WHITE);
       add(Output, LEFT, TOP, FILL, FIT);
   }
}
```

It should look like this:

![UI][16]

(Bruno Muniz, [CC BY-SA 4.0][4])

### 5\. Set up serial communication

As stated above, there are two ways to set up serial communication: Runtime.exec and PortConnector.

#### 5.1 Option 1: Use Runtime.exec

The `java.lang.Runtime` class allows the application to create a connection interface with the environment where it is running. It allows the program to use the Raspberry Pi's native serial communication.

Use the same commands you used in section 3.1, but now use the Edit component on the UI to send the commands to the device.

##### Read the serial

The application must constantly read the serial, and if a value is returned, add it to the Listbox using threads. Threads are a great way to work with processes in the background without blocking user interaction.

The following code creates a new process on this thread that executes the `cat` command, tests the serial, and starts an infinite loop to check if something new is received. If something is received, the value is added to the next line of the Listbox component. This process will continue to run as long as the application is running:


```
new [Thread][17] () {
   @Override
   public void run() {
       try {
           [Process][18] Runexec2 = [Runtime][19].getRuntime().exec("cat /dev/ttyUSB0 9600\n");
           LineReader lineReader = new LineReader(Stream.asStream(Runexec2.getInputStream()));
           [String][20] input;
         
           while (true) {
               if ((input = lineReader.readLine()) != null) {
                   Output.add(input);
                   Output.selectLast();
                   Output.repaintNow();
               }
           }
         } catch ([IOException][21] ioe) {
            ioe.printStackTrace();
         }
       }
   }.start();
}
```

##### Send commands

Sending commands is a simpler process. It happens whenever you press **Enter** on the Edit component.

To forward the commands to the device, as shown in section 3.1, you must instantiate a new terminal. For that, the Runtime class must execute a `sh` command on Linux:


```
try{
   Runexec = [Runtime][19].getRuntime().exec("sh").getOutputStream()        }catch ([IOException][21] ioe) {
   ioe.printStackTrace();
}
```

After the user writes the command in Edit and presses **Enter**, the application triggers an event that executes the `echo` command with the value indicated in Edit:


```
Input.addKeyListener(new [KeyListener][22]() {

   @Override
   public void specialkeyPressed([KeyEvent][23] e) {
       if (e.key == SpecialKeys.ENTER) {
           [String][20] s = Input.getText();
           Input.clear();
           try {
               Runexec.write(("echo \"" + s + "\" &gt; /dev/ttyUSB0 9600\n").getBytes());
           } catch ([IOException][21] ioe) {
           ioe.printStackTrace();
           }
       }
   }

   @Override
   public void keyPressed([KeyEvent][23] e) {} //auto-generate code
   @Override
   public void actionkeyPressed([KeyEvent][23] e) {} //auto-generate code
});
```

Run the application on the Raspberry Pi with the Arduino connected and send the commands for testing. The result should be:

![Testing application running on Raspberry Pi][24]

(Bruno Muniz, [CC BY-SA 4.0][4])

##### Runtime.exec source code

Following is the source code with all parts explained. It includes the thread that will read the serial on line 31 and the `KeyListener` that will send the commands on line 55:


```
package com.totalcross.sample.serial;
import totalcross.ui.MainWindow;
import totalcross.ui.event.KeyEvent;
import totalcross.ui.event.KeyListener;
import totalcross.ui.gfx.Color;
import totalcross.ui.Edit;
import totalcross.ui.ListBox;
import java.io.IOException;
import java.io.OutputStream;
import totalcross.io.LineReader;
import totalcross.io.Stream;
import totalcross.sys.Settings;
import totalcross.sys.SpecialKeys;

public class SerialSample extends MainWindow {
   [OutputStream][25] Runexec;
   ListBox Output;

   public SerialSample() {
       setUIStyle(Settings.MATERIAL_UI);
   }

   @Override
   public void initUI() {
       Edit Input = new Edit();
       add(Input, LEFT, BOTTOM, FILL, PREFERRED);
       Output = new ListBox();
       Output.setBackForeColors([Color][15].BLACK, [Color][15].WHITE);
       add(Output, LEFT, TOP, FILL, FIT);
       new [Thread][17]() {
           @Override
           public void run() {
               try {
                   [Process][18] Runexec2 = [Runtime][19].getRuntime().exec("cat /dev/ttyUSB0 9600\n");
                   LineReader lineReader = new
                   LineReader(Stream.asStream(Runexec2.getInputStream()));
                   [String][20] input;

                   while (true) {
                       if ((input = lineReader.readLine()) != null) {
                           Output.add(input);
                           Output.selectLast();
                           Output.repaintNow();
                       }
                   }

               } catch ([IOException][21] ioe) {
                   ioe.printStackTrace();
               }
           }
       }.start();

       try {
           Runexec = [Runtime][19].getRuntime().exec("sh").getOutputStream();
       } catch ([IOException][21] ioe) {
           ioe.printStackTrace();
       }

       Input.addKeyListener(new [KeyListener][22]() {
           @Override
           public void specialkeyPressed([KeyEvent][23] e) {
               if (e.key == SpecialKeys.ENTER) {
                   [String][20] s = Input.getText();
                   Input.clear();
                   try {
                       Runexec.write(("echo \"" + s + "\" &gt; /dev/ttyUSB0 9600\n").getBytes());
                   } catch ([IOException][21] ioe) {
                       ioe.printStackTrace();
                   }
               }
           }

           @Override
           public void keyPressed([KeyEvent][23] e) {
           }
           @Override
           public void actionkeyPressed([KeyEvent][23] e) {
           }
      });
   }
}
```

#### 5.2 Option 2: Use PortConnector

PortConnector is specifically for working with serial communication. If you want to follow the original example, you can skip this section, as the intention here is to show another, easier way to work with serial.

Change the original source code to work with PortConnector:


```
package com.totalcross.sample.serial;
import totalcross.io.LineReader;
import totalcross.io.device.PortConnector;
import totalcross.sys.Settings;
import totalcross.sys.SpecialKeys;
import totalcross.ui.Edit;
import totalcross.ui.ListBox;
import totalcross.ui.MainWindow;
import totalcross.ui.event.KeyEvent;
import totalcross.ui.event.KeyListener;
import totalcross.ui.gfx.Color;

public class SerialSample extends MainWindow {
   PortConnector pc;
   ListBox Output;

   public SerialSample() {
       setUIStyle(Settings.MATERIAL_UI);
   }

   @Override
   public void initUI() {
       Edit Input = new Edit();
       add(Input, LEFT, BOTTOM, FILL, PREFERRED);
       Output = new ListBox();
       Output.setBackForeColors([Color][15].BLACK, [Color][15].WHITE);
       add(Output, LEFT, TOP, FILL, FIT);
       new [Thread][17]() {
           @Override
           public void run() {
               try {
                   pc = new PortConnector(PortConnector.USB, 9600);
                   LineReader lineReader = new LineReader(pc);
                   [String][20] input;
                   while (true) {
                       if ((input = lineReader.readLine()) != null) {
                           Output.add(input);
                           Output.selectLast();
                           Output.repaintNow();
                       }
                   }
               } catch (totalcross.io.[IOException][21] ioe) {
                   ioe.printStackTrace();
               }
           }
       }.start();
       Input.addKeyListener(new [KeyListener][22]() {
           @Override
           public void specialkeyPressed([KeyEvent][23] e) {
               if (e.key == SpecialKeys.ENTER) {
                   [String][20] s = Input.getText();
                   Input.clear();
                   try {
                       pc.writeBytes(s);
                   } catch (totalcross.io.[IOException][21] ioe) {
                       ioe.printStackTrace();
                   }
               }
           }

           @Override
           public void keyPressed([KeyEvent][23] e) {
           }

           @Override
           public void actionkeyPressed([KeyEvent][23] e) {
           }
      });
  }
}
```

You can find all the code in the [project's repository][26].

### 6\. Next steps

This article shows how to use Raspberry Pi serial ports with Java by using either the Runtime or PortConnector classes. You can also call external files in other languages and create countless other projects—like a water quality monitoring system for an aquarium with temperature measurement via the analog inputs, or a chicken brooder with temperature and humidity regulation and a servo motor to rotate the eggs.

A future article will use the PortConnector implementation (because it is focused on serial connection) to finish the communications with all sensors. It will also add a digital input and complete the UI.

Here are some references for more reading:

  * [Get started with TotalCross][27]
  * [TotalCross PortConnector class][8]
  * [Running C++ applications with TotalCross][7]
  * [VSCode TotalCross Project Extension plugin][28]



After you connect your Arduino and Raspberry Pi, please leave comments below with your results. We'd love to read them!

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/arduino-raspberry-pi

作者：[Patrick Martins de Lima][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pattrickx
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/containers_modules_networking_hardware_parts.png?itok=rPpVj92- (Parts, modules, containers for software)
[2]: https://github.com/pattrickx
[3]: https://opensource.com/sites/default/files/uploads/gui-dashboard.png (UI dashboard)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/raspberrypi_arduino.png (Raspberry Pi and Arduino logos)
[6]: https://totalcross.com/
[7]: https://learn.totalcross.com/documentation/guides/running-c++-applications-with-totalcross
[8]: https://rs.totalcross.com/doc/totalcross/io/device/PortConnector.html
[9]: https://opensource.com/sites/default/files/uploads/connecting-electronics.png (Connecting the hardware)
[10]: https://opensource.com/sites/default/files/uploads/communication-test-result.png (Testing communications in Arduino)
[11]: https://opensource.com/sites/default/files/uploads/leds.jpg (LEDs lit on board)
[12]: https://opensource.com/sites/default/files/uploads/communication-test-result2.png (Testing communications in Arduino)
[13]: https://opensource.com/sites/default/files/uploads/serial-test.png (Testing serial on Arduino)
[14]: https://opensource.com/sites/default/files/uploads/serial-test2.png (Testing serial on Arduino)
[15]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+color
[16]: https://opensource.com/sites/default/files/uploads/ui_0.png (UI)
[17]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+thread
[18]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+process
[19]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+runtime
[20]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+string
[21]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+ioexception
[22]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+keylistener
[23]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+keyevent
[24]: https://opensource.com/sites/default/files/uploads/test-commands.png (Testing application running on Raspberry Pi)
[25]: http://www.google.com/search?hl=en&q=allinurl%3Adocs.oracle.com+javase+docs+api+outputstream
[26]: https://github.com/pattrickx/TotalCrossSerialCommunication
[27]: https://learn.totalcross.com/documentation/get-started/
[28]: https://marketplace.visualstudio.com/items?itemName=Italo.totalcross
