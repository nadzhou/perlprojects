#! user/bin/perl -w

# Hafsa Khalil 
# Percentage counter code. 

sub perctange{
    $dna = $_[0]; 
    my $seq_len = length($dna);
    $count_a = 0;
    $count_t = 0;
    $count_c = 0;
    $count_g = 0;
    #scalars for each nucleotide. 
    # so we can count them. 

    foreach $element (split //, $dna) {
        # Loop through the string 
        # and check for each nucleotide. 
        if ($element eq "A"){
            $count_a = $count_a + 1;
        }
         elsif ($element eq "T"){    
            $count_t = $count_t + 1;
         }
        elsif ($element eq "C"){    
            $count_c = $count_c + 1;
        }
        elsif ($element eq "G"){     
            $count_g = $count_g + 1;
        }
    }
    # Store all the counts in respective variables. 
    $percent_a = int($count_a / $seq_len * 100);
    $percent_t = int($count_t / $seq_len * 100);
    $percent_c = int($count_c / $seq_len * 100);
    $percent_g = int($count_g / $seq_len * 100);

    # Then return the output 
    return "
        Percentage:
        A: $percent_a 
        C: $percent_t 
        T: $percent_c
        G: $percent_g";
}

my $dna_1 = "ACTTGACCTAGGGAAA"; 
# Print the result so we can get a 
# formatted result. 
print(&percentage($dna_1));