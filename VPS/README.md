# VPS


- ENABLED - cPHulk Brute Force Protection
- CHECK   - cPanel Security Advisor

--------------------------------------------------------------------------------

## Install Letsencrypt

https://github.com/Prajithp/letsencrypt-cpanel

- in server execute

```bash
/scripts/install_lets_encrypt_autossl_provider
```

--------------------------------------------------------------------------------

### Change Index.html

- in WHM go to:
- Account Functions >> Web Template Editor

### Change ssh login message

```bash
vim /etc/motd
```

```bash
##########################################################################
WARNING:  Unauthorized access to this system is forbidden and will be
prosecuted by law. By accessing this system, you agree that your actions
may be monitored if unauthorized usage is suspected.
Disconnect IMMEDIATELY if you are not an authorized user!
##########################################################################
```

--------------------------------------------------------------------------------

# WHM Security


### Disable Copiler Access

- Home >> Security Center >> Compiler Access
- DISABLE

### Shell Fork Bomb Protection

- Home >> Security Center >> Shell Fork Bomb Protection
- Enable Proteccion

### Background Process Killer

- Home >> System Health >> Background Process Killer.
- Check ALL

### SMTP Restrictions

- Home >> Security Center >> SMTP Restrictions


### Tweak Settings

- Prevent “nobody” from sending mail  -> ON
- Track email origin via X-Source email headers -> ON


#### Tweak Security

- **WHM –> Server setup –> Tweak Security:**
- Enable  - open_basedir protection
- Disable - Compilers for all accounts(except root)
- Enable  - Shell Bomb/memory Protection
- Enable  - cPHulk Brute Force Protection


#### Account Functions

- **WHM –> Account Functions:**
- Disable cPanel Demo Mode
- Disable shell access for all accounts(except root)


#### FTP Configuration:

- **WHM –> Service Configuration –> FTP Configuration:**
- ****Disable**** anonymous FTP access

#### MySQL

- **WHM –> MySQL:**
- Set some MySQL password(Don’t set the same password like for the root access)

#### PHP and SuExec Configuration

- **WHM –> Service Configuration –> Apache Configuration –> PHP and SuExec Configuration**
- Enable suEXEC – suEXEC = On
When PHP runs as an Apache Module it executes as the user/group of the
webserver which is usually “nobody” or “apache”. suEXEC changes this so
scripts are run as a CGI. Than means scripts are executed as the user
that created them. With suEXEC script permissions can’t be set to
777(read/write/execute at user/group/world level)




--------------------------------------------------------------------------------

# Maintenance

### Find large files
```bash
find . -type f -exec du -Sh {} + | sort -rh | head -n 50
```

###  Apache error log

```
tail -n20 /usr/local/apache/logs/error_log | awk '/error/{system("");printf "\r%s", $0}'

tail -n50 /usr/local/apache/logs/access_log



# View ram use
ps -e -o pid,vsz,comm= | sort -n -k 2



# IP
grep -E -o '([0-9]{1,3}[\.]){3}[0-9]{1,3}' /usr/local/cpanel/logs/login_log  | sort | uniq



# View Brute Force
grep "brute force attempt" /usr/local/cpanel/logs/login_log  | tail -n 20



# View errors Apache
grep "error" /usr/local/apache/logs/error_log | tail -n 20
grep "error" /usr/local/cpanel/logs/login_log | tail -n 20
```

--------------------------------------------------------------------------------

# Clamd

### Update database

```bash
/usr/bin/freshclam  
```

### Restart Service

```bash
/usr/local/cpanel/scripts/restartsrv_clamd   
```
