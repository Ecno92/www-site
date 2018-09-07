#! /bin/bash

function check_environment_variables(){
    for var in DEPLOY_FTP_HOST DEPLOY_FTP_USER DEPLOY_FTP_TARGET_DIR OUTPUTDIR; do
        if [ -z "${!var}" ]; then
            echo "$var is not set"
            exit 1
        fi
    done
}

function deploy(){
    check_environment_variables
    lftp sftp://$(DEPLOY_FTP_USER)@$(DEPLOY_FTP_HOST) \
         -e "set sftp:auto-confirm yes; mirror -Re $(OUTPUTDIR) $(DEPLOY_FTP_TARGET_DIR) ; quit"
}

deploy