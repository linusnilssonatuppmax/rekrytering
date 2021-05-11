#!/usr/bin/perl

#
# Detta är ett script som visar använt diskutrymme för alla projekt en användare är med i.
#
# Användaren är med i alla projekt med två nollor på slutet.
#

print "This is my disk usage\n";
print "---------------------------------------------\n";

open(LIST, "ls -la projektkatalog |");
while (my $line = <LIST>) {
    my ($_, $_, $_, $_, $_, $time1, $time2, $time3, $dir) =
	($line =~ /^(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/);


    if ($group =~ m/00$/) {
	open(DU, "du -s projektkatalog/$dir |");
	print <DU>;
	close(DU);
    }
    

}
close(LIST);

#
# 1. Istället för att titta på katalognamnet så ska scripet kolla gruppen på katalogen och rapportera
#    storlek på alla kataloger i vars grupper avändaren är med i.
#
#    Användaren är med i alla grupper med "00" på slutet i gruppens nummer (gid). Grupperna har inga namn
#    på systemet.
#
