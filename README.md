# GitHub Actions for Hasura

This Action for [Hasura](https://hasura.io) enables arbitrary actions with the `hasura` cli.

## Inputs

- `args` - **Required**. This is the arguments you want to use for the `hasura` cli.

## Environment variables

- `HASURA_ENDPOINT` - **Required**. The endpoint of the Hasura GraphQL engine.

- `HASURA_ADMIN_SECRET` - **Optional**. The admin secret (if any) for the Hasura GraphQL engine.

- `HASURA_WORKDIR` - **Optional**. The path from the root of your repository to the directory where the `migrations` folder can be found.

- `HASURA_ENGINE_VERSION` - **Optional**. The version of the hasura cli you want to use. By default, it will match the version from your endpoint and fall back on `stable` if the version endpoint request fails.

## Example

To apply migrations with the Hasura CLI:

```yaml
name: Hasura migration
on:
  push:
    branches:
      - master
jobs:
  hasura_migration:
    name: Hasura migration
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3
      - name: Apply hasura migrations
        uses: smplrspace/hasura-action@v3
        with:
          args: migrate apply --all-databases
        env:
          HASURA_ENDPOINT: ${{ secrets.HASURA_ENDPOINT }}
          HASURA_ADMIN_SECRET: ${{ secrets.HASURA_ADMIN_SECRET }}
          HASURA_WORKDIR: backend/hasura # replace this by your own path if needed
          HASURA_ENGINE_VERSION: v2.6.2 # replace this by the version you need, remove to use stable
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

This project was forked from [GitHub Action for Firebase](https://github.com/w9jds/firebase-action).
