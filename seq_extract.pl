sub Seqextractor
{ print " Input sequence ID file \n";
my $seqID = <STDIN>;
print " Input Fasta file \n";
my $inputFA = <STDIN>;my $outputFA = 'output2.fa'; #initializing output file
open SEQ, $seqID or die "could not open sequence id file";
#opening files using respective file handles
open INFA, $inputFA or die "could not open input FA file";
open OUTFA, ">$outputFA" or die "could not open output FA file";
my $line;
# stores lines in SEQ and INFA for processing
my $header_line; # stores header line
my $sequence_line; # stores sequence line
my $subline; # stores the truncated sequences
my $id = 0; # preassigned array index for accession ID
my $start = 1; # preassigned array index for start coordinate
my $end = 2;
# preassigned array index for end coordinate
my $current_id;
ID # current sequence to try to match
my $current_start; # current start coordinate used when extracting truncated sequence
my $current_end; # current end coordinate used when extracting truncated sequence
my @array_of_seq_info;
# stores an array to a list of references to seq info
# ie. the Accesssion IDs, Starts and Ends from $seqID file
$line = <SEQ>;
#read sequence-file line
while ($line = <SEQ>)
# read through $seqID file and
{
chomp $line;
my @linearray = split('\t', $line); #converting string into array
push @array_of_seq_info, \@linearray; #store each set of (ID, Start, End) into @array_of_seq_info
}close SEQ;
while ($line = <INFA>) # read through input FASTA file
{ chomp $line;
if ($line =~ /^>/) # check for new header-- if found, store the header line and the sequence line
{ $header_line = $line;
$sequence_line = <INFA>;
foreach my $seq_info_array_ref (@array_of_seq_info)
# iterate through each ID in our seq info array, write output FASTA if ID match found
{ $current_id = ${$seq_info_array_ref}[$id];
if ($header_line =~ /^>$current_id/)
{ $current_start = ${$seq_info_array_ref}[$start];
# get start and end coordinates for the currently matched accession ID
$current_end = ${$seq_info_array_ref}[$end];
# use the start and end values to extract a substring from the sequence
$subline = substr($sequence_line, $current_start - 1, $current_end - $current_start + 1);
# print to OUTFA: accession ID, start, end, and the truncated sequence
print OUTFA ">$current_id | start=$current_start | end=$current_end\n$subline\n"; }}
} }
close INFA;
#close the input and output files
close OUTFA;
}
print "Enter Q to exit\n";
my $repeatition = <STDIN>;
} while ( $repeatition = "Q" );
#enter Q to exit, enter anything other than Q to repeat.
#if user enters Q, exit the program