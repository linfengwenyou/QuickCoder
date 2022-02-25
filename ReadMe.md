快速生成代码块Setter & getter，提高Coding 速度

调试请在项目中调试，调试无碍后将文件拷贝到外层即可



## 使用方案
1. 将`main`文件拖动出来，然后改名为`QuickCoder`
2. 打开文件注释第一行,标记为使用脚本方式

`#!/usr/bin/env xcrun swift`

3. 修改文件尾可执行命令

`chmod +x QuickCoder.swift`



4. 将文件添加到指定路径，创建全局操作方案

5. 添加全局命令操作

```
open .zshrc
➜  ~ pwd
/Users/rayor


# 添加配置如下
alias qc='swift ~/bash/QuickCoder.swift'

source ~/.zshrc

# 测试代码
qc b myButton
```

