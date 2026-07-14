# GIT 설정 

<br/>


<br/>

## 1. GIT의 기본설정 

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



## 2. SSH 설정 

<br/>

* Gihub 사이트 SSH Key 등록         
pub Key 등록     
https://github.com/settings/keys


<br/>

### 2.1 SSH 2개 설정 

<br/>

!!! tip "SSH Key 생성 "
    - RSA 보다는 기본적은 ed25519

<br/>      

```
~/.ssh/id_ed25519_company
~/.ssh/id_ed25519_company.pub
```

<br/>

```
~/.ssh/id_ed25519_personal
~/.ssh/id_ed25519_personal.pub
```
<br/>

### 2.2 SSH Config 생성 및 설정 

<br/>

!!! tip ".ssh/config"
    - 2개 이상 설정할 경우에만 필요  
    - 그전에는 기본적으로 없음   

<br/>

* **~/.ssh/config**   
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

<br/>


* **~/.ssh/config 변경**         
문제는 없으나, 개인을 HTTPS로 사용하는게 낫을 듯 싶음  
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

<br/>

* **ssh/config 설정**      
기본적으로 .ssh/config 가 설정이 안되므로 아래와 같이 강제설정    
**git config --local core.sshCommand 설정필요**     
```
git config --local core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe -F C:/Users/LeeJeongHun/.ssh/config"
```

<br/>

## 3. HTTPS 설정 

<br/>

* HTTPS 기본구조 
```
Git → Git Credential Manager → OAuth 토큰 → GitHub
```

<br/>

!!! tip "Browser 인증"
    - Git Credential Manager 의 경우, Browser로 인증     

[Browser 기본앱 변경](./index.md#2vscode-browser)   

<br/>

### 3.1 GCM

<br/>

* **GCM Log Out**      
계정이 다를 경우, 다시 Brwser 기반으로 다시 인증 
```
git credential-manager github logout "Jeonghun-DYNE"
```
<br/>
