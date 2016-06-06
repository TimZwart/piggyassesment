# Piggy Assessment Backend

Doel van de opdracht is het maken van een API endpoint voor een fictieve app. 

## De situatie

Onze fictieve app is een bibliotheek die boeken weergeeft. De app heeft een aantal endpoints nodig om voorzien te worden van de juiste data.

De data bestaat uit:

- Books
- Authors
- Publishers

## Project basis

Om de basis van het project aan de praat te krijgen is het volgende nodig:

- 'composer install' draaien om propel libraries toe te voegen
- een mysql database met de naam 'piggy_assessment'
- instellen van database connection settings in 'propelproject/propel.json' (dsn, username en password)
- importeren van database structuur: propelproject/generated-sql/bookstore.sql

## Wat wordt er verwacht?

Het maken van verschillende endpoints voor de volgende uitvoer/acties:

- lijst van alle boeken, met mogelijkheid tot paginatie
    * Van een boek enkel id en titel uitkoppelen
- ophalen van boek specifieke data met daarin de optie om auteur wel/niet ook uit te koppelen
- het koppelen van een publisher aan een boek, output mag iets zijn wat duidelijk maakt aan de app dat het succesvol gedaan is

Alle output dient in JSON format te zijn.
  
## Do's en Dont's 

- Het gebruik van Propel is niet vereist. Dit is toegevoegd om de database structuur helder te maken en om kant en klare PHP objecten te hebben waarmee gewerkt mag/kan worden.
We raden je wel aan de objecten te gebruiken, daar dit de hele communicatie met de database voor je afhandelt en een hoop tijd zal schelen. Het niet kennen van Propel is geen probleem, we helpen je graag met het ophalen van de juiste data.
- De opdracht dient met PHP gemaakt te worden, zonder gebruik van andere programmeertalen. 
- We ontvangen graag documentatie omtrent het configureren van je implementatie 


## Tips/hints

- Om propel te gebruiken is het nodig dat je propelproject/generated-conf/config.php include. Pas je database gegevens (dsn, username en password) indien nodig ook aan.
- Propel default CRUD documentatie: http://propelorm.org/documentation/03-basic-crud.html
- Gebruik de vendor/autoload.php zodat je propel objecten kan benaderen middels de toegevoegde classmap autoloading.
- Wees niet bang om vragen te stellen als je ergens niet uitkomt