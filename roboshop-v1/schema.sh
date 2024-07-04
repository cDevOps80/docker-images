if [ "${component}" == "mongo" ]; then

[ -z "${CODE_URL}" ] && echo "GIT_HUB_URL -- env parameter is missing" && exit 1
[ -z "${SCHEMA_FILE}" ] && echo "SCHEMA_FILE -- env parameter is missing" && exit 1
[ -z "${MONGO_DB_ADDRESS}" ] && echo "MONGO_DB_ADDRESS -- env parameter is missing" && exit 1

mkdir -p /app
curl -o /tmp/code.zip ${CODE_URL}
unzip /tmp/code.zip -d /app
mongosh --host ${MONGO_DB_ADDRESS} < ${SCHEMA_FILE}

fi

if [ "${component}" == "mysql" ]; then

[ -z "${CODE_URL}" ] && echo "GIT_HUB_URL -- env parameter is missing" && exit 1
[ -z "${SCHEMA_FILE}" ] && echo "SCHEMA_FILE -- env parameter is missing" && exit 1
[ -z "${MYSQL_ADDRESS}" ] && echo "MONGO_DB_ADDRESS -- env parameter is missing" && exit 1
mkdir -p /app
curl -o /tmp/code.zip ${CODE_URL}
unzip /tmp/code.zip -d /app
for i in $(ls /app/db) ; do echo "mysql -h 172.17.0.3  -uroot -pRoboShop@1 < /app/db/${i}" ;done

fi



