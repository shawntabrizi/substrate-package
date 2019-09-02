# Regular Releases

## Motivation
Developers are making rapid progress on Substrate. They should not be throttled with the overhead of a regular release schedule now. Nevertheless, Substrate is already stable enough to build robust blockchain solutions. The userbase and devex team would benefit from regular releases.

## Solution
The solution is for the devex team to tell their own release story. Substrate package and its dependencies (git submodules) tell that story.

# Goals
As a builder on Substrate, I want to.
* Reliably reproduce the results described in tutorials.
* Clearly explain where I am stuck when I cannot reproduce results from tutorials.
* Know that a tutorial will not switch target versions or otherwise mutate out from under me.
* Easily update to newer releases of Substrate, Apps, etc when and only when I choose to do so.

# Constituents
Substrate Package is a meta-package that depends on other Substrate ecosystem tools through git submodules. Each release of Substrate Package represents a set of tools that have tested and known to work smoothly together.

The submodules are:
* Node template
* Module tempalte
* ink template
* apps
* ui tempalte

# Release Plan

Substrate Package uses a three point versioning system with **M**ajor, **m**inor, and **p**oint releases `M.m.p`. The criteria for making a new release are.

## For **M**ajor Releases
Major releases are made when and only when Substrate has a new major release upstream. These are like long term support releases and all non-depricated docs will be updated when new major versions are released.

## For **m**inor Releases
Minor versions is where the Devex team tells their story. As new features come into constituent projects, Substrate Package will occasionally release stable working combinations. The criteria for making a new minor release are:

* At least one month has passed since the previous minor or major release
* At least one submodule contains a feature required for an already-written tutorial
* The release works with most (not necessarily all) existing docs
* What else?

## For **p**oint releases
Point releases make small changes to comments, implementation details, and things that are sometimes not even worth the time to do. The criteria for a point release are:

* Does not break any docs/examples/tutorials/etc
* Does not change or rename any APIs
* Doesn't add new APIs??

# Start A Project
To start a new Substrate-based project

```bash
# Clone Substrate Package
git clone https://...package.git <project name>

# To clone a previous version
# git clone https://...package.git <project name> --tag <version>

# Bring in the dependencies you need
git submodule update node-template
git submodule update module-template
git submodule update apps
# git submodule update ui-template
# git submodule update ink-template

```

## Update Substrate Package
```bash
# Update Substrate Package
git checkout <newer version>

# Update is just like installing
git submodule update node-template
git submodule update module-template
git submodule update apps
# git submodule update ui-template
# git submodule update ink-template
```
