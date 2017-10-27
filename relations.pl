if (@ARGV == 0) {
	die "Error: Cannot read input file\n";
} 
#Open the file
my $file = $ARGV[0];
open (INPUT, $file) or die "Cannot find file.";
chomp (@lines = <INPUT>);
close INPUT;

#separated by a vertical bar
foreach $lines (@lines) {
	my @array = split ("\\|", $lines);
	push (@Title, $array[0]);
	push (@Artist, $array[1]);
	push (@Album, $array[2]);
	push (@Genre, $array[3]);
	
}
print "Aloha ~ Welcome to Bin's Playlists!\n";

#check boolean
while (1) {
	print "Select songs based on?\n";
	print "[G]enre\n";
	print "[T]itle\n";
	print "[A]rtist\n";
	print "A[L]bum\n";
	print "E[X]it Program\n";
	chomp ($search = <STDIN>);
	print "\n";
	$i = 0; #declare variable info in each array
	$recordCount = 0; #declare variable for counting records
	
	#find Titles
	if ($search =~ /t/i) {
		print "Please enter title:\n";
		chomp ($titlename = <STDIN>);
		print "\n";
		foreach $findTitle (@Title) {
			if ($findTitle =~ /$titlename/i){
				print "(@Genre[$i]) $findTitle in @Album[$i] by @Artist[$i]\n";
				$recordCount++;
				}
			$i++;
		}
		print "$recordCount records retrieved.\n";
	}

	#find Artists
	if ($search =~ /a/i) {
		print "Please enter artist:\n";
		chomp ($artistname = <STDIN>);
		print "\n";
		foreach $findArtist (@Artist) {
			if ($findArtist =~ /$artistname/i) {
				print "(@Genre[$i]) @Title[$i] in @Album[$i] by $findArtist\n";
				$recordCount++;
			}
			$i++;
		}
		print "$recordCount records retrieved.\n";
	}

	#find Albums
	if ($search =~ /l/i) {
		print "Please enter album:\n";
		chomp ($albumname = <STDIN>);
		print "\n";
		foreach $findAlbum (@Album) {
			if ($findAlbum =~ /$albumname/i) {
				print "(@Genre[$i]) @Title[$i] in $findAlbum by @Artist[$i]\n";
				$recordCount++;
			}
			$i++;
		}
		print "$recordCount records retrieved.\n";
	}

	#find Genres
	if ($search =~ /g/i) {
		print "Please enter genre:\n";
		chomp ($genrename = <STDIN>);
		print "\n";
		foreach $findGenre (@Genre) {
			if ($findGenre =~ /$genrename/i) {
				print "($findGenre) @Title[$i] in @Album[$i] by @Artist[$i]\n";
				$recordCount++;
			}
			$i++;
		}
		print "$recordCount records retrieved.\n";
	}
	
	if ($search =~ /x/i) {
		die "Aloha Oe!\n";
	}
}


