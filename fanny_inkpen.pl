#!/usr/bin/perl

#use strict;
#use warnings;

use MARC::Batch;

my $batch = MARC::Batch->new('USMARC','cart.iso2709');
#my $record = $batch->next();	
while ( my $record = $batch->next() ) {
print "\n\n";
my $field = $record->field('100');
if ($field) {
   print $field->as_string(), "\n";
}

my $field = $record->field('700');
if ($field) {
   print $field->as_string(), "\n";
}

my $field = $record->field('110');
if ($field) {
   print $field->as_string(), "\n";
}

my $field = $record->field('710');
if ($field) {
   print $field->as_string(), "\n";
}

my $field = $record->field('245');
if ($field) {
   print $field->subfield('a'), $field->subfield('b'), "\n";
}

my $field = $record->field('248');
if ($field) {
   print $field->subfield('a'), $field->subfield('b'), "\n";
}

my $field = $record->field('490');
if ($field) {
   print $field->as_string(), "\n";
}

my $field = $record->field('260');
if ($field) {
   print $field->subfield(a), " ", $field->subfield(b), " ", $field->subfield(c), "\n";
}

my $field = $record->field('773');
if ($field) {
   print $field->subfield('t'), " ", $field->subfield('y'), " ", $field->subfield('v'), " " , $field->subfield('n'), " " , $field->subfield('p'), " ", $field->subfield('d'),"\n";
}

my $field = $record->field('500');
if ($field) {
   print $field->as_string(), "\n";
}

my $field = $record->field('506');
if ($field) {
   print $field->as_string(), "\n";
}

my $field = $record->field('520');
if ($field) {
   print $field->as_string(), "\n";
}

my @fields = $record->field('856');
foreach my $field (@fields) {
   print $field->subfield('z'), " ", $field->subfield('u'), "\n";
}
my $field = $record->field('952');
if ($field) {
my $test=$field->subfield('o');
if ($test){
   print $field->subfield('o'), "\n";
}}
#my $field = $record->field('050');
#if ($field) {
#   print $field->as_string(), "\n";
#}

my $field = $record->field('020');
if ($field) {
   print $field->as_string(), "\n";
}

}
