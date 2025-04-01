#!/bin/bash

echo "Iniciando processo de atualização FOTA..."

adb shell "mkdir -p /data/ota/"
echo "Diretório /data/ota/ criado."

adb push fota.zip /data/ota/
adb push fota.md5 /data/ota/
adb push fota.zip.signature /data/ota/
echo "Arquivos FOTA enviados para o dispositivo."

adb shell /sbin/prepareOTA.sh
echo "Script prepareOTA.sh executado."

adb shell fw_setenv ota_upgrade_status 2
adb shell sync
echo "Status de atualização configurado e sincronizado."

adb reboot
echo "Dispositivo reiniciando..."

echo "Processo de atualização FOTA concluído!"
