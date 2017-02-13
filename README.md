# ansible-pi

![](https://raw.github.com/motdotla/ansible-pi/master/ansible-pi.jpg)

Quickly setup your Raspberry Pi - particularly WIFI settings.

## Installation

1. Clone and setup the ansible script. 

  ```
  git clone https://github.com/motdotla/ansible-pi.git
  cd ansible-pi
  cp hosts.example hosts
  cp wpa_supplicant.conf.example wpa_supplicant.conf
  ```

2. Edit the `wpa_supplicant.conf` and `hosts` files.
  
  `ping raspberrypi.local` to get the IP address of your pi

3. Deploy using [ansible](http://www.ansible.com) (install instructions for ansible are in [requirements](#requirements) below).

  ```
  ansible-playbook playbook.yml -i hosts && say Ansible task complete
  ```

## Usage

View `http://[ip address]:1880/#` to see Node Red

## Requirements

Start here to get your OS burned on an sd card https://gist.github.com/chrowe/93022b145108071f8c058769111ebce9

[Ansible](http://www.ansible.com/) is required. 

### Installing Ansible on Mac

```
cd /tmp
git clone git://github.com/ansible/ansible.git
cd ./ansible
git checkout v1.4.3
sudo make install
sudo easy_install jinja2 
sudo easy_install pyyaml
sudo easy_install paramiko
```

## History

* Based on https://github.com/motdotla/ansible-pi
* Inspiration
  * https://opensource.com/life/16/2/cluster-computing-with-ansible-and-raspberry-pi
  * 
* Previous notes
  * https://gist.github.com/chrowe/fe8edd7553c678745f5f3ceff9a861a3
  * 
