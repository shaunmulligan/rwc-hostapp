FROM petrosagg/hostapp-preview:raspberrypi3-v2

RUN mkdir -p /usr/src/rwc/

WORKDIR /usr/src/rwc

COPY os-release /etc/os-release
ADD resin-wifi-connect-v2.99.9-linux-armv7hf.tar.gz /usr/src/rwc
RUN mv resin-wifi-connect /usr/bin/resin-wifi-connect

COPY wificonnect.service /etc/systemd/system/wificonnect.service
COPY wificonnect.timer /etc/systemd/system/wificonnect.timer
RUN systemctl enable wificonnect.timer

COPY wificonnect.sh /usr/src/rwc/wificonnect.sh
RUN chmod +x wificonnect.sh 
