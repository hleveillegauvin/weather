# weather - Command-line weather tool for OS X using the openweathermap.org API

Weather is a simple command-line for weather tool OS X that uses the openweathermap.org API.

This GitHub repository contains the main program and its dependencies, along with the user manuals.

## Installation

### Installing dependencies
The weather tool requires the following command-line tools to be installed:
* locateme : http://iharder.sourceforge.net/current/macosx/locateme/
* jq : http://stedolan.github.io/jq/
* figlet : http://www.figlet.org/

The simplest way to install these command-line tools is to use brew. To check if brew is installed on your computer, type the following command in a terminal:

    which brew

If the terminal replies with a line such as `/usr/local/bin/brew`, brew is installed and you are good to go. Otherwise, visit https://brew.sh/ for instructions.

Weather uses the public-domain command-line tool Locateme find your location (latitude, longitude, etc) using Apple's geolocation services. Once brew is installed, type the following command in a terminal to install locateme:

    brew install locateme

To see if the installation worked, simply type the following command in a terminal:

    locateme
    
If `locateme` was insalled properly, your current coordinates should be printed in your terminal. If you get an error message, it could be because Location Services are disabled on your Mac. To enabled Location services, go to System Preferences -> Security & Privacy -> Privacy. 

![instructions-locateme](https://github.com/hleveillegauvin/weather/blob/master/instructions_locateme.jpg)

Next, you'll need to install jq:

    brew install jq
    
Finally, the -v|-verbose option in the weather tool uses figlet to create the visual output. To install figlet, simply type the following command in a terminal:

    brew install figlet

### Downloading the weather tool

To download the weather tool, use the green download button on the main repository page, or simply type the following commands in a terminal:

```
cd ~/Downloads          # Go to downloads directory or wherever you want to download
git clone --recursive https://github.com/hleveillegauvin/weather
```

### Installing the weather tool

To install the weather tool, simply type the following commands in a terminal. First, assemble the city.list file and modify permissions for main script:

```
cd weather/weather-tool
chmod +x weather
chmod +x config.sh
cd ..
```

Second, copy the user manuals in the appropriate directory:

    cp weather.1 /usr/local/share/man/man1
    
Third, create a directory in `~/` for the tool:

    mkdir ~/weather-tool

Finally, copy the weather tool in the appropriate directory and update the bash_profile:

```
cp ./weather-tool/* ~/weather-tool
cd ~/weather-tool
curl -L "http://bulk.openweathermap.org/sample/city.list.json.gz" > "city.list.json.gz"
gunzip -fk "city.list.json.gz"
echo "export PATH=$PATH:~/weather-tool" >> ~/.bash_profile
source ~/.bash_profile
```

### Removing installation directory

Once the tool is installed, you can remove the installation directory by typing the following command in a terminal:

```
cd ~/Downloads          # Go to downloads directory or wherever you downloaded
rm -rf weather
```

## Setup

An API key is needed to use the weather tool. You can signup for an API key at: http://openweathermap.org/appid. After signing-up online, you’ll receive your API key by email.

The following command can be used to add your key (where you enter your own key):

    weather -k 6ff3595d244317ecf2a4a17976e7XXXX
    
To see which key is associated with the command:

    weather -k print

To remove key:

    weather -k remove    
    
## Usage

If no option is provided, outputs the current temperature in celcius. Uses locateme to determine current location based on Apple's geolocation services. 

		-c, --compact
				Print detailed information in csv format: city name, country, current 
				temperature,description,minimum temperature for the day,maximum 
				temperature for the day,pressure,humidity,wind speed. If both -c and -v 	
				are used, -c is ignored.
				
		-b action|argument, --bookmark action | argument
				Create, print, or remove bookmarks for favorite locations. 
				
						Possible argument:
						<bookmarkname>=<cityID>	:	Save new bookmark.
						
						Possible actions:
						print : Print list of all bookmarks.
						remove number : Remove bookmark based on line number.
					
		-h, --help
				Print a brief help message.
				
		-i argument, --id argument
				Print weather for specific city ID. If both -i and -l are used, -l is 
				ignored.
				
		-k action | argument, --key action | argument
				Add, print, or remove openweathermap.org API. API key is added as an 
				argument.
				
						Possible actions:
						print : Print API key.
						remove : Remove API key.
				
		-l argument, --location argument
				Print weather for specific city name. If no argument is provided, current 
				location is used. 
				
						Possible arguments:
						bookmarkname
						city,[2-letter ISO 3166 country code] : City name is required. Country code optional.
				
				If city name contains space, use " ". Country code must be 2-letter ISO 
				3166 format (https://en.wikipedia.org/wiki/ISO_3166-1). If both -i and -l 
				are used, -l is ignored. 
				
		-r, --raw
				Print unformatted json file. Can be used even if jq is not installed. When 
				-r option is used, options -c, -d, and -v are ignored
		
		-u, --unit
				Select preferred unit. Possible arguments: 
						kelvin,k,si	
						metric,m,celcius,c	
						imperial,i,fahrenheit,f
		
		-v, --verbose
				Print detailed information in graphic format. Figlet command required. If 
				both -c and -v are used, -c is ignored.

Refer to reference manual command for further details:

    man weather

## Examples

The following is how print current temperature based on Apple's
localisation:

	weather

By default, temperature is printed in C. The -u option can be used the
change to other systems:

	weather -u f

The most ambiguous way to search for a city is to used a cityID (a list of all cityID can be found at: http://openweathermap.org/help/city_list.txt):

	weather -i 4256038 -u f

You can also search by city name:

	weather -l paris

If many match are found, you'll be asked to select the cityID
corresponding to the city you are looking for. You can make more precise
queries a providing the 2-letter ISO 3166 country code:

	weather -l paris,ca

Bookmarks are used for favorite locations. To create a new bookmark:

	weather -b columbus=4509177

Bookmarks can be called anything:

	weather -b home=4509177

To use a bookmark:

	weather -l home

To see all bookmarks, numbered:

	weather -b print

To remove a bookmark based on its line number:

	weather -b remove 1
	
## Future plans

- [ ] Rewrite the code to make it fully functional on all platforms (currently uses locateme which only works on OS X)
- [ ] Rewrite the code so it doesn't depend on jq
- [ ] Add forecast option
- [ ] Add Twitter option to create tweet version of the output that could be piped to Twitterbot
- [ ] Create a brew package

## Contact details
Hubert Léveillé Gauvin

Email: leveillegauvin.1@osu.edu  
LinkedIn: [hleveillegauvin](https://www.linkedin.com/in/hubertleveillegauvin/)  
Twitter: [@hleveillegauvin](https://twitter.com/hleveillegauvin)  
