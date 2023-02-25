### Some simple scripts to build and deploy to the Hex internal PyPI index for this fork

See also: https://www.notion.so/hexhq/Our-DuckDB-fork-d9cf30bf316e4e8686c54bc70f856964

#### Prerequisites

This assumes you already have built wheels for the version you want to deploy. This should be handled by the GitHub actions on this repo but talk to @dylanscott or @TimNonet if you need help with this.

#### Steps

1. Copy the wheels you've built (there should be separate artifact zips for the Linux and OSX wheels) into the wheelhouse directory. Note: It doesn't matter if you don't have the previous forked wheels in there. We keep a versioned `packages` file in here that we add to to make sure the index doesn't lose track of old versions.
2. Poetry install and run `build_index.sh` from this directory. It should copy the wheels to a `sync` directory and render a new `index.html` there in the format pip needs
3. `assumerole` to the "global" role (which owns the hex-internal-pypi-index bucket) and run `deploy.sh`. This will copy the contents of the `sync` folder to S3
4. Commit the changes to the `packages` file
