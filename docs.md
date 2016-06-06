##Configuratie
php7.0 package op ubuntu 16.04 draaiende op apache2, met mysql. kopieer alle bestanden naar een subdirectory van /var/www/html . zorg dat mod_rewrite aan staat voor apache. pas de apache configuratie (etc/apache2/apache2.conf ) aan zodat AllowOveride op All staat voor de betreffende directory. pas in de index.php de $base_path en $base_uri aan. 
##bedoeld gebruik
ga naar base_uri/books/booklist voor de lijst van alle boeken. paginatie heb ik achterwege gelaten wegens tekort aan tijd maar het is misschien ook een beetje raar om zoiets te hebben voor json output die niet bedoeld is voor menselijke consumptie.
ga naar base_uri/books/book/123 voor informatie over het boek met id 123. base_uri/books/book/123/no_author zou geen auteur moeten weergeven. 
om boek met id 123 aan publisher met id 456 te koppelen, ga naar base_uri/books/addpublisher/123/456 
##problemen
propel werkt niet hier en daarmee de rest ook niet. ik heb dus ook niets kunnen testen dus het kan zijn dat er nog meer dingen misgaan als propel wel werkt
 Fatal error: Uncaught PDOException: SQLSTATE[HY000] [1045] Access denied for user 'root'@'localhost' (using password: NO) 
dit terwijl ik het wachtwoord netjes heb doorgegeven in mijn propel.json . het proberen herbouwen van propel met propel config:convert hielp ook niet, want ik kreeg een permission denied error voor het pad "". gezien dat geen pad is, kan ik daar weinig aan veranderen. 
