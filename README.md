Nerdtree  
https://github.com/preservim/nerdtree

下载压缩包后，将所有文件放到下面目录(解压后的文件 不是目录)
~/.vim/
~/.vim/nerdtree-master\>mv * ../

cscope：
https://sourceforge.net/projects/cscope/

./configure
Make 编译会失败
进入src输入再编译：
 -Wl,--copy-dt-needed-entries  -lncurses -lfl

cscope -Rbq
ctags -R .

Taglist
https://www.vim.org/scripts/script.php?script_id=273
taglist_46.zip


Tags
https://github.com/universal-ctags/ctags-nightly-build/tags

uctags-2025.01.03-1-x86_64.pkg.tar.xz



export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export HISTCONTROL=ignoredups:erasedups


https://ctrlpvim.github.io/ctrlp.vim/#installation
ctrlpvim-ctrlp.vim-1.81-50-g475a864.zip
解压后直接放到~/.vim/目录下


配置完成后需要修改
~/.bashrc的末尾添加如下内容，然后source ~/.bashrc
CSCOPE_DB=/
TAG_DB=/
![image](https://github.com/user-attachments/assets/cec1fa11-e400-4d01-b1e8-2ea7f7ab6ec8)
