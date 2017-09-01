Skeleton Ansible Config
-----------------------

Sets up a webserver (based on ubuntu) with the following utilities provisioned:

- Node 7 (with PM2)
- Nginx
- Postgres
- Redis

To get up and running, the following changes are needed:

- Update `ansible.cfg` with the path to your SSH key
- Update `inventory/hosts` with the IP address/DNS for the server(s)

### Useful commands

Once ansible has run, the following commands can be used to manage the server:

```bash
# PM2
pm2 ls
pm2 logs
pm2 start <<appname>>
pm2 stop <<appname>>

# Nginx
sudo service nginx start 
sudo service nginx stop 
sudo service nginx restart 
less /var/log/nginx/error.log
less /var/log/nginx/access.log

# Postgres
sudo service postgresql start
sudo service postgresql stop
sudo service postgresql restart
psql <<databasename>>
less /var/log/postgresql/postgresql-9.5-main.log

# Redis
redis-cli flushall
redis-cli --scan
less /var/log/redis/redis-server.log
```
