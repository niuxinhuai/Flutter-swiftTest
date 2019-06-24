#  数据库加密配置
### DBConfig中配置 static let DB_ENCRYPTER = true/false(加密/不加密)
### DBFileUtil中配置static let BUNDLE_DB_NAME = grapes_180501.01/grapes_180501.02(加密 /不加密)

#  加密数据库生成
###前言：由于新项目中大量数据操作都和数据库有关，因此决定给数据库进行套壳加密，防止数据库被串改或者被有心人查看，对比再三决定使用免费的SQLCipher进行加密。
####本文是在作者使用mac终端生成加密数据库，使用方法以及踩过的坑都会在本文中一一说明
#### [SQLCipher 下载链接](https://github.com/sqlcipher/sqlcipher)
#### [SQLCipher 官方文档](https://www.zetetic.net/sqlcipher/sqlcipher-api/#attach)
#####SQLCipher下载成功之后放到桌面，打开终端，cd到当前目录下，执行
>1. 复制大法$ ./configure --enable-tempstore=yes CFLAGS="-DSQLITE_HAS_CODEC" \
LDFLAGS="-lcrypto"
>2.作者在执行这句话的时候遇到了一个问题（sqlite3.c:18280:10: fatal error: 'openssl/rand.h' file not found）如果您没有遇到可直接忽略
>3.对于出现（sqlite3.c:18280:10: fatal error: 'openssl/rand.h' file not found）的解决办法是继续在终端执行$ ./configure --enable-tempstore=yes CFLAGS="-DSQLITE_HAS_CODEC" \
LDFLAGS="/opt/local/lib/libcrypto.a"问题即可解决
>4.如果提示sqlcipher找不到，则需要更新 brew install sqlcipher
>5.make
#####以上过程走完，SQLCipher就配置好可以直接使用了，使用方法以官网教程为准，本文只做举例说明
#####前置工作，把需要加密的数据库原件放入到刚才下载的sqlcipher-master同一目录下，
####使用方法
>1.cd 到当前目录(sqlcipher-master目录)
>2.    ./sqlcipher plaintext.db(plaintext.db为你需要加密的数据库,出现警告不用管继续执行)
>3.sqlite> ATTACH DATABASE 'encrypted.db' AS encrypted KEY 'testkey';（加密密钥）
>4.sqlite> SELECT sqlcipher_export('encrypted');
>5.sqlite> DETACH DATABASE encrypted;
#####正常来说到这里数据库加密就已经完成了,生成的encrypted.db就是加密过后的db，可是作者在把加密后的db放入工程时发现，一直提示数据库已被加密，(已使用对应解密方法).原因无它。作者在此尝试修改已加密数据库的密码和cipher_page_size，最终解决该问题
#####解决方法
>1.$ ./sqlcipher encrypted.db(当前已经加密过的数据库)
>2.sqlite> PRAGMA key = 'testkey';(原始密码)
>3.sqlite> ATTACH DATABASE 'newdb.db' AS newdb KEY 'newkey';(修改密码，同时创建一个新的加密db)
>4.sqlite> PRAGMA newdb.cipher_page_size = 4096;(iOS端通用4096)
>5.sqlite> SELECT sqlcipher_export('newdb');
>6.sqlite> DETACH DATABASE newdb;

