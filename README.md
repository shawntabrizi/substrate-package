# Substrate Package

A stable, known working version of the [Substrate Node Template](https://github.com/paritytech/substrate/tree/master/node-template), [Substrate Module Template](https://github.com/shawntabrizi/substrate-module-template), and [Substrate UI](https://github.com/paritytech/substrate-ui).

> **Note:** that this branch depends on the `v1.0` branch of Substrate, not a fixed commit. That means it _may_ be possible that your node breaks if a breaking change makes its way into the `v1.0` branch, but this is unlikely as the branch is intended to be stable.

# How to use it:

 * Run `git clone https://github.com/shawntabrizi/substrate-package.git`.
 * Run `cd substrate-package`.
 * Run `curl https://getsubstrate.io -sSf | bash -s -- --fast`
    * This installs external dependencies needed for substrate. [Take a look at the script](https://getsubstrate.io).
    * The `--fast` command allows us to skip the `cargo install` steps for `substrate` and `subkey`, which is not needed for runtime development.
    * Windows users need to follow [instructions here](https://github.com/paritytech/substrate#61-hacking-on-substrate) instead

 * Run `./substrate-package-rename.sh <project_name> <your_name>`
    * This renames the project folders, and the binary file that gets created when you compile your runtime

* Go into the `<project_name>` folder and run:
    * `./scripts/init.sh`
    * `./scripts/build.sh`
    * `cargo build --release`
    * `./target/release/<project_name> --dev`
    * This should start your node, and you should see blocks being created

* Go into the `<project_name>-ui` folder and run:
    * `yarn install`
    * `yarn run dev`
    * This should start a web server on `localhost:8000` where you can interact with your node

* Interact with your node and hack away!

# What is this?

* Compatible with the latest documentation available for Substrate Runtime Module development.
* The fastest way to get started building on substrate
* Using Substrate branch: `v1.0`
* Using Substrate UI commit: [db7bf60ee81cfd1551c8b9a4ad67f0b1d8d331bc](https://github.com/paritytech/substrate-ui/commit/db7bf60ee81cfd1551c8b9a4ad67f0b1d8d331bc) (`substrate-node-template` branch)

# What is the Substrate Module Template?

The `substrate-module-template` is a template where you can start building your own runtime module as it's own independent crate. This is great if you want to allow others to include your runtime module into their Substrate node. Instructions for using the `substrate-module-template` are included with the project.

We have added the Substrate module template as a dependency to the `substrate-node-template`, but if you want to remove it, you will need to:

1. Remove references from the runtime `Cargo.toml` file.
2. Remove references from the runtime `lib.rs` file.

# How was it made?

`substrate-node-template` was created by running [`substrate-node-new`](https://github.com/paritytech/substrate-up/blob/master/substrate-node-new).

`substrate-module-template` was cloned from [`shawntabrizi/substrate-module-template`](https://github.com/shawntabrizi/substrate-module-template), and Substrate dependencies updated to match `substrate-node-template`.

`substrate-ui` was created by running [`substrate-ui-new`](https://github.com/paritytech/substrate-up/blob/master/substrate-ui-new).

# What is tested to work?

* `substrate-node-template` is fully compatible with `substrate-ui` included with this package:
    * Balance Transfer
    * Runtime Upgrades
    * Creating new UI elements for new modules
* Gav's Web3 Summit Demo
* Substratekitties Tutorial
* Substrate Documentation

# Why do I need `substrate-package`?

Substrate is a rapidly evolving platform, which means that breaking changes may occur on a day to day basis.
Most of the times, these breaking changes do not radically change how substrate works, but may affect how Substrate is organized, the name of functions, the name of modules, etc...

If you try to create a new `substrate-node-template` with the `substrate-node-new` command, you will pull the latest version of substrate which may not be compatible with different parts of the development ecosystem, such as:

* Documentation
* Tutorials
* Samples
* User Interfaces
* etc...

The `substrate-package` repository tries to help solve these problems by taking a snapshot of `substrate` when it is known to be working and compatible with these different resources.

Most of these issues should go away once Substrate v1.0 is released and we have a stable API.
