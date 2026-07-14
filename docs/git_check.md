# GIT 설정 

## 1. GIT Setup

<br/>

* Git SSH Setup   
```
git config --global user.name "xxxx" 
git config --global user.email "xxxxx"  
```

<br/>


## 2. GIT Project Setup

<br/>

* **Git SSH Setup**   
```
git config --local user.name "xxxx" 
git config --local user.email "xxxxx"  
```
<br/>

* **GIT Project 확인** 
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


<br/>

### 2.1 GIT Remote-SSH  

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
> git remote set-url origin git@github.com:Jeonghun-DYNE/Info_jetson.git

> git remote -v                                               
origin  git@github.com:Jeonghun-DYNE/Info_jetson.git (fetch)
origin  git@github.com:Jeonghun-DYNE/Info_jetson.git (push)
```

<br/>

### 2.2 GIT Remote-HTTPS  

<br/>

* HTTPS 기본구조 
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

## Git 으로 projetc 확인 




