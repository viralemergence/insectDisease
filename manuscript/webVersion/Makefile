local:
		`which python3` -m pip install --upgrade pip
		`which python3` -m pip install virtualenv
		`which python3` -m venv env
		env/bin/python3 -m pip install -r requirements.txt
		env/bin/python bin/db_setup.py

install:
		@echo 'Installing EDWIP'
		@docker build -t edwip .

deploy:
		@echo 'Starting EDWIP'
		@docker run --name edwip --detach -p 7778:5000 edwip > /dev/null

remove:
		@echo 'Removing EDWIP Container'
		@docker rm /edwip

start:
		@echo 'Starting EDWIP'
		@docker start edwip > /dev/null

stop:
		@echo 'Stopping EDWIP'
		@docker kill edwip > /dev/null
