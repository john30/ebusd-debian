# ebusd-debian
Debian package repository for ebusd and ebusd-configuration.

## Usage
Add the GPG key to your trusted apt sources (usually root access required):  
`wget -O - https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd.gpg.key|apt-key add -`

Copy the right source list for your architecture (check by executing `dpkg --print-architecture`) to /etc/apt/sources.list.d/:  
`wget -O /etc/apt/sources.list.d/ebusd.list https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd-ARCH-default.list`

If you prefer the variant without MQTT support, use this command instead:  
`wget -O /etc/apt/sources.list.d/ebusd.list https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd-ARCH-nomqtt.list`

After that, you can simply update the package lists via `apt-get update`(depending on your distribution) and then install with `apt-get install ebusd`.
