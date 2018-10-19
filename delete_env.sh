#!/usr/bin/env bash

ENV=vopt
alias conda=${HOME}/anaconda3/bin/conda


while true; do
  [ $# -eq 0 ] && break
  case $1 in
      --env)
          shift
          ENV=$1
        shift; continue
        ;;
  esac
done

conda env remove --name ${ENV} --yes
