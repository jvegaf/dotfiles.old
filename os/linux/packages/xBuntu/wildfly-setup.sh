#!/bin/bash

set -euo pipefail

wget "https://github.com/wildfly/wildfly/releases/download/26.1.3.Final/wildfly-26.1.3.Final.tar.gz"

tar -xvf wildfly-26.1.3.Final.tar.gz

sudo mv wildfly-26.1.3.Final /opt/wildfly

rm -rf wildfly-26.1.3.Final.tar.gz

exit 0

