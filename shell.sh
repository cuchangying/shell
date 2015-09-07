#搜索文件的内容：grep -r hello .
#搜索文件和目录的名称：sudo find . -name rename_version.sh 注意：如果要用正则表达式需要引号包起来！
#递归的创建目录：mkdir -p /var/log/openresty/www/
#导入sql文件到数据库：mysql -h 127.0.0.1 -P 3306 -uusername -ppassword -D test_db <mass.sql
#管道｜：前一个命令的结果是后一个命令的输入 xargs代表比较复杂的参数（姑且先这么理解吧）
#函数定义：
#exec_sql()
# {
#	
# }
# 
# 定义变量：n=123 Note:＝附近不能有空格！
# date:Note:注意mac和liunx上面date的使用方法差别很大
# 
# awk:分列处理数据 ：last -5 |awk '{print $1}'
# awk -F'[\t]'表示以\t做分隔符
# 
# grep -r ^test ../ci3 匹配的是正则，就是以test开始的行
# grep ^sogou shell/tmp/$1| awk -F'[\t]' '{print $2}' >> static/sogouopen/$1.xml;
# 
# #!/bin/bash

exec_sql()
{
    mysql -h  -P 3306 -uxxx -pxxxx -D xxx -e "$1" |awk 'FNR>1'
}

IDATE=`date --date="today -7days" +"%s"`
LOCATION_SQL="select id, category_id from supplies where status = 1 and created_time > $IDATE order by created_time desc;" 
exec_sql "$LOCATION_SQL" > supplies.txt 

