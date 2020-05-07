echo "Metropolis Utils - Adding Helm"
mkdir /metropolis-utils

echo "> Downloading binary"
curl https://storage.googleapis.com/metropolis-utils/bin/linux-amd64/cloud_sql_proxy.tgz -o /metropolis-utils/cloud_sql_proxy.tgz

echo "> Untaring binary"
tar -zxvf /metropolis-utils/cloud_sql_proxy.tgz -C /metropolis-utils

chmod a+x /metropolis-utils/cloud_sql_proxy

echo "> Adding helm to metropolis-utils path"
echo "export PATH=\$PATH:/metropolis-utils" >> /metropolis-utils/.metropolis-utils

.  /metropolis-utils/.metropolis-utils
echo $PATH

cloud_sql_proxy --version

echo "> Complete"
