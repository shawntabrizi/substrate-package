# Substrate Package

A stable, known working version of the [Substrate Node Template](https://github.com/substrate-developer-hub/substrate-node-template), [Substrate Module Template](https://github.com/substrate-developer-hub/substrate-module-template), and [Substrate UI Template](https://github.com/substrate-developer-hub/substrate-ui-template).

# How to use it:

1. Clone the repository.
    ```bash
    git clone https://github.com/substrate-developer-hub/substrate-package
    ```
2. Initialize the git submodules.
    ```bash
    cd substrate-package/
    git submodule update --init
    ```
3. Install Substrate development dependencies.
    ```bash
    curl https://getsubstrate.io -sSf | bash -s -- --fast
    ```
    > This installs external dependencies needed for substrate. [Take a look at the script](https://getsubstrate.io). Windows users need to follow [instructions here](https://substrate.dev/docs/en/getting-started/installing-substrate#windows) instead

* Compile and start your Substrate Node Template.
    ```bash
    cd substrate-node-template/
    # Setup your Wasm build environment
    ./scripts/init.sh
    # Compile your node
    cargo build --release
    # Run the node
    ./target/release/node-template --dev
    ```

* Start your local Substrate UI Template
    ```bash
    # Open a separate terminal
    cd substrate-ui-template/
    yarn & yarn start
    ```

* Interact with your node and hack away!

# What is this?

* Compatible with the latest documentation available for Substrate Runtime Module development.
* The fastest way to get started building on substrate
* Using Substrate branch: `master`

# What is the Substrate Module Template?

The `substrate-module-template` is a template where you can start building your own runtime module as it's own independent crate. This is great if you want to allow others to include your runtime module into their Substrate node. Instructions for using the `substrate-module-template` are included with the project.

We have added the Substrate module template as a dependency to the `substrate-node-template`, but if you want to remove it, you will need to:

1. Remove references from the runtime `Cargo.toml` file.
2. Remove references from the runtime `lib.rs` file.

# What is tested to work?

* For now, these three templates are shown to work together.

# Why do I need `substrate-package`?

Substrate is a rapidly evolving platform, which means that breaking changes may occur on a day to day basis.
Most of the times, these breaking changes do not radically change how substrate works, but may affect how Substrate is organized, the name of functions, the name of modules, etc...

The `substrate-package` repository tries to help solve these problems by taking a snapshot of `substrate` when it is known to be working and compatible with these different resources, such as:

* Documentation
* Tutorials
* Samples
* User Interfaces
* etc...
