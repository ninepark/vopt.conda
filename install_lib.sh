#!/usr/bin/env bash

case `uname` in

    Linux)
        if type lsb_release >/dev/null 2>&1; then
            OS=$(lsb_release -si)
            VER=$(lsb_release -sr)
            if [ "$OS" == "Ubuntu" ] && [ "$VER" == "16.04" ]; then
                /bin/bash install_lib_ubuntu.sh
            else
                echo "Error! Support Ubuntu only."
                return
            fi
        else
            echo "Error! Cannot find linux version."
            return
        fi
        ;;

    Darwin)
        echo "Mac OS X."
        return
        ;;

    *)
        echo "Error! Unsupported OS."
        return
        ;;

esac
