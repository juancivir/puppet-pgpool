# == Class: pgpool::config::connection
#
# This class exposes the connection settings for pgpool.
#
# === Parameters
#
# [*listen_addresses*]
#   String. This is the listen address pgpool should listen on. '*' can be used
#   for all interfaces.
#   Defaults to <tt>localhost</tt>.
#
# [*port*]
#   Integer. This is the port pgpool should listen on.
#   Defaults to <tt>9999</tt>.
#
# [*socket_dir*]
#   String. This is the folder to store the socket.
#   Defaults to <tt>/var/run</tt>.
#
# [*pcp_port*]
#   Integer. This is the listen port for the PCP process.
#   Defaults to <tt>9898</tt>.
#
# [*pcp_socket_dir*]
#   String. This is the folder for the PCP process's unix socket.
#   Defaults to <tt>/var/run</tt>.
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*pgpool_package_name*]
#
# === Examples
#
# class { 'pgpool::config::connection':
#   listen_addresses => '*',
# }
#
# === Authors
#
# Alex Schultz <aschultz@next-development.com>
#
# === Copyright
#
# Copyright 2015 Alex Schultz, unless otherwise noted.
#
class pgpool::config::connection (
  $listen_addresses       = 'localhost',
  $port                   = 9999,
  $socket_dir             = '/var/run',
  $pcp_port               = 9898,
  $pcp_socket_dir         = '/var/run',
) {

  $connection_config = {
    'listen_addresses'       => { value => $listen_addresses },
    'port'                   => { value => $port },
    'socket_dir'             => { value => $socket_dir },
    'pcp_port'               => { value => $pcp_port },
    'pcp_socket_dir'         => { value => $pcp_socket_dir },
  }

  $connection_defaults = {
    ensure => present
  }

  create_resource(pgpool::config::val, $connection_config, $connection_defaults)
}