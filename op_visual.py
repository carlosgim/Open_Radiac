#!/usr/bin/env python

from easygui import *
import sys
import os

while 1:
	msgbox("Hello, welcome to OpenRadiac 1.0!")
	msg ="What do you want to do?"
	title = "Initial Stage"
        choices = buttonbox('Click on your favorite flavor.', 'Favorite Flavor', ('Run', 'Run Test', 'Install', 'Clear Installation'))

	# note that we convert choice to string, in case
	# the user cancelled the choice, and we got None.
	msgbox("You chose: " + str(choices), "Survey Result")

        if choices == "Run Test":
          output = os.system("./testoprad")
          print("Corriendo...")
          print output
          textbox(text="salida")
#          codebox(msg='', title='',text = os.system("./testoprad")
     
	msg = "Do you want to continue?"
	title = "Please Confirm"
	if ccbox(msg, title):     # show a Continue/Cancel dialog
		pass  # user chose Continue
	else:
		sys.exit(0)           # user chose Cancel
