#!/bin/bash

# Verifica se os arquivos necessários foram passados como argumentos
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <caminho_para_o_arquivo_fota>"
    exit 1
fi

FOTA_PATH="$1"

# Verifica se os arquivos necessários existem
if [ ! -f "$FOTA_PATH/fota.zip" ] || [ ! -f "$FOTA_PATH/fota.md5" ] || [ ! -f "$FOTA_PATH/fota.zip.signature" ]; then
    echo "Erro: Um ou mais arquivos de atualização estão faltando no diretório fornecido."
    exit 1
fi

echo "Verificando conexão com o dispositivo..."
adb devices | grep "device$" > /dev/null
if [ $? -ne 0 ]; then
    echo "Nenhum dispositivo ADB encontrado. Conecte o dispositivo e tente novamente."
    exit 1
fi

echo "Criando diretório /data/ota/ no dispositivo..."
adb shell "mkdir -p /data/ota/"

echo "Enviando arquivos para o dispositivo..."
adb push "$FOTA_PATH/fota.zip" /data/ota/
adb push "$FOTA_PATH/fota.md5" /data/ota/
adb push "$FOTA_PATH/fota.zip.signature" /data/ota/

echo "Executando comandos de atualização..."
adb shell /sbin/prepareOTA.sh
adb shell fw_setenv ota_upgrade_status 2
adb shell sync
adb reboot

echo "Atualização iniciada com sucesso!"
