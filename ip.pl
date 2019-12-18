#!/usr/bin/env perl

use strict;
use warnings;

sub getip {
    my $all = `ifconfig`;
    my $beg = index($all, "inet addr:192.168.");
    my $end = index($all, "Bcast");
    if ($beg == -1 or $end == -1) {
        return "";
    }
    $beg = $beg + length("inet addr:");
    my $size = $end - $beg;
    return substr($all, $beg, $size);
}

my $ip = getip();
if ($ip eq "") {
    print "You are not connected to a local network.\n";
} else {
    print $ip, "\n";
}
