# Class: leiningen
# ===========================
#
# Download leiningen (http://leiningen.org/) to your bin directory and makes it executable.
#
# Parameters
# ----------
#
# * `fetch_url`
#   The URL to find the the leiningen bootstrap script at.
#   Default is https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
# * `fetch_timeout`
#   How long to allow fetching of the bootstrap script before failing.
#   Default is 300 seconds
# * `bin_dir`
#   The directory lein should be placed.
#   Default is /usr/bin
#
# Examples
# --------
#
# @example
#   node default {
#     include leiningen
#   }
#
# Authors
# -------
#
# James Stocks <james.stocks@puppet.com>
#
# Copyright
# ---------
#
# Copyright 2016 James Stocks
#
class leiningen (
  $fetch_url     = $leiningen::params::fetch_url,
  $fetch_timeout = $leiningen::params::fetch_timeout,
  $bin_dir       = $leiningen::params::bin_dir,
) inherits leiningen::params {

  include leiningen::bootstrap_fetch
}
