#!/usr/bin/expect -f


# make sure you got expect in your machine.
# yum install -y expect
# expect -v


spawn splunk_orca config

expect "Enter your username (blank for default user: jenkins):"
send "srv_jenkinsqa\r";
expect "Password for srv_jenkinsqa:"
send "password_for_srv_jenkinsqa\r"
expect "Enter the UCP host (blank for default: ucp.splunk.com ):"
send "\r"
expect

# run this expect in your shell
# expect expect.sh
