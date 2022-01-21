 oc get routes

oc extract secret/mycluster-mex01-b3c-4x16-18f5cff1396700a3eb11f3582dee8624-0000 --to=./ -n openshift-ingress

oc create route edge --service reversenginx --key ./tls.key --cert ./tls.crt

