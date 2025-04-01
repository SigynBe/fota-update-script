# FOTA Update Script

Este repositório contém um script para facilitar a atualização FOTA (Firmware Over-The-Air) em dispositivos via ADB.

## Requisitos
Antes de usar o script, certifique-se de que possui os seguintes requisitos:
- **ADB (Android Debug Bridge)** instalado e configurado no seu computador
- **Conexão USB** entre o computador e o dispositivo
- **Depuração USB** ativada no dispositivo
- Arquivos de atualização **fota.zip**, **fota.md5** e **fota.zip.signature** na mesma pasta do script

## Instalação
1. Clone este repositório ou baixe o script manualmente:
   ```bash
   git clone git@github.com:SigynBe/fota-update-script.git
   cd fota-update-script
   ```

2. Dê permissão de execução ao script:
   ```bash
   chmod +x fota_update.sh
   ```

## Uso
Para executar o script e iniciar o processo de atualização, rode:
```bash
./fota_update.sh
```
O script irá:
1. Criar o diretório `/data/ota/` no dispositivo
2. Enviar os arquivos de atualização para o diretório
3. Executar o script de preparação OTA
4. Configurar a variável `ota_upgrade_status`
5. Sincronizar os dados
6. Reiniciar o dispositivo

## Exemplo de Saída
```bash
Starting FOTA update process...
Directory /data/ota/ created.
FOTA files transferred to the device.
prepareOTA.sh script executed.
Upgrade status set and synchronized.
Device is rebooting...
FOTA update process completed!
```

## Solução de Problemas
Se ocorrer algum erro:
- **"device not found"**: Certifique-se de que o dispositivo está conectado e com a depuração USB ativada.
- **Permissão negada ao executar o script**: Tente rodar `chmod +x fota_update.sh` e execute novamente.
- **Erro ao transferir arquivos**: Confirme que os arquivos `fota.zip`, `fota.md5` e `fota.zip.signature` estão na mesma pasta do script.

## Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

---
Caso tenha dúvidas ou precise de suporte, entre em contato! 🚀

