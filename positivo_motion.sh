#!/bin/bash
#instalador wifi da série positivo-motion
#Apesar de ser testando no i3464A ele funciona em todos os notebooks positivo da serie motion pelo fato da placa wifi ser a mesma.

running=$'1'
root=$'0'
ID=${UID}

repositories=(
              "deb http://httpredir.debian.org/debian/ stretch main contrib non-free"
              "deb http://ftp.br.debian.org/debian stretch main contrib non-free"
              "deb http://security.debian.org/ stretch/updates main contrib non-free"
              "deb http://ftp.br.debian.org/debian/ stretch-updates main contrib non-free"
             )

function adicionarRepositorio()
{
         case $ID in
              $root)
                    for (( x=0;x<4;x++ ));
                    do
                           echo "${repositories[$x]}" >> /etc/apt/sources.list
                    done

              return 0
              ;;
              *)
                    printf "\033[01;32m[!] O SCRIPT NECESSITA DE AUTORIZAÇÃO DO ROOT [!]\033[01;00m\n"
                    exit
              ;;
         esac
}

function instalarFirw()
{
         apt update && apt upgrade && apt-get install firmware-iwlwifi
}

adicionarRepositorio
instalarFirw
