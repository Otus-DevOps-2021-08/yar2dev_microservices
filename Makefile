all:
	@echo "Use 'make build' or 'make push' "


PROJECT-TAG = logging
export USER_NAME = yar2dev

SRC_DIR  = src
MONITORING_DIR = monitoring

SRC = comment post-py ui
MONITORING = blackbox prometheus


build:
	for name in $(SRC) ; do \
	(cd $(SRC_DIR)/$$name/ && ./docker_build.sh) ; \
done

	for name in $(MONITORING) ; do \
	docker build -t $(USER_NAME)/$$name:$(PROJECT-TAG) $(MONITORING_DIR)/$$name ; \
done

push:
	for name in $(SRC) $(MONITORING) ; do \
	docker push $(USER_NAME)/$$name:$(PROJECT-TAG) ; \
done


build-src:
	for name in $(SRC) ; do \
	(cd $(SRC_DIR)/$$name/ && ./docker_build.sh) ; \
done

push-src:
	for name in $(SRC)  ; do \
	docker push $(USER_NAME)/$$name:$(PROJECT-TAG) ; \
done

build-monitoring:
	for name in $(MONITORING) ; do \
	docker build -t $(USER_NAME)/$$name:$(PROJECT-TAG) $(MONITORING_DIR)/$$name ; \
done


.PHONY: all build push build-src push-src build-monitoring
