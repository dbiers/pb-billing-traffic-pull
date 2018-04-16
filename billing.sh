#!/bin/bash
set -x
read -p "ProfitBricks Contract Number (eg. 031764312): " contract
read -p "ProfitBricks Username: " username
read -sp "ProfitBricks Password: " password
read -p "Enter YYYY-MM for report (ex. 2018-04): " reqdate

echo -e "\nRunning usage report as ${username}...\n"

# Clear billing_output.txt if exists:
echo > billing_output.txt

# Get API
if [ -z "${1}" ]; then
		curl -s --request GET --user "${username}:${password}" https://billingapi.profitbricks.com/${contract}/traffic/${reqdate}?mac=true > billing_nofilter.txt
		echo "Completed untouched data in file \"billing_nofilter.txt\"."
	else
		curl -s --request GET --user "${username}:${password}" https://billingapi.profitbricks.com/${contract}/traffic/${reqdate}?mac=true | jq '.trafficObj.mac[] | { VDC: .vdcName, MAC_Address: .mac, Date: .dates[].Date, Traffic_Out: .dates[].Out }' > billing_output.txt
		echo "Completed filtered data in file \"billing_output.txt\"."
fi

exit 0
