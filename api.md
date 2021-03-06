# API接口

## 1. 初始化接口 
`InitSkinPage`
> 此接口函数用于初始化nsNiuniuSkin.dll控件的配置信息.
### 调用示例：
```nsh
nsNiuniuSkin::InitSkinPage "$PLUGINSDIR\" "${INSTALL_LICENCE_FILENAME}"
```
### 参数说明：
| 参数序号 | 参数类型 | 参数说明               | 备注                                                          |
|------|------|--------------------|-------------------------------------------------------------|
| 1    | 字符串  | 用于指定NSIS安装包的插件释放路径 | 此路径的指定非常重要，在脚本中指定的插件以及UI资源包将会释放至此目录下，只有正确指定后，界面控件才能调用资源显示窗口 |
| 2    | 字符串  | 许可协议的文件名           | 这是一个txt文档，在界面控件加载时，将会加载此文件来显示许可协议                           |



## 2. 设置安装包标题
`SetWindowTile`
> 此接口函数用于指定安装包的标题。
### 调用示例：
```nsh
nsNiuniuSkin::SetWindowTile $hInstallDlg "${PRODUCT_NAME}安装程序"
```

### 参数说明：
| 参数序号 | 参数类型 | 参数说明           | 备注                        |
|------|------|----------------|---------------------------|
| 1    | 整型   | 用于指定要设置标题的窗口句柄 | 调用init时返回  （可传递子窗口弹窗口的句柄） |
| 2    | 字符串  | 用于指定安装包的标题     |                           |


## 3. 设置当前显示的TAB页
`ShowPageItem`
> 此接口函数用于设置当前显示的TAB页
### 调用示例：
```nsh
nsNiuniuSkin::ShowPageItem $hInstallDlg  "wizardTab" ${INSTALL_PAGE_CONFIG}
```

### 参数说明：
| 参数序号 | 参数类型 | 参数说明                     | 备注                                         |
|----------|----------|------------------------------|----------------------------------------------|
| 1        | 整型     | 用于指定要设置标题的窗口句柄 | 调用init时返回  （可传递子窗口弹窗口的句柄） |
| 2        | 字符串   | 指定的TAB控件的name          |                                              |
| 3        | int      | 需要显示的tab页序号          | 以0为初始值                                  |


## 4. 路径选择相关接口
### 4.1 通知接口来浏览安装路径
`SelectInstallDir`
```nsh
nsNiuniuSkin::SelectInstallDir
Pop $0
```

> 通知界面控件来浏览安装路径，并且将路径获取到变量中。再调用此接口后，应该再调用SetControlAttribute接口来将安装的路径设置到控件界面上。


## 5. 显示界面控件
```nsh
nsNiuniuSkin::ShowPage 0
```
> 当界面绑定事件完成后，通过此接口来调用显示控件，此接口将会阻塞运行。

### 参数说明：
| 参数序号 | 参数类型 | 参数说明                       | 备注                  |
|----------|----------|--------------------------------|-----------------------|
| 1        | 整型     | 用于指定显示前要回调的NSIS函数 | 如果为0，则表示不回调 |


## 6. 弹出提示框接口

### 6.1 以下代码用于初始化子窗口弹窗，同时返回其句柄：
```nsh
nsNiuniuSkin::InitSkinSubPage "msgBox.xml" "btnOK" "btnCancel,btnClose"
pop $hInstallSubDlg
```

#### 参数说明：
| 参数序号 | 参数类型 | 参数说明                                   | 备注                                                         |
|----------|----------|--------------------------------------------|--------------------------------------------------------------|
| 1        | 字符串   | 指定弹窗要用到的UI配置xml文件              |                                                              |
| 2        | 字符串   | 指定点击后弹窗退出时返回IDOK的按钮ID号     | 如果使用BindCallBack绑定了此按钮回调的NSIS函数，则此设置失效 |
| 3        | 字符串   | 指定点击后弹窗退出时返回IDCANCEL的按钮ID号 | 如果使用BindCallBack绑定了此按钮回调的NSIS函数，则此设置失效 |


### 6.2 以下代码用于根据弹窗窗口的句柄设置其UI控件的属性，控制显示变化：
```nsh
nsNiuniuSkin::SetControlAttribute $hInstallSubDlg "lblTitle" "text" "提示"
```

### 6.3 以下代码将弹窗显示出来：
```nsh
nsNiuniuSkin::ShowSkinSubPage 0
```

### 参数说明：
| 参数序号 | 参数类型 | 参数说明                           | 备注                |
|----------|----------|------------------------------------|---------------------|
| 1        | 整型     | 指定显示弹窗前要回调的NSIS函数地址 | 如果为0表示不回调； |


## 7. 指定界面上指定控件的属性
```nsh
nsNiuniuSkin::SetControlAttribute $hInstallDlg "btnClose" "enabled" "false"
nsNiuniuSkin::SetControlAttribute $hInstallDlg "lblInstalling" "text" "正在卸载..."
```
> 此接口用于指定界面的指定元素的指定属性，比如：是否可用、是否可见、是否选中、文字、背景图等等

