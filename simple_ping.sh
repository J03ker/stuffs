#!/bin/bash
#A simple ping loop example
#This will be updated bit by bit to add more functionality
# -J0k3r

echo "## SIMPLE PING SWEEP##"
echo "This simple ping sweep currently only scans /24 networks"
echo "It should have more functionality soon, if it doesn't, just wait longer"
echo "The format for the octects is (192.168.1)"

# Function to gracefully exit the script on Ctrl+C
ctrl_c() {
  echo "Script terminated by user."
  exit 0
}

# Trap Ctrl+C and call the ctrl_c function
trap ctrl_c INT

# Ask the user for the subnet to be scanned
read -e -p "Please enter the first 3 octets: " subnet

# This simple for loop will ping through host addresses 1-254, it sends all output (std and error to /dev/null) and if ran successfully reports a message to the user
for host in {1..254}; do
        ip_address="$subnet.$host"
        ping -c 1 -W 1 "$ip_address" &>/dev/null
        if [ $? -eq 0 ]; then
                echo "Host $ip_address is up!"
        fi
done
