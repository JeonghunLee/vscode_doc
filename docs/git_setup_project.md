# Check GIT 

* 아래는 VS Code의 연관성 보다는 Git 순수설정 
    * Github 사용한다면 주로 Github 기본 인증만 해당  
    * HTTPS/SSH 인증 만 해당  
    * **모든 Project/Respostory는 반드시 각 설정을 확인** 

!!! success "VSCode Source Control"
    - Git 설정은 오직 [VSCode Source Control](./vscode_github.md#vscode-souce-control) 만 연관  
    - **[VS Code Extesion Github](vscode_github.md#vscode-github-account) 다른 부분과는 연관이 없음**  

<br/>

* Check Git 우선순위
    * [Check GIT Remote](./git_setup_project.md#check-git-remote) : Git Remote Repository 확인 
    * [Check GIT Local](./git_setup_project.md#check-git-local) : Git Local 설정 확인 (User 확인)


<br/>

---

## Check GIT Local 

<br/>

!!! tip "Project/Respostory 반드시 확인"
    - 기본적인 모든 정보를 볼 수 있어 편하며, Remote 연결도 확인 가능 
    - [VS Code 의 Github 인증](vscode_github.md#check-github-account) 별도 
    - Git 의 순수 설정만 확인하며, VS Code의 Github 의 여러 인증과 무관   
        - Github Repostiory / Github 만 해당될 듯  


* **Check SSH**      
```
git config --local --list
```
e.g. check **remote.origin** SSH  
```
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true
remote.origin.url=git@github.com:JeonghunLee/vscode_doc.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.main.remote=origin
branch.main.vscode-merge-base=origin/main
branch.main.merge=refs/heads/main
```

<br/>

* **Check HTTPS**   
```
git config --local --list
```
e.g. check **remote.origin**  HTTPS 
```
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true
remote.origin.url=https://github.com/JeonghunLee/vscode_doc
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.main.remote=origin
branch.main.merge=refs/heads/main
branch.main.vscode-merge-base=origin/main
user.name=JeonghunLee
user.email=xxxx
```


<br/>

---


### Check Git User

<br/>

* Local User 정보 확인  

```
git config --show-origin --get user.name
```
!!! tip "user.name"     
    - file : .git/config  의 경우 local 
    - user.name : 상위 File 위치에 따라 Local 

```
git config --show-origin --get user.email
```
!!! tip "user.email"     
    - file : .git/config  의 경우 local 
    - user.email : 상위 File 위치에 따라 Local 


<br/>

---


### Check Git History 

<br/>



* Local Git History 확인  
    * Hash / user.name / user.email 
```
git log --format="%h | %an | %ae" -20
```

!!! tip "Hash/Username/Email"
    - Hash : Commit ID 
    - user.name : Author Name
    - user.email  : Author Email

!!! warning "user.name/user.email"
    - 2개다 반드시 정확히 설정해야 함 

<br/>

---



## Check GIT Remote 

<br/>

!!! tip "Project/Respostory 반드시 확인"
    - Remote 간단히 확인
    - [VS Code 의 Github 인증](vscode_github.md#check-github-account)       
        - Github Repostiory / Github 만 해당    

기본적으로 Remote를 항상 확인  


* **Remote HTTPS 설정 확인**  
```
git remote -v       
```
e.g. https://github.com/username/repo
```
origin  https://github.com/JeonghunLee/vscode_doc (fetch)
origin  https://github.com/JeonghunLee/vscode_doc (push)
```

<br/>

* **Remote SSH 설정 확인**  
```
git remote -v                                               
```
e.g. git@github.com:/username/repo.git      **(host:github.com)**     
```
origin  git@github.com:JeonghunLee/vscode_doc.git (fetch)
origin  git@github.com:JeonghunLee/vscode_doc.git (push)
```

!!! note "Check Remote"
    * orgin : remote repo 
        * https://github.com/username/repo  : **HTTPS** 
        * git@github.com:username/repo.git  : **SSH HOST** 



<br/>

---



## ReSetup GIT 

<br/>  


* **Check User/Remote**        
    * user정보가 없음 global 사용      
    * 즉 local로 별도 지정하지 않으면,  local -> global -> system 
```
git config --local --list
```
e.g. check local(local) user 정보가 없으므로, **global로 사용** 하며, **remote ssh** 로 사용      
```
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true
remote.origin.url=git@github.com:JeonghunLee/vscode_doc.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.main.remote=origin
branch.main.vscode-merge-base=origin/main
branch.main.merge=refs/heads/main
``` 

!!! tip "User Local"
    - **user.name** : 사용자 이름     
    - **user.email** : 사용자 이메일 
    - 우선순위 local -> global -> system(보통 외부, 기업 시스템) 

!!! tip "User Global"
    - 상위처럼 user.name 없다면 기본설정 **~/.gitconfig 사용(global)** 
    - cat ~/.gitconfig (user 확인)  

<br/>

* **Check User/Remote**   
```
git config --local --list
```
e.g. check **local user** 정보, **remote https** 로 사용  
```
core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true
remote.origin.url=https://github.com/JeonghunLee/vscode_doc
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.main.remote=origin
branch.main.merge=refs/heads/main
branch.main.vscode-merge-base=origin/main
user.name=JeonghunLee
user.email=xxxx
```

!!! tip "User Local"
    - **user.name** : 사용자 이름     
    - **user.email** : 사용자 이메일 
    - **이 프로젝트만 한정적으로 사용**   


<br/>

---

### Setup User Local 

<br/>

* **Git Use Local Setup**    
즉 이 Respository에만 설정 
```
git config --local user.name "xxxx" 
git config --local user.email "xxxxx"  
```
e.g. check local setup (only repo)
```
git config --local --list
```

!!! tip "User Local" 
    - **이 프로젝트만 한정적으로 사용가능하며, Global(default)가 별도**   
    - 가장 많이 사용하는 방법은 **Local** 설정으로 사용 


<br/>

---

### Setup User Global

<br/>



* **Git User Global Setup**   
모든 곳에 기본설정  local -> global -> system      
```
git config --global user.name "이름"
git config --global user.email "이메일"
```
e.g. check golbal seupt
```
git config --global --list
```
e.g. check global setup 
```
cat ~\.gitconfig  
```

<br/>

!!! tip "User Global" 
    - **주로 기본설정 Global(default)**   
    - Remote Repository 의 SSH/HTTPS 설정은 별도필요  


<br/>

---

### Setup Remote SSH  

<br/>


* **Remote SSH 설정 A 변경**   
.e.g. setup ssh host   
```
git remote set-url origin git@github.com:JeonghunLee/vscode_doc.git
```
e.g. check SSH host **default host(github.com)**
```
git remote -v                                               
```
```
origin  git@github.com:JeonghunLee/vscode_doc.git (fetch)
origin  git@github.com:JeonghunLee/vscode_doc.git (push)
```
e.g. SSH TEST(host)
```
ssh -T git@github.com
```

<br/>

* **Remote SSH 설정 B 변경**  
.e.g. setup ssh host (~/.ssh/config)  
```
git remote set-url origin git@github-company:JeonghunLee/vscode_doc.git
```
e.g. check SSH host **github-comapny(~/.ssh/config)** 
```
git remote -v                                               
```
```
origin  git@github-company:JeonghunLee/vscode_doc.git (fetch)
origin  git@github-company:JeonghunLee/vscode_doc.git (push)
```


!!! warning "SSH Config 사용시 주의"
    - ~/ssh/config 사용시 SSH Host를 변경시 **VS Code Extesion Github Action 미동작**   
        - Remote는 동작하나, VS Code의 Extension만 미동작 (인증문제)    
    - [Setup Multi Accoutn Config A](git_setup_default.md#ssh-config-a)  

<br/>

---

### Setup Remote HTTPS  

<br/>

* **HTTPS 기본구조** 
```
Git → Git Credential Manager → OAuth 토큰 → GitHub
```

<br/>

* **Remote HTTPS 설정변경**     
```
git remote set-url origin https://github.com/JeonghunLee/vscode_doc
```
```
git remote -v       
```
```
origin  https://github.com/JeonghunLee/vscode_doc (fetch)
origin  https://github.com/JeonghunLee/vscode_doc (push)
```

<br/>

--- 


## Git History Rewriting 

<br/>

!!! tip "Git History Rewriting"

<br/>

---

### Install Git Filter Repo 

<br/>

* Git Filter Repo 설치 
```
python -m pip install git-filter-repo
```

<br/>

---

### Rewrite Commit Infomation

<br/>

* Git History 확인 
```
git log --all --format="%h | %an | %ae"
```

* Git Filter Repo 이용 
Window에서 매번 PATH 문제가 발생하여, Python기반으로 실행   
```
python -m git_filter_repo --force --email-callback "return email.replace(b'ahyuo79@mail.com', b'ahyuo79@gmail.com')"
```




<br/>

---


### Check Git Filter Repo 

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

---

### Setup Window PATH 

<br/>

* git-filter-repo 설치 확인 
```
python -m site --user-base
C:\Users\LeeJeongHun\AppData\Roaming\Python
```

!!! warning "PATH"
    - Location 의 PATH 문제발생 
    - Appdata\Local\Python\pythoncore-3.14-64\Scripts\git-filter-repo.exe
    - Appdata\Roaming\Python : PATH가 미존재 

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

<br/>

* PATH 추가 
```
$Scripts = python -c "import sysconfig; print(sysconfig.get_path('scripts'))"
$env:Path += ";$Scripts"
```

!!! warning "일시적 추가"
    * Window 경우, Python PATH가 자주 문제가 되어짐 
    * Linux 처럼 단순하게 설치가 안되어지며, 상위 명령어는 **Terminal에서 일시적 설정** 


<br/>

* PowerShell PATH 재확인 
```
$env:Path -split ';'
```
```
C:\Users\LeeJeongHun\AppData\Local\Python\pythoncore-3.14-64\Scripts
```

<br/>

* Powershell Command 
```
where.exe git-filter-repo
```

<br/>

---

