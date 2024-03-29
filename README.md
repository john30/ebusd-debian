# ebusd-debian
Debian multi-architecture and multi-distribution package repository for ebusd.

## Usage

1. Add the GPG key to your trusted apt sources:  
   * For `bookworm` (Debian 12 or higher):  
    `sudo mkdir -p /etc/apt/keyrings && sudo wget -q -O /etc/apt/keyrings/ebusd.gpg https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd.gpg`
   * For `bullseye` (Debian 11) or `buster` (Debian 10):  
    `wget -qO - https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd.gpg.key|sudo apt-key add -`

2. Copy the right source list for your distribution to `/etc/apt/sources.list.d/`, i.e. replace `<DIST>` with either:  
    * `bookworm` (Debian 12 or higher)
    * `bullseye` (Debian 11), or
    * `buster` (Debian 10)

   in this command line:  
   `sudo wget -O /etc/apt/sources.list.d/ebusd.list https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd-default-<DIST>.list`

   If you prefer the variant without MQTT support, use this command instead:  
   `sudo wget -O /etc/apt/sources.list.d/ebusd.list https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd-nomqtt-<DIST>.list`

3. After that, you can simply update the package lists via `apt-get update` (depending on your distribution) and then
   install with `apt-get install ebusd`.
