#!perl
use strict;
use warnings FATAL => 'all';

use Test::More;

use Function::Parameters qw(:strict);

{
    my $a;
    ok eval q{ $a = [ fun () {}, 1 ]; 1 }, 'anonymous function in list is okay'
        or diag "eval error: $@";
    is ref $a->[0], "CODE";
    is $a->[1], 1;
}

{
    my $a;
    ok eval q{ $a = [ method () {}, 1 ]; 1 }, 'anonymous method in list is okay'
        or diag "eval error: $@";
    is ref $a->[0], "CODE";
    is $a->[1], 1;
}

done_testing;
