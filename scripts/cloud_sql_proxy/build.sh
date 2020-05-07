mkdir dist
mkdir dist/bin
mkdir dist/bin/linux-amd64

tar -C bin/linux-amd64 -czvf dist/bin/linux-amd64/cloud_sql_proxy.tgz cloud_sql_proxy
