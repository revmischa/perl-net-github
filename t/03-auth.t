#!perl

# to properly test, this needs a private repo. that costs money though.

use Test::More tests => 2;

use Net::GitHub;
use Data::Dumper;

my $v2 = Net::GitHub->new(
    owner => 'AuthTest', repo => 'test',
    login => 'AuthTest', token => '5747b5e47d479d65d041d446899fe775',
);

my $issues = $v2->issue->list('open');
ok($issues, "got issues");

my $res = $v2->issue->open("test issue @ " . time(), "testing issue opening");
ok($res->{created_at}, "created issue");

