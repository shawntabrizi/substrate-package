# substrate-module-template

This is a template for a Substrate runtime module which lives as its own crate so it can be imported into multiple other runtimes. It is based on the ["template" module](https://github.com/paritytech/substrate/blob/v1.0/node-template/runtime/src/template.rs) which is included with the [Substrate node template](https://github.com/paritytech/substrate/tree/v1.0/node-template).

Check out the [HOWTO](HOWTO.md) to learn how to use this for your own runtime module.

This README should act as a general template for distributing your module to others.

## Purpose

This module acts as a template for building other runtime modules.

It currently allows a user to put a `u32` value into storage, which triggers a runtime event.

## Dependencies

### Traits

This module does not depend on any externally defined traits.

### Modules

This module does not depend on any other SRML or externally developed modules.

## Installation

### Runtime `Cargo.toml`

To add this module to your runtime, simply include the following to your runtime's `Cargo.toml` file:

```rust
[dependencies.substrate-module-template]
default_features = false
git = 'https://github.com/shawntabrizi/substrate-module-template.git'
```

and update your runtime's `std` feature to include this module:

```rust
std = [
    ...
    'example_module/std',
]
```

### Runtime `lib.rs`

You should implement it's trait like so:

```rust
/// Used for the module test_module
impl substrate_module_template::Trait for Runtime {
	type Event = Event;
}
```

and include it in your `construct_runtime!` macro:

```rust
ExampleModule: substrate_module_template::{Module, Call, Storage, Event<T>},
```

## Reference Docs

You can view the reference docs for this module by running:

```
cargo doc --open
```

or by visiting this site: <Add Your Link>