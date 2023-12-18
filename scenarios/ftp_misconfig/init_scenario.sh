#!/bin/bash

# Place sensitive files in the FTP server directory
mkdir -p /srv/ftp/sensitive
echo "This is a sensitive file." > /srv/ftp/sensitive/secret.txt

# Simulate the misconfiguration (e.g., incorrect permissions)
chmod 777 /srv/ftp/sensitive
