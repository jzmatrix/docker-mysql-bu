#!/bin/bash

mkdir /var/run/sshd 2>/dev/null
chmod 0755 /var/run/sshd 2>/dev/null

/opt/doBU 1
