## Introduction to Skimr
Skimr is a series of scripts wrapping the Tesseract OCR Engine on a Mac OS.  Built for use as a boilerplate for transcribing typewritten text.  

Use this as a starting point for your own workflow, or feel free to lift components as needed.  This setup has the advantage of piping scans through ImageMagick first, allowing you to make tweaks to the image for the purposes of improved performance.  I used this step to clean up color scans of vintage books which had notable scan artifacts which otherwise reduced quality.



## Setup
In order to use this script you'll need to install Tesseract, instructions for that can be found here: https://tesseract-ocr.github.io/tessdoc/Installation.html

The associated tesseract documentation is also very helpful, you can access any of those commands by modifying the base tesseract call in `skimr.sh`

Then, in order to use the image quality improvements, you will need to install Image Magick, instructions here: https://imagemagick.org/script/download.php#macosx



## Using the Script
Once the pre-requisites are installed, you'll replace the sample.pdf file with any file(s) you would like to extract text from.

Then open a terminal window, navigate to the directory and call the script.  Once it completes the operation, you will find a `.txt` file with your extracted text in the `out` directory.  By default, this project comes with all of these sample files, but you can delete the `sample.txt` file and re-run it as a proof of concept.

Presently this script will iterate over each separate file and create a distinct txt file for each input.  In the future it might be useful if it accepted multi-page PDF's and extracted to a single txt file, or supported a parameterized option for extracting multiple input files to a single output.  Create an issue if you're interested.



## A Beginner's Intro
In some cases it's easier to list out what you'll need from the beginning.  These commands presume you have already gone through the Setup process above.

To use this, you'll need to clone this repository, by default it's set to run from your Documents folder, but feel free to set it up elsewhere.  Use the command below to get to that directory.
`cd ~/Documents`

Next you'll want to pull down the contents of this repository, you can do so with the command below.  If this is your first time using git, you may be prompted to install xcode and the like.
`git clone https://github.com/ubcs-io/skimr.git`

After that completes, you can access the project by changing to it with `cd skimr`

From within that directory, you'll be able to call the script using `sh skim.sh`

To access it again in the future you can drop new file(s) into the the `/in` folder from a Finder window, and then use the command `cd ~/Documents/skimr && sh skim.sh`, which will start by moving you to the directory and then execute the text extraction step.




## About the Config File
In the config.sh you should update the path to wherever you cloned this project.  If you cloned it to your documents directory, you shouldn't need to make any changes, however if you opted to place it elsewhere, you should update it accordingly.

If you plan to contribute changes to this repo, just avoid committing any changes to this file.