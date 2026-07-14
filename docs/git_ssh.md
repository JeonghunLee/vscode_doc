# GIT 설정 

## SSH 설정 


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

~/.ssh/config

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

상위처럼 쓰면, Github Action 문제 발생 
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