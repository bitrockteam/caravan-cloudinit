#! /bin/bash

sudo systemctl enable nomad-watcher.path && \
sudo systemctl enable nomad-watcher.service && \
sudo systemctl start nomad-watcher.path && \
sudo systemctl start nomad-watcher.service
