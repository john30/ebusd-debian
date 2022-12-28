# ebusd-debian
Debian multi-architecture and multi-distribution package repository for ebusd.

## Usage

1. Add the GPG key to your trusted apt sources:  
  ```
  apt install -y gnupg
  wget -qO - https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd.gpg.key|sudo apt-key add -
  ```

2. Copy the right source list for your distribution to `/etc/apt/sources.list.d/`, i.e. replace `<DIST>` with either:  
    * `bullseye` (Debian 11 or higher)
    * `buster` (Debian 10), or
    * `stretch` (Debian 9)

   in this command line:  
   `sudo wget -O /etc/apt/sources.list.d/ebusd.list https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd-default-<DIST>.list`

   If you prefer the variant without MQTT support, use this command instead:  
   `sudo wget -O /etc/apt/sources.list.d/ebusd.list https://raw.githubusercontent.com/john30/ebusd-debian/master/ebusd-nomqtt-<DIST>.list`

3. After that, you can simply update the package lists via `apt-get update` (depending on your distribution) and then
   install with `apt-get install ebusd`.
