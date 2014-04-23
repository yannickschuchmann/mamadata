# amadata server:
- Anbieter webtopia.com Logindaten bei Herr Kabel anfragen
-IP:62.141.45.55
## ssh/sftp
- login: micha 
- pw: *********

subdaomins werden bei all-incl verwaltet auch hier daten bei Herr Kabel anfragen

## backup sftp:
 Dort liegen taegliche backups der datenbank und der hochgeladenen fotos
- login: mamabackup
- pw: **********
- ChrootDirectory: /home/mamabackup

Das backup script selber liegt unter: /home/mamadata/backupdata.sh
der cronjob wurde mit crontab eingerichtet: 0 22 * * * /home/mamadata/backupdata.sh

## production server: mamadata.sharana.org
- Deployt wird mit capistrano und auf dem server laeuft passenger. User sollte immer micha und die groupe immer deployers sein!
- Deploy befehl: cap production deploy
- Deploy branch: ENV['tag']
- Directory: /home/mamadata/
- Datenbank: Siehe Rails Projekt
- Deployment script: Siehe Rails Projekt
- Apache config: /etc/apache2/sites-available/mamadata

## stagging server: mamastagging.sharana.org
- Deployt wird mit capistrano und auf dem server laeuft passenger. User sollte immer micha und die groupe immer deployers sein!
- Deploy befehl: cap staging deploy
- Deploy branch: devel
- Directory: /home/mamastagging/
- Datenbank: Siehe Rails Projekt
- Deployment script: Siehe Rails Projekt
- Apache config: /etc/apache2/sites-available/mamastagging
