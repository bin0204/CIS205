use strict;

print "Welcome.\n";
print "You may bid for up 5 valuable paintings.\n";
print "You start with \$5000. Then, try to sell your collection\n"; 
print "for as much as possible.\n";  
print "\n";   
my $cash = 5000;

#buying phase
while (1){
	my $i;
	my $paintings = 0;
	my $term = 1000;
	my $min = 150;
	my $bid;
	my $opponent;
	my @array;
	my $num;
	my $type;

	#Loop 5 times:
	for ($i= 1; $i<6; $i++){
		print "Painting #$i is up for sale.\n";
		print "you have \$$cash left.\n";
		print "Enter bid:\n";
		chomp ($bid = <STDIN>);
		if ($bid > $cash) {
			print "You don't have that much money\n";
			print "Enter bid:\n";
			chomp ($bid = <STDIN>);
		}
		#opponents bid
		$opponent = int(rand($term)) + $min;
		print "Your opponent offered \$$opponent.\n";
		if ($bid >= $opponent) {
			print "Congratulations, you bought it!\n";
			$paintings++;
			$cash -= $bid;
			push (@array, $bid);
			print "\n";
		}
		else {
			print "Sorry, you lost it.\n";
			print "\n";
		}
	}


	#selling phase
		for ($i=1; $i<=$paintings; $i++) {
			print "You may now sell your painting #$i\n";
			$num = int(rand(6)+1);
			for (my $j=1; $j<= $num; $j++) {
				$bid = int(rand(2000)+500);
				print "You've been offered \$$bid for this painting.\n";
				print "You paid $array[$i-1] for it.\n";
				print "Do you accept? (y/n)\n";
			
				chomp ($type = <STDIN>);
				if ($type eq "y"){
					print "You sold the paintings for this $bid.\n";
					print "\n";
					$cash += $bid;
					last;
				}
				elsif ($j == $num) {
					print "Sorry, that was your last chance. You have to keep that painting.\n";
					print "\n";

				}
			}
		}


	#endgame
	print "You started with \$5000. You finish with \$$cash.\n";
	print "Play again? (y/n)\n";
	chomp ($type = <STDIN>);
	if ($type eq "n") {
		last;
	}
}
			


