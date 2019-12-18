#!/usr/bin/env perl

use strict;
use warnings;

my $text = `cat conf.sh` . "\n";
my @strs = split("\n", $text);
for (my $i = 0; $i < scalar(@strs); $i++) {
     my $cur = $strs[$i];
     system("echo \"$cur \" >> ~/.bashrc");
}
