#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "===================================================================================="
echo "===================================================================================="
# #install apache2
apt-get update -yq
apt-get install apache2 -yq

systemctl is-active --quiet apache2 && echo apache2 is running

# echo "===================================================================================="
# echo "===================================================================================="
# #install openscap
apt-get update -yq
apt-get install libopenscap8 wget  -yq

echo "===================================================================================="
echo "===================================================================================="
# download the necessary OVAL definitions

distribution=$(lsb_release --id | cut -f2 | tr [:upper:] [:lower:])
codename=$(lsb_release --codename | cut -f2)
oval_file="https://people.canonical.com/~${distribution}-security/oval/com.${distribution}.${codename}.cve.oval.xml"


if wget --spider $oval_file 2>/dev/null; then
    echo "OVAL file exists : $oval_file "
else
    echo "OVAL file does not exist : $oval_file "
fi 

wget https://people.canonical.com/~${distribution}-security/oval/com.${distribution}.${codename}.cve.oval.xml

echo "===================================================================================="
echo "===================================================================================="
# Run the audit 
# https://wiki.ubuntu.com/Releases
oscap oval eval --results /tmp/${distribution}_${codename}_oscap_results.xml --report /tmp/${distribution}_${codename}_oscap_report.html com.${distribution}.${codename}.cve.oval.xml
sudo cp /tmp/${distribution}_${codename}_oscap_report.html /var/www/html/
 
 ip4=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)

wget --spider http://${ip4}/${distribution}_${codename}_oscap_report.html 2>/dev/null && echo "link exists" || echo "link does not exist"
#  wget --spider http://192.168.50.15/${distribution}_${codename}_oscap_report.html 2>/dev/null && echo "link exists" || echo "link does not exist"
# browse http://SERVER_IP/${distribution}_${codename}_oscap_report.html
