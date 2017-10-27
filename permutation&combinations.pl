use strict;

#check non-positive numbers
if (@ARGV[0] == 0) {
    die "Error: must supply two numbers, n and r\n";
    }	

#first & second parameters
my $n = @ARGV[0];
my $r = @ARGV[1];

my $factorial = gaston($n,$r);
my $iteration = belle($n,$r);

print "P($n,$r) using factorial: $factorial\n";
print "P($n,$r) using iteration: $iteration\n";

#factorial subroutine
sub fact {
	my $n = $_[0];
	if ($n == 0) {
		return 1;
	} else {
		return $n * fact($n-1);
	}
}

#n!/(n-r)!
#recursive function is one that calls itself again to repeat the code
sub gaston {
	my $n = $_[0];
	my $r = $_[1];
	my $numerator = fact($n);
	my $denominator = fact($n-$r);
	return $numerator/$denominator;
}

#iterative function is one that loops to repeat some part of the code
sub belle {
	my $i;
	my $n = $_[0];
	my $r = $_[1];
	
	my $perm1 = 1;
	for ($i=0; $i<$r; $i++) {
	$perm1 *= ($n-$i)
	}
	return $perm1;
}




