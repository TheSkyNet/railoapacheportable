@rem = '--*-Perl-*--
@echo off
if "%OS%" == "Windows_NT" goto WinNT
perl -x -S "%0" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto endofperl
:WinNT
perl -x -S %0 %*
if NOT "%COMSPEC%" == "%SystemRoot%\system32\cmd.exe" goto endofperl
if %errorlevel% == 9009 echo You do not have Perl in your PATH.
if errorlevel 1 goto script_failed_so_exit_with_non_zero_val 2>nul
goto endofperl
@rem ';
#!/usr/bin/perl -w
#line 15

use strict;
use App::Prove;

my $app = App::Prove->new;
$app->process_args(@ARGV);
exit( $app->run ? 0 : 1 );

__END__

=head1 NAME

prove - Run tests through a TAP harness.

=head1 USAGE

 prove [options] [files or directories]

=head1 OPTIONS

Boolean options:

 -v,  --verbose     Print all test lines.
 -l,  --lib         Add 'lib' to the path for your tests (-Ilib).
 -b,  --blib        Add 'blib/lib' and 'blib/arch' to the path for your tests
 -s,  --shuffle     Run the tests in random order.
 -c,  --color       Colored test output (default).
      --nocolor     Do not color test output.
      --count       Show the X/Y test count when not verbose (default)
      --nocount     Disable the X/Y test count.
 -D   --dry         Dry run. Show test that would have run.
      --ext         Set the extension for tests (default '.t')
 -f,  --failures    Show failed tests.
 -o,  --comments    Show comments.
      --fork        Fork to run harness in multiple processes.
      --ignore-exit Ignore exit status from test scripts.
 -m,  --merge       Merge test scripts' STDERR with their STDOUT.
 -r,  --recurse     Recursively descend into directories.
      --reverse     Run the tests in reverse order.
 -q,  --quiet       Suppress some test output while running tests.
 -Q,  --QUIET       Only print summary results.
 -p,  --parse       Show full list of TAP parse errors, if any.
      --directives  Only show results with TODO or SKIP directives.
      --timer       Print elapsed time after each test.
      --normalize   Normalize TAP output in verbose output
 -T                 Enable tainting checks.
 -t                 Enable tainting warnings.
 -W                 Enable fatal warnings.
 -w                 Enable warnings.
 -h,  --help        Display this help
 -?,                Display this help
 -H,  --man         Longer manpage for prove
      --norc        Don't process default .proverc

Options that take arguments:

 -I                 Library paths to include.
 -P                 Load plugin (searches App::Prove::Plugin::*.)
 -M                 Load a module.
 -e,  --exec        Interpreter to run the tests ('' for compiled tests.)
      --harness     Define test harness to use.  See TAP::Harness.
      --formatter   Result formatter to use. See TAP::Harness.
 -a,  --archive     Store the resulting TAP in an archive file.
 -j,  --jobs N      Run N test jobs in parallel (try 9.)
      --state=opts  Control prove's persistent state.
      --rc=rcfile   Process options from rcfile

=head1 NOTES

=head2 .proverc

If F<~/.proverc> or F<./.proverc> exist they will be read and any
options they contain processed before the command line options. Options
in F<.proverc> are specified in the same way as command line options:

    # .proverc
    --state=hot,fast,save
    -j9 --fork

Additional option files may be specified with the C<--rc> option.
Default option file processing is disabled by the C<--norc> option.

Under Windows and VMS the option file is named F<_proverc> rather than
F<.proverc> and is sought only in the current directory.

=head2 Reading from C<STDIN>

If you have a list of tests (or URLs, or anything else you want to test) in a
file, you can add them to your tests by using a '-':

 prove - < my_list_of_things_to_test.txt

See the C<README> in the C<examples> directory of this distribution.

=head2 Default Test Directory

