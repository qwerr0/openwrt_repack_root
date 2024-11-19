# 使用方法
1. 把sysupgrade文件和对应的备份档案(如etc.tar, usr.tar等)放在这个目录下面，然后按照顺序执行脚本。
2. 执行完成后会得到: 日期_时分秒-squashfs-nand-sysupgrade-mod.bin
3. 将该文件上传到路由器的 /tmp 目录下
4. sysupgrade -n -F 日期_时分秒-squashfs-nand-sysupgrade-mod.bin
5. 路由器会自动重启，使用 df -h /可以查看目录的空间情况

# QA
## 为什么刷了以后没变化?
可能是你的固件精简过度或是固件版本比你的更新，可以进入UBoot，然后刷入-squashfs-nand-sysupgrade.bin结尾的文件，然后在那个系统里更新。

## 上面说到的sysupgrade文件是什么?
下载固件的时候有两种，以sysupgrade.bin就是它。
QWRT-R24.02.24-ipq807x-generic-redmi_ax6-squashfs-nand-factory.bin
QWRT-R24.05.14-ipq807x-generic-redmi_ax6-squashfs-nand-sysupgrade.bin <= 这个文件

## 上面说到的备份档案(如etc.tar, usr.tar等)如何备份?
进入路由器Shell，然后
```
cd /
tar -cvf /tmp/bin.tar bin
# 下载 bin.tar
rm /tmp/bin.tar
tar -cvf /tmp/etc.tar etc
# 下载 etc.tar
rm /tmp/etc.tar
...
```
最好是一个一个地下载，因为/tmp目录容量是有限的，容易塞满。

## 我需要备份哪些文件夹?
对于红米AX6, 需要备份的有 bin data etc ini lib root sawf sbin usr www
当然是可以根据自己需要来备份的，比如你只需要更新root，那只备份root就好。

## root档案更新后的信息是怎么样的?
`
./sysupgrade-redmi_ax6/root: Squashfs filesystem, little endian, version 4.0, xz compressed, 58919450 bytes, 5382 inodes, blocksize: 262144 bytes, created: Tue May 14 12:52:11 2024
`
如果你的root档案的blocksize和压缩方式不一样，请自行修改一下mksquashfs脚本。
