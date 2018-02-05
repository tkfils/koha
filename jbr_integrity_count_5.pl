#!/usr/bin/perl

use MARC::Batch;
print "<!DOCTYPE html>\n";
print "<html lang='en'>\n";
print "  <head>\n";
print "    <meta charset=\"utf-8\">\n";
print "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n";
print "    <meta name=\"description\" content=\"\">\n";
print "    <meta name=\"author\" content=\"\">\n";
print "    <title>Data integrity check</title>\n";
print "    <!-- Bootstrap core CSS -->\n";
print "    <link href=\"../bootstrap/css/bootstrap.css\" rel=\"stylesheet\">\n";
print "    <link href=\"../css/quote.css\" rel=\"stylesheet\">\n";
print "    <!-- Custom styles for this template -->\n";
print "    <style>\n";
print "      body {\n";
print "        padding-top: 54px;\n";
print "      }\n";
print "      \@media (min-width: 992px) {\n";
print "        body {\n";
print "          padding-top: 56px;\n";
print "        }\n";
print "      }\n";
print "    </style>\n";
print "<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n";
print "<script src=\"../js/run_quotes.js\"></script>\n";
print "<script>\n";
print "\$(document).ready(function(){\n";
print "run_quotes();\n";
print "});\n";
print "</script>\n";
print "  </head>\n";
print "  <body>\n";
print "    <!-- Page Content -->";
print "<div class=\"p bg-dark text-light\"><h4>Data integrity check</h4></div>";
print "<div id=\"container\">";
print "	<!--	<h2>Get Your Daily Quote</h2>  -- https://codepen.io/kkoutoup/pen/zxmGLE> -->";
print "			<div id=\"quoteContainer\">";
print "				<p></p>";
print "				<p id=\"quoteGenius\"></p></div>";
print "</div>";

my @records = ();
my @f245    = ();
my $idx     = 0;
my $batch = MARC::Batch->new('USMARC','koha.mrc');
while ( my $MARC = $batch->next ) {
    push(@records, $MARC);
    push(@f245, [$idx++, $MARC->field("245")->as_string]);
}

my $count = 0;
my $checker1 = "";
my $checker2 = "";
my $checker3 = "";
my $checker4 = "";
my $checker5 = "";

while ($count < $idx){
my $upto = $count % 50;

if ($upto == 0){
$checker1 .= " | <a href=#"; 
$checker1 .= $count; 
$checker1 .= ">";
$checker1 .= $count; 
$checker1 .= " to "; 
$checker1 .=($count+9);
$checker1 .= "</a>"; 
}

if ($upto == 10){
$checker2 .= " | <a href=#";
$checker2 .= $count; 
$checker2 .= ">";
$checker2 .= $count; 
$checker2 .= " to "; 
$checker2 .=($count+9);
$checker2 .= "</a>"; 
}

if ($upto == 20){
$checker3 .= " | <a href=#";
$checker3 .= $count; 
$checker3 .= ">";
$checker3 .= $count; 
$checker3 .= " to "; 
$checker3 .=($count+9);
$checker3 .= "</a>"; 
}

if ($upto == 30){
$checker4 .= " | <a href=#";
$checker4 .= $count; 
$checker4 .= ">";
$checker4 .= $count; 
$checker4 .= " to "; 
$checker4 .=($count+9);
$checker4 .= "</a>"; 
}

if ($upto == 40){
$checker5 .= " | <a href=#";
$checker5 .= $count; 
$checker5 .= ">";
$checker5 .= $count; 
$checker5 .= " to "; 
$checker5 .=($count+9);
$checker5 .= "</a>"; 
}

$count ++;
}
print "<div class=\"p-3 mb-2 ml-10 bg-light text-dark\">Nikki", $checker1, "</div>";
print "<div class=\"p-3 mb-2 ml-10 bg-light text-dark\">Kathy", $checker2, "</div>";
print "<div class=\"p-3 mb-2 ml-10 bg-light text-dark\">Hong-Anh", $checker3, "</div>";
print "<div class=\"p-3 mb-2 ml-10 bg-light text-dark\">Ruth", $checker4, "</div>";
print "<div class=\"p-3 mb-2 ml-10 bg-light text-dark\">Nick", $checker5, "</div>";


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
print "<div class=\"p-3 mb-2 bg-light text-dark\"><a name=", $i, ">Record number:", $i, " | <a target='_new' href='http://kingsfund.koha-ptfs.eu:8080/cgi-bin/koha/cataloguing/addbiblio.pl?biblionumber="; 
print $field->subfield("d");
print "'>Edit biblio</a>";
print " | <a target='_new' href='http://kingsfund.koha-ptfs.eu/cgi-bin/koha/opac-detail.pl?biblionumber=";
print $field->subfield("d");
print "'>OPAC view</a>";
print " | <a target='_new' href='http://kingsfund.koha-ptfs.eu:8080/cgi-bin/koha/catalogue/detail.pl?biblionumber=";
print $field->subfield("d");
print "'>Cataloguing view</a>";
print "</div>";
print "<table class=\"table table-bordered\">";

my $field = $record->field('020');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
} 


my $field = $record->field('021');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('022');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('050');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('100');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
      my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('110');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('111');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}



my $field = $record->field('245');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('246');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}



my $field = $record->field('248');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}



my $field = $record->field('250');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}



my $field = $record->field('260');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}



my $field = $record->field('300');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}



my $field = $record->field('440');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('490');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('500');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('502');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}



my $field = $record->field('503');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}



my $field = $record->field('505');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('506');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('520');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}
my @fields = $record->field('650');
foreach my $field (@fields) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}

my @fields = $record->field('700');
if (@fields) {
foreach my $field (@fields) {
   print "<tr>";  
print "<th scope=\"row\">";
      my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}}



my $field = $record->field('710');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
   my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('773');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}

my @fields = $record->field('856');
foreach my $field (@fields) {
   print "<tr>";  
print "<th scope=\"row\">";
      my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $subdata= substr($pretty, 7, 2);
my $data =substr($pretty, 9, );
print $number, "</th><td>";
print $subdata;
print "<a href=\"", $data, "\"</a>", $data, "</td></tr>";
}


my $field = $record->field('942');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
}


my $field = $record->field('952');
if ($field) {
   print "<tr>";  
print "<th scope=\"row\">";
my $pretty= $field->as_formatted();
my $number= substr($pretty, 0, 3);
my $data=substr($pretty, 3, );
print $number, "</th><td>";
print $data, "</td></tr>";
print "</table>";
}
$i++;
}}

}
print "</body></html>";
