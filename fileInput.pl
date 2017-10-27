$file = $ARGV[0];

if ($ARGV[0] == 0) {
	die "Hey! You forgot the command-line parameter.\n";
}
if ($ARGV[0] < 0) {
	die "Number must be non-negative\n";
}

$filename = "file4.txt";
open(INPUT, $filename) or die "Cannot find file.";
@lines = <INPUT>;
close INPUT;
$char = 0;
foreach $line (@lines) {
	chomp $line; # make new line 
	@numbers = split(" ", $line);   # spaces
	foreach $num (@numbers) {
		if ($num eq "8") {      # equal to 8
			$char ++;           
		}
	}
}
print "There are $char eights\n";



