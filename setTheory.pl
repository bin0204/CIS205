use strict;

#check file
if (@ARGV == 0) {
    die "Could not read input file\n";
    }
	
my $filename = $ARGV[0];
open(INPUT, $filename) or die "Cannot find file name";
chomp (my @lines = <INPUT>);
close INPUT;

#print set A
#split by space
my @array1 = split (" ", $lines[0]);
my $A = join (",", @array1 );
print "A = {$A}\n";

#print set B
#split by space
my @array2 = split (" ", $lines[1]);
my $B = join (",", @array2 );
print "B = {$B}\n";


# push means can add one or more value to the end of an array

#A intersection B
my @intersection = ();
foreach my $s (@array1){
    if($s ~~ @array2){
	push (@intersection, $s);
	} 
}

my $intsec = join (",", @intersection);
print "A intersect B = {$intsec}\n";

#A union B
my @union = ();
foreach my $u (@array1) {
	push (@union, $u);
}

foreach my $u (@array2) {
	if(!($u ~~ @union)){
	push (@union, $u);
	}
}
my $union = join (",", @union);
print "A union B = {$union}\n";

#A - B
my @AminusB = ();
foreach my $ab (@array1) {
	if(!($ab ~~ @array2)){
	push (@AminusB, $ab);
	}
}
my $ab = join (",", @AminusB);
print "A - B = {$ab}\n";

#B - A
my @BminusA = ();
foreach my $ba (@array2) {
	if(!($ba ~~ @array1)) {
	push (@BminusA, $ba);
	}
}
my $ba = join (",", @BminusA);
print "B - A = {$ba}\n";

#A X B
my @AxB =();
foreach my $a (@array1) {
	foreach my $b (@array2) {
		push (@AxB, "($a,$b)");
	}
}

my $AxB =  join (",", @AxB);
print "A X B = {$AxB}\n";

#B x A
my @BxA = ();
foreach my $b (@array2) {
	foreach my $a (@array1) {
		push (@BxA, "($b,$a)");
	}
}

my $BxA = join(",", @BxA);
print "B X A = {$BxA}\n";


