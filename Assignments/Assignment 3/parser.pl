#!/usr/bin/perl
use Data::Dumper;


# ---- Sub Routines ----
sub checkCase {
    return $_[0] =~ /^[[:upper:]]/
}


# ---- Part 1 ----
# 1. Parse arguments
# 2. Read in the file
my $paramSize = scalar @ARGV;

if ($paramSize == 1) {
	$in = $ARGV[0];
	$out = substr($in, 0, length($in) - 4) . "_out.txt";
} elsif ($paramSize == 2) {
	($in, $out) = @ARGV;
} else {
	print "[!] Invalid number of arguments!\n";
	exit 1;
}

print "[+] Reading file: $in\n\n";

open($fh, '<:encoding(UTF-8)', $in) or die "[!] Could not open file '$in' $!";

# ---- Part 2 ----
# Validate input from given file
@errors;
@lines;
while (my $row = <$fh>) {
	chomp($row);
	my @line = split(/ -+> /, $row, 2);
	if (!checkCase(@line[0])) {
		push(@errors, "Terminal @line[0] found in the left-hand side of a production.");
	}
	push(@lines, \@line);
}

close $fh;


# ---- Part 3 ----
# Print out the errors found during parsing

if (scalar(@errors) > 0) {
	print "[!] Invalid grammar in input file: $in\n\n";
	for my $el (@errors) {
		print "[-] $el\n";
	}
	exit 1;
}

print "[+] Mappings are:\n";
print Dumper \@lines;

# ---- Part 4 ----
# Eliminate direct left recursion

# Wasn't able to figure out this part....


# ---- Part 5 ----
# Write the lines to the appropriate output file
print "[+] Output will be saved to: $out\n";
open($fh, '>:encoding(UTF-8)', $out) or die "[!] Could not open file '$out' $!";

for my $el (@lines) {
	print $fh $el -> [0] . " -> " . $el->[1] . "\n";
}

close $fh;

print "[+] Process complete!"
