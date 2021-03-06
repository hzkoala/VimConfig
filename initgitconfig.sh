#!/bin/sh
 
# 全局提交用户名与邮箱
git config --global user.name "HanZheng"
git config --global user.email "hzkoala@gmail.com"
 
# 中文编码支持
echo "export LESSCHARSET=utf-8" > $HOME/.profile
git config --global gui.encoding utf-8
git config --global i18n.commitencoding utf-8
git config --global i18n.logoutputencoding utf-8
 
# 全局编辑器，提交时将COMMIT_EDITMSG编码转换成UTF-8可避免乱码
#git config --global core.editor vim
 
# 差异工具配置
#git config --global diff.external git-diff-wrapper.sh
#git config --global diff.tool tortoise
#git config --global difftool.tortoise.cmd 'TortoiseMerge -base:"$LOCAL" -theirs:"$REMOTE"'
#git config --global difftool.prompt false
 
# 合并工具配置
#git config --global merge.tool tortoise
#git config --global mergetool.tortoise.cmd 'TortoiseMerge -base:"$BASE" -theirs:"$REMOTE" -mine:"$LOCAL" -merged:"$MERGED"'
#git config --global mergetool.prompt false
 
# 别名设置
#git config --global alias.dt difftool
#git config --global alias.mt mergetool
 
# 取消 $ git gui 的中文界面，改用英文界面更易懂
#if [ -f "/share/git-gui/lib/msgs/zh_cn.msg" ]; then
#rm /share/git-gui/lib/msgs/zh_cn.msg
#fi

