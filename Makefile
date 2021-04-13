build:
	docker build -t ggueret/docker-xmrig:buster .

shell:
	docker run --rm -ti ggueret/docker-xmrig bash
