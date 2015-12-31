import RPi.GPIO as GPIO ## Import GPIO library
import time ## Import 'time' library. Allows us to use 'sleep'

GPIO.setmode(GPIO.BOARD) ## Use board pin numbering
GPIO.setup(7, GPIO.OUT) ## Setup GPIO Pin 7 to OUT

speed = 0.8

##Define a function named Blink()
def Blink(speed):
	while True:## Run loop numTimes
		GPIO.output(7,True)## Switch on pin 7
		time.sleep(speed)## Wait
		GPIO.output(7,False)## Switch off pin 7
		time.sleep(speed)## Wait

## Start Blink() function. Convert user input from strings to numeric data types and pass to Blink() as parameters
Blink(float(speed))
