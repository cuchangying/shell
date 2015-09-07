# 想要只替换字符串：echo '222' |sed "s/2/3/g"
# 想要替换文件字符串（只输出，实际文件没有改变）：sed "s/done/fuck/g" create_directories.sh
# 想要就地修改到文件（加-i）：sed －i "s/done/fuck/g" create_directories.sh
# ``内的命令先执行，替换所在的位置，再被shell执行
# $1代表第一个参数；
if [ $# -lt 3 ] 
    then
        echo usage:./rename_version.sh dir 2.0.1 2.0.2
        exit
fi
for i in `ls $1`; do mv -f $1/$i `echo $1/$i | sed 's/'$2'/'$3'/'`; done
