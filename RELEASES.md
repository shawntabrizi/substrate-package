# Regular Releases

## Motivation
Developers are making rapid progress on Substrate. They should not be throttled with the overhead of a regular release schedule now. Nevertheless, Substrate is already stable enough to build robust blockchain solutions. The userbase and devex team would benefit from regular releases.

## Goals
As a builder on Substrate, I want to.
* Reliably reproduce the results described in tutorials.
* Clearly explain where I am stuck when I cannot reproduce results from tutorials.
* Know that a tutorial will not switch target versions or otherwise mutate out from under me.
* Easily update to newer releases of Substrate, Apps, etc when and only when I choose to do so.

## Scope of this Release Plan
Substrate Package intends to follow Substrate's own upstream versioning as closely as possible, adding to it only as necessary to achieve the goals in the previous paragraph. To date Substrate has released major versions irregularly and never released minor versions, although some of Substrate's developers have mentioned more regular versioning will soon be standard practice. Until such versioning comes to pass, Substrate Pakage will continue to fill in the gaps.

# Constituents
Substrate Package is a meta-package that contains code copied from three constituent packages:

* Node template
* Module tempalte
* Front End tempalte

# When to release

Substrate Package strives primarily to follow Substrate's upstream versioning and Secondarily to fill in gaps in Substrates versioning with semantic versioning. In addition, these rules will be added to Substrate Package versioning.

## **M**ajor Releases
Major releases are made when and only when Substrate has a new major release upstream.

## **m**inor Releases

* At least one constituent project contains a feature required for an already-written tutorial
* The release works with most existing docs

## **p**atch releases
No additional rules. Just follow semantic versioning.



## How to release
When cutting a new release of Substrate Package, you must cut a new release with the each same tag in each and every constituent package. This is best illustrated through an example.

Imagine that the Node Template has a new change that supports a new already-written tutorial, but no significant changes exist in the Module Template or the Front End Template. Imagine that the previous release of Substrate Package is 1.5.0

* Tag a new release in the Node Template as 1.6.0 (or 1.5.1 depending on the nature of the change).
* Tag a new release in the Module Template as 1.6.0. Because there were no significant changes to the Module Template, this tag will be on the same commit as the previous 1.5.0 tag, but it is still important to publish the new tag.
* Tag a new release in the Front End Template as 1.6.0 just as you did for the Module Tempalate.
* Tag a new release in Substrate Package as 1.6.0
