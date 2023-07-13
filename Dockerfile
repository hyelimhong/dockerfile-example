# ubuntu:focal 이미지에 apache2 서비스를 구성한 이미지를 만들 때 아래와 같은 구조의 폴더를
# 생성하여 만들도록 작업

dock_project/
      	ubuntu_apache2/
	    apache2/
		sites-availavle/
			000-default.conf
	    Dockerfile
	ubuntu_nignx/
	    nignx/
		site-available/
			default
	    Dockerfile