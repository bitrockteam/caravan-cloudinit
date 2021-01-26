#! /bin/bash

if [[ `hostname` == clustnode* ]]; then
    sudo systemctl enable nomad-watcher.path && \
    sudo systemctl enable nomad-watcher.service && \
    sudo systemctl start nomad-watcher.path && \
    sudo systemctl start nomad-watcher.service
else
    sleep 60s && \
    systemctl restart vault-agent && \
    systemctl restart consul && \
    systemctl restart nomad
fi

if [[ `hostname` == monitoring* ]]; then
    export ELASTIC_SERVICE=$(curl -s -H 'Metadata-Flavor: Google' http://metadata.google.internal/computeMetadata/v1/instance/attributes/elastic-service) \
        GRAFANA_SERVICE=$(curl -s -H 'Metadata-Flavor: Google' http://metadata.google.internal/computeMetadata/v1/instance/attributes/grafana-service)
        PROMETHEUS_SERVICE=$(curl -s -H 'Metadata-Flavor: Google' http://metadata.google.internal/computeMetadata/v1/instance/attributes/prometheus-service)
    curl -o /etc/consul.d/elastic-service.json -s -L -H "Authorization: Bearer $TOKEN" $ELASTIC_SERVICE && \
    curl -o /etc/consul.d/grafana-service.json -s -L -H "Authorization: Bearer $TOKEN" $GRAFANA_SERVICE && \
    curl -o /etc/consul.d/prometheus-service.json -s -L -H "Authorization: Bearer $TOKEN" $PROMETHEUS_SERVICE && \
    sudo sysctl -w vm.max_map_count=262144 && \
    sudo systemctl enable prometheus && \
    sudo systemctl start prometheus && \
    sudo systemctl enable elasticsearch && \
    sudo systemctl start elasticsearch && \
    sudo systemctl enable grafana-server && \
    sudo systemctl start grafana-server
fi


# (crontab -l 2>/dev/null; echo "*/15 * * * * /usr/bin/systemctl restart docker-login.service") | crontab -
# sudo service stackdriver-agent start