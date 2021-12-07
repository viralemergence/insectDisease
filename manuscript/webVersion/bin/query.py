def makeQuery(data):
    infectionStatus = data['InfectionStatus']
    del(data['InfectionStatus'])

    fieldlist = []
    joinHosts = False
    for field in [data[field][0] for field in data if '_fields_' in field]:
        if field in ['HostBinomial', 'HostOrder', 'HostFamily', 'Synonyms', 'Habitat', 'Food', 'genYr', 'CommonName', 'InsectStatus']:
            fieldlist.append(f'Hosts.{field}')
            joinHosts = True
        else:
            fieldlist.append(f'Main.{field}')

    fieldString = ', '.join(fieldlist)
    if not fieldString:
        fieldString = 'NULL'

    queryString = f'SELECT {fieldString} FROM Main '
    #if joinHosts:
    queryString += f'INNER JOIN Hosts ON Main.Host = Hosts.HostBinomial '
    wheres = ' AND '.join(['( '+' OR '.join([f'({field} = \'{value}\')' for value in data[field]])+ ' )' for field in data if '_fields_' not in field])
    if wheres:
        queryString += 'WHERE ' + wheres
    if infectionStatus == 'Positive':
        queryString += ' AND ( Infect = 1 )'
    if infectionStatus == 'Negative':
        queryString += ' AND ( Infect = 0 )'
    return queryString

def query(data, db):
    query = makeQuery(data)
    #print(query)
    cur = db.execute(query,{})
    records = cur.fetchall()
    cur.close()
    return [list(x) for x in records]
