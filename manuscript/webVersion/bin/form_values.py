def query_list(field, db, table, args=()):
    db.row_factory = lambda c, r : r[0]
    cur = db.execute(f'SELECT {field} from {table}', args)
    rows = [row for row in cur.fetchall() if row != 'no']
    cur.close()
    return sorted(list(set(rows)))

def query_colnames(table, db, exclude=[], args=()):
    db.row_factory = lambda c, r : r[0]
    cur = db.execute(f'SELECT name FROM PRAGMA_TABLE_INFO(\'{table}\')')
    cols = [col for col in cur.fetchall() if col not in exclude]
    cur.close()
    return sorted(list(set(cols)))

def dropdowns(db, table='main'):
    return {
        'host_binomial'     : query_list('HostBinomial', db, 'Hosts'),
        'host_order'        : query_list('HostOrder', db, 'Hosts'),
        'host_family'       : query_list('HostFamily', db, 'Hosts'),
        'host_genus'        : query_list('HostGenus', db, 'Hosts'),
        'pathogen_name'     : query_list('Pathogen', db, 'Main'),
        'pathogen_group'    : query_list('ParasiteGroup', db, 'Main'),
        'status' : ['Both', 'Positive', 'Negative']
    }

def boxes():
    return {
        'host_fields' : ["Host Binomial (genus and species)"],
        'parasite_fields' : ["Parasite Group (virus, bacteria, fungus, nematode, ect.)", "High Taxon (higher taxonomy)", "Low Taxon (lower taxonomy)", "Pathogen (genus and species)"],
        'infection_fields' : ["Infect (infection status)", "Stage (host stage infected/ tested)", "Tissue (tissue infected/ tested)", "Field Or Lab (field or experimental observation)"],
        'other_fields' : ["Country (country of host population)", "Host Order/ Taxon (higher host taxonomy)", "Host Family (lower host taxonomy)",
            "Synonyms (alternate host scientific names)", "Habitat (host habitat)", "Food (host diet)",
            "genYr (host generations per year)", "Common Name (host common name)", "Insect Status (pest or non-pest)"]
    }

columnMap = {
    "hostbinomial(genusandspecies)"                         : "HostBinomial",
    "parasitegroup(virus,bacteria,fungus,nematode,ect.)"    : "ParasiteGroup",
    "hostorder/taxon(higherhosttaxonomy)"                   : "HostOrder",
    "hostfamily(lowerhosttaxonomy)"                         : "HostFamily",
    "synonyms(alternatehostscientificnames)"                : "Synonyms",
    "habitat(hosthabitat)"                                  : "Habitat",
    "food(hostdiet)"                                        : "Food",
    "genyr(hostgenerationsperyear)"                         : "genYr",
    "commonname(hostcommonname)"                            : "CommonName",
    "insectstatus(pestornon-pest)"                          : "InsectStatus",
    "hightaxon(highertaxonomy)"                             : "HighTaxon",
    "lowtaxon(lowertaxonomy)"                               : "LowTaxon",
    "pathogen(genusandspecies)"                             : "Pathogen",
    "infect(infectionstatus)"                               : "Infect",
    "stage(hoststageinfected/tested)"                       : "Stage",
    "tissue(tissueinfected/tested)"                         : "Tissue",
    "fieldorlab(fieldorexperimentalobservation)"            : "FieldOrLab",
    "country(countryofhostpopulation)"                      : "Country"
}
