#!/usr/bin/env bash

##############################################################################
# Anaconda channel cleaning
##############################################################################
if [[ $(conda config --get channels) ]]; then
    conda config --remove-key channels;
fi
conda config --append channels anaconda --append channels conda-forge


ENV=vopt

if [[ "$#" -eq "0" ]]; then
  OFFLINE=""
  echo "Set online install mode."
else
  while true; do
      [ $# -eq 0 ] && break
      case $1 in
          --offline)
              shift
              OFFLINE="--offline"
              echo "Set offline install mode."
            shift; continue
            ;;
          --env)
              shift
              ENV=$1
            shift; continue
            ;;
      esac
  done
fi

if [ ! -z "$OFFLINE" ]; then
  echo "Change conda config..."
  conda config --remove pkgs_dirs ~/anaconda3/pkgs
  conda config --prepend pkgs_dirs ./pkgs
  echo $(conda config --show pkgs_dirs)
fi

echo "Creating conda environment..."
conda create --name ${ENV} --yes python=3.6 ${OFFLINE}

if [ ! -z "$OFFLINE" ]; then
  echo "Clean conda cache..."
  rm -Rf `ls -1 -d ./pkgs/*/`

  echo "Recover conda config..."
  conda config --remove pkgs_dirs ./pkgs
  conda config --prepend pkgs_dirs ~/anaconda3/pkgs
  echo $(conda config --show pkgs_dirs)
fi
