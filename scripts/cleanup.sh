#!/bin/bash

# delete helm releases
helm uninstall argocd --namespace argo-cd
helm uninstall cert-manager --namespace cert-manager
helm uninstall external-dns --namespace external-dns
helm uninstall nginx-ingress --namespace nginx-ingress


# delete argocd related crds
kubectl delete crd applications.argoproj.io \
                   applicationsets.argoproj.io \
                   appprojects.argoproj.io \

# delete cert manager related crds
kubectl delete crd certificates.cert-manager.io \
                     challenges.acme.cert-manager.io \
                     clusterissuers.cert-manager.io \
                     issuers.cert-manager.io \
                     orders.acme.cert-manager.io \
                     certificaterequests.cert-manager.io \

# optional delete namespaces if no longer needed
kubectl delete namespace argocd
kubectl delete namespace cert-manager
kubectl delete namespace external-dns
kubectl delete namespace nginx-ingress

