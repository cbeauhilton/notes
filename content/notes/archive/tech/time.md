# time
:linux_setup:

I noticed at one point that some websites were getting angry that my time didn't match theirs. It seems the easiest way to fix this is to install ntp (Network Time Protocol), then install networkmanager-dispatcher-ntpd and reboot. https://wiki.archlinux.org/index.php/Network_Time_Protocol_daemon#Start_ntpd_on_network_connection

It may also be useful here to note the NetworkManager dispatcher script found on https://wiki.archlinux.org/index.php/System_time#Update_timezone_every_time_NetworkManager_connects_to_a_network . It will automatically switch the timezone appropriately whenever you connect to a network.


Sun 17 Nov 2019 10:23:05 AM CST
