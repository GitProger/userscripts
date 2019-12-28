#!/usr/bin/env perl

use strict;
use warnings;
 
my $filename = "dummy.html";
my $file;

if (!open(my $file, '<:encoding(UTF-8)', $filename)) {
    die "Could not open file '$filename' $!";
}

print("Content-type: text/html\n\n");

while (my $row = <$file>) {
    chomp $row;
    print "$row\n";
}
