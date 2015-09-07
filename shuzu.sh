#!/bin/bash
# ${var}基本上等价于$var
# 第一个严谨一些，第二个：
# 比如$1...$9这个没区别，但是$10呢，${var}的这种就是${10}
# 而$var却是$10是$1后边带个0。防歧义！

init() {
    tables_queue="
    location
    product
    bank_list
    location
    app_geo
    app_used_time
    "
    fidb_tables_queue="
    "
}

execute() {
    sql_refer=$1
    srchost=$2
    dsthost=$3
    srcdb=$4
    dstdb=$5
    table="${sql_refer}"
    fsql="${table}.sql"
    echo "sync $table starts..."

    mysqldump -h $srchost -P 3306 -u -p $srcdb $table > $fsql
    mysql -h $dsthost -P 3306 -u -p $dstdb < $fsql 
    rm $fsql -f

    if [ $? != 0 ]
    then
        day=`date --date="now" +"%Y-%m-%d %H:%M:%S"`
        echo "$day $table error!" >> "$log/sync_day.log"
        exit -1
    fi
}

main() {
    init
    for table in $tables_queue
    do
        execute $table $ip_ocean $ip_ocean ymt360 ymtdw 
    done

    for table in $fidb_tables_queue
    do
       execute $table $ip_fidb $ip_ocean ymtpay ymtdw
    done

    exit 0
}

main

