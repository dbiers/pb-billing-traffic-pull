# pb-billing-traffic-pull

Pulls some "Traffic Out" with information on the date, MAC address, and VDC the traffic was metered out of.

# Basic Usage

## Prerequisites

* git
* jq
* curl

You can ensure these are currently installed with the following as I didn't care enough to add a check in the script:

```
$ sudo yum install git jq curl -y
```

## Running

* Ensure the script is executable:

```
$ chmod +x billing.sh
```

* Run the script:

```
$ ./billing.sh
```

You will be prompted for some information based on the billing API curl request:

* ProfitBricks contract number (eg. 31759231)
* ProfitBricks username (The username you login to https://my.profitbricks.com/ with)
* ProfitBricks password (Same as above)
* Date range requested (eg. 2018-04, 2018-03, etc.)

# Output

Output will be directed to `stdout` as well as placed into a file in JSON format.  It is best to use jq to highlight this info if re-organize it as you see fit.
