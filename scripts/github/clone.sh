mkdir /root/.ssh

# Setup the id_github SSH key
echo -n "$DEPLOY_KEY\n" > /root/.ssh/id_github
chmod 600 /root/.ssh/id_github

# Add to known_hosts
echo "Hostname github.com\nIdentityFile /root/.ssh/id_github" > /root/.ssh/known_hosts
for domain in "github.com"; do
  sed -i "/$domain/d" /root/.ssh/known_hosts
  line=$(ssh-keyscan $domain)
  # gcloud doesn't support nslookup without the package,
  # but will allow clones without ip

  # line=$(ssh-keyscan $domain,`nslookup $domain | awk '/^Address: / { print $2 ; exit }'`)

  echo $line >> /root/.ssh/known_hosts
done

echo "known_hosts pop"
cat /root/.ssh/known_hosts

# Setup the .clone file with the commands to run to clone.
mkdir /metropolis-utils/
echo "eval \`ssh-agent -s\`" >> /metropolis-utils/.clone
echo "ssh-add /root/.ssh/id_github" >> /metropolis-utils/.clone

# This strategy works for a depth=1 clone for a specific
# commit _OR_ a branch.
echo "git init" >> /metropolis-utils/.clone
echo "git remote add origin $GITHUB_URL" >> /metropolis-utils/.clone
echo "git fetch origin $REF --depth=1" >> /metropolis-utils/.clone
echo "git checkout $REF" >> /metropolis-utils/.clone

# Only works for branches
# echo "git clone $GITHUB_URL . -b $BRANCH --depth=1" >> /metropolis-utils/.clone


cat /metropolis-utils/.clone
