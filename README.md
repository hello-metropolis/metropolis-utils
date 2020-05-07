[
  "gcloud container clusters get-credentials metropolis-staging --zone=us-west1",
  "./infrastructure/bin/helm-linux-amd64 install frontend-$_METROPOLIS_PLACEHOLDER.SANDBOX_ID infrastructure/helm/frontend/ --set image.tag=latest",
  "./infrastructure/bin/helm-linux-amd64 install backend-$_METROPOLIS_PLACEHOLDER.SANDBOX_ID infrastructure/helm/backend/ --set image.tag=latest --set env.RAILS_ENV=staging --set env.AFTER_CONTAINER_DID_MOUNT=\"sh lib/docker/mount-staging.sh\" --set env.SANDBOX_ID=$_METROPOLIS_PLACEHOLDER.SANDBOX_ID"
]
