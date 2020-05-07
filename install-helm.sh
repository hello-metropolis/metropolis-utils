echo "Metropolis Utils - Adding Helm"
mkdir /metropolis-utils

echo "> Downloading binary"
curl https://storage.googleapis.com/metropolis-utils/bin/linux-amd64/helm.tgz -o /metropolis-utils/helm.tgz

echo "> Untaring binary"
tar -zxvf /metropolis-utils/helm.tgz -C /metropolis-utils

echo "> Adding helm to metropolis-utils path"
export PATH=$PATH:/metropolis-utils/bin/linux-amd64

echo "> Complete"
