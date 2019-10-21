# Substrate Package

A stable, known working version of the [Substrate Node Template](https://github.com/substrate-developer-hub/substrate-node-template), [Substrate Module Template](https://github.com/substrate-developer-hub/substrate-module-template), and [Substrate Front End Template](https://github.com/substrate-developer-hub/substrate-front-end-template).

## What is this?

* The fastest way to get started building on Substrate.
* Compatible with the latest documentation available for Substrate runtime module development.
* Using [Substrate](https://github.com/paritytech/substrate) commit: `d1cd01c74e8d5550396cb654f9a3f1b641efdf4c`
* Using [Polkadot-JS API](https://github.com/polkadot-js/api/) version: `^0.95.0-beta.21`

## How to use it:

 * Run `git clone https://github.com/substrate-developer-hub/substrate-package.git`.
 * Run `cd substrate-package`.
 * Run `curl https://getsubstrate.io -sSf | bash -s -- --fast`
    * This installs external dependencies needed for substrate. [Take a look at the script](https://getsubstrate.io).
    * The `--fast` command allows us to skip the `cargo install` steps for `substrate` and `subkey`, which is not needed for runtime development.
    * Windows users need to follow [instructions here](https://github.com/paritytech/substrate#61-hacking-on-substrate) instead

* Go into the `substrate-node-template` folder and run:

    ```sh
    ./scripts/init.sh
    cargo build --release
    ./target/release/node-template --dev
    ```

    The above process may take 30 minuites or so, depending on your hardware. This should start your node, and you should see blocks being created.

* Go into the `substrate-front-end-template` folder and run:

    ```sh
    yarn install
    yarn start
    ```

    This should start a web server on `localhost:3000` where you can interact with your node.

* Go into the `substrate-module-template` folder:
    * Read `HOWTO.md`
    * Edit `/src/lib.rs` to create a custom Substrate runtime module
    * Add dependencies to `Cargo.toml` with the appropriate `rev`

* Interact with your node and hack away!

## What is the Substrate Module Template?

The `substrate-module-template` is a template where you can start building your own runtime module as it's own independent crate.

This is an alternative from writing your module in `substrate-node-template/runtime/src/template.rs`, where you would not be able to easily share your runtime module after your are done. We recommend development in the `substrate-module-template` if you want to allow others to include your runtime module into their Substrate node.

Instructions for using the `substrate-module-template` are included with the project.

We have added the Substrate module template as a dependency to the `substrate-node-template`, but if you want to remove it, you will need to:

1. Remove references from the runtime `Cargo.toml` file.
2. Remove references from the runtime `lib.rs` file.

# How was it made?

This project simply clones the individual templates in a single place where they are tested to be compatible with one another.

```bash
git clone https://github.com/substrate-developer-hub/substrate-node-template
git clone https://github.com/substrate-developer-hub/substrate-module-template
git clone https://github.com/substrate-developer-hub/substrate-front-end-template
```

# Why do I need `substrate-package`?

Substrate is a rapidly evolving platform, which means that breaking changes may occur on a day to day basis.
Most of the times, these breaking changes do not radically change how substrate works, but may affect how Substrate is organized, the name of functions, the name of modules, etc...

The `substrate-package` repository tries to help solve these problems by taking a snapshot of `substrate` when it is known to be working and compatible with these different resources:

* Documentation
* Tutorials
* Samples
* User Interfaces
* etc...
