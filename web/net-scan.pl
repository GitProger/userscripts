#!/usr/bin/env perl

use strict;
use warnings;

my $PACK_COUNT = 1; #2

sub usage {
    print "Usage: net-scan [beginAddr] [endAddr]\n\tScan all addresses in [beginAddr..endAddr]\n";
}

sub ip_to_int {
    my ($i0, $i1, $i2, $i3) = (shift =~ m/(\d+)\.(\d+)\.(\d+)\.(\d+)/);
    return ($i0 << 24) + ($i1 << 16) + ($i2 << 8) + $i3;
}

sub int_to_ip {
    our $ip = shift;
    sub sep {
        my $res = $ip % 0x100;
        $ip = int($ip / 0x100);
        return $res;
    }
    my $i3 = sep(); my $i2 = sep(); my $i1 = sep(); my $i0 = sep();
    return "$i0.$i1.$i2.$i3";
}

sub check {
    my $host = shift;
    `ping -c $PACK_COUNT $host`;
    return $?;
}

sub scan {
    our $i = 0; # like static
    sub boot {
        my @all = ("/", "-", "\\", "|");
        $i = ($i + 1) % 4;
        return $all[$i];
    }
    sub dt_boot {
        return (("." x $i) . (" " x (4 - $i)));
    }
    my ($beg, $end) = (ip_to_int(shift), ip_to_int(shift));
    for (my $addr = $beg; $addr <= $end; $addr++) {
        my $host = int_to_ip($addr);
        my $ok = check($host);
        print(("\b" x 32) . (" " x 32) . ("\b" x 32));
        if ($ok == 0) {
            print "Opened: $host\n";
        }
        print boot(), " Scanning", dt_boot(), " $host";
    }
}

sub main {
    if ($#_ < 0) {
        usage();
        return -1;
    }
    my $beg = shift;
    my $end = "";
    if ($#_ == -1) {
        $end = $beg;
    } else {
        $end = shift;
    }
    scan($beg, $end);
    print(("\b" x 32) . (" " x 32) . "\n");
    return 0;
}

exit(main(@ARGV));
