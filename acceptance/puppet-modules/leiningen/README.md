# leiningen

## Description

Leiningen is a project automation tool for Clojure.
This module downloads the leiningen bootstrap script to a specified executable directory, and sets executable permissions on it.

### Beginning with leiningen

    node default {
      require leiningen
    }

See init.pp for parameters.
Note that the module does not execute leiningen and perform the actual bootstrapping. This will happen implicitly the first time you attempt a lein command.

## Reference

### Leiningen

http://leiningen.org/

## Limitations

Only tested on EL7.
May not work on Windows due to https://github.com/maestrodev/puppet-wget/issues/72
