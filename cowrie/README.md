# Cowrie Container

Create Cowrie container:

```bash
docker run -d --name cowrie -p 2222:2222 -v cowrie-etc:/cowrie/cowrie-git/etc -v cowrie-var:/cowrie/cowrie-git/var cowrie/cowrie:latest
```

Store log to Database:

```bash
docker-compose up --build -d
```

Access your database:

```bash
docker exec -it mysql-cowrie mysql -u cowrie -p
```

**NB: default password is: cowri3_king.**

```sql
use cowrie;
show tables;
```

Then create table from [this](docker/cowrie.sql).

The table should look like this.

```sql
mysql> show tables;
+------------------+
| Tables_in_cowrie |
+------------------+
| auth             |
| clients          |
| downloads        |
| input            |
| ipforwards       |
| ipforwardsdata   |
| keyfingerprints  |
| params           |
| sensors          |
| sessions         |
| ttylog           |
+------------------+
11 rows in set (0.00 sec)
```

Lastly, navigate to `/var/lib/docker/volumes/cowrie-etc/_data`, then update `cowrie.cfg.dist`. Search for MySQL.

```sh
[output_mysql]
enabled = true
host = <database-ip>
database = cowrie
username = cowrie
password = cowri3_king
port = 3306
debug = true
```