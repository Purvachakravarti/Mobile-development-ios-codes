{\rtf1\ansi\ansicpg1252\cocoartf1404\cocoasubrtf340
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 Name: Purva Chakravarti\
CWID:802344432\
Email: purvachakravarti@csu.fullerton.edu\
\

\b Topic
\b0 : Height Measuring by camera IOS app\
\

\b Description:\

\b0 \
1.Requirements: This application needs an iPhone with\
	a. Gyroscope ability to get the angles\
	b. Camera to access for detecting the object to be measured\
	c. Works best in iOS 9.0 and above\
\
\
2. Application Logic flow:\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\qj\partightenfactor0
\cf0 	a.  This application first takes the height of the person holding the phone.\
	b. Then,it takes the angles depending on the gyroscope,that gives on clicking the plus sign 	     present on the app.\
	c.  It calculates the distance by using those angles using the formula of tan (theta) = (Height of 	     person)/distance where theta= (180 - (90 + angle obtained on click))\
	d. Once the distance is found the application finds the height but there are two cases 	     taken into account as follows:\
		Case 1: The object is shorter than the height of the person measuring it.\
		Case tackled as:  Using tan (theta) = (height of the remaining part)/distance\
		So the height of the object can be calculated as = height of person - height of the 		remaining.. Refer the figure 1 in the image format present inside the folder\
\
		Case 2: The object is bigger than the height of the person measuring it.\
		Case tackled as:  Using tan (theta) = (height of the remaining part)/distance\
		So the height of the object can be calculated as = height of person + height of the 		remaining.. Refer the figure 2 in the image format present inside the folder\
\
	Finally the height is calculated.\
\
	e. It uses the camera overlay to get the crosshair_1_violet.png, labels and the buttons on top 	of the 	camera view. Camera overlay is used basically to change the default view of camera.\
\
\
3. Limitation:\
	1. The object to be measured should be on the ground and the person should also be on the 	    ground standing erect.\
	2. The application works great when the height of the person is given absolutely correct.\
	3. The application has +/- metros error approximately.\
\
\
4. Instruction to be followed:\
1.Let the object to be measured is on the ground.\
2.Enter your height 12cm less than your actual height and click on ok.\
3.Keep your hand stable and click on plus pointing it to the bottom of the object.\
4.Similarly do the same for the top of the object.\
\
Result: 1. Distance between the person and object is calculated and displayed on the screen\
	 2. Height of the object  is calculated and displayed on the screen.\
\
There are two buttons in the bottom of the camera view called as \
1. \'93start over\'94 to go to the first page.\
2. \'93 What to do?\'94shows an alert to what to do when camera detects the object.\
\
\
\
\
\
\
\
\
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0
\cf0 		\
}