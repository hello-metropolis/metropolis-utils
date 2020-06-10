# Metropolis Utilities

These metropolis utilities make it easy to install packages or perform actions that are extremely common across metropolis build environments.

> Many of these utilities are split into two separate commands.  
>
> The first command generates an executable that is populated with a configuration from the environment.
>
> The second command executes the executable in the context of the current shell environment.  It may alter local shell variables as needed.
>
> The commands will be shown as an example, however will pass a blank string through the example.  Under the documentation, it will explain how this variable should be populated.


## Clone Source

The follow can be used to clone source code from GitHub.

```
curl -sS https://raw.githubusercontent.com/hello-metropolis/metropolis-utils/master/scripts/github/clone.sh | DEPLOY_KEY="" GITHUB_URL="" REF="" sh

. /metropolis-utils/.clone
```

| Property  | Value  |
|---|---|
| **DEPLOY_KEY** | Full contents of the [Deploy Key](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys) that has access to the project.  This is only required if the project you're deploying is not a public repository. |
| **GITHUB_URL** | SSH URL for the GitHub repo to clone. |
| **REF** | Either or a branch name or SHA commit hash to checkout for the repo.  This will use a `--depth=1` approach, to avoid cloning unnecessary commits history. |

## Install Helm

Helm is a tool that can easily install, update, and remove released on Kubernetes.

The following can be used to install the helm binary.

```
curl -sS https://raw.githubusercontent.com/hello-metropolis/metropolis-utils/master/scripts/helm/install.sh | sh

. /metropolis-utils/.metropolis-utils
```

## Install CloudSQL Proxy

Google Cloud Platform's CloudSQL product can be configured so it is accessible behind a private ip address easily.  From their documentation:

> The Cloud SQL Proxy allows a user with the appropriate permissions to connect to a Second Generation Cloud SQL database without having to deal with IP whitelisting or SSL certificates manually.

This means it's possible the instance your VM is running may have it's IP address whitelisted to CloudSQL automatically, but setting up a CloudSQL proxy for a CI environment is the easiest way to access it.


```
curl -sS https://raw.githubusercontent.com/hello-metropolis/metropolis-utils/master/scripts/cloud_sql_proxy/install.sh | sh

. /metropolis-utils/.metropolis-utils
```

This will install the `cloud_sql_proxy` binary that can be used to proxy database requests through it.  You can see documentation on the project [here](https://github.com/GoogleCloudPlatform/cloudsql-proxy).

Once installed, you can setup the proxy if you know your `database instance name`.  This name is the name of the project, zone, and database.  For instance it looks like this:

```
hello-metropolis:us-west1:metropolis-quickstart-b602c1a397bda4cdde1021795b94c95d
```

If you want to create a proxy connection to this database, for instance, the command:

```
cloud_sql_proxy -dir /tmp/csql  --instances=hello-metropolis:us-west1:metropolis-quickstart-b602c1a397bda4cdde1021795b94c95d
```

Will setup the proxy and a unix socket file on `/tmp/csql/hello-metropolis:us-west1:metropolis-quickstart-b602c1a397bda4cdde1021795b94c95d`

Once setup, you can use this as the `host` to connect to from a database connection string.  For instance, in Ruby on Rails, you may setup a `database.yml` file like this:

```
production:
  adapter: postgresql
  encoding: unicode
  database: metro-backend-database-master
  pool: 5
  port: 5432
  host: /tmp/csql/hello-metropolis:us-west1:metropolis-quickstart-b602c1a397bda4cdde1021795b94c95d
  username: username
  password: password
```

To setup your application to connect through the proxy.

## Install Terraform

These commands can install the terraform binary packages.

```
curl -sS https://raw.githubusercontent.com/hello-metropolis/metropolis-utils/master/scripts/terraform/install.sh | sh

. /metropolis-utils/.metropolis-utils
```
