# GIT 설정 

<br/>

* HTTPS
```
Git → Git Credential Manager → OAuth 토큰 → GitHub
```


* SSH
```
Git → SSH 클라이언트 → 개인키 → GitHub
```
<br/>

## SSH 설정 

<br/>

* Gihub 사이트 SSH Key 등록 
pub Key 등록 
https://github.com/settings/keys


<br/>

## SSH 2개 사용하기 위해 분리 


```
~/.ssh/id_ed25519_company
~/.ssh/id_ed25519_company.pub
```

```
~/.ssh/id_ed25519_personal
~/.ssh/id_ed25519_personal.pub
```

## SSH Config 생성 및 설정 


* ~/.ssh/config 
문제: Github Action 동작이 안됨 
```
Host github-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal

Host github-company
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_company
```

* **~/.ssh/config 변경** 

```
Host github-personal
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal

Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_company
    IdentitiesOnly yes
```

ssh/config 설정 

```
git config --local core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe -F C:/Users/LeeJeongHun/.ssh/config"
```

## HTTPS 



```
git credential-manager github logout "Jeonghun-DYNE"
```