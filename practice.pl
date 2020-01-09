
$fn = "/home/nad/Desktop/PYTHON/MOTIFVIZ/results.fasta"; 
open FILE, "$fn" or die $!;
$x = <FILE>; 
$seq = ""; 
while ( my $line = <FILE>)
{   
    if (!($line =~ />/))
    {
        $seq .= $line
    }
}

@split_seq = split(/\n/, $seq); 
print "Array: @split_seq\n"; 
$c = grep($_ > 20, @seq); 
print "all the cs: @c"; 
# print $seq; 
close FILE or die $!;
# @codon = ""; 
# for (my $i = 0; i < length($seq) -2; $i+=3)
# {
#     $codon.push(substr($seq, i, 3)); 
# }
# print "Codons: ";
# print @codon; 

$pattern = "SYTTT"; 
@serien = grep($_ = $pattern, $seq); 
if (@serien)
{
print "pattern found: @serien";
}
else 
{
    print"not found";
    }