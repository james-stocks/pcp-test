class leiningen::bootstrap_fetch inherits leiningen {
  include wget

  wget::fetch { 'Fetch lein bootstrap':
    source      => $leiningen::fetch_url,
    destination => "${leiningen::bin_dir}/lein",
    timeout     => $leiningen::fetch_timeout,
    verbose     => false,
    unless      => "test -f ${leiningen::bin_dir}/lein",
    notify      => File['lein bootstrap file'],
  }

  file { 'lein bootstrap file':
    path => "${leiningen::bin_dir}/lein",
    mode => 'a+x',
  }
}
