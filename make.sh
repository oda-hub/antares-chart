export ODA_SITE=${ODA_SITE:-}
export ODA_NAMESPACE=${ODA_NAMESPACE:-oda-staging}

function site-values() {
    if [ "${ODA_SITE}" == "" ]; then
        echo values.yaml
    else
        echo values-${ODA_SITE}.yaml
    fi
}

function create-secret() {
    echo "no secrets for ANTARES"    
}

function install() {
    upgrade
}

function upgrade() {
    set -x
    helm upgrade --install -n ${ODA_NAMESPACE:?} oda-antares . -f $(site-values) #--set image.tag="$(cd antares; git describe --always)" 
}

$@
