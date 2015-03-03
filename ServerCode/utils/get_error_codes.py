import urllib2
from bs4 import BeautifulSoup


html = urllib2.urlopen('http://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml').read()
soup = BeautifulSoup(html)

table = soup.table

rows = table.find_all('tr')

with open('..\out.py', 'w') as f:
    for row in rows:
        cols = row.find_all('td')
        if len(cols) > 2:
            code = cols[0].contents[0]
            description = cols[1].contents[0].upper().replace(' ', '_').replace('-', '_')
            if '-' not in code and 'UNASSIGNED' not in description:
                f.write('{} = {}\n'.format(description, code))
