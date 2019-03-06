# Substrate Package

A stable, known working version of the [Substrate Node Template](https://github.com/paritytech/substrate/tree/master/node-template) and [Substrate UI](https://github.com/paritytech/substrate-ui).

# How to use it:

 * Run `./get-substrate-dependencies.sh`
    * This installs some external dependencies, take a look at the script
    * Windows users need to follow [instructions here](https://github.com/paritytech/substrate#61-hacking-on-substrate) instead

 * Run `./substrate-package-rename.sh <project_name> <your_name>`
    * This renames the project folders, and the binary file that gets created when you compile your runtime

* Go into the `<project_name>` folder and run:
    * `./build.sh`
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
* Using Substrate commit: [ebe4c972bab088a760ca43e7662bf750ccf1e919](https://github.com/paritytech/substrate/commit/ebe4c972bab088a760ca43e7662bf750ccf1e919)
* Using Substrate UI commit: [e32e874b177effe9b789699282f11dd63b783398](https://github.com/paritytech/substrate-ui/commit/e32e874b177effe9b789699282f11dd63b783398)

# How was it made?

`substrate-node-template` was created by running `substrate-node-new` and resetting some of the "naming" values to default.

`substrate-ui` was created by running `substrate-ui-new`.

# What it tested to work?

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
