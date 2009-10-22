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


package Apache2::Process;

use strict;
use warnings FATAL => 'all';



use Apache2::XSLoader ();
our $VERSION = '2.000004';
Apache2::XSLoader::load __PACKAGE__;



1;
__END__

=head1 NAME

Apache2::Process - Perl API for Apache process record




=head1 Synopsis

  use Apache2::Process ();
  use Apache2::ServerRec ();
  my $proc = $s->process;
  
  # global pool cleared on exit
  my $global_pool = $proc->pool;
  
  # configuration pool cleared on restart
  my $pconf = $proc->pconf;
  
  # short program name (e.g. httpd)
  my $proc_name = $proc->short_name;






=head1 Description

C<Apache2::Process> provides the API for the Apache process object,
which you can retrieve with
C<L<$s-E<gt>process|docs::2.0::api::Apache2::ServerRec/C_process_>>:

  use Apache2::ServerRec ();
  $proc = $s->process;




=head1 API

C<Apache2::Process> provides the following functions and/or methods:




=head2 C<pconf>

Get configuration pool object.

  $p = $proc->pconf();

=over 4

=item obj: C<$proc>
( C<L<Apache2::Process object|docs::2.0::api::Apache2::Process>> )

=item ret: C<$p>
( C<L<APR::Pool object|docs::2.0::api::APR::Pool>> )

=item since: 2.0.00

=back

This pool object gets cleared on server restart.







=head2 C<pool>

Get the global pool object.

  $p = $proc->pool();

=over 4

=item obj: C<$proc>
( C<L<Apache2::Process object|docs::2.0::api::Apache2::Process>> )

=item ret: C<$p>
( C<L<APR::Pool object|docs::2.0::api::APR::Pool>> )

=item since: 2.0.00

=back

This pool object gets cleared only on (normal) server exit








=head2 C<short_name>

The name of the program used to execute the program

  $short_name = $proc->short_name();

=over 4

=item obj: C<$proc>
( C<L<Apache2::Process object|docs::2.0::api::Apache2::Process>> )

=item ret: C<$short_name> (string)

e.g. C<httpd>

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

