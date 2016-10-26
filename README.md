# Assistive Computing with Eye-tracking

The project aim was to create an interface which could be navigated upon using the eyes' movements alone.
The project was concerned towards enabling people with complete body paralysis give a tool of communication at a low cost. 

Software used : 

Matlab for image processing

HTML/CSS for front end creation
                
(Proposed scripting language : Python)

Hardware Used : 
 
Webcam(for image capture)

Raspberry Pi

Screen to display output using HDMI/VGI cable

The project uses the vision toolbox in matlab for facial feature and eye detection. Thus Viola-Jones Algorithm was used to detect the facial features.

Methodology adopted : 

Extract the face from the image using the vision toolbox

Convert the image into grayscale - This reduces the computational load increasing performance and making the code less complicated

Convert the image into binary - The algorithm developed adjusts according to lighting conditions for the user while image is being detected (For cases where very low light exists)

Track the eyeball in the image using simple X and Y axis and mapping the distance from the centre; whether left or right.


Developed By:
Anant Gupta

Aditya Kumar

With invaluable inputs from:

Prof P.V.S.S.R Chandramauli

VIT University, Vellore
