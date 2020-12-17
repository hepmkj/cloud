BEGIN {}
{
    cmd = "kubectl get po -n " $1 " " $2 " -o=json  | jq -c >> pods_info.json "
    if (NR > 1){
        print cmd 
        system(cmd)
    }
}
END {}
