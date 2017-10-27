$file = $ARGV[0];
if ($ARGV[0] == 0) {
	die "Hey! You forgot the command-line parameter.\n";
}
$filename = "input.txt";
open(INPUT, $filename) or die "Cannot find file.";
@lines = <INPUT>;
close INPUT;

foreach $line (@lines) {
	chomp $line; #for new line
	@words = split(" ",$line);
	$singleWord = @words; #new variable for single word
	#checks any pronouns
	if ($line =~ /^She/i || $line =~ /^He/i || $line =~ /^It/i || $line =~ /^They/i) {
		$statement = "NOT A STATEMENT";
	} 
	#check question words
	elsif ($line =~ /why/ || $line =~ /what/ || $line =~ /when/ || $line =~ /where/ || $line =~ /how/ || $line =~ /who/) {
		$statement = "NOT A STATEMENT";
	}
	#check question mark
	elsif ($line =~ /\?$/) {
		$statement = "NOT A STAEMENT";
	}
	#check possessive cases
	elsif ($line =~ /his/ || $line =~ /her/ || $line =~ /their/ || $line =~ /our/ || $line =~ /your/ || $line =~ /my/) {
		$statmenet = "NOT A STATEMENT";
	}
	#check single word
	elsif ($singleWord <= 1) {
		$statment = "NOT A STATEMENT";
	}
	#Statement!!!
	else {
		$statement = "STATEMENT";
	}
	#print each line whether it is true statement or not
	print "$line $statement\n";
}
	

