package config;

$FLAGS = "-s -O2 -std=c++11";
$COMPILER = "g++";
%LIBS = (
    "curses"  =>  "-lcurses",
    "curl"    =>  "-lcurl",
    "gtk"     =>  "`pkg-config --cflags --libs gtk+-3.0`",
    "boost"   =>  "-lboost_system -lboost_filesystem -pthread",
);

1;
