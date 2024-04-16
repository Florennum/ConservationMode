# WELCOME!

# ConservationMode for Linux
A script for managing the so called "Conservation Mode" for some Lenovo laptops!

# System requirements
!!!(the script checks the current system requirements once ran)!!!

You need to have the ideapad_laptop module loaded(and the firmware itself).

# How to install it
First we need to clone the repository, we will use git for that but you can use whatever you want as long as it works
```sh
git clone https://github.com/Florennum/ConservationMode.git
```
Then we change the working directory with
```sh
cd ConservationMode/
```
After that we get ourselves some permissions
```sh
sudo chmod +rwx cm.sh
```
And finally we execute
```sh
./cm.sh
```

# How to use it
You have 3 options:

on, off, status

example:
```sh
./cm.sh off
```
(turns off conservation)

I don't that there is a need for further explanation. 

# Encountering issues?
Report them in the [issue tracker.](https://github.com/Florennum/ConservationMode/issues)

# TODO LIST:
- Revision

- Make a bashrc importer
