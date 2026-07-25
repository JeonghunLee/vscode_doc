# VS Code CONFIG

## Config 

<br/>

* **CMD Extension 이름 파악**     
설치되어진 extension 이름 확인가능하면 쉽게 들어가서 package.json 파일을 찾을 수 있음  
```
code --list-extensions
code --list-extensions --show-versions
```
<br/>

!!! tip  "global / local config"
    - 기본적으로 local 우선순위가 높으며, 각 config는 json 기반 
    - global extensions 들의 global config 정확히 알아야 세부설정도 가능 
    - global extensions 들의 구조 와 package.json 파악  

---

### Config Global

<br/>

!!! tip  "global config"
    - 본인 계정의 .vscode 에서 출발하며 이 기반으로 찾기  
    - ~/.vscode/extesions  
    - global extensions 들의 구조 와 package.json 파악  


* VSCode Config 기본구조 
```
~/.vscode
├── agent-plugins   
├── cli       
├── extensions   // 주로 분석할 곳 package.json         
└── argv.json  

~/.vscode-shared
└── sharedStorage  
```
<br/>

* ESPIDF Config 연결 
```
~/.espressif
├── dist          // 배포 
├── python_env       
├── tools         // 각 실행파일 및 cmake/build 등 
├── espidf.constraints.v5.2.txt /  
├── espidf.constraints.v5.4.txt         
└── esp_idf.json  // 중요 각 설정 
```

* 이외 다른 연결도 확인  
```
ls ~/
```

<br/>

* Json 파일 찾기 
    ```
    Get-ChildItem ~\.vscode -Recurse -File -Filter *.json
    ``` 
    ```
    Get-ChildItem ~\.vscode -Recurse -File -Filter package.json
    ```
<br/>

* package.json 기반의 특정 설정 찾기      
Linux의 파이프 기반의 Grep 과 유사  
```
Get-ChildItem -Path "$HOME\.vscode\extensions" -Recurse -Filter "package.json" | Select-String -Pattern "terminal.activateEnvironment"
```

<br/>

---

### Config Local 


<br/>

* **.vscode**  
```
.vscode
├── settings.json   // Editor, Formatter, Terminal
├── tasks.json       // Build / Flash / Clean / Test 
├── launch.json      // GDB Debug
└── extensions.json  // 내부 Extesion 
``` 



| 파일                      | 용도                                            | 자주 사용 |
| ----------------------- | --------------------------------------------- | :---: |
| `settings.json`         | 프로젝트 전용 VS Code 설정                            | ⭐⭐⭐⭐⭐ |     
| `tasks.json`            | Build, Flash, Script 등의 Task 정의               | ⭐⭐⭐⭐⭐ |
| `launch.json`           | 디버거(GDB, C++, Python 등) 실행 설정                 | ⭐⭐⭐⭐⭐ |
| `extensions.json`       | 추천(또는 비추천) 확장 목록                              |  ⭐⭐⭐⭐ |
| `c_cpp_properties.json` | Microsoft C/C++ 확장의 Include Path, Compiler 설정 |  ⭐⭐⭐  |
| `cmake-kits.json`       | CMake Kit 정의(예전 방식)                           |   ⭐⭐  |
| `mcp.json`              | MCP(Model Context Protocol) 서버 설정(최신 AI 기능)   |   ⭐⭐  |
| `devcontainer.json`     | Dev Container 환경 설정                           |   ⭐⭐  |



<br/>

---

## settings 

<br/>

!!! tip " 우선순위" 
    - AI 가 이미 많이 알고 있음   
    - AI 에서 힌트를 얻어 세부적인 제어를 할 경우 , 각 Package.json 에서 다른 설정 문의  
    - 각 Package.json 설정 과 외부 config 연결성 


