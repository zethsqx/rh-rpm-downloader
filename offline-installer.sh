#! /bin/bash
package=podman

echo "[TARGET PACKAGE]........................: $package"

echo "...........[START: EXTRACT TAR PACK]..........."
mkdir -p /var/tmp/$package
tar -xvf podman.tar -C /
echo "...........[END: EXTRACT TAR PACK]..........."

echo "...........[START: CREATE REPO TO FILE]..........."
echo "[offline-$package]" > "/etc/yum.repos.d/$package.repo"
echo "name=$package-offline" >> "/etc/yum.repos.d/$package.repo"
echo "baseurl=file:///var/tmp/$package" >> "/etc/yum.repos.d/$package.repo"
echo "enabled=1" >> "/etc/yum.repos.d/$package.repo"
echo "gpgcheck=0" >> "/etc/yum.repos.d/$package.repo"
echo "...........[END: CREATE REPO TO FILE]..........."

echo "...........[START: INSTALL PACKAGE]..........."
yum install podman -y
echo "...........[END: INSTALL PACKAGE]..........."