If no files or directories are supplied, C<prove> looks for all files
matching the pattern C<t/*.t>.

=head2 Colored Test Output

Colored test output is the default, but if output is not to a
terminal, color is disabled. You can override this by adding the 
C<--color> switch.

Color support requires L<Term::ANSIColor> on Unix-like platforms and
L<Win32::Console> windows. If the necessary module is not installed
colored output will not be available.

=head2 Exit Code

If the tests fail C<prove> will exit with non-zero status.

=head2 Arguments to Tests

It is possible to supply arguments to tests. To do so separate them from
prove's own arguments with the arisdottle, '::'. For example

 prove -v t/mytest.t :: --url http://example.com
 
would run F<t/mytest.t> with the options '--url http://example.com'.
When running multiple tests they will each receive the same arguments.

=head2 C<--exec>

Normally you can just pass a list of Perl tests and the harness will know how
to execute them.  However, if your tests are not written in Perl or if you
want all tests invoked exactly the same way, use the C<-e>, or C<--exec>
switch:

 prove --exec '/usr/bin/ruby -w' t/
 prove --exec '/usr/bin/perl -Tw -mstrict -Ilib' t/
 prove --exec '/path/to/my/customer/exec'

=head2 C<--merge>

If you need to make sure your diagnostics are displayed in the correct
order relative to test results you can use the C<--merge> option to
merge the test scripts' STDERR into their STDOUT. 

This guarantees that STDOUT (where the test results appear) and STDOUT
(where the diagnostics appear) will stay in sync. The harness will
display any diagnostics your tests emit on STDERR.

Caveat: this is a bit of a kludge. In particular note that if anything
that appears on STDERR looks like a test result the test harness will
get confused. Use this option only if you understand the consequences
and can live with the risk.

=head2 C<--state>

You can ask C<prove> to remember the state of previous test runs and
select and/or order the tests to be run based on that saved state.

The C<--state> switch requires an argument which must be a comma
separated list of one or more of the following options.

=over

=item C<last>

Run the same tests as the last time the state was saved. This makes it
possible, for example, to recreate the ordering of a shuffled test.

    # Run all tests in random order
    $ prove -b --state=save --shuffle

    # Run them again in the same order
    $ prove -b --state=last

=item C<failed>

Run only the tests that failed on the last run.

    # Run all tests
    $ prove -b --state=save
    
    # Run failures
    $ prove -b --state=failed

If you also specify the C<save> option newly passing tests will be
excluded from subsequent runs.

    # Repeat until no more failures
    $ prove -b --state=failed,save

=item C<passed>

Run only the passed tests from last time. Useful to make sure that no
new problems have been introduced.

=item C<all>

Run all tests in normal order. Multple options may be specified, so to
run all tests with the failures from last time first:

    $ prove -b --state=failed,all,save

=item C<hot>

Run the tests that most recently failed first. The last failure time of
each test is stored. The C<hot> option causes tests to be run in most-recent-
failure order.

    $ prove -b --state=hot,save

Tests that have never failed will not be selected. To run all tests with
the most recently failed first use

    $ prove -b --state=hot,all,save

This combination of options may also be specified thus

    $ prove -b --state=adrian

=item C<todo>

Run any tests with todos.

=item C<slow>

Run the tests in slowest to fastest order. This is useful in conjunction
with the C<-j> parallel testing switch to ensure that your slowest tests
start running first.

    $ prove -b --state=slow -j9 

=item C<fast>

Run test tests in fastest to slowest order.

=item C<new>

Run the tests in newest to oldest order based on the modification times
of the test scripts.

=item C<old>

Run the tests in oldest to newest order.

=item C<fresh>

Run those test scripts that have been modified since the last test run.

=item C<save>

Save the state on exit. The state is stored in a file called F<.prove>
(F<_prove> on Windows and VMS) in the current directory.

=back

The C<--state> switch may be used more than once.

    $ prove -b --state=hot --state=all,save

=head2 @INC

prove introduces a separation between "options passed to the perl which
runs prove" and "options passed to the perl which runs tests"; this
distinction is by design. Thus the perl which is running a test starts
with the default C<@INC>. Additional library directories can be added
via the C<PERL5LIB> environment variable, via -Ifoo in C<PERL5OPT> or
via the C<-Ilib> option to F<prove>.

=head2 Taint Mode

Normally when a Perl program is run in taint mode the contents of the
C<PERL5LIB> environment variable do not appear in C<@INC>.

Because C<PERL5LIB> is often used during testing to add build directories
to C<@INC> prove (actually L<TAP::Parser::Source::Perl>) passes the
names of any directories found in C<PERL5LIB> as -I switches. The net
effect of this is that C<PERL5LIB> is honoured even when prove is run in
taint mode.

=head1 PLUGINS

Plugins can be loaded using the C<< -PI<plugin> >> syntax, eg:

  prove -PMyPlugin

This will search for a module named C<App::Prove::Plugin::MyPlugin>, or failing
that, C<MyPlugin>.  If the plugin can't be found, C<prove> will complain & exit.

You can pass arguments to your plugin by appending C<=arg1,arg2,etc> to the
plugin name:

  prove -PMyPlugin=fou,du,fafa

Please check individual plugin documentation for more details.

=head2 Available Plugins

For an up-to-date list of plugins available, please check CPAN:

L<http://search.cpan.org/search?query=App%3A%3AProve+Plugin>

=head2 Writing Plugins

Please see L<App::Prove/PLUGINS>.

=cut

# vim:ts=4:sw=4:et:sta

__END__
:endofperl