* 다음순위 
    1. [Config Global 분석](#config-global)   
    2. local settings.json 변경 

<br/>

---

### settings 1

<br/>

* Global package.json 찾기      
이미 **terminal.activateEnvironment** 설정값을 알고 있으므로, 역으로 찾기 
```
Get-ChildItem -Path "$HOME\.vscode\extensions" -Recurse -Filter "package.json" | Select-String -Pattern "terminal.activateEnvironment"
```

!!! tip "python config" 
    - 1줄로 되어있어 솔직히 보기가 힘들면, AI 한테 분석요청 
    - 이 기반으로 다른 설정 및 연결진행   

<br/>

* Python 자동설정 
```
{  
  //.venv
  //Python Automatic Environment Activation 
  "python.terminal.activateEnvironment": false
}
```

<br/>

---

### settings 2

<br/>


* Global package.json 찾기    
만약, 모른다면, 아래 처럼 모든 Package 의 이름 찾으며 유사이름으로 보기   
```
Get-ChildItem ~\.vscode -Recurse -File -Filter package.json
```


<br/>

* Global 모드 Package.json 과 중복 문자 넣기     
    1. idf  쉽게 찾음 
    2. esp
    3. espressif
```
Get-ChildItem ~\.vscode -Recurse -File -Filter package.json |  Select-String '"idf\.' -List
```
```
Get-ChildItem -Path "$HOME\.vscode\extensions" -Recurse -Filter "package.json" | Select-String -Pattern "idf"
```

* 상위 파일 분석  
~\.vscode\extensions\espressif.esp-idf-extension-2.1.0\package.json
```
		"configuration": [
			{
				"title": "%configuration.section.setup%",
				"properties": {
					"idf.extensionActivationMode": {
						"type": "string",
						"default": "detect",
						"enum": [
							"detect",
							"always",
							"never"
						],
						"enumDescriptions": [
							"%param.extensionActivationMode.enum.detect%",
							"%param.extensionActivationMode.enum.always%",
							"%param.extensionActivationMode.enum.never%"
						],
						"description": "%param.extensionActivationMode%",
						"scope": "resource"
					},
					"idf.eimIdfJsonPath": {
						"type": "string",
						"default": "",
						"description": "%param.eimIdfJsonPath%",
						"scope": "application"
					},
...
			{
				"command": "espIdf.partition.table.refresh",
				"title": "%espIdf.partition.table.refresh.title%",
				"category": "ESP-IDF",
				"icon": "$(refresh)"
			},
			{
				"command": "espIdf.flashBinaryToPartition",
				"category": "ESP-IDF",    // Ctrl+Shift P  : ESP-IDF: Flash Partition 찾음 
				"title": "%espIdf.flashBinaryToPartition.title%"
			},
			{
				"command": "espIdf.apptrace.archive.refresh",
				"title": "%espIdf.apptrace.archive.refresh.title%",
				"icon": "$(refresh)",
				"category": "ESP-IDF"
			},
```
* 상위 idf 중복 검색  
여러개의 extensions 을 사용   
```
ls ~/.vscode\extensions\espressif.esp-idf-extension-2.1.0   // Main 
ls ~/.vscode\extensions\espressif.esp-idf-web-0.0.4         // Web 
ls ~/.vscode\extensions\ms-vscode.cmake-tools-1.23.52       // Cmake 연결 
```

<br/>

* 상위 특정 Command    
    1. Ctrl+Shift P  : ESP-IDF: Flash Partition 찾음   
    2. 이걸 package.json 
    3. *.json 확장찾기 
    4. 다시 구조 파악 (export.ps1) 발견 및 python 연결사항 확인 
    5. ~/.espressif 다시 확인 
```
 Get-ChildItem -Path "$HOME\.vscode\extensions" -Recurse -Filter "*.json" | Select-String -Pattern "flashBinaryToPartition"
```
```
cat ~\.vscode\extensions\espressif.esp-idf-extension-2.1.0\export.ps1
# Define the Invoke-idfpy function
function global:Invoke-idfpy {
    & python.exe `
    "$($env:IDF_PATH)\tools\idf.py" @args
}

function global:esptool.py {
  & python.exe `
  "$($env:IDF_PATH)\components\esptool_py\esptool\esptool.py" @args
}

function global:espefuse.py {
  & python.exe `
  "$($env:IDF_PATH)\components\esptool_py\esptool\espefuse.py" @args
}

function global:espsecure.py {
  & python.exe `
  "$($env:IDF_PATH)\components\esptool_py\esptool\espsecure.py" @args
}

function global:otatool.py {
  & python.exe `
  "$($env:IDF_PATH)\components\app_update\otatool.py" @args
}

