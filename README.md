# ca-scripts

This repo is based on the gist https://gist.github.com/Soarez/9688998

## Generate a Certificate Authority

First you have to generate a custom CA:
```bash
./generate-ca.sh
```

and set the informations below as you wish:
```
// ...
Country Name (2 letter code) [AU]:HU
State or Province Name (full name) [Some-State]:Bács-Kiskun
Locality Name (eg, city) []:Kecskemét
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Something Ltd.
Organizational Unit Name (eg, section) []:IT
Common Name (e.g. server FQDN or YOUR name) []:                              // <- empty
Email Address []:                                                            // <- empty
```

You can see that the `Common Name` and `Email Address` fields are **EMPTY**.

After this you have to import the `ca.crt` file into your browser.

## Generate a signed certificate

You have to generate the CA only once. After that you can generate any amount of certificates which are signed by the `ca.cert` CA.

Generate your first certificate:
```bash
./generate.sh
```

In this example we will generate a certificate for the host `localhost` so see the informations provided below:
```
Please give the domain name:
localhost                                                  // <- first question, set the domain name what you want
                                                           //    the script will create a directory with this name and
                                                           //    the generated files will be in this folder
Country Name (2 letter code) [AU]:HU
State or Province Name (full name) [Some-State]:Bács-Kiskun
Locality Name (eg, city) []:Kecskemét
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Something Ltd.
Organizational Unit Name (eg, section) []:IT
Common Name (e.g. server FQDN or YOUR name) []:localhost   // <- here we set the main domain name
                                                           //    only one domain name can be added here
Email Address []:                                          // <- empty

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:                                   // <- empty
An optional company name []:                               // <- empty
Please give the domain names, separated by space:
(example: *.test.net test.net)
localhost  127.0.0.1  ::1                                  // <- here we set the domains and IP addresses
                                                           //    you can give multiple domains and IP addresses
                                                           //    (separated by a space character)
                                                           //    what will be valid with this certificate
Sign the key...
// ...
Sign the certificate? [y/n]:y                              // <- yes, we want to sign the certificate


1 out of 1 certificate requests certified, commit? [y/n]y  // <- yes, commit it
Write out database with 1 new entries
Data Base Updated
```

After this you can find the certificate files in the directory what you provided in section `Please give the domain name:`.
