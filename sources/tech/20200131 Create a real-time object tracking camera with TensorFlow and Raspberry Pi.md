[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create a real-time object tracking camera with TensorFlow and Raspberry Pi)
[#]: via: (https://opensource.com/article/20/1/object-tracking-camera-raspberry-pi)
[#]: author: (Leigh Johnson https://opensource.com/users/leighjohnson)

Create a real-time object tracking camera with TensorFlow and Raspberry Pi
======
Get started with machine learning by building a portable computer vision
and motion tracking system on a budget.
![Vector, generic Raspberry Pi board][1]

Are you just getting started with machine/deep learning, TensorFlow, or Raspberry Pi?

I created [rpi-deep-pantilt][2] as an interactive demo of object detection in the wild, and in this article, I'll show you how to reproduce the video below, which depicts a camera panning and tilting to track my movement across a room.

![Real-time tracking setup][3]

Raspberry Pi 4GB, Pi Camera v2.1, Pimoroni Pan-Tilt HAT, Coral Edge TPU USB Accelerator

> I'm just a girl, standing in front of a tiny computer, reminding you most computing problems can be solved by sheer force of will. 💪
>
> MobileNetv3 + SSD [@TensorFlow][4] model I converted [#TFLite][5][#RaspberryPi][6] \+ [@pimoroni][7] pantilt hat, PID controller.
>
> Write-up soon! ✨ <https://t.co/v63KSJtJHO> [pic.twitter.com/dmyAlWCnWk][8]
>
> — Leigh (@grepLeigh) [November 28, 2019][9]

This article will cover:

  1. Build materials and hardware assembly instructions.
  2. Deploying a **TensorFlow Lite** object-detection model (**MobileNetV3-SSD**) to a **Raspberry Pi.**
  3. Sending tracking instructions to pan/tilt servo motors using a **proportional–integral–derivative (PID) controller.**
  4. Accelerating inferences of any **TensorFlow Lite** model with **Coral's USB Edge TPU Accelerator** and **Edge TPU Compiler**.



## Terms and references

  * **[Raspberry Pi][10]:** A small, affordable computer popular with educators, hardware hobbyists, and robot enthusiasts.

  * [**Raspbian**][11]**:** The Raspberry Pi Foundation's official operating system for the Pi. Raspbian is derived from Debian Linux.

  * [**TensorFlow**][12]**:** An open source framework for [dataflow][13] programming used for machine learning and deep neural learning.

  * [**TensorFlow Lite**][14]**:** An open source framework for deploying TensorFlow models on mobile and embedded devices.

  * **[Convolutional neural network][15]:** CNN is a type of neural network architecture that is well-suited for image classification and object detection tasks.

  * **[Single-shot detector][16]:** SSD is a type of CNN architecture specialized for real-time object detection, classification, and bounding box localization.

  * [**MobileNetV3**][17]**:** A state-of-the-art computer vision model optimized for performance on modest mobile phone processors.

  * [**MobileNetV3-SSD**][18]**:** An SSD based on MobileNet architecture. This tutorial will use MobileNetV3-SSD models available through [TensorFlow's object-detection model zoo][19].

![Comparison of computer vision neural networks][20]

Comparison of computer vision neural networks

  * [**Edge TPU**][21]**:** a tensor processing unit (TPU) is an integrated circuit for accelerating computations performed by TensorFlow. The Edge TPU was developed with a small footprint for mobile and embedded devices "at the edge."


![Cloud TPUv1][22] | ![Cloud TPUv2][23] | ![Edge TPUs][24]
---|---|---

## Build list

### Essential

  * [Raspberry Pi 4][25] (4GB recommended)
  * [Raspberry Pi Camera V2][26]
  * [Pimoroni Pan-Tilt HAT Kit][27]
  * MicroSD card (16GB or more)
  * Micro-HDMI cable



### Optional

  * [12" CSI/DSI ribbon for Raspberry Pi Camera][28]: The Pi Camera's stock cable is too short for the Pan-Tilt HAT's full range of motion.
  * [RGB NeoPixel Stick][29]: This component adds a consistent light source to your project.
  * [Coral Edge TPU USB Accelerator][30]: Accelerates inference (prediction) speed on the Raspberry Pi. You don't need this to reproduce the demo.



> _Looking for a project with fewer moving pieces? Check out [Portable Computer Vision: TensorFlow 2.0 on a Raspberry Pi][15] to create a hand-held image classifier._

## Set up the Raspberry Pi

There are two ways you can install Raspbian to your MicroSD card:

  1. [NOOBS][31] ("New Out Of Box Software") is a GUI operating system installation manager. If this is your first Raspberry Pi project, I'd recommend starting here.
  2. [Write the Raspbian image to an SD card][32].



This tutorial and supporting software were written using [Raspbian (Buster)][33]. If you're using a different version of Raspbian or another platform, you'll probably experience some pains.

Before proceeding, you'll need to:

  * [Connect your Pi to the internet][34]
  * [SSH into your Raspberry Pi][35]



## Install software

  1. Install system dependencies: [code]`$ sudo apt-get update && sudo apt-get install -y python3-dev libjpeg-dev libatlas-base-dev raspi-gpio libhdf5-dev python3-smbus`
```
2. Create a new project directory: [code]`$ mkdir rpi-deep-pantilt && cd rpi-deep-pantilt`
```
  3. Create a new virtual environment: [code]`$ python3 -m venv .venv`
```
4. Activate the virtual environment: [code]`$ source .venv/bin/activate && python3 -m pip install --upgrade pip`
```
  5. Install TensorFlow 2.0 from a community-built wheel: [code]`$ pip install https://github.com/leigh-johnson/Tensorflow-bin/blob/master/tensorflow-2.0.0-cp37-cp37m-linux_armv7l.whl?raw=true`
```
6. Install the **rpi-deep-pantilt** Python package: [code]`$ python3 -m pip install rpi-deep-pantilt`
```



## Assemble Pan-Tilt HAT hardware

If you purchased a pre-assembled Pan-Tilt HAT kit, you can skip to the next section. Otherwise, follow the steps in [Assembling Pan-Tilt HAT][36] before proceeding.

## Connect the Pi Camera

  1. Turn off the Raspberry Pi.
  2. Locate the camera module between the USB module and HDMI modules.
  3. Unlock the black plastic clip by (gently) pulling upward.
  4. Insert the camera module's ribbon cable (with metal connectors _facing away_ from the Ethernet/USB ports on a Raspberry Pi 4).
  5. Lock the black plastic clip.



![Getting started with the Pi Camera][37]

## Enable the Pi Camera

  1. Turn the Raspberry Pi on.
  2. Run **sudo raspi-config** and select **Interfacing Options** from the Raspberry Pi Software Configuration Tool's main menu. Press **Enter**.
![Raspberry Pi Software Configuration Tool][38]
  3. Select the **Enable Camera** menu option and press **Enter**.
![Enable Camera][39]
  4. In the next menu, use the Right arrow key to highlight **Enable** and press **Enter**.
![Enable Raspberry Pi Camera][40]



## Test the Pan-Tilt HAT

Next, test the installation and setup of your Pan-Tilt HAT module.

  1. SSH into your Raspberry Pi.
  2. Activate your virtual environment: [code]`source .venv/bin/activate`
```
3. Run: [code]`rpi-deep-pantilt test pantilt`
```
  4. Exit the test with **Ctrl**+**C**.



If you installed the HAT correctly, you should see both servos moving in a smooth sinusoidal motion while the test is running.

![Pan-Tilt HAT in motion][41]

## Test the Pi Camera

Next, verify that the Pi Camera is installed correctly by starting the camera's preview overlay. The overlay will render on the Pi's primary display (HDMI).

  1. Plug your Raspberry Pi into an HDMI screen.
  2. SSH into your Raspberry Pi.
  3. Activate your virtual environment: [code]`$ source .venv/bin/activate`
```
4. Run: [code]`$ rpi-deep-pantilt test camera`
```
  5. Exit the test with **Ctrl**+**C**.



If you installed the Pi Camera correctly, you should see footage from the camera rendered on your HDMI or composite display.

## Test object detection

Next, verify you can run an object-detection model (MobileNetV3-SSD) on your Raspberry Pi.

  1. SSH into your Raspberry Pi.
  2. Activate your Virtual Environment: [code]`$ source .venv/bin/activate`
```
3. Run: [code]`$ rpi-deep-pantilt detect`
```



Your Raspberry Pi should detect objects, attempt to classify them, and draw bounding boxes around them. **Note:** Only the following objects can be detected and tracked using the default MobileNetV3-SSD model.


```
$ rpi-deep-pantilt list-labels
[‘person’, ‘bicycle’, ‘car’, ‘motorcycle’, ‘airplane’, ‘bus’, ‘train’, ‘truck’, ‘boat’, ‘traffic light’, ‘fire hydrant’, ‘stop sign’, ‘parking meter’, ‘bench’, ‘bird’, ‘cat’, ‘dog’, ‘horse’, ‘sheep’, ‘cow’, ‘elephant’, ‘bear’, ‘zebra’, ‘giraffe’, ‘backpack’, ‘umbrella’, ‘handbag’, ‘tie’, ‘suitcase’, ‘frisbee’, ‘skis’, �