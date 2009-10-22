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


package Apache2::Access;

use strict;
use warnings FATAL => 'all';



use Apache2::XSLoader ();
our $VERSION = '2.000004';
Apache2::XSLoader::load __PACKAGE__;



1;
__END__

=head1 NAME

Apache2::Access - A Perl API for Apache request object: Access,
Authentication and Authorization.





=head1 Synopsis

  use Apache2::Access ();
  
  # allow only GET method
  $r->allow_methods(1, qw(GET));
  
  # Apache Options value
  $options = $r->allow_options();
  
  # Apache AllowOverride value
  $allow_override = $r->allow_overrides();
  
  # which Options are allowed by AllowOverride (since Apache 2.2)
  $allow_override_opts = $r->allow_override_opts();
  
  # auth name ("foo bar")
  $auth_name = $r->auth_name();
  
  # auth type
  $auth_type = $r->auth_type();
  $r->auth_type("Digest");
  
  # Basic authentication process
  my ($rc, $passwd) = $r->get_basic_auth_pw();
  
  # the login name of the remote user (RFC1413)
  $remote_logname = $r->get_remote_logname();
  
  # dynamically figure out which auth has failed
  $r->note_auth_failure();
  
  # note Basic auth failure
  $r->note_basic_auth_failure();
  
  # note Digest auth failure
  $r->note_digest_auth_failure();
  
  # Apache Request value(s)
  $requires = $r->requires();
  
  # Apache Satisfy value (as a number)
  $satisfy = $r->satisfies();
  
  # check whether some auth is configured
  $need_auth = $r->some_auth_required();







=head1 Description

The API provided by this module deals with access, authentication and
authorization phases.

C<Apache2::Access> extends
C<L<Apache2::RequestRec|docs::2.0::api::Apache2::RequestRec/Description>>.








=head1 API

C<Apache2::Access> provides the following functions and/or methods:





=head2 C<allow_methods>

Specify which HTTP methods are allowed

  $r->allow_methods($reset);
  $r->allow_methods($reset, @methods);

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item arg1: C<$reset> ( boolean )

If a true value is passed all the previously allowed methods are
removed. Otherwise the list is left intact.

=item opt arg2: C<@methods> ( array of strings )

a list of HTTP methods to be allowed (e.g. C<GET> and C<POST>)

=item ret: no return value

=item since: 2.0.00

=back

For example: here is how to allow only C<GET> and C<POST> methods,
regardless to what was the previous setting:

  $r->allow_methods(1, qw(GET POST));






=head2 C<allow_options>

Retrieve the value of C<Options> for this request

  $options = $r->allow_options();

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret: C<$options> ( integer )

the C<Options> bitmask. Normally used with bitlogic operators against
C<L<Apache2::Const :options
constants|docs::2.0::api::Apache2::Const/C__options_>>.

=item since: 2.0.00

=back

For example if the configuration for the current request was:

  Options None
  Options Indexes FollowSymLinks

The following applies:

  use Apache2::Const -compile => qw(:options);
  $r->allow_options & Apache2::Const::OPT_INDEXES;   # TRUE
  $r->allow_options & Apache2::Const::OPT_SYM_LINKS; # TRUE
  $r->allow_options & Apache2::Const::OPT_EXECCGI;   # FALSE








=head2 C<allow_overrides>

Retrieve the value of C<AllowOverride> for this request

  $allow_override = $r->allow_overrides();

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret: C<$allow_override> ( integer )

the C<AllowOverride> bitmask. Normally used with bitlogic operators
against C<L<Apache2::Const :override
constants|docs::2.0::api::Apache2::Const/C__override_>>.

=item since: 2.0.00

=back

For example if the configuration for the current request was:

  AllowOverride AuthConfig

The following applies:

  use Apache2::Const -compile => qw(:override);
  $r->allow_overrides & Apache2::Const::OR_AUTHCFG; # TRUE
  $r->allow_overrides & Apache2::Const::OR_LIMIT; # FALSE






=head2 C<allow_override_opts>

Retrieve the bitmask of allowed C<Options> set by C<AllowOverride Options=...>
for this request

  $override_opts = $r->allow_override_opts();

