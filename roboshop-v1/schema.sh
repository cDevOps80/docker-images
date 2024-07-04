if [ "${COMPONENT}" == "mongo" ]; then

[ -z "${CODE_URL}" ] && echo "GIT_HUB_URL -- env parameter is missing" && exit 1
[ -z "${SCHEMA_FILE}" ] && echo "SCHEMA_FILE -- env parameter is missing" && exit 1
[ -z "${MONGO_DB_ADDRESS}" ] && echo "MONGO_DB_ADDRESS -- env parameter is missing" && exit 1

mkdir -p /app
curl -o /tmp/code.zip ${CODE_URL}
unzip /tmp/code.zip -d /app
mongosh --host ${MONGO_DB_ADDRESS} < ${SCHEMA_FILE}

fi

if [ "${COMPONENT}" == "mysql" ]; then

[ -z "${CODE_URL}" ] && echo "GIT_HUB_URL -- env parameter is missing" && exit 1
[ -z "${SCHEMA_FILE}" ] && echo "SCHEMA_FILE -- env parameter is missing" && exit 1
[ -z "${MYSQL_ADDRESS}" ] && echo "MYSQL_ADDRESS -- env parameter is missing" && exit 1
[ -z "${MYSQL_USER}" ] && echo "MYSQL_USER -- env parameter is missing" && exit 1
[ -z "${MYSQL_PASSWORD}" ] && echo "MYSQL_PASSWORD -- env parameter is missing" && exit 1
mkdir -p /app
curl -o /tmp/code.zip ${CODE_URL}
unzip /tmp/code.zip -d /app
for i in $(ls ${SCHEMA_FILE}) ; do echo "mysql -h ${MYSQL_ADDRESS}  -u${MYSQL_USER} -p${MYSQL_PASSWORD}" < ${SCHEMA_FILE}/${i} ; done

fi



