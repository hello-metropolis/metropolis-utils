mkdir /root/.ssh

echo -n "$DEPLOY_KEY\n" > /root/.ssh/id_github

cat /root/.ssh/id_github
chmod 600 /root/.ssh/id_github


echo "Hostname github.com\nIdentityFile /root/.ssh/id_github" > /root/.ssh/known_hosts

echo "Adding to known_hosts"
for domain in "github.com"; do
  sed -i "/$domain/d" /root/.ssh/known_hosts
  line=$(ssh-keyscan $domain,`nslookup $domain | awk '/^Address: / { print $2 ; exit }'`)
  echo $line >> /root/.ssh/known_hosts
done

mkdir /metropolis-utils/
echo "eval \`ssh-agent -s\`" >> /metropolis-utils/.clone
echo "ssh-add /root/.ssh/id_github" >> /metropolis-utils/.clone
echo "git clone $GITHUB_URL . --depth=1" >> /metropolis-utils/.clone

cat /metropolis-utils/.clone
