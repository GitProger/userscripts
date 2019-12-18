#!/usr/bin/env perl

use strict;
use warnings;

my $__USAGE__ = "Usage: build [filelist] [target binary]\n";

sub build_with_curl {
    my ($fname, $objname) = @_;    
    my $cmd = "gcc -s -O2 " . $fname . " -lcurl -o " . $objname;
    print "Running: $cmd\n";
    print "-" x (9 + length($cmd)), "\n";
    print `$cmd`;
}

if ($#ARGV > 0) {
    my $flist = "";
    my $target = pop(@ARGV);
    for (my $i = 0; $i < scalar(@ARGV); $i++) {
        $flist = $flist . " " . $ARGV[$i];
	} 
    build_with_curl($ARGV[0], $target);
    exit 0;
} else {
    print __USAGE__;
    exit -1;
}
