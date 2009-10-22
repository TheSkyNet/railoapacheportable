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


package APR::Finfo;

use strict;
use warnings FATAL => 'all';


use APR ();
use APR::XSLoader ();
our $VERSION = '0.009000';
APR::XSLoader::load __PACKAGE__;



1;
__END__

=head1 NAME

APR::Finfo - Perl API for APR fileinfo structure


=head1 Synopsis

  use APR::Finfo ();
  use APR::Const -compile => qw(FINFO_NORM);
  my $finfo = APR::Finfo::stat("/tmp/test", APR::Const::FINFO_NORM, $pool);
  
  $device = $finfo->device;     # (stat $file)[0]
  $inode  = $finfo->inode;      # (stat $file)[1]
  $prot   = $finfo->protection; # (stat $file)[2]
  $nlink  = $finfo->nlink;      # (stat $file)[3]
  $gid    = $finfo->group;      # (stat $file)[4]
  $uid    = $finfo->user;       # (stat $file)[5]
  $size   = $finfo->size;       # (stat $file)[7]
  $atime  = $finfo->atime;      # (stat $file)[8]
  $mtime  = $finfo->mtime;      # (stat $file)[9]
  $ctime  = $finfo->ctime;      # (stat $file)[10]
  
  $csize = $finfo->csize; # consumed size: not portable!
  
  $filetype = $finfo->filetype; # file/dir/socket/etc
  
  $fname = $finfo->fname;
  $name  = $finfo->name;  # in filesystem case:
  
  # valid fields that can be queried
  $valid = $finfo->valid;






=head1 Description

APR fileinfo structure provides somewhat similar information to Perl's
C<stat()> call, but you will want to use this module's API to query an
already C<stat()'ed> filehandle to avoid an extra system call or to
query attributes specific to APR file handles.

During the HTTP request handlers coming after
C<L<PerlMapToStorageHandler|docs::2.0::user::handlers::http/PerlMapToStorageHandler>>,
C<L<$r-E<gt>finfo|docs::2.0::api::Apache2::RequestRec/C_finfo_>>
already contains the cached values from the apr's C<stat()> call. So
you don't want to perform it again, but instead get the C<ARP::Finfo>
object via:

  my $finfo = $r->finfo;



=head1 API

C<APR::Finfo> provides the following functions and/or methods:




=head2 C<atime>

Get the time the file was last accessed:

  $atime = $finfo->atime;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$atime> ( integer )

Last access time in seconds since the epoch

=item since: 2.0.00

=back

This method returns the same value as Perl's:

  (stat $filename)[8]

Note that this method may not be reliable on all platforms, most
notably Win32 -- FAT32 filesystems appear to work properly, but NTFS
filesystems do not.






=head2 C<csize>

Get the storage size consumed by the file

  $csize = $finfo->csize;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$csize> ( integer )

=item since: 2.0.00

=back

Chances are that you don't want to use this method, since its
functionality is not supported on most platforms (in which case it
always returns 0).







=head2 C<ctime>

Get the time the file was last changed

  $ctime = $finfo->ctime;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$ctime> ( integer )

Inode change time in seconds since the epoch

=item since: 2.0.00

=back

This method returns the same value as Perl's:

  (stat $filename)[10]

The ctime field is non-portable.  In particular, you cannot expect it
to be a "creation time", see "Files and Filesystems" in the
I<perlport> manpage for details.






=head2 C<device>

Get the id of the device the file is on.

  $device = $finfo->device;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$device> ( integer )

=item since: 2.0.00

=back

This method returns the same value as Perl's:

  (stat $filename)[0]

Note that this method is non-portable. It doesn't work on all
platforms, most notably Win32.






=head2 C<filetype>

Get the type of file.

  $filetype = $finfo->filetype;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$filetype> ( C<L<:filetype
constant|docs::2.0::api::APR::Const/C__filetype_>> )

=item since: 2.0.00

=back

For example:

  use APR::Pool;
  use APR::Finfo;
  use APR::Const -compile => qw(FILETYPE_DIR FILETYPE_REG FINFO_NORM);
  my $pool  = APR::Pool->new();
  my $finfo = APR::Finfo::stat("/tmp", APR::Const::FINFO_NORM, $pool);
  my $finfo = $finfo->filetype;
  if ($finfo == APR::Const::FILETYPE_REG) {
      print "regular file";
  }
  elsif ($finfo == APR::Const::FILETYPE_REG) {
      print "directory";
  }
  else {
      print "other file";
  }

