#!/usr/bin/env bash

ENV=vopt


##############################################################################
# Anaconda channel cleaning
##############################################################################
if [[ $($HOME/anaconda3/bin/conda config --get channels) ]]; then
    $HOME/anaconda3/bin/conda config --remove-key channels;
fi
$HOME/anaconda3/bin/conda config --append channels default --append channels conda-forge


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
  $HOME/anaconda3/bin/conda config --remove pkgs_dirs ~/anaconda3/pkgs
  $HOME/anaconda3/bin/conda config --prepend pkgs_dirs ./pkgs
  echo $($HOME/anaconda3/bin/conda config --show pkgs_dirs)
fi

echo "Creating conda environment..."
$HOME/anaconda3/bin/conda create --name ${ENV} --yes python=3.6 ${OFFLINE}

if [ ! -z "$OFFLINE" ]; then
  echo "Clean conda cache..."
  rm -Rf `ls -1 -d ./pkgs/*/`

  echo "Recover conda config..."
  $HOME/anaconda3/bin/conda config --remove pkgs_dirs ./pkgs
  $HOME/anaconda3/bin/conda config --prepend pkgs_dirs ~/anaconda3/pkgs
  echo $($HOME/anaconda3/bin/conda config --show pkgs_dirs)
fi
