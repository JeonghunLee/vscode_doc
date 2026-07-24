# Setup GIT 

<br/>


복수 계정을 위해서 설명

* **테스트 결론**     
    1. HTTPS 1개 설정 : 개인 설정   
    2. SSH 1개 설정 : 공용 설정   
        - SSH 2개 설정 : 미권장  

---

## Setup GIT

<br/>


 아래와 같이 HTTPS or SSH로 Git을 설정을하는데, 주로 SSH로 진행을 많이 한다. 

<br/>


* HTTPS
```
Git → Git Credential Manager → OAuth 토큰 → GitHub
```

!!! tips "HTTPS PAT 생략 "
    - PAT 부분은 생략하며, VS Code에서 진행을 하면 브라우저가 필요 할 것임  
        - 원래는 브라우저가 필요 없음   


<br/>

* SSH
```
Git → SSH 클라이언트 → 개인키 → GitHub
```
<br/>



## Setup SSH 

<br/>

* Gihub 사이트 SSH Key 등록         
pub Key 등록     
https://github.com/settings/keys


<br/>

### Multi Accounts  

<br/>

!!! tip "SSH Key 2개 생성 "
    - RSA 보다는 기본적은 ed25519

!!! warning "미권장"
    - [Github Action 미동작](#setup-config-a)
    - 1개의 SSH로 그냥 사용하길 권장   

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

---

### Setup Config A    

<br/>

기본적으로 SSH Config 존재하지 않으며, 2개의 설정할 경우 별도로 생성   
**Github Action 동작이 안됨** 

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

!!! warning "Github Action 동작안됨"
    - 상위처럼 2개로 완벽히 나누면 안됨 

<br/>

---

### Setup Config B    

<br/>

기본적으로 SSH Config 존재하지 않으며, 2개의 설정할 경우 별도로 생성  
**1개의 SSH 로 사용하는 것은 권장** 

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

!!! warning "Host github.com default 설정"
    - 1개의 Git만 허용하는 듯 하며 default 사용해야함  


<br/>

* **ssh/config 설정**      
기본적으로 .ssh/config 가 설정이 안되므로 아래와 같이 강제설정    
**git config --local core.sshCommand 설정필요**     
```
git config --local core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe -F C:/Users/LeeJeongHun/.ssh/config"
```

<br/>

* **VSCode - Remote Exploer**          
SSH 설정 과 Remote 쉽게 확인가능  
![](./imgs/vscode_remote_00.png)   

<br/>

---

## Setup HTTPS 

<br/>

* HTTPS 기본구조 
```
Git → Git Credential Manager → OAuth 토큰 → GitHub
```

<br/>

!!! tip "Browser 인증"
    - Git Credential Manager 의 경우, Browser로 인증     

[Browser 기본앱 변경](./vscode_github.md#default-browser)   

<br/>

---

### GCM

<br/>

GCM: Git Credential Manager 


* **GCM Log Out**      
계정이 다를 경우, 다시 Brwser 기반으로 다시 인증 
```
git credential-manager github logout "Jeonghun-DYNE"
```

<br/>
