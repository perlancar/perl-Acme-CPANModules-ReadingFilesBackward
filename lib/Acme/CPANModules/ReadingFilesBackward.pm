package Acme::CPANModules::ReadingFilesBackward;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use Acme::CPANModulesUtil::Misc;

our $LIST = {
    summary => 'Reading files backward (in reverse)',
    description => <<'_',

Probably the fastest way, if you are on a Unix system, is to use the **tac**
command, which can read a file line by line in reverse order, or paragraph by
paragraph, or character by character, or word by word, or by a custom separator
string or regular expression. Example for using it from Perl:

    open my $fh, "tac /etc/passwd |";
    print while <$fh>;

Another convenient way is to use the Perl I/O layer <pm:PerlIO::reverse>. It
only does line-by-line reversing, but you can use the regular Perl API. You
don't even have to `use` the module explicitly (but of course you have to get it
installed first):

    open my $fh, "<:reverse", "/etc/passwd";
    print while <$fh>;

If your file is small (fits in your system's memory), you can also slurp the
file contents first into an array (either line by line, or paragraph by
paragraph, or what have you) and then simply `reverse` the array:

    open my $fh, "<", "/etc/passwd";
    my @lines = <$fh>;
    print for reverse @lines;

If the above solutions do not fit your needs, there are also these modules which
can help: <pm:File::ReadBackward>, <pm:File::Bidirectional>. File::ReadBackward
is slightly faster than File::Bidirectional, but File::Bidirectional can read
forward as well as backward. I now simply prefer PerlIO::reverse because I don't
have to use a custom API for reading files.

_
    'x.app.cpanmodules.show_entries' => 0,
};

Acme::CPANModulesUtil::Misc::populate_entries_from_module_links_in_description;

1;
# ABSTRACT:

=head1 prepend:SEE ALSO

L<Acme::CPANModules::PickingRandomLinesFromFile>
