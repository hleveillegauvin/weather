# weather - Command-line weather tool for OS X using the openweathermap.org API

Weather is a simple command-line for weather tool OS X that uses the openweathermap.org API.

This GitHub repository contains the main program and its dependencies, along with the user manuals.

## Installation

### Installing dependencies
weather requires the following command-line tools to be installed:
* locateme : http://iharder.sourceforge.net/current/macosx/locateme/
* jq : http://stedolan.github.io/jq/
* figlet : http://www.figlet.org/

The simplest way to install these command-line tools is to use brew. To check if brew is installed on your computer, type the following command in a terminal:

    which brew

If the terminal replies with a line such as `/usr/local/bin/brew`, brew is installed and you are good to go. Otherwise, visit https://brew.sh/ for instructions.

Once brew is installed, type the following command in a terminal to install locateme, jq, and figlet:

```
brew install locateme
brew install jq
brew figlet
```

### Downloading the weather tool

To download the weather tool, use the green download button on the main repository page, or simply type the following commands in a terminal:

```
cd ~/Downloads # Go to downloads directory or wherever you want to install,
git clone --recursive https://github.com/hleveillegauvin/weather
```






