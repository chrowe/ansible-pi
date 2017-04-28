# ansible-pi

![](https://raw.github.com/motdotla/ansible-pi/master/ansible-pi.jpg)

Quickly setup your Raspberry Pi - particularly WIFI settings and NodeRED.

## Requirements

### Hardware
1. A Raspberry Pi w/ associated power supply and SD card. 8GB recommended but 4GB should work.
2. USB wifi adaptor. I recommend the [TL-WN722N V2](http://www.tp-link.com/us/download/TL-WN722N.html)

### Software
1. [Ansible](http://www.ansible.com/) is required. The [offical docs](http://docs.ansible.com/ansible/intro_installation.html#latest-releases-on-mac-osx) suggest using pip. I used [Homebrew](https://brew.sh/) `brew install ansible`
2. Add an entry to your `~/.ssh/config` file
```
Host anewpi
    Hostname raspberrypi.local
    User pi
    StrictHostKeyChecking no
```

## Installation

1. Clone and setup the ansible script. 

  ```
  git clone https://github.com/chrowe/ansible-pi.git
  cd ansible-pi
  cp hosts.example hosts
  cp wpa_supplicant.conf.example wpa_supplicant.conf
  ```
  
2. Edit the `wpa_supplicant.conf`
  - Replace `your_wifi_sid` with the name of your wifi network
  - Replace `your_wifi_password` with the password for your wifi network

  
Note: You can `ping raspberrypi.local` if you want to get the IP address of your pi.

## Usage
### Setting up an new Pi
1. Create new sd card
  - I use [Etcher](https://etcher.io/) w/ latest [Raspian](https://www.raspberrypi.org/downloads/raspbian/) lite
  - `touch /Volumes/boot/ssh` //Enables ssh
2. Configure ssh and hostname so Ansible can connect
  - Run `./scripts/anewpi.sh` to login to the new pi.
  - Connect Pi to the network and power it up.
    - Note: If you get a message `paramiko: The authenticity of host 'raspberrypi.local' can't be established.` just type `yes` and hit enter to continue.
  - Note: You should now be logged into the Pi
  - Run `sudo raspi-config` and choose "2 Hostname" to set a new hostname for your Pi. You will be prompted to reboot.
  - Add the new hostname to `hosts`. for example
    ```
    [newname]
    newhostname.local
    ```
  - Test that everything is working
    - ssh `ssh pi@newhostname.local`
    - ansible ``
3. Run Ansible to setup everything else 
  - In `playbook.yml` change `hosts` to match the `newname` you just gave your Pi.
  - `ansible-playbook -i hosts playbook.yml`

## Accessing NodeRED

View `http://[newname]:1880/#` to see Node Red

## History

* Based on https://github.com/motdotla/ansible-pi
* Inspiration
  * https://opensource.com/life/16/2/cluster-computing-with-ansible-and-raspberry-pi
  * 
* Previous notes
  * https://gist.github.com/chrowe/fe8edd7553c678745f5f3ceff9a861a3
  * 


