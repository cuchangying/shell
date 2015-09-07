/*************************************************************************
    > File Name: create_directories.sh
    > Author: ma6174
    > Mail: ma6174@163.com 
    > Created Time: 一  8/17 21:24:59 2015
    xargs:前一个命令执行的结果
    seq：seq -f 'dir%03g' 1 10 | xargs mkdir 生成：dir001~dir010
    seq的作用就是快速生成一堆数字
 ************************************************************************/
 for i in `seq 0 255`
 do 
	 printf "%02x\n" $i | xargs mkdir $1
	 for j in `seq 0 255`
	 do 
		 printf "%02x/%02x\n" $i $j | xargs mkdir $1
	 done
 done

