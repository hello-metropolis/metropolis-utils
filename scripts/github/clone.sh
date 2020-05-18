mkdir /root/.ssh
echo "DEPLOY_KEY"
echo "$DEPLOY_KEY"

echo "GITHUB URL"
echo $GITHUB_URL


echo -n "$DEPLOY_KEY\n" > /root/.ssh/id_github

cat /root/.ssh/id_github
chmod 600 /root/.ssh/id_github
#

echo -e "Hostname github.com\nIdentityFile /root/.ssh/id_github" > /root/.ssh/known_hosts
#
# for domain in "github.com"; do
#   sed -i "/$domain/d" /root/.ssh/known_hosts
#   line=$(ssh-keyscan $domain,`nslookup $domain | awk '/^Address: / { print $2 ; exit }'`)
#   echo $line >> /root/.ssh/known_hosts
# done
#
# git clone $GITHUB_URL . --depth=1
echo "finish"

mkdir /metropolis-utils/
echo -e "eval \`ssh-agent -s\`" > /metropolis-utils/.clone
