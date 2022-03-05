# fluent-bit-rpm Unofficial RPM package builder

![build](https://github.com/shogo82148/fluent-bit-rpm/workflows/build/badge.svg)

[Fluent Bit](https://fluentbit.io/) provides RPM Packages, but it doesn't provide some distributions I want to use.
That's why I created this.

## How to use prebuilt RPM

Once the file is correctly saved, you can install packages in the repository by

```bash
yum install fluent-bit
```

Note that the package name is **fluent-bit** because it is not distributed by Treasure Data.

### Amazon Linux 2

To add Fluent Bit yum repository, create a file named `/etc/yum.repos.d/shogo82148.repo`.

```ini
# shogo82148-rpm - packages by shogo82148
[shogo82148-rpm]
name=shogo82148-rpm
baseurl=https://shogo82148-rpm-repository.s3-ap-northeast-1.amazonaws.com/amazonlinux/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://shogo82148-rpm-repository.s3-ap-northeast-1.amazonaws.com/RPM-GPG-KEY-shogo82148
```

Or install the RPM package for configure the repository.

```
yum install -y https://shogo82148-rpm-repository.s3-ap-northeast-1.amazonaws.com/amazonlinux/2/noarch/shogo82148/shogo82148-1.0.0-1.amzn2.noarch.rpm
```

### CentOS 7

To add Fluent Bit yum repository, create a file named `/etc/yum.repos.d/shogo82148.repo`.

```ini
# shogo82148-rpm - packages by shogo82148
[shogo82148-rpm]
name=shogo82148-rpm
baseurl=https://shogo82148-rpm-repository.s3-ap-northeast-1.amazonaws.com/centos/$releasever/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://shogo82148-rpm-repository.s3-ap-northeast-1.amazonaws.com/RPM-GPG-KEY-shogo82148
```

Or install the RPM package for configure the repository.

```bash
# CentOS 8
yum install -y https://shogo82148-rpm-repository.s3-ap-northeast-1.amazonaws.com/centos/8/noarch/shogo82148/shogo82148-1.0.0-1.el8.noarch.rpm
```
