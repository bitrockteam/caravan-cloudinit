#! /bin/bash

sleep 60s && \
systemctl restart vault-agent && \
systemctl restart consul && \
systemctl restart nomad

if [[ `hostname` == monitoring* ]]; then
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
