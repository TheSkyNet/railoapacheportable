# 
# /*
#  * *********** WARNING **************
#  * This file generated by Apache2::Build/0.01
#  * Any changes made here will be lost
#  * ***********************************
#  * 01: lib/ModPerl/Code.pm:709
#  * 02: lib/Apache2/Build.pm:926
#  * 03: lib/Apache2/Build.pm:946
#  * 04: C:\perl\bin\.cpanplus\5.10.0\build\mod_perl-2.0.4\Makefile.PL:405
#  * 05: C:\perl\bin\.cpanplus\5.10.0\build\mod_perl-2.0.4\Makefile.PL:96
#  * 06: C:\perl\bin\cpanp-run-perl.bat:21
#  */
# 
package Apache2::BuildConfig;

use Apache2::Build ();

sub new {
    bless( {
        'API_VERSION' => 2,
        'APXS_APR_BINDIR' => 'C:\\Apache2.2\\bin',
        'APXS_APU_BINDIR' => 'C:\\Apache2.2\\bin',
        'APXS_BINDIR' => 'C:\\Apache2.2\\bin',
        'APXS_EXTRA_CFLAGS' => '',
        'APXS_EXTRA_CPPFLAGS' => '',
        'APXS_INCLUDEDIR' => 'C:\\Apache2.2\\include',
        'APXS_LIBEXECDIR' => 'C:\\Apache2.2\\modules',
        'APXS_NOTEST_CPPFLAGS' => '',
        'APXS_PREFIX' => 'C:\\Apache2.2',
        'MODPERL_AP_INCLUDEDIR' => 'C:\\Apache2.2\\include',
        'MODPERL_AP_LIBDIR' => 'C:\\Apache2.2\\lib',
        'MODPERL_AP_LIBEXECDIR' => 'C:\\Apache2.2\\modules',
        'MODPERL_AP_LIBS' => 'libapr-1.lib libaprutil-1.lib libhttpd.lib',
        'MODPERL_AR' => 'lib',
        'MODPERL_ARCHLIBEXP' => 'c:\\perl\\lib',
        'MODPERL_CC' => 'cl',
        'MODPERL_CCCDLFLAGS' => ' ',
        'MODPERL_CCOPTS' => ' -nologo -GF -W3 -MD -Zi -DNDEBUG -O1 -DWIN32 -D_CONSOLE -DNO_STRICT -DHAVE_DES_FCRYPT -DPERL_IMPLICIT_CONTEXT -DPERL_IMPLICIT_SYS -DUSE_PERLIO -DPERL_MSVCRT_READFIX -I"C:\\perl\\lib\\CORE" -DMOD_PERL -DMP_COMPAT_1X',
        'MODPERL_CP' => '$(MODPERL_PERLPATH) -MExtUtils::Command -e cp',
        'MODPERL_CPPRUN' => 'cl -nologo -E',
        'MODPERL_C_FILES' => 'mod_perl.c modperl_interp.c modperl_tipool.c modperl_log.c modperl_config.c modperl_cmd.c modperl_options.c modperl_callback.c modperl_handler.c modperl_gtop.c modperl_util.c modperl_io.c modperl_io_apache.c modperl_filter.c modperl_bucket.c modperl_mgv.c modperl_pcw.c modperl_global.c modperl_env.c modperl_cgi.c modperl_perl.c modperl_perl_global.c modperl_perl_pp.c modperl_sys.c modperl_module.c modperl_svptr_table.c modperl_const.c modperl_constants.c modperl_apache_compat.c modperl_error.c modperl_debug.c modperl_common_util.c modperl_common_log.c modperl_hooks.c modperl_directives.c modperl_flags.c modperl_xsinit.c modperl_exports.c',
        'MODPERL_DLEXT' => 'so',
        'MODPERL_H_FILES' => 'mod_perl.h modperl_interp.h modperl_tipool.h modperl_log.h modperl_config.h modperl_cmd.h modperl_options.h modperl_callback.h modperl_handler.h modperl_gtop.h modperl_util.h modperl_io.h modperl_io_apache.h modperl_filter.h modperl_bucket.h modperl_mgv.h modperl_pcw.h modperl_global.h modperl_env.h modperl_cgi.h modperl_perl.h modperl_perl_global.h modperl_perl_pp.h modperl_sys.h modperl_module.h modperl_svptr_table.h modperl_const.h modperl_constants.h modperl_apache_compat.h modperl_error.h modperl_debug.h modperl_common_util.h modperl_common_log.h modperl_perl_unembed.h modperl_types.h modperl_time.h modperl_apache_includes.h modperl_perl_includes.h modperl_apr_includes.h modperl_apr_compat.h modperl_common_includes.h modperl_common_types.h modperl_hooks.h modperl_directives.h modperl_flags.h modperl_trace.h modperl_largefiles.h',
        'MODPERL_INC' => '-IC:\\perl\\bin\\.cpanplus\\5.10.0\\build\\mod_perl-2.0.4\\src\\modules\\perl -IC:\\perl\\bin\\.cpanplus\\5.10.0\\build\\mod_perl-2.0.4\\xs -IC:\\Apache2.2\\include -I"C:\\Apache2.2\\include"   -IC:\\Apache2.2\\include',
        'MODPERL_LD' => 'link',
        'MODPERL_LDDLFLAGS' => '-dll -nologo -nodefaultlib -debug -opt:ref,icf  -libpath:"c:\\perl\\lib\\CORE"  -machine:x86',
        'MODPERL_LDOPTS' => '    C:\\perl\\lib\\CORE\\perl510.lib oldnames.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib netapi32.lib uuid.lib ws2_32.lib mpr.lib winmm.lib version.lib odbc32.lib odbccp32.lib msvcrt.lib',
        'MODPERL_LIB' => 'mod_perl.so',
        'MODPERL_LIBNAME' => 'mod_perl',
        'MODPERL_LIBPERL' => 'c:\\perl\\lib/CORE/perl510.lib',
        'MODPERL_LIB_DSO' => 'mod_perl.so',
        'MODPERL_LIB_EXT' => '.lib',
        'MODPERL_LIB_LOCATION' => 'C:\\perl\\bin\\.cpanplus\\5.10.0\\build\\mod_perl-2.0.4\\src\\modules\\perl\\mod_perl.lib',
        'MODPERL_LIB_SHARED' => 'mod_perl.so',
        'MODPERL_LIB_STATIC' => 'mod_perl.lib',
        'MODPERL_MAKEFILE' => 'Makefile',
        'MODPERL_MANIFEST_LOCATION' => 'C:\\perl\\bin\\.cpanplus\\5.10.0\\build\\mod_perl-2.0.4\\src\\modules\\perl\\mod_perl.so.manifest',
        'MODPERL_MV' => '$(MODPERL_PERLPATH) -MExtUtils::Command -e mv',
        'MODPERL_OBJ_EXT' => '.obj',
        'MODPERL_OPTIMIZE' => '-MD -Zi -DNDEBUG -O1',
        'MODPERL_O_FILES' => 'mod_perl.o modperl_interp.o modperl_tipool.o modperl_log.o modperl_config.o modperl_cmd.o modperl_options.o modperl_callback.o modperl_handler.o modperl_gtop.o modperl_util.o modperl_io.o modperl_io_apache.o modperl_filter.o modperl_bucket.o modperl_mgv.o modperl_pcw.o modperl_global.o modperl_env.o modperl_cgi.o modperl_perl.o modperl_perl_global.o modperl_perl_pp.o modperl_sys.o modperl_module.o modperl_svptr_table.o modperl_const.o modperl_constants.o modperl_apache_compat.o modperl_error.o modperl_debug.o modperl_common_util.o modperl_common_log.o modperl_hooks.o modperl_directives.o modperl_flags.o modperl_xsinit.o modperl_exports.o',
        'MODPERL_O_PIC_FILES' => 'mod_perl.lo modperl_interp.lo modperl_tipool.lo modperl_log.lo modperl_config.lo modperl_cmd.lo modperl_options.lo modperl_callback.lo modperl_handler.lo modperl_gtop.lo modperl_util.lo modperl_io.lo modperl_io_apache.lo modperl_filter.lo modperl_bucket.lo modperl_mgv.lo modperl_pcw.lo modperl_global.lo modperl_env.lo modperl_cgi.lo modperl_perl.lo modperl_perl_global.lo modperl_perl_pp.lo modperl_sys.lo modperl_module.lo modperl_svptr_table.lo modperl_const.lo modperl_constants.lo modperl_apache_compat.lo modperl_error.lo modperl_debug.lo modperl_common_util.lo modperl_common_log.lo modperl_hooks.lo modperl_directives.lo modperl_flags.lo modperl_xsinit.lo modperl_exports.lo',
        'MODPERL_PERLPATH' => 'c:\\perl\\bin\\perl.exe',
        'MODPERL_PRIVLIBEXP' => 'c:\\perl\\lib',
        'MODPERL_RANLIB' => 'rem',
        'MODPERL_RM' => 'del',
        'MODPERL_RM_F' => '$(MODPERL_PERLPATH) -MExtUtils::Command -e rm_f',
        'MODPERL_TEST_F' => '$(MODPERL_PERLPATH) -MExtUtils::Command -e test_f',
        'MODPERL_XSUBPP' => '$(MODPERL_PERLPATH) $(MODPERL_PRIVLIBEXP)\\ExtUtils\\xsubpp -typemap $(MODPERL_PRIVLIBEXP)\\ExtUtils\\typemap -typemap C:\\perl\\bin\\.cpanplus\\5.10.0\\build\\mod_perl-2.0.4\\lib\\typemap',
        'MP_APR_LIB' => 'aprext',
        'MP_APXS' => 'C:\\Apache2.2\\bin\\apxs.bat',
        'MP_COMPAT_1X' => 1,
        'MP_GENERATE_XS' => 1,
        'MP_LIBNAME' => 'mod_perl',
        'MP_USE_DSO' => 1,
        'VERSION' => '2.0.4',
        'XS' => {},
        'ap_includedir' => 'C:\\Apache2.2\\include',
        'apr_bindir' => 'C:\\Apache2.2\\bin',
        'apr_config' => {
                          'HAS_DSO' => '1',
                          'HAS_FORK' => '0',
                          'HAS_INLINE' => '1',
                          'HAS_LARGE_FILES' => '0',
                          'HAS_MMAP' => '1',
                          'HAS_RANDOM' => '1',
                          'HAS_SENDFILE' => '0',
                          'HAS_THREADS' => '1'
                        },
        'apr_config_path' => 'C:\\Apache2.2\\bin\\apr-1-config.bat',
        'apr_includedir' => 'C:\\Apache2.2\\include',
        'apu_config_path' => 'C:\\Apache2.2\\bin\\apu-1-config.bat',
        'cwd' => 'C:\\perl\\bin\\.cpanplus\\5.10.0\\build\\mod_perl-2.0.4',
        'dir' => undef,
        'file_build_config' => 'lib\\Apache2\\BuildConfig.pm',
        'file_ldopts' => 'src\\modules\\perl\\ldopts',
        'file_makefile' => 'src\\modules\\perl\\Makefile',
        'httpd_is_source_tree' => '',
        'httpd_version' => {
                             'C:\\Apache2.2\\include' => '2.2.11'
                           }
      }, 'Apache2::Build' );
}

1;