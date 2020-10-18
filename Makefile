build:
	docker build -t test:latest .
test:
	docker run -d --rm --name test -p 8088:80 test
	curl -s localhost:8088|grep hello
