SYSTEMD_UNIT_DIR := /etc/systemd/system

install:
	sudo cp pulseaudio.service pulseaudio.socket $(SYSTEMD_UNIT_DIR)

deploy: install
	-sudo systemctl --global disable --now pulseaudio.service pulseaudio.socket
	sudo systemctl enable --now pulseaudio.socket
	
.PHONY: install