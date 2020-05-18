mkdir /root/.ssh

cat /root/.ssh/id_github

chmod 600 /root/.ssh/id_github
#
eval `ssh-agent -s`
echo -e "Hostname github.com\nIdentityFile /root/.ssh/id_github" > /root/.ssh/known_hosts
#
for domain in "github.com"; do
  sed -i "/$domain/d" /root/.ssh/known_hosts
  line=$(ssh-keyscan $domain,`nslookup $domain | awk '/^Address: / { print $2 ; exit }'`)
  echo $line >> /root/.ssh/known_hosts
done
#
git clone $GITHUB_URL . --depth=1
echo "finish"
