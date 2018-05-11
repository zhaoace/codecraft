
username=xxxx
password=xxxx
key=xxxx
ip=xxxx

curl -u ${username}:${password} ${key} -o  /tmp/key.tar
cd /tmp
tar -xvf key.tar
cd -
ssh -i /tmp/.orca/id_rsa -p 2222  root@${ip}