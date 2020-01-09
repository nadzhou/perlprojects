use strict;
#handels File Path 	
use File::Path;
print "_________________________________________________________\n\n";
print "______**********Welcome to Mutation Inducer***********______\n\n";
print " Usage Instruction\n";
print "Input File Must be in Fasta Format \n";
print "Point mutations will be introduced in your sequence\n";
print "You can choose number of induced mutations\n";
print "_________________________________________________________\n\n";

#Geting File Name from user
print "Please Enter Your File Name\n";
my $filename=<STDIN>;
chomp($filename);
#passing Variable to the read_file subrutine
read_file($filename);
my $mm=mutatate();
#subrutine for opening a file and generate a string of whole sequence
sub read_file
{
my ($name)=@_;
my ($sequence)="";
#chomp($filename);
open(DNAFILE, '<' , $filename) or die $!; 
#Header Line is removed by reading  first line
<DNAFILE>;
#Reading File Line By line and Generating a string of all lines
my ($counter)=0;
my ($bb)=0;
while($counter ne 10)
{
my ($temp)=<DNAFILE>;
$bb=length($temp);
#Loop breaks at blank line
if($bb==0)
{$counter=10;}
#Adds the content of $temp to the sequence
chomp($temp);
$sequence=$sequence.$temp;
}
chomp($sequence);
close DNAFILE;
print
return $sequence;
}
#Generating Random Mutations at Random Positons in the sequence
sub mutatate
{
my ($query_sequence)=read_file(); 
my ($mutated_sequence)=read_file();
my ($location)=();
my ($new_base)=();
my ($real_base)=();
my (@mutation_record)=();
#Itriating the number of mutations
print "Enter the Number of Mutations\n";
my $mutation_no=<STDIN>;
#Check that user number of mutations must be in sequence length range
if($mutation_no>length($query_sequence))
{
    print "Your Entered Value is greater then you sequence \n";
    die;
}
for(my ($i)=1;$i<=$mutation_no;$i++)
{
my ($control)="";
#Comparing Real Base and Old Base
$location=generate_position();
while($control!=10)
{
#This variable stores the base in original sequence     
$real_base=substr($query_sequence,$location,1);
#This variable contains new base
$new_base=replacement();
#If new base is not equal to the replacement the loop breaks
if(($new_base ne $real_base))
{
    $control=10;
}}
#print statementat for output
print("             Mutation NO. $i\n");
print "$real_base is replaced by $new_base at $location \n";
substr($mutated_sequence,$location,1,$new_base);
print "Initial Sequence: $query_sequence \n";
print "Mutated Sequence: $mutated_sequence \n";
print "Recent  Mutation: ";
#Pointer to the Last Mutation 
for(my $jj=0;$jj<=$location;$jj++)
{print"^";}
print "\n______________________________________________________________________________________________________\n";
}
}
#Returns the position of Mutation
sub generate_position
{
my ($seq)=read_file();  
my ($position)=1;
#Length of the String to Define the range of Random Numbers
my ($len)=length($seq)-1;
#Generating Random Number in Range of Length
$position=int(rand($len));
return $position;
}
#Returns the new base for replacement
sub replacement
{
my (@nucleotides)=('A','C','T','G');
#Rnd function t0 genrate random numbers in range 0-3"
my ($base_index)=int(rand(3));
#Nucleotide at random numbe index is stored in new variable
my ($random_nucleotide)=$nucleotides[$base_index];
return $random_nucleotide;}