# WELCOME TO THE MAIN BRANCH!(THE GENERAL COMMANDS LIKE SCHEME)
FAQ:
Q:Why is there a legacy branch?

A:The legacy branch uses the old scheme of doing things. For example when you execute the script you are in lets say a "manager mode" and in there you can use the options until you exit.


Q:Wait, why did u decide to make this the main branch?

A1: Because I can.

A2: Because i like the new scheme more than the old one.

# ConservationMode for Linucs/Linux
A script for conservation mode on Lenovo laptops

# System requirements(subject to change)
!!!(the script checks the current system requirements once ran)!!!

You need to have the ideapad_laptop module loaded

A laptop that supports conservation mode


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
sudo chmod +rwx conservation_mode.sh
```
And finally we execute
```sh
./conservation_mode.sh
```

# How to use it
You have 4 options

--status, --enable, --disable

example:
```sh
./conservation_mode.sh --enable
```

I don't think that I need to explain to you how to use these.

# Encountering issues?
Report them in the [issue tracker.](https://github.com/Florennum/ConservationMode/issues)

# TODO LIST:
Expand the script, make it more beautiful

Make a bashrc importer
