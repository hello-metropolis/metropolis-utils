echo "metropolis-utils - installing cloud_sql_proxy"
mkdir /metropolis-utils

echo "> Downloading binary"
curl -sS https://storage.googleapis.com/metropolis-utils/bin/linux-amd64/cloud_sql_proxy.tgz -o /metropolis-utils/cloud_sql_proxy.tgz

echo "> untaring binary"
tar -zxf /metropolis-utils/cloud_sql_proxy.tgz -C /metropolis-utils

chmod a+x /metropolis-utils/cloud_sql_proxy

echo "> adding cloud_sql_proxy to metropolis-utils path"
echo "export PATH=\$PATH:/metropolis-utils" >> /metropolis-utils/.metropolis-utils

.  /metropolis-utils/.metropolis-utils
echo $PATH

cloud_sql_proxy --version

echo "> complete"
