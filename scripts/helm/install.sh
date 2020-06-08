echo "Metropolis Utils - Adding Helm"
mkdir /metropolis-utils

echo "> Downloading binary"
curl -sS https://storage.googleapis.com/metropolis-utils/bin/linux-amd64/helm.tgz -o /metropolis-utils/helm.tgz

echo "> Untaring binary"
tar -zxf /metropolis-utils/helm.tgz -C /metropolis-utils

chmod a+x /metropolis-utils/helm

echo "> Adding helm to metropolis-utils path"
echo "export PATH=\$PATH:/metropolis-utils" >> /metropolis-utils/.metropolis-utils

.  /metropolis-utils/.metropolis-utils
echo $PATH

helm version

echo "> Complete"
