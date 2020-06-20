#!/usr/bin/env perl
use strict;
use warnings;
use CGI;
print "Content-type: text/plain\n\n";

my $cgi = CGI->new();
my $t = $cgi->param("type") || "";
$_ = $cgi->param("value") || ""; # '$_' is a default variable for perl regexp's (/.../ as $_ =~ /.../)

print int(
    $t eq "email" ? /(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)/i :
    $t eq "host" ? /[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/i :
    $t eq "url" ? /^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:\/?#[\]@!\$&'\(\)\*\+,;=.]+$/i :
    0
);

# examples returning '1'
# http://localhost/uni_regex.pl?type=email&value=user@gmail.com
# http://localhost/uni_regex.pl?type=host&value=www.google.com
# http://localhost/uni_regex.pl?type=url&value=https://www.google.com/search?q=query/#/js_cmds
