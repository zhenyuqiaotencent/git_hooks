# 提交规范

在开发过程中，每次提交代码，都需要写Commit message（提交说明），规范的Commit message有很多好处：

方便快速浏览查找，回溯之前的工作内容
可以直接从commit 生成Change log(发布时用于说明版本差异)

目前我们并没有对commit message进行规范，造成以下麻烦：

每个人风格不同，格式凌乱，查看很不方便
部分commit没有填写message，事后难以得知对应修改的作用

规范Commit message不仅能解决上述问题，而且基本没有副作用和学习成本

基于目前的现状，指定的统一规范 commitType:commit subject 

# commitType包含一些类型
* feat:新增加的功能
* fix：解决的bug
* docs:更新了文档
* chore：构建代码，例如makefile,配置等
* style：修改的代码问题
* refactor：代码重构
* test:测试代码
* other：其他

commit Subject:对变更内容的描述

示例： feat:添加支持xx银行定投需求

# 脚本原理
脚本基于git的global hook，对每一个commit的message进行判断，如果不满足约定的规范，会阻止代码提交

# 脚本安装
### Mac下
直接执行 curl -kSL https://raw.githubusercontent.com/zhenyuqiaotencent/git_hooks/main/install.sh | sh
针对历史存量的本地仓库，需要在每个仓库下重新执行“git init”才能让脚本生效

### Windows下
由于windows的cmd默认不支持执行shell脚本，可以在任意路径打开Git Bash Here,在
里面执行 curl -kSL https://raw.githubusercontent.com/zhenyuqiaotencent/git_hooks/main/install.sh | sh
针对历史存量的本地仓库，需要在每个仓库下重新执行“git init”才能让脚本生效

### 环境条件
window下需要手动下载安装curl，地址 https://curl.se/windows/ 

使用过程有任何问题，可联系zhenyuqiao
 
