#!/bin/bash

# 获取版本库名称
echo "Please enter the name of new SVN Repository:"
read RepoName

# 创建版本库目录
cd /svn/
sudo mkdir $RepoName

# 创建版本库
sudo svnadmin create /svn/$RepoName/

# 输入用户名密码
echo "Please enter the username of SVN Repository's Administrator:"
read UserName

echo "Please enter the password of Administrator:"
read PassWord

# 更改配置文件
cd /svn/$RepoName/conf

sudo echo "[general]"             >svnserve.conf
sudo echo "anon-access = none"   >>svnserve.conf
sudo echo "auth-access = write"  >> svnserve.conf
sudo echo "password-db = passwd" >> svnserve.conf
sudo echo "authz-db = authz"     >> svnserve.conf

sudo echo "[groups]"              > authz
sudo echo "admin = $UserName"    >> authz
sudo echo "[/]"                  >> authz
sudo echo "@admin = rw"          >> authz
sudo echo "[$RepoName:/]"        >> authz
sudo echo "@admin = rw"          >> authz

sudo echo "[users]"                  > passwd
sudo echo "$UserName = $PassWord"   >> passwd

# 创建脚本，允许SVN客户端修改已提交版本的日志
cd ../hooks/

sudo echo "#!/bin/sh"     > pre-revprop-change
#sudo echo "exit 0;"      >> pre-revprop-change # 这句可能有问题

sudo chmod +x pre-revprop-change

# 重启服务
sudo service svnserve stop
sudo service svnserve start

