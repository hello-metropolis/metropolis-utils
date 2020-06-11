echo "Metropolis Utils - Adding Terraform"
mkdir /metropolis-utils

echo "> Downloading binary"
curl -sS https://storage.googleapis.com/metropolis-utils/bin/linux-amd64/terraform.tgz -o /metropolis-utils/terraform.tgz

echo "> Untaring binary"
tar -zxf /metropolis-utils/terraform.tgz -C /metropolis-utils

chmod a+x /metropolis-utils/terraform

echo "> Adding terraform to metropolis-utils path"
echo "export PATH=\$PATH:/metropolis-utils" >> /metropolis-utils/.metropolis-utils

.  /metropolis-utils/.metropolis-utils
echo $PATH

terraform version

echo "> Complete"
