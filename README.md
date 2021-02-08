# ebusd-debian
Debian multi-architecture and multi-distribution package repository for ebusd.

## Usage
Add the GPG key to your trusted apt sources (usually root access required):  
`wget -qO - https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd.gpg.key|apt-key add -`

Copy the right source list for your distribution to `/etc/apt/sources.list.d/` (replace `DIST` with either buster, stretch, or jessie):  
`wget -O /etc/apt/sources.list.d/ebusd.list https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd-DIST-default.list`

If you prefer the variant without MQTT support, use this command instead:  
`wget -O /etc/apt/sources.list.d/ebusd.list https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd-DIST-nomqtt.list`

After that, you can simply update the package lists via `apt-get update`(depending on your distribution) and then install with `apt-get install ebusd`.

