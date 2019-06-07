import requests
from xml.etree import ElementTree

def get_books(nCodigoCliente, sToken, sParametrosBusca):
	try:
		url = 'http://api.sponteeducacional.net.br/WSAPIEdu.asmx/GetAlunos'
		params = {'nCodigoCliente': nCodigoCliente, 'sToken': sToken, 'sParametrosBusca':sParametrosBusca}
		r = requests.get(url, params=params, stream=True)
		dom = ElementTree.parse(r.content)
		students = dom.findall('wsAluno')
		print ("Inicio dos estudantes: {}".format(students))
		return dom
	except Exception as e:
		print(e)
		return 0