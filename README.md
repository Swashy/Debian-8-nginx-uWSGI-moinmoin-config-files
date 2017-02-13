This repo tracks the three essential files for getting MoinMoin, a free wsgi python wiki, communicating to uWSGI and being served by Nginx on Debian 8.

This guide is unusual in that most guides in their installation "how-tos" are for Apache, and there's only 2 for Nginx.
Debian 8 has systemd so this made it more difficult. You need a proper uWSGI systemd unit if you want restarting and stopping to be easy.

The distro-provided uWSGI package is compiled for python3.4, and MoinMoin is written in 2.7. Since it lacks a shebang version specification, uWSGI will attempt to interpret under python3.4. So to get this to work, you need uWSGI to interpret *only* 2.7. A dead giveaway is that uWSGI will log an error like this:

```
umask = 0770
               ^
SyntaxError: invalid token
```

Python2 used a leading 0 to indicate an octal number, but in 3 this is invalid. So,

1. Compile uWSGI to interprety 2.7
