# Known Issues

## Local development on WSL2 and folder permissions

On a Windows system running WSL2, it may be necessary to execute `chmod 777 -R` on several folders to prevent errors
like `Could not write to storage.log` . These should be solved ad-hoc as they appear.

## Let's Encrypt certificate expiration notice

`jrcs/letsencrypt-nginx-proxy-companion` is used to renew the SSL certificates in time. Let's Encrypt requires such a
refresh every 90 days.

The validity of the certificate can be checked in the browser by visiting the URL in question and clicking on the
lock-icon.
![How to check certificate validity](assets/chrome_lock_icon.png)

After clicking "Certificate", a window shows with the end date.
![Certificate details](assets/certificate_validity.png)

If for whatever reason the Docker instance `jrcs/letsencrypt-nginx-proxy-companion` is not running, the certificate may
be in danger of expiring. This might happen after a server reboot and the Docker containers are not restarted. However,
this should also cause everything else in the application to not function.