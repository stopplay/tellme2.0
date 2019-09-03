import requests
from xml.etree import ElementTree
import pdb

def get_alunos(nCodigoCliente, sToken, sParametrosBusca):
	try:
		url = 'http://api.sponteeducacional.net.br/WSAPIEdu.asmx/GetAlunos'
		params = {'nCodigoCliente': nCodigoCliente, 'sToken': sToken, 'sParametrosBusca':sParametrosBusca}
		r = requests.get(url, params=params, stream=True)
		dom = ElementTree.fromstring(r.content.decode('UTF-8'))
		return dom
	except Exception as e:
		print(e)
		return 0

def get_parents(nCodigoCliente, sToken, sParametrosBusca):
	try:
		url = 'http://api.sponteeducacional.net.br/WSAPIEdu.asmx/GetResponsaveis'
		params = {'nCodigoCliente': nCodigoCliente, 'sToken': sToken, 'sParametrosBusca':sParametrosBusca}
		r = requests.get(url, params=params, stream=True)
		dom = ElementTree.fromstring(r.content.decode('UTF-8'))
		return dom
	except Exception as e:
		print(e)
		return 0