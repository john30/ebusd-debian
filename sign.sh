#!/bin/sh
gpg --no-use-agent --digest-algo SHA256 -u ebusd@ebusd.eu --passphrase "$PASS" --clearsign -o "$2" "$1"
gpg --no-use-agent --digest-algo SHA256 -u ebusd@ebusd.eu --passphrase "$PASS" -abs -o "$3" "$1"

