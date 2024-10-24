#!/bin/bash
# gh workflow list -R ULL-MII-SYTWS/ull-mii-sytws.github.io
# NAME                    STATE   ID      
# pages-build-deployment  active  16440203
# I want a bash script that returns the ID of the workflow 


REPOS=("ULL-ESIT-DMSI/ull-esit-dmsi.github.io" "ULL-ESIT-DMSI-2425/ull-esit-dmsi-2425.github.io")

for REPONAME in "${REPOS[@]}"; do
  echo 
  echo "REPO: $REPONAME"
  WORKFLOWID=$(gh workflow list -R $REPONAME | awk '{print $3}')
  # gh workflow view -R $REPONAME $WORKFLOWID | grep -v '^To see .*' | cat -
  gh workflow view -w -R $REPONAME $WORKFLOWID
done

