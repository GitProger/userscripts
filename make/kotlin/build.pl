#!/usr/bin/perl
#use strict;use warnings;
use utf8; binmode(STDOUT, ':utf8');
#open(STDERR, "/dev/null"); #wide character in print line...
use JSON;

my $conf = decode_json `cat config.sb`;
my $home = $conf->{"home"};
my $src = $conf->{"src"};
chdir($home);

my $jar = $conf->{"mainjar"};
my $main = $src . "/" . $conf->{"base"};
my $modules = join " ", map { "$src/$_" } @{$conf->{"modules"}};

sub run {
    my $jar = shift;
    system("java -jar $jar");
}

sub compile {
	my ($main, $modules, $jar) = @_;
    my $cmd = "kotlinc $main $modules -include-runtime -d $jar";
    print "$cmd\n";
    system($cmd);
    print "Compilated to '$jar'. Running...\n" if (!$?);
}

my $flag = shift;
if (!defined($flag) || $flag ne "r") {
    compile($main, $modules, $jar);
}
run($jar) unless ($?);
