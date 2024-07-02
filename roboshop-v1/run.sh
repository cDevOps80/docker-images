[ -z "${GIT_HUB_URL}" ] && echo "GIT_HUB_URL -- env parameter is missing" && exit 1
[ -z "${SCHEMA_FILE}" ] && echo "SCHEMA_FILE -- env parameter is missing" && exit 1
[ -z "${MONGO_DB_ADDRESS}" ] && echo "MONGO_DB_ADDRESS -- env parameter is missing" && exit 1

git clone ${GIT_HUB_URL} /app
mongo --host ${MONGO_DB_ADDRESS} < ${SCHEMA_FILE}