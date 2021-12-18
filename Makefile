all:
	@echo "Use 'make build' or 'make push' "


USER_NAME=yar2dev

SRC_DIR  = src
MONITORING_DIR = monitoring

SRC = comment post-py ui
MONITORING = blackbox prometheus

build:
	for name in $(SRC) ; do \
	docker build -t $(USER_NAME)/$$name:latest $(SRC_DIR)/$$name ; \
done

	for name in $(MONITORING) ; do \
	docker build -t $(USER_NAME)/$$name:latest $(MONITORING_DIR)/$$name ; \
done

push:
	for name in $(SRC) $(MONITORING) ; do \
	docker push $(USER_NAME)/$$name:latest ; \
done

.PHONY: all build push
