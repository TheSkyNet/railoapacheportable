# 
# /*
#  * *********** WARNING **************
#  * This file generated by ModPerl::WrapXS/0.01
#  * Any changes made here will be lost
#  * ***********************************
#  * 01: lib/ModPerl/Code.pm:709
#  * 02: lib/ModPerl/WrapXS.pm:626
#  * 03: lib/ModPerl/WrapXS.pm:1175
#  * 04: C:\perl\bin\.cpanplus\5.10.0\build\mod_perl-2.0.4\Makefile.PL:423
#  * 05: C:\perl\bin\.cpanplus\5.10.0\build\mod_perl-2.0.4\Makefile.PL:325
#  * 06: C:\perl\bin\.cpanplus\5.10.0\build\mod_perl-2.0.4\Makefile.PL:56
#  * 07: C:\perl\bin\cpanp-run-perl.bat:21
#  */
# 


package Apache2::Connection;

use strict;
use warnings FATAL => 'all';



use Apache2::XSLoader ();
our $VERSION = '2.000004';
Apache2::XSLoader::load __PACKAGE__;



1;
__END__

=head1 NAME

Apache2::Connection - Perl API for Apache connection object




=head1 Synopsis

  use Apache2::Connection ();
  use Apache2::RequestRec ();

  my $c = $r->connection;

  my $c = $r->connection;   
  # is connection still open?
  $status = $c->aborted;
  
  # base server
  $base_server = $c->base_server();
  
  # needed for creating buckets/brigades
  $ba = $c->bucket_alloc();
  
  # client's socket
  $socket = $c->client_socket;
  
  # unique connection id
  $id = $c->id();
  
  # connection filters stack
  $input_filters = $c->input_filters();
  $output_filters = $c->output_filters();
  
  # keep the connection alive?
  $status = $c->keepalive();
  
  # how many requests served over the current connection
  $served = $c->keepalives();
  
  # this connection's local and remote socket addresses
  $local_sa  = $c->local_addr();
  $remote_sa = $c->remote_addr();
  
  # local and remote hostnames
  $local_host = $c->local_host();
  $remote_host = $c->get_remote_host();
  $remote_host = $c->remote_host();
  
  # server and remote client's IP addresses
  $local_ip = $c->local_ip();
  $remote_ip = $c->remote_ip();
  
  # connection level Apache notes
  $notes = $c->notes();
  
  # this connection's pool
  $p = $c->pool();







=head1 Description

C<Apache2::RequestRec> provides the Perl API for Apache connection
record object.





=head1 API

C<Apache2::Connection> provides the following functions and/or methods:





=head2 C<aborted>

Check whether the connection is still open

  $status = $c->aborted();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$status> ( boolean )

true if the connection has been aborted, false if still open

=item since: 2.0.00

=back








=head2 C<base_server>

Physical server this connection came in on (main server or vhost):

  $base_server = $c->base_server();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$base_server>
( C<L<Apache2::Server object|docs::2.0::api::Apache2::ServerRec>> )

=item since: 2.0.00

=back







=head2 C<bucket_alloc>

The bucket allocator to use for all bucket/brigade creations

  $ba = $c->bucket_alloc();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$ba>
( C<L<APR::BucketAlloc object|docs::2.0::api::APR::BucketAlloc>> )

=item since: 2.0.00

=back

This object is needed by C<L<APR::Bucket|docs::2.0::api::APR::Bucket>>
and C<L<APR::Brigade|docs::2.0::api::APR::Brigade>> methods/functions.







=head2 C<client_socket>

Get/set the client socket

  $socket      = $c->client_socket;
  $prev_socket = $c->client_socket($new_socket);

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item opt arg1: C<$new_socket>
( C<L<APR::Socket object|docs::2.0::api::APR::Socket>> object )

If passed a new socket will be set.

=item ret: C<$socket>
( C<L<APR::Socket object|docs::2.0::api::APR::Socket>> object )

current client socket

if the optional argument C<$new_socket> was passed the previous socket
object is returned.

=item since: 2.0.00

=back





=head2 C<get_remote_host>

Lookup the client's DNS hostname or IP address

  $remote_host = $c->remote_host();
  $remote_host = $c->remote_host($type);
  $remote_host = $c->remote_host($type, $dir_config);

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

The current connection

=item opt arg1: C<$type> ( C<L<:remotehost
constant|docs::2.0::api::Apache2::Const/C__remotehost_>> )

The type of lookup to perform:

=over

=item C<Apache2::Const::REMOTE_DOUBLE_REV>

will always force a DNS lookup, and also force a double reverse
lookup, regardless of the C<HostnameLookups> setting.  The result is
the (double reverse checked) hostname, or undef if any of the lookups
fail.

=item C<Apache2::Const::REMOTE_HOST>

returns the hostname, or C<undef> if the hostname lookup fails.  It
will force a DNS lookup according to the C<HostnameLookups> setting.

=item C<Apache2::Const::REMOTE_NAME>

returns the hostname, or the dotted quad if the hostname lookup fails.
It will force a DNS lookup according to the C<HostnameLookups>
setting.

