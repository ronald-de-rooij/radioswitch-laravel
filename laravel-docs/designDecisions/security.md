# Security

HTTPS is used for the API, which means any incoming/outgoing traffic is encrypted. This is achieved by using
[LetsEncrypt](https://letsencrypt.org/).

Role-based access control is employed in the application. It is not possible to query the API without a bearer token,
which can only be acquired after login.