Since F</tmp> is a directory, this will print:

  directory






=head2 C<fname>

Get the pathname of the file (possibly unrooted)

  $fname = $finfo->fname;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$filetype> ( string )

=item since: 2.0.00

=back








=head2 C<group>

Get the group id that owns the file:

  $gid = $finfo->group;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$gid> ( number )

=item since: 2.0.00

=back

This method returns the same value as Perl's:

  (stat $filename)[5]

Note that this method may not be meaningful on all platforms, most
notably Win32.  Incorrect results have also been reported on some
versions of OSX.







=head2 C<inode>

Get the inode of the file.

  $inode = $finfo->inode;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$inode> ( integer )

=item since: 2.0.00

=back

This method returns the same value as Perl's:

  (stat $filename)[1]

Note that this method may not be meaningful on all platforms, most
notably Win32.







=head2 C<mtime>

The time the file was last modified

  $mtime = $finfo->mtime;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$mtime> ( integer )

Last modify time in seconds since the epoch

=item since: 2.0.00

=back

This method returns the same value as Perl's:

  (stat $filename)[9]






=head2 C<name>

Get the file's name (no path) in filesystem case:

  $name = $finfo->name;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$device> ( string )

=item since: 2.0.00

=back






=head2 C<nlink>

Get the number of hard links to the file.

  $nlink = $finfo->nlink;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$nlink> ( integer )

=item since: 2.0.00

=back

This method returns the same value as Perl's:

  (stat $filename)[3]









=head2 C<protection>

Get the access permissions of the file.  Mimics Unix access rights.

  $prot = $finfo->protection;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$prot> ( C<L<:fprot
constant|docs::2.0::api::APR::Const/C__fprot_>> )

=item since: 2.0.00

=back

This method returns the same value as Perl's:

  (stat $filename)[2]








=head2 C<size>

Get the size of the file

  $size = $finfo->size;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$size> ( integer )

Total size of file, in bytes

=item since: 2.0.00

=back

This method returns the same value as Perl's:

  (stat $filename)[7]







=head2 C<stat>

Get the specified file's stats.

  $finfo = APR::Finfo::stat($fname, $wanted_fields, $p);

=over 4

=item arg1: C<$fname> ( string )

The path to the file to C<stat()>.

=item arg2: C<$wanted_fields> ( C<L<:finfo
constant|docs::2.0::api::APR::Const/C__finfo_>> )

The desired fields, as a bitmask flag of
C<L<APR::FINFO_*|docs::2.0::api::APR::Const/C__finfo_>> constants.

Notice that you can also use the constants that already combine
several elements in one. For example
C<L<APR::Const::FINFO_PROT|docs::2.0::api::APR::Const/C_APR__Const__FINFO_PROT_>>
asks for all protection bits,
C<L<APR::Const::FINFO_MIN|docs::2.0::api::APR::Const/C_APR__Const__FINFO_MIN_>> asks
for the following fields: type, mtime, ctime, atime, size and
C<L<APR::Const::FINFO_NORM|docs::2.0::api::APR::Const/C_APR__Const__FINFO_NORM_>>
asks for all atomic unix C<apr_stat()> fields (similar to perl's
C<stat()>).

=item arg3: C<$p> ( C<L<APR::Pool object|docs::2.0::api::APR::Pool>> )

the pool to use to allocate the file stat structure.

=item ret: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item since: 2.0.00

=back

For example, here is how to get most of the C<stat> fields:

  use APR::Pool ();
  use APR::Finfo ();
  use APR::Const -compile => qw(FINFO_NORM);
  my $pool = APR::Pool->new();
  my $finfo = APR::Finfo::stat("/tmp/test", APR::Const::FINFO_NORM, $pool);








=head2 C<user>

Get the user id that owns the file:

  $uid = $finfo->user;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item return: C<$uid> ( number )

=item since: 2.0.00

=back

This method returns the same value as Perl's:

  (stat $filename)[4]

Note that this method may not be meaningful on all platforms,
most notably Win32.






=head2 C<valid>

The bitmask describing valid fields of this apr_finfo_t structure
including all available 'wanted' fields and potentially more

  $valid = $finfo->valid;

=over 4

=item obj: C<$finfo>
( C<L<APR::Finfo object|docs::2.0::api::APR::Finfo>> )

=item arg1: C<$valid> ( bitmask )

This bitmask flag should be bit-OR'ed against C<L<:finfo
constant|docs::2.0::api::APR::Const/C__finfo_>> constants.

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

