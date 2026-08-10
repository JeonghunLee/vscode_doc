# Rewrite GIT 


!!! success "Git History Rewrite"
    * 과거에 잘못 오릴 경우, 이 부분 수정 Git History User Name / Email 변경


<br/>

---

## Git History Rewriting 

<br/>

!!! warning "Git History Rewriting"
    * 과거에 Git Commit Username 과 User.Email 잘못 올리 경우, 각 부분을 수정할 경우 
    * 과거의 Git Commit 정보를 수정하고 싶을 경우 

<br/>
    
!!! success "git filter repo"
    * Git History 수정을 위한 Python Package 
    * git filter repo 명령어는 Window PATH 문제가 자주 발생 
    * 가급적 Python으로 실행 


<br/>

---

### Install Git Filter Repo 

<br/>

* Git Filter Repo 설치 
```
python -m pip install git-filter-repo
```

!!! success "git filter repo"     
    * 설치 후 Python으로 실행 진행  
    * exe 도 존재하지만, 이 부분 [PATH로 Error에서 확인](git_rewrite.md#error-git-filter-repo-in-window) 


<br/>

---

### Recheck Commit Local

<br/>

* Git History 전체확인 
```
git log --all --format="%h | %an | %ae"
```
<br/>


* Git Current Branch 확인 
```
git branch --show-current
```

!!! tip "Git Current Branch "
    * Remote 에 Push 할때 동일한지 확인 

<br/>

* Git Remote 확인 
```
git remote -v  
```
!!! warning "git_filter_repo"
    - 사용할 경우 remote 정보가 자동으로 삭제되어짐 


<br/>

---

### Rewrite Commit Local 


<br/>

!!! warning "check branch/remote"
    - 반드시 [check branch, remote 확인](git_rewrite.md#recheck-commit-local) 

* Git Filter Repo Email 변경        
    * --email-callback  
```
python -m git_filter_repo --force --email-callback "return email.replace(b'ahyuo79@mail.com', b'ahyuo79@gmail.com')"
```

!!! tip "Git Local Commit 변경"
    * user.email 변경됨
    * user.name 보다 user.email 이 맞으면 거의 다 해결되어짐   
    * 아래는 옵션  

<br/>

* Git Filter Repo user/email 2개 동시 변경  
    * --name-callback
    * --email-callback  
```
python -m git_filter_repo --force `
  --name-callback "return b'JeonghunLee' if name == b'Jeonghun-DYNE' else name" `
  --email-callback "return b'ahyuo79@gmail.com' if email == b'jeonghun.lee@dynemedical.com' else email"
```

!!! tip "user.name/user.email 변경"
    * user.name 과 user.email 변경됨 
    * **user.email 만 맞추면 거의 다 되어짐** 

!!! warning " Window 의 경우"
    * 아래 PATH 문제로 상위와 같이 Python 기반으로 실행 
    * git filter repo 로 실행되어야 함 
  

<br/>

---


### Rewrite Commit Remote

<br/>

!!! warning "remote 정보"
    * 상위를 제대로 하면, remote 정보가 삭제되어짐 


* Git Remote 확인 
```
git remote -v  
```
```
git remote add origin https://github.com/JeonghunLee/vscode_doc.git
```

!!! tip "Remote Resetup"
    * 기존의 Remote가 없어짐 

<br/>


* Git Push Remote Force 
현재 바꾸고 싶은 Branch를 정확히 알고해야함 
```
git push --force origin main // main , master , develop 등
```
```
git push --force --tags origin
```

!!! warning "main/master"
    * force 하기전에 반드시 branch main/master 인지 확인 
    * tags의 경우도 가급적 해주자. 

<br/>

---



## Error Git Filter Repo in Window 

<br/>

!!! tip "Window 의 PATH"
    * Window 의 경우, 주로 PATH 문제가 자주 발생함 
    * 상위와 같이 그냥 Python 기반으로 실행하는 것을 권장함 
    * Window 의 git filter repo .exe 를 사용하고 싶다면 아래와 같이 실행  



<br/>

---

### Check Window PATH 

<br/>


* git filter repo 설치 확인 
```
python -m pip show git-filter-repo
```
```
Name: git-filter-repo
Version: 2.47.0
Summary: Quickly rewrite git repository history
Home-page: https://github.com/newren/git-filter-repo
Author: 
Author-email: Elijah Newren <newren@gmail.com>
License: MIT
Location: C:\Users\LeeJeongHun\AppData\Local\Python\pythoncore-3.14-64\Lib\site-packages
Requires: 
Required-by: 
```

!!! tip "git-filter-repo.py/exe"
    * Location : git-filter-repo.py 확인  
    * **Scripts : git_filter-repo.exe 확인** 
        * C:\Users\LeeJeongHun\AppData\Local\Python\pythoncore-3.14-64\Scripts\git-filter-repo.exe


<br/>


* git-filter-repo 설치 확인 
```
python -m site --user-base
C:\Users\LeeJeongHun\AppData\Roaming\Python
```

!!! warning "Window Python PATH"
    * Location 의 PATH 문제발생 
        * Appdata\Local\Python\pythoncore-3.14-64\Scripts\git-filter-repo.exe
        * Appdata\Roaming\Python : PATH가 미존재 

<br/>

---

### Setup Window PATH 

<br/>


* PowerShell PATH 확인 
```
$env:Path -split ';'
```
```
c:\Users\LeeJeongHun\AppData\Roaming\Code\User\globalStorage\github.copilot-chat\debugCommand
c:\Users\LeeJeongHun\AppData\Roaming\Code\User\globalStorage\github.copilot-chat\copilotCli
C:\Windows\system32
C:\Windows
C:\Windows\System32\Wbem
C:\Windows\System32\WindowsPowerShell\v1.0\
C:\Windows\System32\OpenSSH\
C:\Program Files\dotnet\
C:\Program Files\Git\cmd
C:\Program Files\nodejs\
C:\Program Files\NVIDIA Corporation\SDK Manager
C:\Program Files\Bandizip\
C:\Program Files\usbipd-win\
C:\Users\LeeJeongHun\AppData\Local\Microsoft\WindowsApps
C:\Users\LeeJeongHun\AppData\Local\Programs\Microsoft VS Code\bin
C:\Users\LeeJeongHun\AppData\Local\GitHubDesktop\bin
C:\Users\LeeJeongHun\AppData\Local\Python\bin
C:\Users\LeeJeongHun\AppData\Roaming\npm

C:\Users\LeeJeongHun\AppData\Local\Programs\Ollama
C:\Users\LeeJeongHun\AppData\Local\Microsoft\WinGet\Links
C:\Users\LeeJeongHun\AppData\Local\Microsoft\WinGet\Packages\JohnMacFarlane.Pandoc_Microsoft.Winget.Source_8wekyb3d8bbwe\pandoc-3.10

c:\Users\LeeJeongHun\.vscode\extensions\ms-python.debugpy-2026.6.0-win32-x64\bundled\scripts\noConfigScripts
```

!!! tip "Window PS PATH"
    * Check PS PATH 확인 


<br/>


* Window PS PATH 추가 
아래와 같이 강제로 추가 
```
$Scripts = python -c "import sysconfig; print(sysconfig.get_path('scripts'))"
$env:Path += ";$Scripts"
```

!!! warning "Window PS PATH 해당 Terminal에서 일시적 설정"
    * Window 경우, Python PATH가 자주 문제가 되어짐 
    * Linux 처럼 단순하게 설치가 안되어지며, 상위 명령어는 **Terminal에서 일시적 설정** 


<br/>

* PowerShell PATH 재확인 
```
$env:Path -split ';'
```
```
....
C:\Users\LeeJeongHun\AppData\Local\Python\pythoncore-3.14-64\Scripts
```

<br/>

* Powershell Command 
```
where.exe git-filter-repo
```

<br/>

---

