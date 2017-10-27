if (@ARGV == 0) {
	die "Error: Cannot read input file!!\n";
}
#Open the file
$file = $ARGV[0];
open (INPUT, $file) or die "Cannot find file.\n";
chomp (@lines = <INPUT>);
close INPUT;


foreach $lines (@lines) {
	@tokens = split (' ', $lines);
	print "input: $lines\n";

#$input = "6 6 * 2 7 * - 2 /";
#@tokens = split (' ', $input);

@stack = ();
$a = pop @stack;
$b = pop @stack;

foreach $token (@tokens) {
	if ($token eq "*") {
		$a = pop @stack;
		$b = pop @stack;
		$mul = $a * $b;
		push (@stack, $mul);
		#print "$mul\n";
		next;
	}
	elsif ($token eq "/") {
		$b = pop @stack;
		$a = pop @stack;
		$div = $a / $b;
		push (@stack, $div);
		#print "$div\n";
		next;
	}
	elsif ($token eq "+") {
		$a = pop @stack;
		$b = pop @stack;
		$sum = $a + $b;
		push (@stack, $sum);
		#print "$sum\n";
		next;
	}
	elsif ($token eq "-") {
		$b = pop @stack;
		$a = pop @stack;
		$dif = $a - $b;
		push (@stack, $dif);
		#print "$dif\n";
		next;
	}
	else {
		push (@stack, $token);
		#print "num $token\n";
	}
}

	print "result: @stack\n";
}
