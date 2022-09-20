build:
	docker build -t shadow-backend:latest . 

run-test:
	docker run -t -p  1337:1337 shadow-backend

run-test-with-sqlite:   	
	docker run -v ${PWD}/data.db:/opt/app/.tmp/data.db -t -p 1337:1337 shadow-backend
