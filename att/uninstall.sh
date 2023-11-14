#!/bin/bash

echo "=========================="
echo "Removing App att"


LIBPANDA_USER=$(cat /etc/libpanda.d/libpanda_usr)

# Disable the installed services:
echo " - Disabling startup scripts..."
systemctl disable app-template-test


# Here is where we remove scripts, services, etc.
echo " - Removing scripts..."
cd
if [ "x"`systemctl list-units | grep -c app-template-test.service` = "x1" ]; then
    echo "Uninstalling app-template-test.service"

    source /home/$LIBPANDA_USER/catkin_ws/devel/setup.bash
    rosrun robot_upstart uninstall app-template-test
fi

systemctl daemon-reload # if needed
