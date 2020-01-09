my %codon_count; 
print "\n\n\t\#################### CODON NUMBER IN  DNA SEQUENCE #################### \n\n";
print "This script find the codon number in a DNA sequence\n\n";

$dnafilename = "ACTCTGAAACTACTAATTTAATTTACAAAAAAACGCTTGAAGATGGAAGCAAAATGGCAGAAAG";

my $DNA_length = length($dnafilename);
 
for( my $index = 0; $index <= $DNA_length - 3; $index = $index + 3){
  my $codon = substr($dnafilename, $index, 3);
 
  if(not exists $codon_count{$codon}){
    $codon_count{$codon} = 0;
  }
 
  $codon_count{$codon} = $codon_count{$codon} + 1;  
}

my @key = keys %codon_count;
my @value = values %codon_count;
 
for (my $i=0; $i < scalar(@key); $i++){
  print "$key[$i] => $value[$i] \n";