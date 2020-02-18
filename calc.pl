#!/usr/bin/env perl

use strict;
use warnings;

sub calc {
    my $e = shift;
    return
        ($e =~ m/^[-\d\*\/\+%(\*\*)\(\)\s(<<|>>|&|\||\^|~|)]*$/) ?
            eval($e)
        :
            "Uncorrect expression.";
}

sub main {
    if ($#_ == -1) {
        print "Usage: calc <expr>\n";
        return -1;
    }
    my $param = "";
    while (scalar(@_)) {
        $param .= shift;
    }
    print calc($param), "\n";
    return 0;
}

exit(main(@ARGV));
