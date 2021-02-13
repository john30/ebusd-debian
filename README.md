# ebusd-debian
Debian multi-architecture and multi-distribution package repository for ebusd.

## Usage
Add the GPG key to your trusted apt sources (usually root access is required, so e.g. do `sudo -s` before starting with these commands if you're not logged in as root):  
`wget -qO - https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd.gpg.key|apt-key add -`

Copy the right source list for your distribution to `/etc/apt/sources.list.d/`, i.e. replace `DIST` with either `buster` (Debian 10 or higher), `stretch` (Debian 9), or `jessie`(Debian 8):  
`wget -O /etc/apt/sources.list.d/ebusd.list https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd-default-DIST.list`

If you prefer the variant without MQTT support, use this command instead:  
`wget -O /etc/apt/sources.list.d/ebusd.list https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd-nomqtt-DIST.list`

After that, you can simply update the package lists via `apt-get update`(depending on your distribution) and then install with `apt-get install ebusd`.

