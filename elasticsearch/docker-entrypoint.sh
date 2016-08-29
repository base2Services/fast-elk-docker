# #!/bin/bash
#
# set -e
#
# # Add elasticsearch as command if needed
# if [ "${1:0:1}" = '-' ]; then
# 	set -- elasticsearch "$@"
# fi
#
# # Drop root privileges if we are running elasticsearch
# # allow the container to be started with `--user`
# if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
# 	# Change the ownership of /usr/share/elasticsearch/data to elasticsearch
# 	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data
#
# 	set -- gosu elasticsearch "$@"
# 	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
# fi
#
# # As argument is not related to elasticsearch,
# # then assume that user wants to run his own process,
# # for example a `bash` shell to explore this image
# exec "$@"
chown -R elasticsearch:elasticsearch /data/elasticsearch

gosu elasticsearch /usr/share/elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf -b 2>&1 | tee -a /usr/share/elasticsearch/plugin_install_log
gosu elasticsearch /usr/share/elasticsearch/bin/plugin install cloud-aws -b 2>&1 | tee -a /usr/share/elasticsearch/plugin_install_log

gosu elasticsearch /usr/share/elasticsearch/bin/plugin list 2>&1 | tee -a /usr/share/elasticsearch/plugin_install_log

set -e

consul-template -template "/usr/share/elasticsearch/config/elasticsearch.yml.template:/usr/share/elasticsearch/config/elasticsearch.yml" -once
cat /usr/share/elasticsearch/config/elasticsearch.yml | grep -v "^#" 
#DAEMON_OPTS=" -De --default.path.home=$ES_HOME --default.path.logs=$LOG_DIR --default.path.data=$DATA_DIR --default.path.conf=$CONF_DIR"
#elasticsearch ${DAEMON_OPTS}
gosu elasticsearch elasticsearch ${DAEMON_OPTS}

