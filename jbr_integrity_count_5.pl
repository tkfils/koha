#!/usr/bin/perl

use MARC::Batch;
print "<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN'";
print "    'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>";
print "<html lang='en' xml:lang='en'  xmlns='http://www.w3.org/1999/xhtml'>";

print "<title>Data integrity test</title>\n";
print "<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />\n";

print "</head>\n";
print "<body>\n";

my @records = ();
my @f245    = ();
my $idx     = 0;
my $batch = MARC::Batch->new('USMARC','koha.mrc');
while ( my $MARC = $batch->next ) {
    push(@records, $MARC);
    push(@f245, [$idx++, $MARC->field("245")->as_string]);
}

my $count = 0;
my $ruth = "";
my $kathy = "";
my $kirsty = "";
my $nick = "";
my $nikki = "";
while ($count < $idx){
my $upto = $count % 50;

if ($upto == 0){
$ruth .= " | <a href=#"; 
$ruth .= $count; 
$ruth .= ">";
$ruth .= $count; 
$ruth .= " to "; 
$ruth .=($count+9);
$ruth .= "</a>"; 
}

if ($upto == 10){
$kathy .= " | <a href=#";
$kathy .= $count; 
$kathy .= ">";
$kathy .= $count; 
$kathy .= " to "; 
$kathy .=($count+9);
$kathy .= "</a>"; 
}

if ($upto == 20){
$kirsty .= " | <a href=#";
$kirsty .= $count; 
$kirsty .= ">";
$kirsty .= $count; 
$kirsty .= " to "; 
$kirsty .=($count+9);
$kirsty .= "</a>"; 
}

if ($upto == 30){
$nick .= " | <a href=#";
$nick .= $count; 
$nick .= ">";
$nick .= $count; 
$nick .= " to "; 
$nick .=($count+9);
$nick .= "</a>"; 
}
if ($upto == 40){
$nikki .= " | <a href=#";
$nikki .= $count; 
$nikki .= ">";
$nikki .= $count; 
$nikki .= " to "; 
$nikki .=($count+9);
$nikki .= "</a>"; 
}
$count ++;
}
print "Hong-Anh", $ruth, "<p>";
print "Kathy", $kathy, "<p>";
print "Bernadette", $kirsty, "<p>";
print "Nick", $nick, "<p>";
print "Nikki", $nikki, "<p>";


my $i=0;
my $batch = MARC::Batch->new('USMARC','koha.mrc');
my $record = $batch->next();	
while ( my $record = $batch->next() ) {
my $field = $record->field('952');
$test=($field->subfield("c"));
if ($test ne "INPROCESS") {
my $field = $record->field('999');
my $restrictor= $field->subfield("d");
if ($restrictor > 1000){
print "<p><a name=", $i, ">Record number:", $i, " | <a target='_new' href='http://kingsfund.koha-ptfs.eu:8080/cgi-bin/koha/cataloguing/addbiblio.pl?biblionumber="; 
print $field->subfield("d");
print "'>Edit biblio</a>";
print " | <a target='_new' href='http://kingsfund.koha-ptfs.eu/cgi-bin/koha/opac-detail.pl?biblionumber=";
print $field->subfield("d");
print "'>OPAC view</a>";
print " | <a target='_new' href='http://kingsfund.koha-ptfs.eu:8080/cgi-bin/koha/catalogue/detail.pl?biblionumber=";
print $field->subfield("d");
print "'>Cataloguing view</a>";
print "<br>";
my $field = $record->field('020');
if ($field) {
   print $field->as_formatted(), "<br>";
} 
my $field = $record->field('021');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('022');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('050');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('100');
if ($field) {
#$field->encoding( 'UTF-8' );
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('110');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('111');
if ($field) {
   print $field->as_formatted(), "<br>";
}

my $field = $record->field('245');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('246');
if ($field) {
   print $field->as_formatted(), "<br>";
}

my $field = $record->field('248');
if ($field) {
   print $field->as_formatted(), "<br>";
}

my $field = $record->field('250');
if ($field) {
   print $field->as_formatted(), "<br>";
}

my $field = $record->field('260');
if ($field) {
   print $field->as_formatted(), "<br>";
}

my $field = $record->field('300');
if ($field) {
   print $field->as_formatted(), "<br>";
}

my $field = $record->field('440');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('490');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('500');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('502');
if ($field) {
   print $field->as_formatted(), "<br>";
}

my $field = $record->field('503');
if ($field) {
   print $field->as_formatted(), "<br>";
}

my $field = $record->field('505');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('506');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('520');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my @fields = $record->field('650');
foreach my $field (@fields) {
print $field->as_formatted(), "<br>";
}

my @fields = $record->field('700');
if (@fields) {
foreach my $field (@fields) {
   print $field->as_formatted(), "<br>";
}}

my $field = $record->field('710');
if ($field) {
   print $field->as_formatted(), "<br>";
}
my $field = $record->field('773');
if ($field) {
print $field->as_formatted(), "<br>";
}

my @fields = $record->field('856');
foreach my $field (@fields) {
print $field->as_formatted(), "<br>";
}
my $field = $record->field('942');
if ($field) {
print $field->as_formatted(), "<br>";
}
my $field = $record->field('952');
if ($field) {
print $field->as_formatted(), "<br>";
}
$i++;
}}

}
print "</body></html>";
