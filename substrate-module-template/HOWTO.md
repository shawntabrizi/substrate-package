# How to Use

Simply fork this project and start your runtime development in `lib.rs`.

## Updating Your Dependencies

For the time being, Substrate does not have any releases on Cargo, which means there is some magic involved with ensuring that all the dependencies of your module and the downstream runtime are the same.

This repository has all Substrate dependencies use:

```
branch = 'v1.0'
```

This means that the runtime is using this module must also be tied to the `v1.0` branch, not simply the same commit (`rev`).

If you are working with the Substrate node template or the [`substrate-package`](https://github.com/shawntabrizi/substrate-package/) which uses a specific git commit (`rev`), you can find/replace all instances of `branch = 'v1.0'` with:

```
rev = '<git-commit>'
```

This of course means that only runtimes with this setting on their side can use your module, at which point you may want to introduce different branches yourself for supporting different commits... 

Our recommended pattern is to keep your module marked as `v1.0` and tell your runtime developer to update their dependencies. `v1.0` branch _should_ be stable.

> **Note:** Be sure to purge your projects of any `Cargo.lock` files when making changes like this!

## Adding New Dependencies

The Substrate blockchain framework can support any Rust libraries that can compile to Wasm. In general, this means that the libraries you use must compile with `no_std` enabled.

This also means you need to import your dependencies to only use their `std` feature when this module also uses it's `std` dependency.

The common pattern here look like:

1. Import your library with `default-features = false`

    ```
    [dependencies.parity-codec]
    default-features = false
    features = ['derive']
    version = '3.5'
    ```

2. Add your library to the `std` feature with its `std` feature enabled

    ```
    std = [
        'parity-codec/std',
        ...
    ]
    ```

We won't teach you the details of using Cargo, but feel free to [become a master](https://doc.rust-lang.org/cargo/).

## Building and Testing

Before you release your module, you should check that it can:

1. Build to Native:

    ```
    cargo build
    ```

2. Build to Wasm:

    ```rust
    cargo build --target=wasm32-unknown-unknown --no-default-features
    ```

3. Pass your tests:

    ```
    cargo test
    ```

## Update the README

Finally, update the [README](README.md) included with this template with the appropriate information for your module.

## Common Issues

Unfortunately keeping things modular can be a little tricky. Here are some common issues you may face.

### Developer Dependencies

When running `cargo build`, everything can compile fine, but when running `cargo test`, you may run into an import error like:

```rust
error[E0432]: unresolved import `runtime_io`
  --> src/lib.rs:67:6
   |
67 |     use runtime_io::with_externalities;
   |         ^^^^^^^^^^ use of undeclared type or module `runtime_io`
```

You may need to specify some developer dependency which is needed for your tests:

```
[dev-dependencies.runtime-io]
default_features = false
git = 'https://github.com/paritytech/substrate.git'
package = 'sr-io'
branch = 'v1.0'
```

### Forgetting `cfg_attr` for `no_std`

If you forget to include this line in your module's `lib.rs` file:

```rust
#![cfg_attr(not(feature = "std"), no_std)]
```

You will get errors like this when trying to compile your runtime:

```rust
error: duplicate lang item in crate `sr_io`: `panic_impl`.
|
= note: first defined in crate `std`.

error: duplicate lang item in crate `sr_io`: `oom`.
|
= note: first defined in crate `std`.
```

### Using Mismatching Substrate Dependencies

We mentioned above how it is important that your runtime and your module have exactly the same dependency on the Substrate project. If they do not, you will get a lot of `trait bound` errors like this:

```rust
error[E0277]: the trait bound `Runtime: srml_system::Trait` is not satisfied in `Event`
   --> /Users/shawntabrizi/Desktop/temp/modular-node/runtime/src/lib.rs:112:6
    |
112 | impl system::Trait for Runtime {
    |      ^^^^^^^^^^^^^ within `Event`, the trait `srml_system::Trait` is not implemented for `Runtime`
    |
    = note: required because it appears within the type `Event`

error[E0277]: the trait bound `test_module::Module<Runtime>: template::sr_api_hidden_includes_decl_storage::hidden_include::Callable` is not satisfied in `Call`
   --> /Users/shawntabrizi/Desktop/temp/modular-node/runtime/src/lib.rs:184:6
    |
184 | impl sudo::Trait for Runtime {
    |      ^^^^^^^^^^^ within `Call`, the trait `template::sr_api_hidden_includes_decl_storage::hidden_include::Callable` is not implemented for `test_module::Module<Runtime>`
    |
    = note: required because it appears within the type `Call`

error[E0277]: the trait bound `Runtime: srml_system::Trait` is not satisfied
   --> /Users/shawntabrizi/Desktop/temp/modular-node/runtime/src/lib.rs:196:6
    |
196 | impl test_module::Trait for Runtime {
    |      ^^^^^^^^^^^^^^^^^^ the trait `srml_system::Trait` is not implemented for `Runtime`
```
