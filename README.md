# fluent-bit-rpm Unofficial RPM package builder

![build](https://github.com/shogo82148/fluent-bit-rpm/workflows/build/badge.svg)

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
gpgkey=https://bintray.com/user/downloadSubjectPublicKey?username=shogo82148
```

Once the file is correctly saved, you can install packages in the repository by

```bash
rpm --import https://bintray.com/user/downloadSubjectPublicKey?username=shogo82148
yum install fluent-bit
```
