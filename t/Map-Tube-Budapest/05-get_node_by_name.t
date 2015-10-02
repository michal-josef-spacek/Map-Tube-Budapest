# Pragmas.
use strict;
use warnings;

# Modules.
use Encode qw(decode_utf8);
use Map::Tube::Budapest;
use Test::More tests => 3;
use Test::NoWarnings;

# Test.
my $map = Map::Tube::Budapest->new;
my $ret = $map->get_node_by_name('foo');
is($ret, undef, 'Get node for bad node name.');

# Test.
my @ret = sort map { $_->id } $map->get_node_by_name(
	decode_utf8('Deák Ferenc tér'));
is_deeply(
	\@ret,
	[
		'M1-02',
		'M2-05',
		'M3-10',
	],
	"Get all nodes for 'Deák Ferenc tér'.",
);
