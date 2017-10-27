#declare all variables!
use strict;

if ($ARGV[0] < 0) {
	die "Hey! You need to type correct file name!!\n";
}

my $filename = $ARGV[0];
open(INPUT, $filename) or die "Cannot find file.";
my @A = <INPUT>;
close INPUT;


#chomp @A;
sort205(0, @A-1); #call sort205

foreach my $A (@A) { #call A array
	chomp $A;
	print "$A\n";
}


sub sort205 {
	my $p = $_[0]; #first parameter
	my $r = $_[1]; #second parameter
        if ($p < $r) {
                my $q = divide($p, $r);
                sort205($p, $q-1);
                sort205($q+1, $r);
        }
}

sub divide {
		my $p = $_[0];
		my $r = $_[1];
        my $x = $A[$r];
        my $i = my $p-1;
        for (my $j = $p; $j <= $r-1; $j++) {
                if ($A[$j] <= $x) {
                    $i++;
					my $tmp = $A[$i];
					$A[$i] = $A[$j];
					$A[$j] = $tmp;  #switch the values
					#print "@A\n";	#compare all the values
                }
        }
		my $tmp = $A[$i+1];
		$A[$i+1] = $A[$r];
		$A[$r] = $tmp; #swap the values
		#print "@A\n";
        return ($i+1);
}