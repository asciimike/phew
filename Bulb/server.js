var Firebase = require('firebase'),
    i2c = require('i2c');

var port = '/dev/i2c-1',
    address = 0x09;

var wire = new i2c(0x09, {device: port}); // Connect to RGB LED
wire.writeBytes(0x6f,[/* empty array */], i2cCallback); // Turn off LED script

/* Replace this with the name of your firebase */
var ref = new Firebase('https://<YOUR-FIREBASE-APP>.firebaseio.com');
ref.child('devices/phew_bulb').on('value', function(snapshot) {
  var color = snapshot.val();
  writeRGB(color.r | 0, color.g | 0, color.b | 0);
});

function writeRGB(red, green, blue) {
  wire.writeBytes(0x6e, [red, green, blue], i2cCallback);  
  console.log("R: " + red + " G: " + green + " B: " + blue);
}

function i2cCallback(error) {
  if (error) {
    console.log(error);
  }
}
