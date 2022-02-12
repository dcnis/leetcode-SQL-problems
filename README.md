# LeetCode SQL-Problems

A collection of leetcode SQL problems for practising MySQL DB queries
# Cheat Sheet

## Spin up mysql in Docker

```
docker run --name training-mysqlv802 -e MYSQL_ROOT_PASSWORD=secret -d mysql:8.0.2
```

## Connect phpmyadmin to mysql db
```
docker run --name training-phpmyadmin-2 -d --link training-mysqlv802:db -p 8082:80 phpmyadmin/phpmyadmin
```
