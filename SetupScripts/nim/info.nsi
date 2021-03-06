# ====================== 自定义宏 产品信息==============================
!define PRODUCT_NAME           		"网易云信"
!define PRODUCT_PATHNAME 			"NIM_PC"  # 安装卸载项用到的KEY
!define INSTALL_APPEND_PATH         "NIM"	  # 安装路径追加的名称 
!define INSTALL_DEFALT_SETUPPATH    ""       # 默认生成的安装路径
!define EXE_NAME               		"cloudmusic.exe" # 指定主运行程序，快捷方式也是用此程序生成
!define PRODUCT_VERSION        		"2.5.0.0"
!define PRODUCT_PUBLISHER      		"网易公司"
!define PRODUCT_LEGAL          		"${PRODUCT_PUBLISHER} Copyright（c）2019"
!define INSTALL_OUTPUT_NAME    		"${PRODUCT_NAME}_v${PRODUCT_VERSION}.exe"

# ====================== 自定义宏 安装信息==============================
!define INSTALL_7Z_PATH 	   		"..\app.7z"
!define INSTALL_7Z_NAME 	   		"app.7z"
!define INSTALL_RES_PATH       		"skin.zip"
;!define INSTALL_LICENCE_FILENAME    "license.txt"
!define INSTALL_LICENCE_FILENAME    "licence.rtf"
!define INSTALL_ICO 				"logo.ico"


!include "ui.nsh"

# ==================== NSIS属性 ================================

# 针对Vista和win7 的UAC进行权限请求.
# RequestExecutionLevel none|user|highest|admin
RequestExecutionLevel admin

#SetCompressor zlib

; 安装包名字.
Name "${PRODUCT_NAME}"

# 安装程序文件名.

OutFile "..\..\Output\${INSTALL_OUTPUT_NAME}"

;$PROGRAMFILES32\Netease\NIM

InstallDir "1"

# 安装和卸载程序图标
Icon              "${INSTALL_ICO}"
UninstallIcon     "uninst.ico"
