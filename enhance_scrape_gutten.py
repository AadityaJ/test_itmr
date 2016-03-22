## download  catalog from site http://www.gutenberg.org/cache/epub/feeds/rdf-files.tar.zip 
## the catalog very big.Before running the code , download catalog into this repo
## Guttenberg doesnt allow direct catalog page scrapping : http://gutenberg.us/articles/web_scraping 
def get_book(id):
	filename = 'cache/epub/%d/pg%d.rdf',%(id,id)
	from lxml import etree  ## processing xml and html 
	rdf = open(filename).read()
	tree = etree.fromstring(rdf)
	resource_tag = '{http://www.w3.org/1999/02/22-rdf-syntax-ns#}resource'
	hasFormat_tag = './/{http://purl.org/dc/terms/}hasFormat' ## xml formatting
	resources = [el.attrib[resource_tag] for el in tree.findall(hasFormat_tag)]
	urls = [url for url in resources if url.endswith('htm')] ## actual site id ends with 'htm'
	## urls[0] is 'http://www.gutenberg.org/files/id/id-h/id-h.htm' which is what is required
	import requests ## now lets get the data from that site  
	response = requests.get(urls[0])
	html = etree.HTML(response.text)
	text = '\n'.join([el.text for el in html.findall('.//p')])  
	## text now contains the full text of book reqd, minus the Project Gutenberg metadata, 
	## table of contents, and chapter headings.
	print text
## to run this place any id in . Like :
#get_book(78) gets Tarzan
##for any 10 books :
#import random
## need 10 random books
#for i in range(10):
#	get_book(randint(0,1000))