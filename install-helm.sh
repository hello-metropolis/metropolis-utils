echo "Metropolis Utils - Adding Helm"
mkdir /metropolis-utils

echo "> Downloading binary"
curl https://storage.googleapis.com/metropolis-utils/bin/linux-amd64/helm.tgz -o /metropolis-utils/helm.tgz

echo "> Untaring binary"
tar -zxvf /metropolis-utils/helm.tgz -C /metropolis-utils

chmod a+x /metropolis-utils/helm

echo "> Adding helm to metropolis-utils path"
export PATH=$PATH:/metropolis-utils

echo $PATH

helm version

echo "> Complete"
