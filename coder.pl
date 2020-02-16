#!/usr/bin/env perl

use strict;
use warnings;

sub getfile {
    my $filename = $_[0];
    my $file;
    my $res = "";
    if (!open($file, "<:encoding(UTF-8)", $filename)) {
        print "Could not open file '$filename' $!";
        return "";
    }
    while (my $s = <$file>) {
        $res .= $s;
    }
    close($file);
    return $res;
}

sub main {
    my $n = scalar(@_);
    if ($n != 1 && $n != 2) {
        print "Usage:\tcoder [file] [-e string]\n";
        print "\t'eval pack('H*', \$code);' in your programs\n\n";
        return -1;
    };
    my $code = "";
    if ($n == 1) {
        $code = getfile(shift);
    } elsif (shift eq "-e") {
        $code = shift;
    } else {
        print "Invalid key.\n";
    }

    my $obf = unpack("H*", $code);
    # eval pack('H*', $var);
    print $obf;
    return 0;
}

exit(main(@ARGV));
