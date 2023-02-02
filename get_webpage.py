import requests
import urllib.request

url = "https://en.wikipedia.org/wiki/2008_Summer_Olympics"

uf = urllib.request.urlopen(url)
html = uf.read()
print(type(html))