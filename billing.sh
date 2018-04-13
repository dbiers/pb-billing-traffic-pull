#!/bin/bash
read -p "ProfitBricks Contract Number (eg. 031764312): " contract
read -p "ProfitBricks Username: " username
read -sp "ProfitBricks Password: " password
read -p "Enter YYYY-MM for report (ex. 2018-04): " reqdate

echo -e "\nRunning usage report as ${username}...\n"

# Clear billing_output.txt if exists:
echo > billing_output.txt

# Get API
curl -s --request GET --user "${username}:${password}" https://billingapi.profitbricks.com/${contract}/traffic/${reqdate}?mac=true | jq '.trafficObj.mac[] | { VDC: .vdcName, MAC_Address: .mac, Date: .dates[].Date, Traffic_Out: .dates[].Out }' | tee billing_output.txt

echo "Completed."
