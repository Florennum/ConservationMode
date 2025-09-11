# WELCOME!

# ConservationMode for Linux
A script for managing the so called **"Battery Conservation Mode"** for some Lenovo laptops!

# What is "Battery Conservation Mode"?
Simply we could call it battery protection. It prevents the battery from charging after it has reached 60%(or at least in my case). Thus extending the life of the battery(prevents overcharging).

# System requirements
**!!!(the script checks the current system requirements once ran)!!!**

Essentially you only need(I think) to have the `ideapad_laptop` module up and running

# How to install/download it
First we clone the repository with `git`
```sh
git clone https://github.com/Florennum/ConservationMode.git
```
We change the working directory to the clone
```sh
cd ConservationMode/
```
After that we give ourselves the execute permission
```sh
sudo chmod +x cm.sh
```

# How to use it
3 subcommands:

`on` - enables

`off` - disables

`status` - shows wether its disabled or enabled

Example usage(turning on):
```sh
./cm.sh on
```

# Encountering issues?
Report them in the [issue tracker.](https://github.com/Florennum/ConservationMode/issues)