=item C<Apache2::Const::REMOTE_NOLOOKUP>

is like C<Apache2::Const::REMOTE_NAME> except that a DNS lookup is never
forced.

=back

Default value is C<Apache2::Const::REMOTE_NAME>.

=item opt arg2: C<$dir_config>
( C<L<Apache2::ConfVector object|docs::2.0::api::Apache2::RequestRec/C_per_dir_config_>> )

The directory config vector from the request. It's needed to find the
container in which the directive C<HostnameLookups> is set. To get one
for the current request use
C<L<$r-E<gt>per_dir_config|docs::2.0::api::Apache2::RequestRec/C_per_dir_config_>>.

By default, C<undef> is passed, in which case it's the same as if
C<HostnameLookups> was set to C<Off>.

=item ret: C<$remote_host> ( string/undef )

The remote hostname.  If the configuration directive
B<HostNameLookups> is set to off, this returns the dotted decimal
representation of the client's IP address instead. Might return
C<undef> if the hostname is not known.

=item since: 2.0.00

=back

The result of C<get_remote_host> call is cached in
C<L<$c-E<gt>remote_host|/C_remote_host_>>. If the latter is set,
C<get_remote_host> will return that value immediately, w/o doing any
checkups.







=head2 C<id>

ID of this connection; unique at any point in time

  $id = $c->id();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$id> (integer)

=item since: 2.0.00

=back





=head2 C<input_filters>

Get/set the first filter in a linked list of protocol level input
filters:

  $input_filters      = $c->input_filters();
  $prev_input_filters = $c->input_filters($new_input_filters);

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item opt arg1: C<$new_input_filters>

Set a new value

=item ret: C<$input_filters>
( C<L<Apache2::Filter object|docs::2.0::api::Apache2::Filter>> )

The first filter in the connection input filters chain.

If C<$new_input_filters> was passed, returns the previous value.

=item since: 2.0.00

=back

For an example see: L<Bucket Brigades-based Protocol
Module|docs::2.0::user::handlers::protocols/Bucket_Brigades_based_Protocol_Module>






=head2 C<keepalive>

This method answers the question: Should the the connection be kept
alive for another HTTP request after the current request is completed?

  $status = $c->keepalive();
  $status = $c->keepalive($new_status);

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item opt arg1: C<$new_status> ( C<L<:conn_keepalive
constant|docs::2.0::api::Apache2::Const/C__conn_keepalive_>> )

Normally you should not mess with setting this option when handling
the HTTP protocol. If you do (for example when sending your own
headers set with
C<L<$r-E<gt>assbackwards|docs::2.0::api::Apache2::RequestRec/C_assbackwards_>>)
-- take a look at the ap_set_keepalive() function in
F<httpd-2.0/modules/http/http_protocol.c>.

=item ret: C<$status> ( C<L<:conn_keepalive
constant|docs::2.0::api::Apache2::Const/C__conn_keepalive_>> )

The method does B<not> return true or false, but one of the states
which can be compared against (C<L<:conn_keepalive
constants|docs::2.0::api::Apache2::Const/C__conn_keepalive_>>).

=item since: 2.0.00

=back

Unless you set this value yourself when implementing non-HTTP
protocols, it's only relevant for HTTP requests.

For example:

  use Apache2::RequestRec ();
  use Apache2::Connection ();
  
  use Apache2::Const -compile => qw(:conn_keepalive);
  ...
  my $c = $r->connection;
  if ($c->keepalive == Apache2::Const::CONN_KEEPALIVE) {
      # do something
  }
  elsif ($c->keepalive == Apache2::Const::CONN_CLOSE) {
      # do something else
  }
  elsif ($c->keepalive == Apache2::Const::CONN_UNKNOWN) {
      # do yet something else
  }
  else {
      # die "unknown state";
  }

Notice that new states could be added later by Apache, so your code
should make no assumptions and do things only if the desired state
matches.




=head2 C<keepalives>

How many requests were already served over the current connection.

  $served = $c->keepalives();
  $served = $c->keepalives($new_served);

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item opt arg1: C<$new_served> (integer)

Set the number of served requests over the current
connection. Normally you won't do that when handling HTTP
requests. (But see below a note regarding
C<L<$r-E<gt>assbackwards|docs::2.0::api::Apache2::RequestRec/C_assbackwards_>>).

=item ret: C<$served> (integer)

How many requests were already served over the current connection.

In most handlers, but HTTP output filter handlers, that value doesn't
count the current request. For the latter it'll count the current
request.

=item since: 2.0.00

=back

This method is only relevant for L<keepalive|/C_keepalive_>
connections. The core connection output filter
C<ap_http_header_filter> increments this value when the response
headers are sent and it decides that the connection should not be
closed (see C<ap_set_keepalive()>).

If you send your own set of HTTP headers with
C<L<$r-E<gt>assbackwards|docs::2.0::api::Apache2::RequestRec/C_assbackwards_>>,
which includes the C<Keep-Alive> HTTP response header, you must make
sure to increment the C<keepalives> counter.







