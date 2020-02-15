cd /home
touch myscript1
nano skript1
#!/bin/bash
cd /home
# проверка существования файла
if [ -e $HOME/test_$(date +%d%m%y).txt ]
#вывод на экран что файл существует
echo "file exist"
then
echo "blablabla" > /home/test_$(date +%d%m%y).txt
fi

rsync -avz test_$(date +%d%m%y).txt root@84.201.166.77:/home
echo "file send"

nano script2
#!/bin/bash
find /home -type f -name "*.txt"-mtime +7 -exec rm -rf {} \;

crontab -e
0 0 * * * /myscript/myscript1
0 0 * * 0 /myscript/myscript2
