## Automatically created docker image for php

[![Build Status](https://travis-ci.org/encodeering/docker-php.svg?branch=master)](https://travis-ci.org/encodeering/docker-php)

### Docker

```docker pull encodeering/php-armhf```

- 5.6-apache, [5.6-apache-onbuild]
- 7.0-apache, [7.0-apache-onbuild]
- https://hub.docker.com/r/encodeering/php-armhf/

```docker pull encodeering/php-amd64```

- 5.6-apache, [5.6-apache-onbuild]
- 7.0-apache, [7.0-apache-onbuild]
- https://hub.docker.com/r/encodeering/php-amd64/

### Modification

The build time for a armhf image was greater than the allowed maximum of 50 min and we had to split the official php build into two parts therefore.

- 5.6-apache-onbuild includes the compile and install steps. Please look at the [patch](.patch/5.6/apache/Dockerfile.patch) for further information.
- 7.0-apache-onbuild includes the compile and install steps. Please look at the [patch](.patch/7.0/apache/Dockerfile.patch) for further information.
