#!/usr/bin/env perl
use strict;
use warnings;
use Socket;

my $host = shift;
my $port = shift || 13333;

for (;;) {
    socket(SOCK, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
    my $paddr = sockaddr_in($port, inet_aton($host));
    connect(SOCK, $paddr);
    print "\$ ";
    my $t = readline(); # <STDIN>
    send(SOCK, "$t\n", 0);

    my @data = <SOCK>;
    print @data; # join "\n",
}

close(SOCK);
