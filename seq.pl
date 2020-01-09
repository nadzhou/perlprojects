use strict;
use warnings;

sub retriever{
 
use HTTP::Tiny;
 
my $http = HTTP::Tiny->new();
 
my $server = 'https://rest.ensembl.org';
my $ext = '/sequence/region/human/X:1000000..1000100:1?';
my $response = $http->get($server.$ext, {
  headers => { 'Content-type' => 'text/plain' }
});
 
#die "Failed!\n" unless $response->{success};
 
 
print "$response->{status} $response->{reason}\n";
}