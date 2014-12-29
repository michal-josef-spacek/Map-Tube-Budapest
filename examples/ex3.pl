#!/usr/bin/env perl

# Pragmas.
use strict;
use warnings;

# Modules.
use Map::Tube::GraphViz;
use Map::Tube::GraphViz::Utils qw(node_color_without_label);
use Map::Tube::Budapest;

# Object.
my $obj = Map::Tube::Budapest->new;

# GraphViz object.
my $g = Map::Tube::GraphViz->new(
        'callback_node' => \&node_color_without_label,
        'driver' => 'neato',
        'tube' => $obj,
);

# Get graph to file.
$g->graph('Budapest.png');

# Print file.
system "ls -l Budapest.png";

# Output like:
# -rw-r--r-- 1 skim skim 150646 Dec 29 11:07 Budapest.png