### 参数说明：
| 参数序号 | 参数类型 | 参数说明                     | 备注                                         |
|----------|----------|------------------------------|----------------------------------------------|
| 1        | 整型     | 用于指定要设置标题的窗口句柄 | 调用init时返回  （可传递子窗口弹窗口的句柄） |
| 2        | 字符串   | 控件的name                   |                                              |
| 3        | 字符串   | 控件的属性名                 |                                              |
| 4        | 字符串   | 控件的属性值                 |                                              |

> 注：
可以通过此接口设置所有的通用属性；一般可以利用此接口来设置指定控件的文本、是否可用、是否可见、位置、大小 、背景图、文本颜色等；比如可以用于设置复选框是否选中等等。



## 8. 获取控件的通用属性
```nsh
nsNiuniuSkin::GetControlAttribute $hInstallDlg "editDir" "text" 
Pop $2
```
> 此接口用于获取界面的指定元素的指定属性，比如：是否可用、是否可见，文本等等

### 参数说明：
| 参数序号 | 参数类型 | 参数说明                     | 备注                                         |
|----------|----------|------------------------------|----------------------------------------------|
| 1        | 整型     | 用于指定要设置标题的窗口句柄 | 调用init时返回  （可传递子窗口弹窗口的句柄） |
| 2        | 字符串   | 控件的name                   |                                              |
| 3        | 字符串   | 控件的属性名                 |                                              |


## 9. 绑定UI上控件的相关事件
```nsh
GetFunctionAddress $0 OnExitDUISetup
nsNiuniuSkin::BindCallBack $hInstallDlg "btnClose" $0
```
> 此接口用于绑定一个按钮点击的回调函数或一个RichEdit控件的文字变化时的回调函数。

### 参数说明：
| 参数序号 | 参数类型 | 参数说明                         | 备注                                                                       |
|----------|----------|----------------------------------|----------------------------------------------------------------------------|
| 1        | 整型     | 用于指定要设置标题的窗口句柄     | 调用init时返回  （可传递子窗口弹窗口的句柄）                               |
| 2        | 字符串   | UI界面中按钮或richedit控件的name |                                                                            |
| 3        | LONG     | 要绑定的NSIS函数的地址           | 当指定名称的按钮被点击或者指定的richedit的内容变化时，绑定的函数将会被触发 |

> 注：
>> 1). 当绑定的控件是一个RichEdit控件时，其中的文本内容变化时就会触发绑定的函数；可以通过绑定路径的控件，同时在绑定的函数中获取路径，做否合法的判断。

>> 2). 为了能够将通过Ctrl+F4关闭窗口，以及通过在任务栏关闭窗口的事件通知到NSIS中，此处需要绑定一个特殊的名称，这个特殊的名称是：syscommandclose


## 10. 结束安装
```nsh
nsNiuniuSkin::ExitDUISetup
```
> 此接口被调用时，将会退出安装进程

## 11. 字符串处理辅助接口
```nsh
nsNiuniuSkin::StringHelper "c:\test\test\" "\" "" "trimright"; 如果源字符串的最后一个字符是\，则将其去掉
pop $0

nsNiuniuSkin::StringHelper "c:\AAA\dst" "AAA" "bbb" "replace"   ;将源码中的AAA替换成bbb
pop $0

nsNiuniuSkin::StringHelper "c:\AAA\dst" "\" "" " getrightbychar "   ;将源码中的以\分隔的最后一段返回，此例中返回dst
pop $0
```
> 这是一个为了简化在NSIS脚本中的字符串处理而提供的辅助函数，有需要者可以使用。

### 参数说明：

| 参数序号 | 参数类型 | 参数说明                                       | 备注                    |
|----------|----------|------------------------------------------------|-------------------------|
| 1        | 字符串   | 等待处理的字符串                               |                         |
| 2        | 字符串   | 指定在源码处理时，需要用来进行辅助查询的参数值 |                         |
| 3        | 字符串   | 要被替换成的目标字符串                         | 仅当指令为replace时有效 |
| 4        | 字符串   | 用于指定要对字符串处理的操作类型               |   replace：在源串中将第二个参数的值替换成第三个参数的值，再返回 trimright：将源串中的最后一个字符去掉（如果等于第二个参数）getrightbychar:从源串中，取根据第二个参数分割的最后一段值   |


## 12. 其他信息

### 具体的NSIS脚本及DUILIB的配置文件可以参看DEMO，有如下几个注意事项：
- 1). DUILIB资源必需打包成zip压缩包，且名称必需是skin.zip

- 2). 在NSIS脚本中，安装与卸载界面中按如下方式指定：
 
  -  此处将插件释放目录指定为duilib资源包及许可协议文件的释放路径。

- 3). 在实际的安装过程中，为了让进度信息尽可能准确，采用的是7z解压的方式
  -  这就要求在制作安装包之前，需要将要安装的文件打包成一个7z 的压缩包，再在NSIS中指定安装
 
  -  在NSIS中，有相关的7z插件来解压，这里需要在线程中调用，以免界面卡住
 
- 4). 目前提供的示例仅包含了常见的与UI界面相关的NSIS脚本；需要进一步的处理特定的注册表写入、文件备份等操作，需要自行另外再写NSIS脚本。

- 5). 界面的安装过程中的图片支持轮播，并且可以设置间隔时间，在XML中的写法如下

 
