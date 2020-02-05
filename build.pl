#!/usr/bin/env perl

use strict;
use warnings;

my $__USAGE__ = "Usage: build main-file final-object [libs]\n";
my $__FLAGS__ = "-s -O2";
my $__COMPILER__ = "gcc";
my %__LIBMAP__ = (
    "curses"  =>  "-lcurses",
    "curl"    =>  "-lcurl",
    "gtk"     =>  "`pkg-config --cflags --libs gtk+-3.0`",
);

sub build {
    my ($fname, $objname) = (shift, shift);    
    my $cmd = "$__COMPILER__ $fname $__FLAGS__ -o $objname ";
    foreach my $curlib (@_) {
		$cmd .= $__LIBMAP__{$curlib} . " "
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
        print $__USAGE__;
        return -1;
    }
}

exit(main(@ARGV))
