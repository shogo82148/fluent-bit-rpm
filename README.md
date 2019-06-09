# fluent-bit-rpm Unofficial RPM package builder

[![Build Status](https://travis-ci.com/shogo82148/fluent-bit-rpm.svg?branch=master)](https://travis-ci.com/shogo82148/fluent-bit-rpm)

It provides [Fluent Bit](https://fluentbit.io/) RPM spec file and required files to build RPM for Amazon Linux 2.

## How to use prebuilt RPM

To add Fluent Bit yum repository, create a file named `/etc/yum.repos.d/bintray-shogo82148-fluent-bit-rpm.repo` and paste the configurations below:

```ini
#bintray-shogo82148-fluent-bit-rpm - packages by shogo82148 from Bintray
[bintray-shogo82148-fluent-bit-rpm]
name=bintray-shogo82148-fluent-bit-rpm
baseurl=https://dl.bintray.com/shogo82148/fluent-bit-rpm/amazonlinux2/$releasever/$basearch/
gpgcheck=0
repo_gpgcheck=1
enabled=1
gpgkey=https://bintray.com/api/v1/usrs/shogo82148/keys/gpg/public.key
```

Once the file is correctly saved, you can install packages in the repository by

```bash
rpm --import https://bintray.com/api/v1/usrs/shogo82148/keys/gpg/public.key
yum install fluent-bit
```
