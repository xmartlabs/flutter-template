## flutter-ci.yml

This YAML file contains the configuration for the continuous integration (CI) workflow for Flutter projects. It defines the steps and actions to be executed whenever changes are pushed to the repository. The CI workflow ensures that the code is built, tested, and validated before merging it into the main branch.

## flutter-production-cd.yml

This YAML file contains the configuration for the continuous deployment (CD) workflow for Flutter projects in a production environment. It defines the steps and actions to be executed when changes are merged into the main branch. The CD workflow automates the process of deploying the Flutter application to the production environment, ensuring a smooth and efficient release process.

### Secrets required:

GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS_CONTENT
FIREBASE_SERVICE_ACCOUNT_CREDENTIALS_BASE_64
IOS_DIST_CERTIFICATE_BASE_64
DIST_CERTIFICATE_PASSWORD
APPSTORE_CONNECT_API_KEY_ID
APPSTORE_CONNECT_API_KEY_ISSUER_ID
APPSTORE_CONNECT_API_KEY_BASE_64

## flutter-staging-cd.yml

This YAML file contains the configuration for the continuous deployment (CD) workflow for Flutter projects in a staging environment. It defines the steps and actions to be executed when changes are merged into the staging branch. The CD workflow automates the process of deploying the Flutter application to the staging environment, allowing for testing and validation before releasing to production.

### Secrets required:

GOOGLE_PLAY_SERVICE_ACCOUNT_CREDENTIALS_CONTENT
FIREBASE_SERVICE_ACCOUNT_CREDENTIALS_BASE_64
IOS_DIST_CERTIFICATE_BASE_64_CONTENT
FIREBASE_SERVICE_ACCOUNT_CREDENTIALS_BASE_64
APPSTORE_CONNECT_API_KEY_ID
APPSTORE_CONNECT_API_KEY_ISSUER_ID
APPSTORE_CONNECT_API_KEY_BASE_64_CONTENT
IOS_DIST_CERTIFICATE_PASSWORD
FIREBASE_SERVICE_ACCOUNT_CREDENTIALS_BASE_64

## pr-title-checker.yml

This YAML file contains the configuration for a workflow that checks the title of pull requests (PRs) in a Flutter project. It defines the steps and actions to be executed whenever a new PR is created. The workflow ensures that the PR title follows a specific format or meets certain criteria, helping maintain consistency and clarity in the project's PRs.