=head2 C<local_addr>

Get this connection's local socket address

  $local_sa = $c->local_addr();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$local_sa>
( C<L<APR::SockAddr object|docs::2.0::api::APR::SockAddr>> )

=item since: 2.0.00

=back







=head2 C<local_host>

used for ap_get_server_name when UseCanonicalName is set to DNS
(ignores setting of HostnameLookups)

  $local_host = $c->local_host();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$local_host> (string)

=item since: 2.0.00

=back

META: you probably shouldn't use this method, but (
C<L<get_server_name|docs::2.0::api::Apache2::RequestUtil/C_get_server_name_>>
) if inside request and C<$r> is available.





=head2 C<local_ip>

server IP address

  $local_ip = $c->local_ip();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$local_ip> (string)

=item since: 2.0.00

=back







=head2 C<notes>

Get/set text notes for the duration of this connection. These notes can
be passed from one module to another (not only mod_perl, but modules
in any other language):

  $notes      = $c->notes();
  $prev_notes = $c->notes($new_notes);

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item opt arg1: C<$new_notes>
( C<L<APR::Table object|docs::2.0::api::APR::Table>> )

=item ret: C<$notes>
( C<L<APR::Table object|docs::2.0::api::APR::Table>> )

the current notes table.

if the C<$new_notes> argument was passed, returns the previous value.

=item since: 2.0.00

=back

Also see
C<L<$r-E<gt>notes|docs::2.0::api::Apache2::RequestRec/C_notes_>>







=head2 C<output_filters>

Get the first filter in a linked list of protocol level output
filters:

  $output_filters = $c->output_filters();
  $prev_output_filters = $r->output_filters($new_output_filters);

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item opt arg1: C<$new_output_filters>

Set a new value

=item ret: C<$output_filters>
( C<L<Apache2::Filter object|docs::2.0::api::Apache2::Filter>> )

The first filter in the connection output filters chain.

If C<$new_output_filters> was passed, returns the previous value.

=item since: 2.0.00

=back

For an example see: L<Bucket Brigades-based Protocol
Module|docs::2.0::user::handlers::protocols/Bucket_Brigades_based_Protocol_Module>






=head2 C<pool>

Pool associated with this connection

  $p = $c->pool();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$p>
( C<L<APR::Pool object|docs::2.0::api::APR::Pool>> )

=item since: 2.0.00

=back







=head2 C<remote_addr>

Get this connection's remote socket address

  $remote_sa = $c->remote_addr();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$remote_sa>
( C<L<APR::SockAddr object|docs::2.0::api::APR::SockAddr>> )

=item since: 2.0.00

=back







=head2 C<remote_ip>

Client's IP address

  $remote_ip      = $c->remote_ip();
  $prev_remote_ip = $c->remote_ip($new_remote_ip);

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item opt arg1: C<$new_remote_ip> ( string )

If passed a new value will be set

=item ret: C<$remote_ip> ( string )

current remote ip address

if the optional argument C<$new_remote_ip> was passed the previous
value is returned.

=item since: 2.0.00

=back







=head2 C<remote_host>

Client's DNS name:

  $remote_host = $c->remote_host();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$remote_host> ( string/undef )

If C<L<$c-E<gt>get_remote_host|/C_get_remote_host_>> was run it
returns the cached value, which is a client DNS name or C<""> if it
wasn't found. If the check wasn't run -- C<undef> is returned.

=item since: 2.0.00

=back

It's best to to call C<L<$c-E<gt>get_remote_host|/C_get_remote_host_>>
instead of directly accessing this variable.






=head1 Unsupported API

C<Apache2::Connection> also provides auto-generated Perl interface for
a few other methods which aren't tested at the moment and therefore
their API is a subject to change. These methods will be finalized
later as a need arises. If you want to rely on any of the following
methods please contact the L<the mod_perl development mailing
list|maillist::dev> so we can help each other take the steps necessary
to shift the method to an officially supported API.







=head2 C<conn_config>

Config vector containing pointers to connections per-server config
structures

  $ret = $c->conn_config();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$ret>
( C<L<Apache2::ConfVector object|docs::2.0::api::Apache2::RequestRec/C_per_dir_config_>> )

=item since: 2.0.00

=back





=head2 C<sbh>

META: Autogenerated - needs to be reviewed/completed

handle to scoreboard information for this connection

  $sbh = $c->sbh();

=over 4

=item obj: C<$c>
( C<L<Apache2::Connection object|docs::2.0::api::Apache2::Connection>> )

=item ret: C<$sbh> (XXX)

=item since: 2.0.00

=back

META: Not sure how this can be used from mod_perl at the
moment. Unless C<Apache2::Scoreboard> is extended to provide a hook to
read from this variable.







=head1 See Also

L<mod_perl 2.0 documentation|docs::2.0::index>.




=head1 Copyright

mod_perl 2.0 and its core modules are copyrighted under
The Apache Software License, Version 2.0.




=head1 Authors

L<The mod_perl development team and numerous
contributors|about::contributors::people>.

=cut

