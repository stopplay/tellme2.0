import requests
from xml.etree import ElementTree

def get_financeiro(nCodigoCliente, sToken, sParametrosBusca):
	try:
		url = 'http://api.sponteeducacional.net.br/WSAPIEdu.asmx/GetFinanceiro'
		params = {'nCodigoCliente': nCodigoCliente, 'sToken': sToken, 'sParametrosBusca':sParametrosBusca}
		r = requests.get(url, params=params, stream=True)
		dom = ElementTree.fromstring(r.content.decode('UTF-8'))
		return dom
	except Exception as e:
		print(e)
		return 0