#!/usr/bin/env perl

use utf8;
use strict;
use warnings;
use FindBin;

sub execute {
    my @arg = @_;
    my $cmd = join " ", @arg;
    print "executing: $cmd\n";
    my $ret = system(@arg);
    if ($ret != 0) {
        print STDERR "::warning::failed to execute $cmd";
    }
}

sub upload {
    my ($variant, $prefix) = @_;
    while (my $rpm = <$FindBin::Bin/../$variant.build/*.x86_64.rpm>) {
        execute("aws", "s3", "cp", $rpm, "s3://shogo82148-rpm-temporary/$prefix/x86_64/fluent-bit/");
    }
    while (my $rpm = <$FindBin::Bin/../$variant.build/*.aarch64.rpm>) {
        execute("aws", "s3", "cp", $rpm, "s3://shogo82148-rpm-temporary/$prefix/aarch64/fluent-bit/");
    }
}

upload "amazonlinux2", "amazonlinux/2";
upload "centos7", "centos/7";
upload "centos8", "centos/8";
