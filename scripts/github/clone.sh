mkdir /root/.ssh

# Setup the id_github SSH key
echo -n "$DEPLOY_KEY\n" > /root/.ssh/id_github
chmod 600 /root/.ssh/id_github

# Add to known_hosts
echo "Hostname github.com\nIdentityFile /root/.ssh/id_github" > /root/.ssh/known_hosts
for domain in "github.com"; do
  sed -i "/$domain/d" /root/.ssh/known_hosts
  line=$(ssh-keyscan $domain)
  echo $line >> /root/.ssh/known_hosts
done

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

# This strategy clones a github url with a depth of 1
# but unfortunately, it doesn't work for SHA tags commits.
# echo "git clone $GITHUB_URL . -b $BRANCH --depth=1" >> /metropolis-utils/.clone

# For debugging
# cat /metropolis-utils/.clone
