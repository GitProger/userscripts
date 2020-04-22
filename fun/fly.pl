#!/usr/bin/env perl

use strict;
use warnings;
use Time::HiRes;

my @person;

sub set_pers {
    my $param = shift;
    if ($param eq "fly") {

@person = ('
  _._.
 _\ //    
(_  _OO
  /|| *-<
 ', '
    
 _.._
(---_oO
  //\ *-<
 ', '
 
 __.._
(/_/_Oo
  /|\ *-<
 '
);

    } elsif ($param eq "bee") {

@person = ('
   _._.
  _\ //
<[_  _**
  "/|\ "<
 ', '

  _...
<[--- **
  "/|\ "-
 ', '
  
  _...
<[/_/_**
  "/|\ "<
 '
);

    } elsif ($param eq "bird") {

@person = ('
  =--.
   \  ) ._
 ___\_/( o)>
   -\_  _/
      ^^

 ', '

        ._
 ___---( O)<
   ==== _/
      ^^

 ', '

       ._
 ___.-( o)>
   /_\ _/
  /  )^^
 =--"
 '
);

    } elsif ($param eq "mosquito") {

@person = ('

     \\\\//
    __\\\\__
   [______O----
     / | \
    /  |  \
 ', '

     
    __\\/__
   [______O----
     / | \
    /  |  \
 ','

     
    ______
   [__//__O----
     //|\\\\
    /  |  \
 '
);

    }
        
    return scalar(split("\n", $person[0]));
}

sub loop {
    my $ms = shift;
    my $cnt = shift;
    my $size = shift; # size of chosen animal (height)
    my $h = 5; # default height
    my $vy = 1; # up-down movements
    for (my $x = 0; $x < $cnt; $x++) {
        system("clear");
        $h += $vy;
        $vy *= -1;
        print "\n" x $h;
        my @cur = split("\n", $person[$x % 3]);
        for (my $i = 0; $i < $size; $i++) {
            print((" " x $x) . $cur[$i] . "\n");
        }   
        Time::HiRes::sleep(0.001 * $ms);
    }
}

sub main {
    my $ms = 100;
    my $cnt = 90;
    my $pers = "fly";
    while (my $now = shift) {
        if ($now eq "-h") {
            print
"\t-h\tthis menu
\t-c\tcount of loops (default 90)
\t-p\t[fly|bee|bird|mosquito] (default fly)
\t-s\ttimeout between loops (in ms) (default 100)

";
            return 1;
        } elsif ($now eq "-s") {
            $ms = shift || 100;
        } elsif ($now eq "-c") {
            $cnt = shift || 90;
        } elsif ($now eq "-p") {
            $pers = shift || "fly";
        }
    }
    loop($ms, $cnt, set_pers($pers));
    return 0;
}

exit(main(@ARGV));
