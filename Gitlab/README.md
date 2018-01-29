# Gitlab

## Omnibus


### Backup

- **Pre**

```bash
mkdir /var/opt/gitlab/backups
chown git /var/opt/gitlab/backups
chmod 700 /var/opt/gitlab/backups
```

- **Backup**

```bash
gitlab-rake gitlab:backup:create
```

### Upgrade

```bash
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
sudo apt-get install gitlab-ee
```

##### Get service status

```bash
gitlab-ctl status
```

-----

##### Starting and stopping

```bash
# Start all GitLab components
sudo gitlab-ctl start

# Stop all GitLab components
sudo gitlab-ctl stop

# Restart all GitLab components
sudo gitlab-ctl restart
```

##### Invoking Rake tasks

```bash
sudo gitlab-rake gitlab:check
sudo gitlab-ci-rake -T
```


### Gmail Config



```bash
$
vim /etc/gitlab/gitlab.rb

+++
gitlab_rails['gitlab_email_from'] = 'MAIL@gmail.com'
gitlab_rails['gitlab_email_reply_to'] = 'MAIL@gmail.com'
gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "smtp.gmail.com"
gitlab_rails['smtp_port'] = 587
gitlab_rails['smtp_user_name'] = "MAIL@gmail.com"
gitlab_rails['smtp_password'] = "PASS"
gitlab_rails['smtp_domain'] = "gmail.com"
gitlab_rails['smtp_authentication'] = :login
gitlab_rails['smtp_enable_starttls_auto'] = true
gitlab_rails['smtp_tls'] = false
gitlab_rails['smtp_openssl_verify_mode'] = 'peer'

$
sudo gitlab-ctl reconfigure

```




### Install

```bash
$
sudo apt-get update
sudo apt-get install -y vim
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y openssh-server
sudo apt-get install -y ca-certificates
debconf-set-selections <<< "postfix postfix/mailname string 'debian'"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
sudo apt-get install -y postfix
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo apt-get install -y gitlab-ce
sudo gitlab-ctl reconfigure

# Username: root
# Password: 5iveL!fe
```

### Change Host

```bash
$
sudo vim /etc/gitlab/gitlab.rb

+++
external_url 'http://192.168.0.0'

sudo gitlab-ctl reconfigure
sudo gitlab-ctl restart
```

### Reset Pass

```bash
$ sudo gitlab-rails console
> u = User.where(id: 1).first
> u.password = 'secret_pass'
> u.password_confirmation = 'secret_pass'
> u.save!
```
