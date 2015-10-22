# Phew RGB Lightbulb, powered by Firebase
Phew, as in, "Phew, I'm glad that's done" is an easy (yes, easy, we promise) sample that demonstrates connecting an IoT device to an iOS app through [Firebase](www.firebase.com). You'll need a Firebase application, so if you don't have a Firebase account, [sign up for free](www.firebase.com/signup) right now!

This project was initially built for a tech talk entitled ["Simplifying IoT with Firebase"](http://www.meetup.com/NSLondon/events/225697907/) at [NSLondon](http://www.meetup.com/NSLondon/) on 22 October. Slides for this talk are available [here](https://github.com/mcdonamp/phew/blob/master/Simplifying%20IoT%20with%20Firebase%20(iOS).pdf).

## Hardware Needed
Phew was mostly built from parts lying around in my electronics box, but all the parts are inexpensive and redily available from your favorite online (electronics) retailer:

1. 1x Beaglebone (or RasPi, or similar)
2. 1x BlinkM I2C LED ([datasheet](https://thingm.com/fileadmin/thingm/downloads/BlinkM_datasheet.pdf))
3. 2x 4.7kOhm resistors
4. 4x long wires
5. 1x breadboard
6. 1x ping pong ball (to be used as a bulb diffuser)

Once you've got everything, wire it up like so:
![Fritzing wiring diagram for Phew Bulb](https://github.com/mcdonamp/phew/blob/master/Bulb/PhewBulb.png)

Instructions:

1. Connect Ground (BB Pin 1) to Ground (BlinkM Pin 1)
2. Connect Power (BB Pin 3) to Power (BlinkM Pin 2)
3. Connect SCL (BB Pin 19) to C (BlinkM Pin 4)
4. Connect SDA (BB Pin 20) to D (BlinkM Pin 3)
5. Add 4.7k resistors as [pull-ups](https://learn.sparkfun.com/tutorials/pull-up-resistors) (so wire them to Power) on SCL and SDA ([see why](https://learn.sparkfun.com/tutorials/i2c))
6. Cut a hole in the ping pong ball (careful!) and insert it over the LED

## Bulb Software Installation
Once you've got your circuit set up, you should SSH into your Beaglebone (or RasPi, etc.). Make sure it's got an internet connection, as well as has `git` set up. Do the following:

```
git clone git@github.com:mcdonamp/phew.git
cd phew/Bulb
npm install
```

Assuming everything went perfectly, you should now have everything ready to go for running your server by typing `node server.js`.

In the event that things errored out, you're likely having issues with your I2C (I know I did).

If you're on a Beaglebone, do the following to enable the second I2C port:
```
echo BB-I2C1 > /sys/devices/bone_capemgr.9/slots
```

Then follow the [Beaglebone setup instructions](https://www.npmjs.com/package/i2c#beaglebone) on the I2C node package then try again.

## App Software Installation
All of the code for the Phew App lives in `PhewApp`. Once you're there, run the following:
```
pod install
open PhewApp.xcworkspace
```

Then build and run on the simulator or your favorite iOS device :)

You can also [play with the App online](https://goo.gl/oWUNvx) via [Appetize.io](www.appetize.io).

## Questions, comments, contributions?
Contact me [@asciimike](www.twitter.com/asciimike) or mcdonald <at> firebase <dot> com to learn more about Firebase, IoT, iOS development, or with any burning questions you may have!
