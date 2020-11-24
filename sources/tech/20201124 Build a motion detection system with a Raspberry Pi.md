[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a motion detection system with a Raspberry Pi)
[#]: via: (https://opensource.com/article/20/11/motion-detection-raspberry-pi)
[#]: author: (Lukas Janėnas https://opensource.com/users/lukasjan)

Build a motion detection system with a Raspberry Pi
======
Set up an inexpensive home security system to alert you when someone is
lurking around your house.
![Houses in a row][1]

If you want a home security system to tell you if someone is lurking around your property, you don't need an expensive, proprietary solution from a third-party vendor. You can set up your own system using a Raspberry Pi, a passive infrared (PIR) motion sensor, and an LTE modem that will send SMS messages whenever it detects movement.

### Prerequisites

You will need:

  * A Raspberry Pi with Ethernet connection and Raspberry Pi OS
  * An HC-SR501 PIR motion sensor
  * 1 red LED
  * 1 green LED
  * An LTE modem (I used the Teltonika [TRM240][2])
  * A SIM card



#### The PIR motion sensor

The PIR motion sensor will sense motion when something that emits infrared rays (e.g., a human, animal, or anything that emits heat) moves in the range of the sensor's field or reach. PIR motion sensors are low power and inexpensive, so they're used in many products that detect motion. They can't say how many people are in the area and how close they are to the sensor; they just detect motion.

![PIR sensor][3]

(Lukas Janenas, [CC BY-SA 4.0][4])

A PIR sensor has two potentiometers, one for setting the delay time and another for sensitivity. The delay time adjustment sets how long the output should remain high after detecting motion; it can be anywhere from five seconds to five minutes. The sensitivity adjustment sets the detection range, which can be anywhere from three to seven meters.

#### The LTE modem

Long-term evolution (LTE) is a standard for wireless broadband communication based on the GSM/EDGE and UMTS/HSPA technologies. The LTE modem I'm using is a USB device that can add 3G or 4G (LTE) cellular connectivity to a Raspberry PI computer. In this project, I'm not using the modem for cellular connectivity, but to send messages to my phone when motion is detected. I can control the modem with serial communication and AT commands; the latter send messages from the modem to my phone number.

![LTE modem][5]

(Lukas Janenas, [CC BY-SA 4.0][4])

### How to set up your home security system

#### Step 1: Install the software

First, install the necessary software on your Raspberry Pi. In the Raspberry Pi's terminal, enter:


```
`sudo apt install python3 python3-gpiozero python-serial -y`
```

#### Step 2: Set up the modem

Insert your SIM card into your LTE modem by following these [instructions][6] for the TRM240. Make sure to mount the antenna on the modem for a better signal.

#### Step 3: Connect the modem to the Raspberry Pi

Connect the LTE modem to one of the Raspberry Pi's USB ports, then wait for the device to boot up. You should see four new USB ports in the `/dev` directory. You can check them by executing this command in the terminal:


```
`ls /dev/ttyUSB*`
```

You should now see these devices:

![USB ports output][7]

(Lukas Janenas, [CC BY-SA 4.0][4])

You will use the **ttyUSB2** port to communicate with the device by sending AT commands.

#### Step 4: Connect the sensors to the Raspberry Pi

  1. **Connect the PIR sensor:**
Connect the **VCC** and **GND** pins to the respective pins on the Raspberry Pi, and connect the motion sensor's output pin to the **8 pin** on the Raspberry Pi. See below for a schematic on these connections, and you can learn more about [Raspberry Pi pin numbering][8] in the GPIO Zero docs.

  2. **Connect the LED lights:**
If you want indicator LEDs to light up when motion is detected, connect the cathode (short leg, flat side) of the LED to a ground pin; connect the anode (longer leg) to a current-limiting resistor; and connect the other side of the resistor to a GPIO pin (the limiting resistor can be placed either side of the LED). Connect the red LED to the **38 pin** on the board and the green LED to the **40 pin**.




Note that this step is optional. If you don't want indicator LEDs when motion is detected, delete the LED sections from the example code below.

![Raspberry Pi wiring diagram][9]

(Lukas Janenas, [CC BY-SA 4.0][4])

#### Step 5: Launch the program

Using the terminal (or any text editor), create a file named `motion_sensor.py`, and paste in the [example code][10] below.

Find and change these fields:

  * `phone_number`
  * `message`



If you used different pins to connect the sensors, make sure to change the code accordingly.

When everything is set and ready to go, start the program from the terminal by entering:


```
`python3 motion_sensor.py`
```

If you don't have the required privileges to start the program, try this command:


```
`sudo python3 motion_sensor.py`
```

![Motion sensor hardware][11]

(Lukas Janenas, [CC BY-SA 4.0][4])

### Example code


```
from gpiozero import MotionSensor, LED
from time import sleep, time
from sys import exit
import serial
import threading

# Raspberry Pi GPIO pin config
sensor = MotionSensor(14)
green = LED(21)
red = LED(20)

# Modem configuration
device = '/dev/ttyUSB2'
message = '&lt;message&gt;'
phone_number = '&lt;phone_number&gt;'
sms_timeout = 120 # min seconds between SMS messages

def setup():
    port.close()

    try:
        port.open()
    except serial.SerialException as e:
        print('Error opening device: ' + str(e))
        return False

    # Turn off echo mode
    port.write(b'ATE0 \r')
    if not check_response('OK', 10):
        print('Failed on ATE0')
        return False

    # Enter SMS text mode
    port.write(b'AT+CMGF=1 \r')
    if not check_response('OK', 6):
        print('Failed on CMGF')
        return False

    # Switch character set to 'international reference alphabet'
    # Note: this still doesn't support all characters
    port.write(b'AT+CSCS="IRA" \r')
    if not check_response('OK', 6):
        print('Failed on CSCS')
        return False

    return True

def check_response(string, amount):
    result = ''

    try:
        result = port.read(amount).decode()
    except:
        return False

    if not string in result:
        try:
            # Write 'ESC' to exit SMS input mode, just in case
            port.write(b'\x1B \r')
        except:
            return False

    return string in result

def send_sms():
    global currently_sending, last_msg_time
    currently_sending = True

    try:
        port.write('AT+CMGS="{}" \r'.format(phone_number).encode())
        if not check_response('&gt;', 6):
            print('Failed on CMGS')
            currently_sending = False
            return

        # Write the message terminated by 'Ctrl+Z' or '1A' in ASCII
        port.write('{}\x1A \r'.format(message).encode())

        while True:
            result = port.readline().decode()

            if 'OK' in result:
                print('&gt; SMS sent successfully')
                last_msg_time = time()
                currently_sending = False
                return

            if 'ERROR' in result:
                print('&gt; Failed to send SMS [{}]'.format(result.rstrip()))
                currently_sending = False
                return
    except:
        # Initiate setup if the got while the program was running
        setup()
        currently_sending = False

def on_motion():
    print('Motion detected!')
    green.off()
    red.on()

    if time() - last_msg_time &gt; sms_timeout and not currently_sending:
        print('&gt; Sending SMS...')
        threading.Thread(target=send_sms).start()

def no_motion():
    green.on()
    red.off()

print('* Setting up...')
green.on()
red.on()

port = serial.Serial()
port.port = device
port.baudrate = 115200
port.timeout = 2

last_msg_time = 0
currently_sending = False

if not setup():
    print('* Retrying...')
    if not setup():
        print('* Try restarting the modem')
        exit(1)

print('* Do not move, setting up the PIR sensor...')
sensor.wait_for_no_motion()

print('* Device ready! ', end='', flush=True)
green.on()
red.off()

sensor.when_motion = on_motion
sensor.when_no_motion = no_motion
input('Press Enter or Ctrl+C to exit\n\n')
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/motion-detection-raspberry-pi

作者：[Lukas Janėnas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lukasjan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/house_home_colors_live_building.jpg?itok=HLpsIfIL (Houses in a row)
[2]: https://teltonika-networks.com/product/trm240/
[3]: https://opensource.com/sites/default/files/uploads/pir-sensor.jpg (PIR sensor)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/modem.jpg (LTE modem)
[6]: https://wiki.teltonika-networks.com/view/TRM240_SIM_Card
[7]: https://opensource.com/sites/default/files/uploads/deviceoutput.png (USB ports output)
[8]: https://gpiozero.readthedocs.io/en/stable/recipes.html#pin-numbering
[9]: https://opensource.com/sites/default/files/uploads/wiring.png (Raspberry Pi wiring diagram)
[10]: tmp.4ePb9Wjuou#code
[11]: https://opensource.com/sites/default/files/uploads/motionssensorsetup.jpg (Motion sensor hardware)
