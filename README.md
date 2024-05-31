# RPI-HA-dashboard
Script and setup instructions for getting a functional RPI Home Assistant Dashboard.

Created and tested on Raspberry Pi OS 64-bit Bookworm.


## Dependencies
- Firefox
- Dotool *(Will be installed in the setup instructions)*
- Wayfile (Can be enabled in raspi-config -> Advanced Options -> Wayland)


## Setup instructions
### Prepare the environment file
To make sure that no secrets are published on GIT, we use a `.env` file instead to store the secrets.

An example `.env` file has been provided in the form of `.env.example`.

Simply make a copy of that file, call it `.env` and then edit the values to match your environment.



### Install Dotool
The kiosk mode of Firefox and Chromium are broken when using Wayfire at the time of writing, so we will use Dotool to automatically send key inputs.

1. Install the Dotool dependencies: `sudo apt install libxkbcommon-dev golang scdoc`
2. Clone the repository: `git clone https://git.sr.ht/~geb/dotool`
3. Enter the `dotool` directory: `cd dotool`
4. Compile and install Dotool: `./build.sh && sudo ./build.sh install`
5. Configure the udev rules: `sudo udevadm control --reload && sudo udevadm trigger`

And that should be it, you can try the following command to see if it works: 
```sh
echo type hello | dotool
```


### Update your `wayfire.ini` config
To make Wayfire automatically start the Dashboard on startup, we need to edit your `wayfire.ini`.

Open a terminal and run `nano ~/.config/wayfire.ini`.

Inside this file we need to add the following, please verify the path to make sure it also matches the location that you used.

```ini
[autostart]
open_ha_dashboard = $HOME/RPI-HA-dashboard/open_ha_dashboard.sh
```
