#!/bin/bash

# Define MongoDB configuration file location
MONGO_CONF="/etc/mongod.conf"

# Backup the original configuration file
cp $MONGO_CONF "$MONGO_CONF.bak"

# Enable authentication by modifying the configuration file
sed -i '/^#?security:/a\  authorization: enabled' $MONGO_CONF

# Restart MongoDB to apply changes
systemctl restart mongod

# Verify if MongoDB authentication is enabled
echo "Checking MongoDB authentication status..."
grep -A 1 "security:" $MONGO_CONF

echo "Localhost Authentication Bypass has been disabled successfully!"
