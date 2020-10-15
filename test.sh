Validation() {
    echo "Start Validation Test"
    docker -v

    FILEPATH="$(pwd)/"

    [ -n "${PARAM_FPATH}" ] && echo "${PARAM_FPATH}" | grep -Eq '^\/.*' && FILEPATH="${PARAM_FPATH}/" || FILEPATH="$FILEPATH/${PARAM_FPATH}"
    [ -z "${P_REMOTE_BASE_URL}" ] && REMOTEPATH="" || REMOTEPATH=" -remote-base-url ${P_REMOTE_BASE_URL} "
    [ "${P_DISABLE_STRICT}" = "true" ] && STRICT=" -no-strict " || STRICT=""
    [ "${P_DISABLE_NETWORK}" = "true" ] && NETWORK=" -no-network " || NETWORK=""

    echo "docker run -i italia/publiccode-parser-go /dev/stdin $REMOTEPATH$STRICT$NETWORK --verbose < $FILEPATH/${P_FILENAME}" 

    docker run -i italia/publiccode-parser-go /dev/stdin "$REMOTEPATH$STRICT$NETWORK" --verbose < "$FILEPATH/${P_FILENAME}"
}

export P_FILENAME="publiccode2.yml"
export PARAM_FPATH=""
export P_DISABLE_NETWORK=""
export P_DISABLE_STRICT=""
export P_REMOTE_BASE_URL=""

Validation