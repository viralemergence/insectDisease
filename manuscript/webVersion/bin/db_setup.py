import sqlite3
import csv

def escape(s):
    return s.replace('"','""').replace("'","''").strip()

db=sqlite3.connect("data/db.sqlite")
c=db.cursor()

c.execute('CREATE TABLE Main (ID INTEGER PRIMARY KEY, Host TEXT, ParasiteGroup TEXT, HighTaxon TEXT, LowTaxon TEXT, Pathogen TEXT, Infect INTEGER, Stage TEXT, Tissue, TEXT, FieldOrLab TEXT, Country TEXT)')
with open('data/csv/negative.csv', newline='', encoding='iso-8859-1') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        c.execute(f"INSERT INTO Main (Host, ParasiteGroup, HighTaxon, LowTaxon, Pathogen, Infect, Stage, Tissue, FieldOrLab, Country) VALUES (\"{escape(row['Host'])}\", \"{escape(row['Group'])}\", \"{escape(row['HighTaxon'])}\", \"{escape(row['LowTaxon'])}\", \"{escape(row['Pathogen'])}\", \"0\", \"{escape(row['HostStageTested'])}\", \"NA\", \"Lab\", \"NA\")")

with open('data/csv/nematode.csv', newline='', encoding='iso-8859-1') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        c.execute(f"INSERT INTO Main (Host, ParasiteGroup, HighTaxon, LowTaxon, Pathogen, Infect, Stage, Tissue, FieldOrLab, Country) VALUES (\"{escape(row['Host'])}\", \"nematode\", \"{escape(row['NematodeOrder'])}\", \"{escape(row['NematodeFamily'])}\", \"{escape(row['Nematode'])}\", \"1\", \"{escape(row['StageInfected'])}\", \"{escape(row['TissueInfected'])}\", \"{escape(row['FieldOrLab'])}\", \"{escape(row['Country'])}\")")

with open('data/csv/nvpassoc.csv', newline='', encoding='iso-8859-1') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        c.execute(f"INSERT INTO Main (Host, ParasiteGroup, HighTaxon, LowTaxon, Pathogen, Infect, Stage, Tissue, FieldOrLab, Country) VALUES (\"{escape(row['Host'])}\", \"{escape(row['Group'])}\", \"{escape(row['HighTaxon'])}\", \"{escape(row['LowTaxon'])}\", \"{escape(row['Pathogen'])}\", \"1\", \"{escape(row['HostStageInfected'])}\", \"{escape(row['HostTissueInfected'])}\", \"{escape(row['Field'])}\", \"{escape(row['Country'])}\")")

with open('data/csv/viruses.csv', newline='', encoding='iso-8859-1') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        c.execute(f"INSERT INTO Main (Host, ParasiteGroup, HighTaxon, LowTaxon, Pathogen, Infect, Stage, Tissue, FieldOrLab, Country) VALUES (\"{escape(row['Host'])}\", \"Virus\", \"{escape(row['HighTaxon'])}\", \"{escape(row['LowTaxon'])}\", \"{escape(row['Virus'])}\", \"1\", \"{escape(row['HostStageInfected'])}\", \"{escape(row['HostTissueInfected'])}\", \"{escape(row['Field'])}\", \"{escape(row['Country'])}\")")

c.execute('CREATE TABLE Hosts (ID INTEGER PRIMARY KEY, HostBinomial TEXT, HostOrder TEXT, HostFamily TEXT, HostGenus TEXT, HostSpecies TEXT, Synonyms TEXT, Habitat TEXT, Food TEXT, genYr TEXT, CommonName TEXT, InsectStatus TEXT)')
with open('data/csv/hosts.csv', newline='', encoding='iso-8859-1') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        # Check if the host has any infection records
        c.execute(f"SELECT 1 from Main WHERE Host=\"{escape(row['HostSpecies'])}\"")
        matches = c.fetchall()
        if not matches:
            continue
        # Add Host
        namesplit = row['HostSpecies'].split(' ')
        genus = namesplit.pop(0)
        species = ' '.join(namesplit)
        if row['HostOrder'] == 'Araneae':
            row['HostOrder'] = 'Class Arachnida (Araneae)'
        if row['HostOrder'] == 'Symphyla (class)':
            row['HostOrder'] = 'Class Symphyla'
        if row['HostOrder'] == '?':
            row['HostOrder'] = 'Unknown'
        c.execute(f"INSERT INTO Hosts (HostBinomial, HostOrder, HostFamily, HostGenus, HostSpecies, Synonyms, Habitat, Food, genYr, CommonName, InsectStatus) VALUES (\"{escape(row['HostSpecies'])}\", \"{escape(row['HostOrder'])}\", \"{escape(row['HostFamily'])}\", \"{escape(genus)}\", \"{escape(species)}\", \"{escape(row['Synonyms'])}\", \"{escape(row['Habitat'])}\", \"{escape(row['Food'])}\", \"{escape(row['genYr'])}\", \"{escape(row['CommonName'])}\", \"{escape(row['InsectStatus'])}\")")

db.commit(); db.close()
