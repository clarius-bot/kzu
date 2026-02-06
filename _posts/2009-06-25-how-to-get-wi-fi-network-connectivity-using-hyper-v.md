---
layout: post
title: "How to get wi-fi network connectivity using Hyper-V"
date: 2009-06-25 00:00:00 +0000
---

  1. Create a new Local Network with Virtual Network Manager (name it Hyper-V, for example) 
  2. In the VHD, run msconfig.exe, in the Boot tab, click the Advanced options button, and select the Detect HAL option. 
  3. Reboot the VM, reinstall the integration services and reboot again. Now you should get the new network adapter detected. 
  4. Use ICS on the wi-fi network and select the local network Hyper-V as the one to share the connection with. 
  5. To allow VPN access, you need to open a port (GRE) in the windows firewall as explained in <http://help.wugnet.com/vista/VPN-server-configured-Generic-Routing-Encapsulatio-ftopict116489.html>

/kzu
