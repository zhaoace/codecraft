import requests
import bs4
 

def download_buildfile(url, build_file_name,auth):
    url = url + build_file_name
    r = requests.get(url, stream=True, auth=auth)
    with open(build_file_name, 'wb') as fd:
        for chunk in r.iter_content(chunk_size=128):
            fd.write(chunk)



auth = ('username', 'password')

url = 'http://JENKINSIP:8080/job/build_job_name/lastSuccessfulBuild/artifact/build/'

r1 = requests.get(url, auth=auth)

soup1 = bs4.BeautifulSoup(r1.content,features="html.parser")

build_file_name_1 = soup1.select("a[href$=zip][href^=oly]")[0].text

download_buildfile(url, build_file_name_1 ,auth )


