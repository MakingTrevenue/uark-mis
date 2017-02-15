![entity relationship diagram][10]

ERD made with [lucidchart][11]

## Notes

* Always hash passwords with at least [`password_hash`][1] or even better with the [`script` algorithm][2]. Check out [this awesome blog post][12] from the creator of stackoverflow with lots of great links, like [this one][13], and consider using [`zxcvbn`][14].
* Encrypt SSNs with [`openssl_encrypt`][3] using `aes-256-ctr` or `aes-256-cbc-hmac-sha256` but I'm not a security expert, so you might google for better information when choosing a cipher suite.
* `PDO` will talk to MySQL as well as [a lot of other DBMS drivers][4], so you can portably hotswap the backend later, to whereas if you stick with `MySQLi` you're pretty locked into that platform.
* For application attachments, [hash file contents][5] on upload, and save under that filename.

## Tools

* PHP package manager: [composer][6]
* PHP package library: [packagist][7]
* JS (node) installer: [nvm][8]
* JS package manager (npm) => [yarn][9]

[1]:http://php.net/manual/en/function.password-hash.php
[2]:https://en.wikipedia.org/wiki/Scrypt
[3]:http://php.net/manual/en/function.openssl-encrypt.php
[4]:http://php.net/manual/en/pdo.drivers.php
[5]:http://php.net/manual/en/function.hash-file.php
[6]:https://getcomposer.org/
[7]:https://packagist.org/
[8]:https://github.com/creationix/nvm
[9]:https://yarnpkg.com/en/
[10]:./images/erd.png
[11]:https://www.lucidchart.com/
[12]:https://blog.codinghorror.com/your-password-is-too-damn-short/
[13]:https://www.nccgroup.trust/us/about-us/newsroom-and-events/blog/2015/march/enough-with-the-salts-updates-on-secure-password-schemes/
[14]:https://blogs.dropbox.com/tech/2012/04/zxcvbn-realistic-password-strength-estimation/