Enabling single options was introduced in Apache 2.2. For Apache 2.0 this
function returns
C<L<Apache2::Const::OPT_UNSET|docs::2.0::api::Apache2::Const/C_Apache2__Const__OPT_UNSET_>> |
C<L<Apache2::Const::OPT_ALL|docs::2.0::api::Apache2::Const/C_Apache2__Const__OPT_ALL_>> |
C<L<Apache2::Const::OPT_INCNOEXEC|docs::2.0::api::Apache2::Const/C_Apache2__Const__OPT_INCNOEXEC_>> |
C<L<Apache2::Const::OPT_SYM_OWNER|docs::2.0::api::Apache2::Const/C_Apache2__Const__OPT_SYM_OWNER_>> |
C<L<Apache2::Const::OPT_MULTI|docs::2.0::api::Apache2::Const/C_Apache2__Const__OPT_MULTI_>>,
which corresponds to the default value (if not set) for Apache 2.2.

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret: C<$override_opts> ( integer )

the override options bitmask. Normally used with bitlogic operators
against C<L<Apache2::Const :options
constants|docs::2.0::api::Apache2::Const/C__options_>>.

=item since: 2.0.3

=back

For example if the configuration for the current request was:

  AllowOverride Options=Indexes,ExecCGI

The following applies:

  use Apache2::Const -compile => qw(:options);
  $r->allow_override_opts & Apache2::Const::OPT_EXECCGI; # TRUE
  $r->allow_override_opts & Apache2::Const::OPT_SYM_LINKS; # FALSE






=head2 C<auth_name>

Get/set the current Authorization realm (the per directory
configuration directive C<AuthName>):

  $auth_name = $r->auth_name();
  $auth_name = $r->auth_name($new_auth_name);

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item opt arg1: C<$new_auth_name> ( string )

If C<$new_auth_name> is passed a new C<AuthName> value is set

=item ret: C<$> ( integer )

The current value of C<AuthName>

=item since: 2.0.00

=back

The C<AuthName> directive creates protection realm within the server
document space. To quote RFC 1945 "These realms allow the protected
resources on a server to be partitioned into a set of protection
spaces, each with its own authentication scheme and/or authorization
database." The client uses the root URL of the server to determine
which authentication credentials to send with each HTTP request. These
credentials are tagged with the name of the authentication realm that
created them.  Then during the authentication stage the server uses
the current authentication realm, from C<$r-E<gt>auth_name>, to
determine which set of credentials to authenticate.








=head2 C<auth_type>

Get/set the type of authorization required for this request (the per
directory configuration directive C<AuthType>):

  $auth_type = $r->auth_type();
  $auth_type = $r->auth_type($new_auth_type);

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item opt arg1: C<$new_auth_type> ( string )

If C<$new_auth_type> is passed a new C<AuthType> value is set

=item ret: C<$> ( integer )

The current value of C<AuthType>

=item since: 2.0.00

=back

Normally C<AuthType> would be set to C<Basic> to use the basic
authentication scheme defined in RFC 1945, I<Hypertext Transfer
Protocol -- HTTP/1.0>. However, you could set to something else and
implement your own authentication scheme.









=head2 C<get_basic_auth_pw>

Get the password from the request headers

  my ($rc, $passwd) = $r->get_basic_auth_pw();

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret1: C<$rc>
( C<L<Apache2::Const constant|docs::2.0::api::Apache2::Const>> )

C<Apache2::Const::OK> if the C<$passwd> value is set (and assured a correct
value in
C<L<$r-E<gt>user|docs::2.0::api::Apache2::RequestRec/C_user_>>);
otherwise it returns an error code, either
C<Apache2::Const::HTTP_INTERNAL_SERVER_ERROR> if things are really confused,
C<Apache2::Const::HTTP_UNAUTHORIZED> if no authentication at all seemed to be
in use, or C<Apache2::Const::DECLINED> if there was authentication, but it
wasn't C<Basic> (in which case, the caller should presumably decline
as well).

=item ret2: C<$ret> (string)

The password as set in the headers (decoded)

=item since: 2.0.00

=back

If C<L<AuthType|/C_auth_type_>> is not set, this handler first sets it
to C<Basic>.








=head2 C<get_remote_logname>

Retrieve the login name of the remote user (RFC1413)

  $remote_logname = $r->get_remote_logname();

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret: C<$remote_logname> ( string )

The username of the user logged in to the client machine, or an empty
string if it could not be determined via RFC1413, which involves
querying the client's identd or auth daemon.

=item since: 2.0.00

=back

Do not confuse this method with
C<L<$r-E<gt>user|docs::2.0::api::Apache2::RequestRec/C_user_>>, which
provides the username provided by the user during the server
authentication.








=head2 C<note_auth_failure>

Setup the output headers so that the client knows how to authenticate
itself the next time, if an authentication request failed.  This
function works for both basic and digest authentication

  $r->note_auth_failure();

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret: no return value

=item since: 2.0.00

=back

