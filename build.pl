#!/usr/bin/env perl

# Build all architecture YAMLs into some browser readable JSON indices

use strict;
use YAML;
use JSON qw(to_json);
use File::Path qw(make_path);

my $BASE = "output";

my $index = {};
my $data = {};

unless(-d $BASE) {
	make_path($BASE) or die "Failed to mkdir ($!)";
}

# Build index and per org-arch data
foreach my $filename (split(/\n/, `find . -name "*.yaml"`)) {
	print "Parsing $filename\n";
	my $yaml = YAML::LoadFile($filename) or die "Failed to parse '$filename'!";
	next unless($filename =~ m#^\./(?<org>\w+)/(?<arch>.+)/(?<name>.+)\.yaml#);

	$index->{$+{org}} = {} unless($index->{$+{org}});
	$index->{$+{org}}->{$+{arch}} = [] unless($index->{$+{org}}->{$+{arch}});
	push(@{$index->{$+{org}}->{$+{arch}}}, $+{name});

	$data->{$+{org}."_".$+{arch}} = [] unless($data->{$+{org}."_".$+{arch}});
	push(@{$data->{$+{org}."_".$+{arch}}}, $yaml);
}
use Data::Dumper;
# Dump org-arch tuple contents
foreach my $oa (keys %$data) {
	open(my $OUTPUT, ">$BASE/$oa.json") or die "Cannot write '$oa.json' ($!)";
	print $OUTPUT to_json($data->{$oa});
}

open(my $OUTPUT, ">$BASE/index.json") or die "Cannot write 'index.json' ($!)";
print $OUTPUT to_json($index);
