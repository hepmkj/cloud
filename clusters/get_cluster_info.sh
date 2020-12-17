#!/bin/bash

nodes_info () {
    rm -r describe*
    fname="describe_nodes_info_"`date +"%F_%T.%3N"`
    echo "Getting nodes info: "
    kubectl describe nodes |& tee ${fname}
}
get_pods_info () {
    fname="pods_info.json"
    touch ${fname}
    echo "Getting pods info: "
    kubectl get po -ns --all-namespaces | awk -f create_json.awk
}

get_metrices () {
    fname="metrices_info_"`date +"%F_%T.%3N"`
    kubectl top node |& tee ${fname}
    
    echo "" >> ${fname}
    echo "Retriving POD metrices: " >> ${fname}
    echo "" >> ${fname}
    kubectl top pod --all-namespaces >>  ${fname}

}

nodes_info
get_pods_info
get_metrices
