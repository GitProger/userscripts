#!/usr/bin/env perl

use strict;
use warnings;
use config;

sub build {
    my ($fname, $objname) = (shift, shift);    
    my $cmd = "${config::COMPILER} $fname ${config::FLAGS} -o $objname ";
    foreach my $curlib (@_) {
        $cmd .= $config::LIBS{$curlib} . " "
    }
    print "Running: $cmd\n";
    print "-" x (9 + length($cmd)), "\n";
    print `$cmd`;
}

sub main {
    if (scalar(@_) >= 2) { #  $#_ >= 1
        build(@_);
        return 0;
    } else {
        my $__USAGE__ = "Usage: build [main file] [final object] [libs]\n";
        print $__USAGE__;
        return -1;
    }
}

exit(main(@ARGV));
