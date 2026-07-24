# GIT 설정 

* 아래는 VS Code의 연관성 보다는 Git 순수설정 
    * Github 사용한다면 주로 Github 기본 인증만 해당  
    * HTTPS/SSH 인증 만 해당  
    * **모든 Project/Respostory는 반드시 각 설정을 확인** 

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
> git config --local --list

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
> git config --local --list
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

## Check GIT Remote 

<br/>

!!! tip "Project/Respostory 반드시 확인"
    - Remote 간단히 확인
    - [VS Code 의 Github 인증](vscode_github.md#check-github-account)       
        - Github Repostiory / Github 만 해당    

기본적으로 Remote를 항상 확인  


* **Remote HTTPS 설정 확인**  
```
> git remote -v       
origin  https://github.com/JeonghunLee/vscode_doc (fetch)
origin  https://github.com/JeonghunLee/vscode_doc (push)
```

<br/>

* **Remote SSH 설정 확인**  
```
> git remote -v                                               
origin  git@github.com:JeonghunLee/vscode_doc.git (fetch)
origin  git@github.com:JeonghunLee/vscode_doc.git (push)
```

<br/>

---


## Setup GIT SSH User

<br/>

* **Git SSH Local Setup**   
즉 이 Respository에만 설정 
```
git config --local user.name "xxxx" 
git config --local user.email "xxxxx"  
```

<br/>

!!! tip "Git Config SSH만 유효"
    - SSH 설정에만 유효 
    - **HTTPS 설정에는 사용되지 않음**       

* **GIT SSH Project 확인** 
```
> git config --local --list

core.repositoryformatversion=0
core.filemode=false
core.bare=false
core.logallrefupdates=true
core.symlinks=false
core.ignorecase=true
remote.origin.url=git@github.com:Jeonghun-DYNE/Info_jetson.git
remote.origin.fetch=+refs/heads/*:refs/remotes/origin/*
branch.main.remote=origin
branch.main.vscode-merge-base=origin/main
branch.main.merge=refs/heads/main
```


* **Check HTTPS**   
```
> git config --local --list
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

### Setup Remote-SSH  

<br/>

* **Remote 설정확인**   
    1. SSH 설정 
    2. HTTPS 설정 
```
> git remote -v
origin  git@github.com:Jeonghun-DYNE/Info_jetson.git (fetch)
origin  git@github.com:Jeonghun-DYNE/Info_jetson.git (push)
```
<br/>

* **Remote SSH 설정변경**   
    * SSH의 config에서 host 가 git@github-company 일 경우  
    * 상위처럼 변경할 경우, VS Code의 Github Action 문제 발생 
```
> git remote set-url origin git@github-company:Jeonghun-DYNE/Info_jetson.git

> git remote -v                                               
origin  git@github-company:Jeonghun-DYNE/Info_jetson.git (fetch)
origin  git@github-company:Jeonghun-DYNE/Info_jetson.git (push)
```

<br/>

* **Remote SSH 설정변경**     
기본 SSH설정으로 가급적 아래 처럼 사용      
```
> git remote set-url origin git@github.com:JeonghunLee/vscode_doc.git

> git remote -v                                               
origin  git@github.com:JeonghunLee/vscode_doc.git (fetch)
origin  git@github.com:JeonghunLee/vscode_doc.git (push)
```

<br/>

### Setup Remote-HTTPS  

<br/>

* **HTTPS 기본구조** 
```
Git → Git Credential Manager → OAuth 토큰 → GitHub
```

<br/>

* **Remote HTTPS 설정변경**     

```
> git remote set-url origin https://github.com/JeonghunLee/vscode_doc

> git remote -v       
origin  https://github.com/JeonghunLee/vscode_doc (fetch)
origin  https://github.com/JeonghunLee/vscode_doc (push)
```

<br/>

 

<br/>


