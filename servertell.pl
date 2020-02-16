#!/usr/bin/env perl

use strict;
use warnings;
use IO::Socket;

sub servertell {
    my $host = shift;
    my $sock = shift or die "Invalid socket handler\n";
    #for(;;)
    {
        my $cmd = <STDIN>;
        chomp($cmd);
        my $method = substr($cmd, 0, index(" ", $cmd));
        if (not uc($method) =~ m/(GET|HEAD|POST)/) {
            print "Invalid method: $cmd\n";
            next;
        }
        my $query = $cmd . " HTTP/1.1\r\n";
        $query .= "Host: $host\r\n";

        if (uc($method) eq "POST") {
            my ($content, $input) = ("", "");
            print "Content: ";
            do {
                $input = <STDIN>;
                $content .= $input;
            } while ($input);
            $query .= "Content-Length: " . length($content) . "\r\n";
            $query .= "\r\n";
            $query .= $content;
        }

        $query .= "\r\n";
        print $sock $query;
        print "-" x 5 . " Response " . "-" x 10, "\n"; 
        print <$sock>, "\n";
        print "-" x 25, "\n";
        print "Errors: $!\n" if ($!);
    }
}

sub main {
    my $host = shift || "localhost";
    my $port = shift || "80";
    for (;;) {
        my $sock = IO::Socket::INET->new(
            "PeerAddr" => $host,
            "PeerPort" => $port,
            "Proto"    => "tcp",
        ) or die $!;
        servertell($host, $sock);
        close $sock;
    }
}

exit(main(@ARGV));
