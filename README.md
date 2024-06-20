# CSP shim module for Magento 2

## Purpose

This module exists for people who don't want to deal with the CSP (Content-Security-Policy) module which ships with Magento.

Up until Magento 2.4.7, it was simple, you could just remove the module via composer's `replace` syntax.
But in Magento 2.4.7, this module is more tightly integrated with certain modules (like the AdminAnalytics, Checkout and Paypal modules), which - when you try to remove the CSP module using composer's `replace` syntax - would cause `bin/magento setup:di:compile` to fail.

This module provides a solution for this case, by pretending to be the Magento CSP module for certain classes that some other modules require. The classes introduced by this module use the Magento namespace because there doesn't seem to be another way of doing this but the classes are actually empty and only contain empty functions just so nothing crashes when other modules call them.

This module comes bundled with the composer `replace` line to remove the Magento CSP module, so you don't need to do this yourself anymore.

**Update 12 June 2024**: Magento devs decided to backport the CSP changes to the following Magento security releases, so we now also support these versions in the shim:

- 2.4.4-p9
- 2.4.5-p8
- 2.4.6-p6

## Alternatives

This module might not be the best solution out there, here are some alterntives we can recommend. Pick whatever one you like best:

- [https://github.com/yireo/Yireo_DisableCsp](https://github.com/yireo/Yireo_DisableCsp) - it keeps the Magento CSP module installed and uses plugins to disable the CSP output
- [https://github.com/weiweiouyang/magento2-module-disable-csp](https://github.com/weiweiouyang/magento2-module-disable-csp) - it keeps the Magento CSP module installed and disables some events the CPS module hooks into
- ...

## Watch out

- **Do not install this module when you care about PCI DSS compliance!**
- The module is currently declared compatible with specific versions of Magento only, it's hard to predict what will happen in the future, so we'll try to open up compatibility with more future Magento versions when they get released.

## Compatibility

- This module should work with Magento 2.4.4-p9, 2.4.5-p8, 2.4.6-p6, 2.4.7 and 2.4.7-p1
- The module should be compatible with PHP 7.4, 8.1, 8.2 and 8.3

## Installation

You can use composer to install this module:

```sh
composer require baldwin/magento2-module-csp-shim
```

After which you can then activate it in Magento using:

```sh
bin/magento setup:upgrade
```
