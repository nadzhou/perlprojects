
use warnings; 



%bir = ("A" => "B", 
        "dracula" => "navid"); 


@nad = keys(%bir);


$navid = $bir{"navid"}; 


print "Here's list: @nad\n"; 


sub protein_extract
{
    $current_id = ''; %seqs; 
    open(PTFILE, "results.fasta"); 
        $x = <PTFILE>; 
    @y = <PTFILE>; 

    for my $line (<PTFILE>)
    {
        if ( $line =~ /^(>.*)$/ ) 
        {
            print "start of file: $line\n"; 
            $current_id = $line; 
        }
        elsif ( $line !~ /^\s*$/ ) { 
            print "sequence \s in file: $line\n"; 
            $seqs{$current_id} .= $line; 
        }

    }

    print "x: $x\n"; 
    $seq = join('', @y); 
    @seq_ar = split("\n", $seq); 
    print "y: @y\n"; 
    print "seq: $seq\n"; 
    for my $base (@seq_ar)
    {
        print "$base\n"; 
    }
    print "\n Final solution: $!"; 

    close PTFILE; 

}

&protein_extract; 