function global:parttool.py {
  & python.exe `
  "$($env:IDF_PATH)\components\partition_table\parttool.py" @args
}
```


*  ~/.espressif/esp_idf.json     
idfToolsPath 기반으로 어디 연결되었는지 다시 확인  
연결안됨 
요즘 ESP IDF가 VS Code 용으로 나와 전부 변경되어짐    
```
{                                        
  "$schema": "http://json-schema.org/schema#",
  "$id": "http://dl.espressif.com/dl/schemas/esp_idf",
  "_comment": "Configuration file for ESP-IDF IDEs.",
  "_warning": "Use / or \\ when specifying path. Single backslash is not allowed by JSON format.",
  "gitPath": "C:\\Users\\ahyuo\\.espressif\\tools\\idf-git\\2.39.2\\cmd\\git.exe",
  "idfToolsPath": "C:\\Users\\ahyuo\\.espressif",
  "idfSelectedId": "esp-idf-5faf46425cae84f5cb184f383d0c258b",
  "idfInstalled": {
    "esp-idf-a10fe9e3b31485d978ed51c67889688c": {
      "version": "5.2.6",
      "python": "C:\\Users\\ahyuo\\.espressif\\python_env\\idf5.2_py3.11_env\\Scripts\\python.exe",
      "path": "C:\\Users\\ahyuo\\esp\\v5.2\\esp-idf"
    },
    "esp-idf-5faf46425cae84f5cb184f383d0c258b": {
      "version": "5.4.3",
      "python": "C:\\Users\\ahyuo\\.espressif\\python_env\\idf5.4_py3.11_env\\Scripts\\python.exe",
      "path": "C:\\Users\\ahyuo\\esp\\v5.4\\esp-idf"
    }
  }
}
```

<br/>

!!! warning "setting.json 참고" 
    - **아래의 경우는 참고** 만 하며 **최신 VSCDOE** 에는 의미가 없음  
    - 상위처럼 각 분석방법을 통해 찾아서 본인만의 설정을 만들어야 함  
    - ex RS485의 경우, 내가 내부 설정을 변경해서 별도로 확장구성해서 구성을 하였음 
        - **문제사항: 확장할 경우 , 이전과 호환성이 떨어짐** 
        - 가급적 Local 기반으로 별도로 구성하며, **각 Global Config와 최대한 연결** 을 하도록 해야함    
    - VSCODE가 이전에는 이보다 더 단순하여, 세부사항을 내마음대로 설정을 하였음    

* **Local setting.json 참고**           
```
{
    "files.associations": {
        "http_client_buffer.h": "c",
        "ota_client.h": "c",
        "bit": "c",
        "compare": "c",
        "complex": "c",
        "cstddef": "c",
        "iterator": "c",
        "limits": "c",
        "memory": "c",
        "sstream": "c",
        "system_error": "c",
        "type_traits": "c",
        "xiosbase": "c",
        "xlocale": "c",
        "xutility": "c",
        "sys_param_sid00did10_system_network_wifista.h": "c",
        "led_drv_rmt.h": "c",
        "xtr1common": "c",
        "iosfwd": "c",
        "atomic": "c",
        "xmemory": "c",
        "xstring": "c",
        "optiga_type.h": "c",
        "initializer_list": "c",
        "sdkconfig.h": "c"
    },    
    "idf.adapterTargetName": "esp32",
    "idf.flashType": "UART",
    "idf.portWin": "COM13",
    "idf.monitorBaudRate" : "115200",  

    //"idf.RS485Port": "COM8",    // My Home FT232
    "idf.RS485Port": "COM18",     // My Home FT2232 (with JTAG)
    //"idf.RS485Port": "COM17",   // Comapnay 

    //"idf.RS485Baudrate": "921600",  
    "idf.RS485Baudrate": "460800",  
    //"idf.RS485Baudrate": "115200",          
    "idf.RS485ResponseTimeout": "0.100", //0.050 -> 0.100
    "idf.RS485MaxUnit": "8",       
    "idf.RS485TimerInterval": "1", 
    "idf.RS485TesTimeHour": "10",             
               
    "idf.svdFilePath": "${workspaceFolder}/esp32.svd",
    "idf.openOcdConfigs": [
        "interface/ftdi/esp32_devkitj_v1.cfg",
        "target/esp32.cfg"
    ],
    "idf.espIdfPathWin": "C:\\Users\\jhlee\\esp\\esp-idf",
    "idf.pythonBinPathWin": "C:\\Users\\jhlee\\.espressif\\python_env\\idf4.2_py3.8_env\\Scripts\\python.exe",
    "idf.toolsPathWin": "C:\\Users\\jhlee\\.espressif",
    "idf.customExtraPaths": "C:\\Users\\jhlee\\.espressif\\tools\\xtensa-esp32-elf\\esp-2020r3-8.4.0\\xtensa-esp32-elf\\bin;C:\\Users\\jhlee\\.espressif\\tools\\xtensa-esp32s2-elf\\esp-2020r3-8.4.0\\xtensa-esp32s2-elf\\bin;C:\\Users\\jhlee\\.espressif\\tools\\esp32ulp-elf\\2.28.51-esp-20191205\\esp32ulp-elf-binutils\\bin;C:\\Users\\jhlee\\.espressif\\tools\\esp32s2ulp-elf\\2.28.51-esp-20191205\\esp32s2ulp-elf-binutils\\bin;C:\\Users\\jhlee\\.espressif\\tools\\cmake\\3.16.4\\bin;C:\\Users\\jhlee\\.espressif\\tools\\openocd-esp32\\v0.11.0-esp32-20211220\\openocd-esp32\\bin;C:\\Users\\jhlee\\.espressif\\tools\\ninja\\1.10.0;C:\\Users\\jhlee\\.espressif\\tools\\idf-exe\\1.0.1;C:\\Users\\jhlee\\.espressif\\tools\\ccache\\3.7;C:\\Users\\jhlee\\.espressif\\tools\\dfu-util\\0.9\\dfu-util-0.9-win64",
    "idf.customExtraVars": {
        "OPENOCD_SCRIPTS": "C:\\Users\\jhlee\\.espressif\\tools\\openocd-esp32\\v0.11.0-esp32-20211220/openocd-esp32/share/openocd/scripts",
        "IDF_CCACHE_ENABLE": "1"
    },
    "idf.gitPathWin": "\\Git\\cmd\\git.exe"
}
```

<br/>

---

#### ESP-IDF 

<br/>

* 예전의 ESP-IDF 구조 

ESP-IDF Termianl 실행하면 실행됨 
아래 소스 확인 
```
c:\Users\jhlee\.vscode\extensions\espressif.esp-idf-extension-1.10.1\export.ps1
```

최근에 설치한 ESP-IDF PATH 동일함 확인  
```
function global:esptool.py {
  & python.exe `
  "$($env:IDF_PATH)\components\esptool_py\esptool\esptool.py" @args
}
```

* 재확인 방법         
  C:\Users\jhlee\.vscode\extensions -> 모든 Extension 확인        
  C:\Users\jhlee\.vscode\extensions\espressif.esp-idf-extension-1.10.1            

<br/>

* TypeScript 관리   
상위는 소스는 TypeScript로 아래에서 관리 하는 듯함         
https://github.com/espressif/vscode-esp-idf-extension/blob/master/src/flash/flashTask.ts    
```
flashCommand 함수 
Failed to flash because of some unusual error. Check Terminal for more details`;
```
배포되는 듯함 
https://github.com/espressif/vscode-esp-idf-extension/blob/master/src/flash/uartFlash.ts
```
flashCommand 함수 검색됨 
Failed to flash because of some unusual error. Check Terminal for more details` -> 수정하면 죽지만 다음에 실행하면 됨 
```

<br/>

* 재확인 
C:\Users\jhlee\.vscode\extensions\espressif.esp-idf-extension-1.10.1\dist\extension.js  --> TypeScript / JavaScript 로 변환됨
C:\Users\jhlee\.vscode\extensions\espressif.esp-idf-extension-1.10.1\dist\views

<br/>

---

<br/>

## tasks

<br/>

* **Terminal -> Run Task**     
자신이 원하는 모든 자동화 기능을 Build 부터 TEST 까지 가능 

**Manaul**     
https://code.visualstudio.com/docs/debugtest/tasks   


<br/>

---

### tasks 1

<br/>

자동으로 Task 
```
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "VENV mkdoc serve Local",
            "type": "shell",
            "command": "powershell",
            "args": [
                "-ExecutionPolicy",
                "RemoteSigned",
                "-Command",
                "& { .\\.venv\\Scripts\\Activate.ps1; mkdocs serve }"
            ],
        },
        {
            "label": "VENV mkdoc serve Remote",
            "type": "shell",
            "command": "powershell",
            "args": [
                "-ExecutionPolicy",
                "RemoteSigned",
                "-Command",
                "& { .\\.venv\\Scripts\\Activate.ps1; mkdocs serve -a 0.0.0.0:8000 }"
            ],
        },
        {
            "label": "VENV mkdoc build",
            "type": "shell",
            "command": "powershell",
            "args": [
                "-ExecutionPolicy",
                "RemoteSigned",
                "-Command",
                "& { .\\.venv\\Scripts\\Activate.ps1; mkdocs build  }"
            ],
        },       
        {
            "label": "VENV mkdoc build strict",
            "type": "shell",
            "command": "powershell",
            "args": [
                "-ExecutionPolicy",
                "RemoteSigned",
                "-Command",
                "& { .\\.venv\\Scripts\\Activate.ps1; mkdocs build --strict }"
            ],
        }            
    ]
}
```

<br/>

---

### tasks 2

<br/>

!!! tip "TEST 자동화"
    - TEST 의 거의 자동화를 위해 Task를 적극적 이용 
    - 이를 수동실행 과 자동실행 변경 
    - 수동 VS Code에서 실행 
        - 각 연결해서 실행하도록 하고, 최대한 단순하게 구성하려고 함 
        - 각 config 설정을 세부적으로 알아야 더 세부적인 Task도 구성 가능   
    - 자동은 다른 Tool를 별도로 사용 

```
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "IP Config",
            "type": "shell",
            "command": "ipconfig"
        },
        {
            "label": "User Home",
            "type": "shell",
            "command": "echo ${userHome}  "
        },
        {
            "label": "User Date",
            "type": "shell",
            "command": "Get-Date -Format \"yyy_MM_dd_HH_mm\" "
        },
        {
            "label": "ESP Monitor Com4",
            "type": "shell",
            "command": "set IDF_PATH=${userHome}\\esp\\esp-idf; ${userHome}\\.espressif\\python_env\\idf4.2_py3.8_env\\Scripts\\python.exe ${userHome}\\esp\\esp-idf\\tools\\idf_monitor.py -p COM4 -b 115200 --toolchain-prefix xtensa-esp32-elf- ${workspaceFolder}\\build\\mxx610-app.elf "
        },
        {
            "label": "MOD61x Release",
            "type": "shell",
            "command": "cd ${workspaceFolder}/release; ./makeFirmware.ps1"
        },
        {
            "label": "ESP-IDF Erase ALL",
            "type": "shell",
            "command": "${userHome}/.espressif/python_env/idf4.2_py3.8_env/Scripts/python.exe ${userHome}/esp/esp-idf/components/esptool_py/esptool/esptool.py -p ${config:idf.portWin} -b 460800 --before default_reset --after hard_reset --chip ${config:idf.adapterTargetName} erase_flash"
        },
        {
            "label": "ESP-IDF WRITE OLD_PATITION",
            "type": "shell",
            "command": "${config:idf.pythonBinPathWin} ${userHome}/esp/esp-idf/components/esptool_py/esptool/esptool.py -p ${config:idf.portWin} -b 460800 --before default_reset --after hard_reset --chip ${config:idf.adapterTargetName} write_flash --flash_mode dio --flash_freq 80m --flash_size detect 0x50000 ${workspaceFolder}/release/firmware/mxx610-app.bin 0x1000 ${workspaceFolder}/release/firmware/bootloader.bin 0x10000 ${workspaceFolder}/release/firmware/partition-table.bin 0x15000 ${workspaceFolder}/release/firmware/ota_data_initial.bin 0x17000 ${workspaceFolder}/release/firmware/phy_init_data.bin 0x39000 ${workspaceFolder}/release/firmware/storage_data.bin"
        },
        {
            "label": "ESP-IDF WRITE NEW_PATITION (Release/Erase/Write)",
            "type": "shell",
            "command": "${config:idf.pythonBinPathWin} ${userHome}/esp/esp-idf/components/esptool_py/esptool/esptool.py -p ${config:idf.portWin} -b 460800 --before default_reset --after hard_reset --chip ${config:idf.adapterTargetName} write_flash --flash_mode dio --flash_freq 80m --flash_size detect 0x070000 ${workspaceFolder}/release/firmware/mxx610-app.bin 0x1000 ${workspaceFolder}/release/firmware/bootloader.bin 0x10000 ${workspaceFolder}/release/firmware/partition-table.bin 0x15000 ${workspaceFolder}/release/firmware/ota_data_initial.bin 0x17000 ${workspaceFolder}/release/firmware/phy_init_data.bin 0x39000 ${workspaceFolder}/release/firmware/storage_data.bin",
            "dependsOrder": "sequence",
            "dependsOn": [
                "MOD61x Release",
                "ESP-IDF Erase ALL"
            ]
        },
        {
            "label": "ESP-IDF Only WRITE NEW_PATITION",
            "type": "shell",
            "command": "${config:idf.pythonBinPathWin} ${userHome}/esp/esp-idf/components/esptool_py/esptool/esptool.py -p ${config:idf.portWin} -b 460800 --before default_reset --after hard_reset --chip ${config:idf.adapterTargetName} write_flash --flash_mode dio --flash_freq 80m --flash_size detect 0x070000 ${workspaceFolder}/release/firmware/mxx610-app.bin 0x1000 ${workspaceFolder}/release/firmware/bootloader.bin 0x10000 ${workspaceFolder}/release/firmware/partition-table.bin 0x15000 ${workspaceFolder}/release/firmware/ota_data_initial.bin 0x17000 ${workspaceFolder}/release/firmware/phy_init_data.bin 0x39000 ${workspaceFolder}/release/firmware/storage_data.bin"
        },
        {
            "label": "Get Image from Flash-OTA2",
            "type": "shell",
            "command": "${config:idf.pythonBinPathWin} ${userHome}/esp/esp-idf/components/esptool_py/esptool/esptool.py -p ${config:idf.portWin} -b 460800 --before default_reset --after hard_reset --chip ${config:idf.adapterTargetName} read_flash  0x230000 0x1C0000 ${workspaceFolder}/build/mxx610-ota2.bin"
        },
        {
            "label": "TEST MQTT Broker Service Start",
            "type": "shell",
            "command": "D:/Works/Project/batch/mqtt.ps1"
        },
        {
            "label": "TEST MQTT ONLY Realtime LOG",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_only_subscribe_realtime.py  | tee ${workspaceFolder}/log_mqtt_realtime_2024_04_05_01.log",
            "problemMatcher": []
        },
        {
            "label": "TEST MQTT ONLY Realtime",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_only_subscribe_realtime.py",
            "problemMatcher": []
        },
        {
            "label": "TEST MQTT ONLY Realtime-TLS",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_only_subscribe_realtime_tls.py",
            "problemMatcher": []
        },
        {
            "label": "TEST MQTT ONLY Subscribe",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_only_subscribe.py"
        },
        {
            "label": "TEST MQTT General Publish",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_publish_general.py"
        },
        {
            "label": "TEST MQTT General Publish-TLS",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_publish_general_tls.py"
        },
        {
            "label": "TEST MQTT General Publish AES128ECB",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_publish_general_SETAES128.py"
        },
        {
            "label": "TEST MQTT SET wifi list",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_publish_wifi_list.py"
        },
        {
            "label": "TEST MQTT RSPSetup Publish",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_publish_rspsetup.py"
        },
        {
            "label": "TEST MQTT OTA Publish",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_publish_otasetup.py"
        },
        {
            "label": "TEST MQTT OTA Publish-TLS",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_publish_otasetup_tls.py"
        },
        {
            "label": "TEST MQTT MO613 RMT Publish",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_publish_rmt_mod613.py"
        },
        {
            "label": "TEST MQTT MO613 RMT TEST A",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_publish_rmt_mod613_testa.py"
        },
        {
            "label": "TEST MQTT MO613 RMT TEST B",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_publish_rmt_mod613_testb.py"
        },
        {
            "label": "TEST HTTP Server",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/http/http_server.py"
        },
        {
            "label": "TEST HTTP-Server-LOG",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/http/http_server.py | tee ${workspaceFolder}/log_http_2024_03_25.log"
        },
        {
            "label": "TEST HTTP-Server-SMP",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/http/http_server_simple.py",
            "problemMatcher": []
        },
        {
            "label": "TEST HTTP-Server-SMP-TLS",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/http/http_server_simple_tls.py",
            "problemMatcher": []
        },
        {
            "label": "TEST HTTP-Server-SMP-LOG",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/http/http_server_simple.py | tee ${workspaceFolder}/log_http_smp_2024_03_25.log"
        },
        {
            "label": "TEST OTA HTTP Server",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/ota/http_ota_server.py"
        },
        {
            "label": "TEST OTA HTTP Server-TLS",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/ota/http_ota_server_tls.py"
        },
        {
            "label": "TEST UDP SIMPLE SETUP",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/net/net_test_solution_mode.py"
        },
        {
            "label": "TEST UDP WIFI-AP SETUP",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/net/net_test_rsp_setup.py"
        },
        {
            "label": "TEST UDP Sever-Realtime by MQTT",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/mqtt/mqtt_only_subscribe_realtime_udp.py"
        },
        {
            "label": "TEST UDP Server-Realtime by UDP-CMD",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/net/net_test_realtime.py"
        },
        {
            "label": "TEST UDP RSP-SETUP2",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/net/net_test_rsp_setup2.py"
        },
        {
            "label": "TEST UDP WIFI-LIST SETUP",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/dev/wifi_drv/net_test_wifi_list_setup.py"
        },
        {
            "label": "TEST RS485 MSG",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/dev/rs485_drv/test_rs485.py -p ${config:idf.RS485Port}"
        },
        {
            "label": "TEST MODBUS-Ordering",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/modbus/modbus_test_anal_decode.py"
        },
        {
            "label": "TEST MODBUS-Transaction",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/modbus/modbus_test_anal_transaction.py -p ${config:idf.RS485Port} -b ${config:idf.RS485Baudrate}  -r ${config:idf.RS485ResponseTimeout}  -u ${config:idf.RS485MaxUnit}  -i ${config:idf.RS485TimerInterval} -t ${config:idf.RS485TesTimeHour} "
        },
        {
            "label": "TEST MODBUS-CHK-EventGR",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/modbus/modbus_test_check_rspevent_general.py -p ${config:idf.RS485Port} -b ${config:idf.RS485Baudrate}  "
        },
        {
            "label": "TEST MODBUS-CHK-EventBT",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/modbus/modbus_test_check_rspevent_burst.py -p ${config:idf.RS485Port} -b ${config:idf.RS485Baudrate}  -r ${config:idf.RS485ResponseTimeout}  -u ${config:idf.RS485MaxUnit}  -i ${config:idf.RS485TimerInterval} -t ${config:idf.RS485TesTimeHour}  "
        },
        {
            "label": "TEST MODBUS-CHK-SystemInfo",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/modbus/modbus_test_check_systeminfo.py -p ${config:idf.RS485Port} -b ${config:idf.RS485Baudrate}  -r ${config:idf.RS485ResponseTimeout}  -u ${config:idf.RS485MaxUnit}  -i ${config:idf.RS485TimerInterval} -t ${config:idf.RS485TesTimeHour}  "
        },
        {
            "label": "TEST MODBUS-Set-Modbus",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/modbus/modbus_test_set_modbus_general.py -p ${config:idf.RS485Port} -b ${config:idf.RS485Baudrate} -r ${config:idf.RS485ResponseTimeout}  -u ${config:idf.RS485MaxUnit}  -i ${config:idf.RS485TimerInterval} -t ${config:idf.RS485TesTimeHour}  "
        },
        {
            "label": "TEST MODBUS-Set-OTA-GR",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/modbus/modbus_test_set_ota_general.py  -p ${config:idf.RS485Port} -b ${config:idf.RS485Baudrate}  -r ${config:idf.RS485ResponseTimeout}  -u ${config:idf.RS485MaxUnit}  -i ${config:idf.RS485TimerInterval} -t ${config:idf.RS485TesTimeHour}  ",
            "problemMatcher": []
        },
        {
            "label": "TEST MODBUS-Set-RSPSetup",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe ${workspaceFolder}/main/module/modbus/modbus_test_set_rspsetup.py -p ${config:idf.RS485Port} -b ${config:idf.RS485Baudrate} -r ${config:idf.RS485ResponseTimeout} -u ${config:idf.RS485MaxUnit}  -i ${config:idf.RS485TimerInterval} -t ${config:idf.RS485TesTimeHour} "
        },
        {
            "label": "TEST Python List",
            "type": "shell",
            "command": "& D:/Tools/python/python-3.7.5-embed-amd64/python.exe -m pip list  "
        },
        {
            "label": "TEST Shell",
            "type": "shell",
            "command": "echo Hellow | tee ${workspaceFolder}/test.log  "
        }
    ]
}
```

<br/>

---

## launch

<br/>

거의 ESP32 에서 자동으로 실행하는 기능으로 많이 사용  
**Rund and Debug** 에서 연결해서 사용가능   

**Manaul**   
https://code.visualstudio.com/docs/debugtest/debugging-configuration  

<br/>

---

### launch 1

```
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "ESP32 Debugger",
            "type": "espidf",
            "request": "launch",
            "gdbinitFile": "${workspaceFolder}/.vscode/gdbinit"
        }
    ]
}
```

<br/>

---