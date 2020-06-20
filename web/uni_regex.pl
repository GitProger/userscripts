#!/usr/bin/env perl
use strict;
use warnings;
use CGI;
print "Content-type: text/plain; charset=UTF8\n\n";

my $cgi = CGI->new();
my $t = $cgi->param("type") || "";
$_ = $cgi->param("value") || "";

sub get {
    return 
        $t eq "email" ? /(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)/i :
        $t eq "host" ? /[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/i:
        $t eq "url" ? /((https?://|ftp://|www\.|[^\s:=]+@www\.).*?[a-z_\/0-9\-\#=&])(?=(\.|,|;|\?|\!)?("|'|\[|\s|\r|\n|$))/i :
        0;
}

print int(get());
