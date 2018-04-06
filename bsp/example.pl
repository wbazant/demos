#!/usr/bin/perl

use strict;
use warnings;
use JSON;
use HTTP::Tiny;

sub get_response_for_gene { 
  my $gene= shift;
  my $http = HTTP::Tiny->new();
   
  my $server = 'http://parasite.wormbase.org';
  my $ext = "/rest-10/homology/id/$gene";
  my $response = $http->get($server.$ext, {
    headers => { 'Content-type' => 'application/json' }
  });
   
  die "Failed!\n" unless $response->{success};
  return decode_json($response->{content});
} 
sub get_homologous_species {
  my $gene = shift;
  my @homologies = @{get_response_for_gene($gene)->{'data'}[0]->{'homologies'}};
  my @ret;
  for my $homology (@homologies) {
    push @ret, $homology -> {'target'} -> {'species'};
  }
  return @ret;
}

my @genes = qw/Smp_000090
Smp_000120
Smp_000180
Smp_000210
Smp_000220
Smp_000250
Smp_000330
Smp_000380
Smp_000400
Smp_000520
Smp_000030
Smp_000040
Smp_000050
Smp_000070
Smp_000080
Smp_000130
Smp_000140
Smp_000150
Smp_000160
Smp_000170
Smp_000320
Smp_001085
Smp_002080
Smp_002180
Smp_002550
Smp_000020
Smp_000075
Smp_000100
Smp_000110
Smp_000370/;
for my $gene (@genes) {
  my @homologous_species = get_homologous_species($gene);
  my $has_japonica = grep "caenorhabditis_japonica_prjna12591", @homologous_species;
  my $has_haematobium = grep "schistosoma_haematobium_prjna78265", @homologous_species;
  print "$gene\n" if $has_japonica and $has_haematobium;
}
