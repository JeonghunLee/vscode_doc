# GIT 설정 

## SSH 설정 


## SSH config 의 Git 설정 

```
> git remote -v
origin  git@github.com:Jeonghun-DYNE/Info_jetson.git (fetch)
origin  git@github.com:Jeonghun-DYNE/Info_jetson.git (push)
```

```
> git remote set-url origin git@github-company:Jeonghun-DYNE/Info_jetson.git
```

```
> git remote -v                                               
origin  git@github-company:Jeonghun-DYNE/Info_jetson.git (fetch)
origin  git@github-company:Jeonghun-DYNE/Info_jetson.git (push)

> git remote set-url origin git@github.com:Jeonghun-DYNE/Info_jetson.git
```

## Git 으로 projetc 확인 

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


## ssh/config 설정 

```
git config --local core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe -F C:/Users/LeeJeongHun/.ssh/config"
```