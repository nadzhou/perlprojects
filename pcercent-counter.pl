#! user/bin/perl -w
sub percent_counter(@dna){
    my @dna = [];
    count_a = 0;
    count_t = 0;
    count_c = 0;
    count_g = 0;
    my $seq_length = @dna;
    
    foreach $nt (@dna){ 
        if ($element == "A"){
            $count_a = $count_a + 1;
        }
         elsif ($element == "T"){    
            $count_t = $count_t + 1;
         }
        elsif ($element == "C"){    
            $count_c = $count_c + 1;
        }
        elsif ($element == "G"){     
            $count_g = $count_g + 1;
        }
    }
    return "A: int($count_a/$seq_len) \n \
        C: int($count_c/$seq_len) \n 
        T: int($count_t/$seq_len) \n \
        G: int($count_g/$seq_len) \n";
}

my @dna_1 = ["ACCCCGGATTAACC"];
&percenter_counter(@dna_1);