This method requires C<AuthType> to be set to C<Basic> or
C<Digest>. Depending on the setting it'll call either
C<L<$r-E<gt>note_basic_auth_failure|/C_note_basic_auth_failure_>> or
C<L<$r-E<gt>note_digest_auth_failure|/C_note_digest_auth_failure_>>.









=head2 C<note_basic_auth_failure>

Setup the output headers so that the client knows how to authenticate
itself the next time, if an authentication request failed.  This
function works only for basic authentication

  $r->note_basic_auth_failure();

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret: no return value

=item since: 2.0.00

=back









=head2 C<note_digest_auth_failure>

Setup the output headers so that the client knows how to authenticate
itself the next time, if an authentication request failed.  This
function works only for digest authentication.

  $r->note_digest_auth_failure();

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret: no return value

=item since: 2.0.00

=back







=head2 C<requires>

Retrieve information about all of the requires directives for this request

  $requires = $r->requires

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret: C<$requires> ( ARRAY ref )

Returns an array reference of hash references, containing information
related to the C<require> directive.

=item since: 2.0.00

=back

This is normally used for access control.

For example if the configuration had the following require directives:

    Require user  goo bar
    Require group bar tar

this method will return the following datastructure:

  [
    {
      'method_mask' => -1,
      'requirement' => 'user goo bar'
    },
    {
      'method_mask' => -1,
      'requirement' => 'group bar tar'
    }
  ];

The I<requirement> field is what was passed to the C<Require>
directive.  The I<method_mask> field is a bitmask which can be
modified by the C<Limit> directive, but normally it can be safely
ignored as it's mostly used internally. For example if the
configuration was:

    Require user goo bar
    Require group bar tar
    <Limit POST>
       Require valid-user
    </Limit>

and the request method was C<POST>, C<$r-E<gt>requires> will return:

  [
    {
      'method_mask' => -1,
      'requirement' => 'user goo bar'
    },
    {
      'method_mask' => -1,
      'requirement' => 'group bar tar'
    }
    {
      'method_mask' => 4,
      'requirement' => 'valid-user'
    }
  ];

But if the request method was C<GET>, it will return only:

  [
    {
      'method_mask' => -1,
      'requirement' => 'user goo bar'
    },
    {
      'method_mask' => -1,
      'requirement' => 'group bar tar'
    }
  ];

As you can see Apache gives you the requirements relevant for the
current request, so the I<method_mask> is irrelevant.

It is also a good time to remind that in the general case, access
control directives should not be placed within a E<lt>LimitE<gt>
section.  Refer to the Apache documentation for more information.

Using the same configuration and assuming that the request was of type
POST, the following code inside an Auth handler:

  my %require =
      map { my ($k, $v) = split /\s+/, $_->{requirement}, 2; ($k, $v||'') }
      @{ $r->requires };

will populate C<%require> with the following pairs:

  'group' => 'bar tar',
  'user' => 'goo bar',
  'valid-user' => '',









=head2 C<satisfies>

How the requires lines must be met. What's the applicable value of the
C<Satisfy> directive:

  $satisfy = $r->satisfies();

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret: C<$satisfy> ( integer )

How the requirements must be met.  One of the C<L<Apache2::Const
:satisfy constants|docs::2.0::api::Apache2::Const/C__satisfy_>>:

C<L<Apache2::Const::SATISFY_ANY|docs::2.0::api::Apache2::Const/C_Apache2__Const__SATISFY_ANY_>>,
C<L<Apache2::Const::SATISFY_ALL|docs::2.0::api::Apache2::Const/C_Apache2__Const__SATISFY_ALL_>>
and
C<L<Apache2::Const::SATISFY_NOSPEC|docs::2.0::api::Apache2::Const/C_Apache2__Const__SATISFY_NOSPEC_>>.

=item since: 2.0.00

=back

See the documentation for the C<Satisfy> directive in the Apache
documentation.





=head2 C<some_auth_required>

Can be used within any handler to determine if any authentication is
required for the current request:

  $need_auth = $r->some_auth_required();

=over 4

=item obj: C<$r>
( C<L<Apache2::RequestRec object|docs::2.0::api::Apache2::RequestRec>> )

The current request

=item ret: C<$need_auth> ( boolean )

TRUE if authentication is required, FALSE otherwise

=item since: 2.0.00

=back




=head1 See Also

L<mod_perl 2.0 documentation|docs::2.0::index>.




=head1 Copyright

mod_perl 2.0 and its core modules are copyrighted under
The Apache Software License, Version 2.0.




=head1 Authors

L<The mod_perl development team and numerous
contributors|about::contributors::people>.

=cut

