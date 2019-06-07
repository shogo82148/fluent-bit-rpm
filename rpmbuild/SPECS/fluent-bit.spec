%define main_version 1.1.2
%define main_release 1%{?dist}

Summary: Fast and Lightweight Log processor and forwarder for Linux, BSD and OSX
Name: fluent-bit
Version: %{main_version}
Release: %{main_release}
URL: http://fluentbit.io/
Source0: https://github.com/fluent/fluent-bit/archive/v%{main_version}.tar.gz
License: Apache License 2.0
Group: System Environment/Daemons
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root
BuildRequires: gcc-c++, pkgconfig, systemd-devel, cyrus-sasl-devel, zlib-devel, flex, bison
BuildRequires: systemd-units
Requires(preun): systemd
Requires(postun): systemd
Requires(post): systemd

%description
Fast and Lightweight Log processor and forwarder for Linux, BSD and OSX

%prep
%setup -q

%build
cd build && cmake .. && make

%install
rm -rf $RPM_BUILD_ROOT

cd build && make DESTDIR=$RPM_BUILD_ROOT install

%pre
# TODO

%post
# TODO

%preun
# TODO

%postun
# TODO

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)


%changelog
* Fri Jun 7 2019 Ichinose Shogo <shogo82148@gmail.com> - 1.1.2-1
- Initial package release
