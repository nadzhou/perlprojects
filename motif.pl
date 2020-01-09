use strict;
use warnings;
#The following statement prints “Enter the motif”
print "Enter the motif: ";
#<STDIN> prompts the user to give the motif as input and that motif is assigned to the following variable
my $motif = <STDIN>;
# The chomp() function removes any newline character from the end of the motif string
chomp $motif;
#A hash is a set of key/value pairs of unordered items and is good for storing things you want to get at by name and where order is unimportant
my %seqs = %{ read_fasta_as_hash( 'results.fasta' ) };
#The foreach loop is used for iterating arrays/lists- the loop continues execution until all the elements of the specified array gets processed
foreach my $id ( keys %seqs ) {
#if the motif is present in the sequence, display the id and sequence
    if ( $seqs{$id} =~ /$motif/ ) {
        print $id, "\n";
        print $seqs{$id}, "\n";
    }
}
#Subroutine for reading file as hash from a single-user script when no file locking is required
sub read_fasta_as_hash {
#shift() function will return the first sequence in hash and it is assigned to the variable fn
    my $fn = $_; 
    my $current_id = '';
    my %seqs;
#Open the file assigned to fn or if there is an error in opening it, a call to die will print out the given string to the standard error (STDERR) and then quit the program
    open FILE, "<$fn" or die $!;
#while function reads the file remove any newline character from the end of the string is removed
while ( my $line = <FILE> ) {
        chomp $line; 
#if the line has any of the said symbols, the current id variable returns the first set of grouping parern i.e. (>.*)
if ( $line =~ /^(>.*)$/ ) {
            $current_id  = $1;
        }
#if the line does not contain any of the said symbols and blank spaces, concatenate the current id with the line
 elsif ( $line !~ /^\s*$/ ) { 
            $seqs{$current_id} .= $line; 
        }
#close the file or in the opposite case, print out the given string to the standard error (STDERR) and then quit the program 
    } close FILE or die $!;