.PHONY: test

SERVICE_NAME=hello-world-printer
MY_DOCKER_NAME=$(SERVICE_NAME)

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test
test_smoke:
	curl -I --fail 127.0.0.1:5000

run:
	python main.py

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=.

test_xunit:
	PYTHONPATH=. py.test -s --cov=.  --junit-xml=test_results.xml

docker_build:
	docker build -t $(SERVICE_NAME) .

docker_run: docker_build
	docker run \
	--name hello-world-printer-dev \
		-p 5000:5000 \
		-d $(SERVICE_NAME)

USERNAME=jplamowska
TAG=$(USERNAME)/hello_world_printer

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag hello_world_printer $(TAG); \
	docker push $(TAG); \
	docker logout;
