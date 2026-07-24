# VSCode

<br/>



<br/>

---

## VSCode-Extension

<br/>


![](./imgs/vscode_ex_install_00.png)
![](./imgs/vscode_ex_install_01.png)
![](./imgs/vscode_ex_install_02.png)
![](./imgs/vscode_ex_install_03.png)
![](./imgs/vscode_ex_install_04.png)
![](./imgs/vscode_ex_install_05.png)


<br/>

---

###  Git Graph

<br/>

!!! tip "Git History 분석" 
    - Remote Respository 분석  

<br/>

* Git Graph Extension  
![](./imgs/vscode_ex_gitgraph_00.png) 
![](./imgs/vscode_ex_gitgraph_01.png) 


* Git Graph Remote   
![](./imgs/vscode_ex_gitgraph_02.png) 

<br/>

---



###  Github  

<br/>

!!! tip "GitHub Pull Request/Issue" 
    - Pull Request  연동  
    - Issue 연동

!!! warning "Github 인증확인" 
    - [Github 인증 확인 필요](vscode_github.md#vscode-github-account) 


* **Github Extension**        
VS Code에서 쉽게 사용가능한 Github 의 기능   
![](./imgs/vscode_ex_github_00.png)



<br/>

---

###  Github Action  

<br/>

* **Github Action Extension**        
VS Code에서 쉽게 사용가능한 Github 의 기능   
![](./imgs/vscode_ex_github_01.png) 

!!! warning "Github 인증 다중으로 변경" 

<br/>

---

###  Continue   

<br/>

* **Continue Extension**        
VS Code Extension Marketplace에서 검색하여 설치 가능  
ollama 와 같이 내부 LLM을 사용가능한 VS Code의 Extension으로 아래와 같이 쉽게 설정   

<br/>

* **ollama 설치**  
pull 각 원하는 LLM 설치 
```
> ollama list
NAME                       ID              SIZE      MODIFIED     
nomic-embed-text:latest    0a109f422b47    274 MB    28 hours ago    
qwen2.5-coder:3b           f72c60cabf62    1.9 GB    29 hours ago    
```

<br/>

* **Continue Extension Config**    
![](./imgs/vscode_ex_continue_00.png)  
![](./imgs/vscode_ex_continue_01.png)  
```
name: Main Config
version: 1.0.0
schema: v1
models:
  - name: Qwen2.5-Coder 3B
    provider: ollama
    model: qwen2.5-coder:3b
    roles:
      - chat
      - edit
      - apply
      - autocomplete

  - name: Nomic Embed
    provider: ollama
    model: nomic-embed-text:latest
    roles:
      - embed

```

<br/>

* **Continue Agent**   
![](./imgs/vscode_ex_continue_02.png)  

<br/>

---

###  Python  

<br/>

* Python 관리    
![](./imgs/vscode_ex_python_00.png)  
![](./imgs/vscode_ex_python_01.png)  


<br/>

---


###  Better Comments

<br/>

* C/C++ 주석 가독성    
![](./imgs/vscode_ex_bettercoments_00.png)  


<br/>

---



## Check Extensions

<br/>

VS Code에 설치되어진 Extensions 들을 확인하고 각 부분의 버전을 확인   

<br/>

---

### Extensions A

<br/>

* **CMD** in Window          
VS Code에 설치되어진 Extensions   
```
C:\Users\LeeJeongHun> code --list-extensions
alefragnani.project-manager
anthropic.claude-code
codexbuild.codex-build
codezombiech.gitignore
continue.continue
davidanson.vscode-markdownlint
donjayamanne.githistory
github.github-vscode-theme
github.remotehub
github.vscode-github-actions
github.vscode-pull-request-github
gruntfuggly.todo-tree
mhutchie.git-graph
ms-edgedevtools.vscode-edge-devtools
ms-python.debugpy
ms-python.python
ms-python.vscode-pylance
ms-python.vscode-python-envs
ms-toolsai.jupyter
ms-toolsai.jupyter-keymap
ms-toolsai.jupyter-renderers
ms-toolsai.vscode-jupyter-cell-tags
ms-toolsai.vscode-jupyter-slideshow
ms-vscode-remote.remote-ssh
ms-vscode-remote.remote-ssh-edit
ms-vscode-remote.remote-wsl
ms-vscode.azure-repos
ms-vscode.cpptools
ms-vscode.cpptools-themes
ms-vscode.hexeditor
ms-vscode.powershell
ms-vscode.remote-explorer
ms-vscode.remote-repositories
ms-vscode.vscode-serial-monitor
nvidia.nsight-copilot
nvidia.nsight-vscode-edition
openai.chatgpt
wayou.vscode-todo-highlight
ziyasal.vscode-open-in-github
```

<br/>

* **CMD** in Window          
VS Code에 설치되어진 Extensions 과 Version  
```
C:\Users\LeeJeongHun>code --list-extensions --show-versions
alefragnani.project-manager@13.1.0
anthropic.claude-code@2.1.218
codexbuild.codex-build@0.5.7
codezombiech.gitignore@0.10.0
continue.continue@2.0.0
davidanson.vscode-markdownlint@0.61.2
donjayamanne.githistory@0.6.20
github.github-vscode-theme@6.3.5
github.remotehub@0.64.0
github.vscode-github-actions@0.32.3
github.vscode-pull-request-github@0.160.0
gruntfuggly.todo-tree@0.0.226
mhutchie.git-graph@1.30.0
ms-edgedevtools.vscode-edge-devtools@2.1.10
ms-python.debugpy@2026.6.0
ms-python.python@2026.4.0
ms-python.vscode-pylance@2026.3.1
ms-python.vscode-python-envs@1.36.0
ms-toolsai.jupyter@2025.9.1
ms-toolsai.jupyter-keymap@1.1.2
ms-toolsai.jupyter-renderers@1.3.0
ms-toolsai.vscode-jupyter-cell-tags@0.1.9
ms-toolsai.vscode-jupyter-slideshow@0.1.6
ms-vscode-remote.remote-ssh@0.124.0
ms-vscode-remote.remote-ssh-edit@0.87.0
ms-vscode-remote.remote-wsl@0.104.3
ms-vscode.azure-repos@0.40.0
ms-vscode.cpptools@1.33.4
ms-vscode.cpptools-themes@2.0.0
ms-vscode.hexeditor@1.11.1
ms-vscode.powershell@2025.4.0
ms-vscode.remote-explorer@0.5.0
ms-vscode.remote-repositories@0.42.0
ms-vscode.vscode-serial-monitor@0.13.251128001
nvidia.nsight-copilot@2026.1.19
nvidia.nsight-vscode-edition@2025.1.36067579
openai.chatgpt@26.721.30844
wayou.vscode-todo-highlight@1.0.5
ziyasal.vscode-open-in-github@1.3.6
```
<br/>

---

### Extensions B

<br/>

* **CMD** in Window          
VS Code에 설치되어진 Extensions 과 Version  
```
>code --list-extensions --show-versions
aaron-bond.better-comments@3.0.2
anthropic.claude-code@2.1.218
bierner.markdown-mermaid@1.32.1
chekweitan.compare-view@0.14.1
christian-kohler.npm-intellisense@1.4.5
codezombiech.gitignore@0.10.0
donjayamanne.githistory@0.6.20
eamodio.gitlens@18.3.0
espressif.esp-idf-extension@2.1.0
espressif.esp-idf-web@0.0.4
github.codespaces@1.18.15
github.github-vscode-theme@6.3.5
github.remotehub@0.64.0
github.vscode-github-actions@0.32.3
github.vscode-pull-request-github@0.160.0
google.colab@0.8.1
lextudio.restructuredtext@190.4.12
mhutchie.git-graph@1.30.0
moshfeu.compare-folders@0.30.0
ms-azuretools.vscode-azure-github-copilot@1.0.209
ms-azuretools.vscode-azure-mcp-server@2.0.46
ms-azuretools.vscode-azureresourcegroups@0.12.7
ms-azuretools.vscode-containers@2.4.5
ms-edgedevtools.vscode-edge-devtools@2.1.10
ms-python.debugpy@2026.6.0
ms-python.python@2026.4.0
ms-python.vscode-pylance@2026.3.1
ms-python.vscode-python-envs@1.36.0
ms-toolsai.jupyter@2025.9.1
ms-toolsai.jupyter-keymap@1.1.2
ms-toolsai.jupyter-renderers@1.3.0
ms-toolsai.vscode-jupyter-cell-tags@0.1.9
ms-toolsai.vscode-jupyter-slideshow@0.1.6
ms-vscode-remote.remote-containers@0.466.0
ms-vscode.azure-repos@0.40.0
ms-vscode.cmake-tools@1.23.52
ms-vscode.cpp-devtools@0.5.13
ms-vscode.cpptools@1.32.2
ms-vscode.cpptools-extension-pack@1.5.1
ms-vscode.cpptools-themes@2.0.0
ms-vscode.remote-repositories@0.42.0
ms-vscode.vscode-github-issue-notebooks@0.0.134
ms-windows-ai-studio.windows-ai-studio@1.6.5
openai.chatgpt@26.5721.30844
vscjava.migrate-java-to-azure@1.22.0
```
<br/>

---

### Extensions Functions 

<br/>

* **Ctrl + Shift +p**    
각 전체기능을 쉽게 검색 및 찾기 
![](./imgs/vscode_05.png)  

<br/>

---



## VSCode Remote Explore 

<br/>

!!! tip "SSH 설정" 
    - SSH 설정기반으로 확인 가능 
    - SSH 기반의 설정의 Repository 파악 
    - WSL 도 파악  

!!! warning "Git 설정확인 필요"
    - Remote 설정 확인 (여기 설정과 실제 Git 설정이 다를 수 있음)
    - [Git Local 확인](git_setup_project.md#check-git-local)
    - [2개의 계정 SSH Config B](git_setup_default.md#ssh-config-b)   

<br/>

![](./imgs/vscode_remote_00.png)


<br/>

---



## VSCode TEST

<br/>


* **Python TEST**   
    * **pytest**  : 대부분 임베디드에서 많이 사용 
        * 추후 sales 와 같이 사용도 가능하며 C/C++ TEST도 가능   
        * 즉 Logic Analyer 같이 사용가능   
    * python unittest : 거의 사용안함  

![](./imgs/vscode_test_00.png)






<br/>

---
