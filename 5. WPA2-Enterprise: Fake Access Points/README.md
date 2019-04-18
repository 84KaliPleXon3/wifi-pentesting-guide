# 5. WPA2-Enterprise: Fake Access Points

### Virtual machines download

- [Ubuntu 16.04.5, VMware (3.25 GB)](https://mega.nz/#!5h92EQYa!LHCNzYTN3GXEYYWcXgOUsnU37PpksbcaUFRlOK7RyRM) 

- [Kali 2019.1, VMware (4.99 GB)](https://mega.nz/#!s90G0SBL!P4tYAfAT42Q2JVQY723KcW0XzKqEC8lbxVuJVbu7aTM)

- [Ubuntu 16.04.5, VirtualBox (3.18 GB)](https://mega.nz/#!so9AzC7Q!XwAUmiSRUvldwrkNsSoyEbUTCUJDiyG3P1O_sYJNlcY)

--------------------------------

## Hostapd & Freeradius-wpe

Start the Access Point using:

```
sh freeradius_wpe_init.sh $AP_NAME $INTERFACE
```

Or:
```
freeradiuswpe $AP_NAME $INTERFACE
```

![Screenshot](img/1.png)

When a client connects, read logs with:

```
sh freeradius_wpe_read.sh
```

Or:

```
readlog
```
![Screenshot](img/2.png)

Result:

![Screenshot](img/3.png)

--------------------------------

## Hostapd-wpe

Start the Access Point using:

```
sh hostapd_wpe_init.sh $AP_NAME $INTERFACE
```

Or:

```
start_wpe $AP_NAME $INTERFACE
```

![Screenshot](img/4.png)

--------------------------------

## Installation

In case you do not want to use the virtual machine, you can install everything using:

```
sh install.sh
```
