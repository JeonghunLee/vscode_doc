# MSTeams

<br/>

!!! tip "Notification" 
    * Slack Channel 구독 처럼 각 기능을 자동화에 연결할 방법을 모색  


## Slack 

<br/>

* Slack 변화 
이전과 다르게 많은 무료기능이 줄어 Slack 사용 대신 MS Teams 최대한 활용방법 모색    
https://slack.com/intl/ko-kr/pricing  


!!! tip "Slack"
    * 이전과 다르게 무료Free 로 최대 90일까지만 사용 


<br/>

---

## MS Teams 

<br/>

!!! tip "MS Teams"
    * Channel을 간단히 구독기능으로 사용하려고 방법모색   

<br/>

---


### Workflows 

<br/>

* **Workflows(Power Automate)**       
Github 와 Workflow 연결    
    https://support.microsoft.com/en-us/workflows/send-messages-in-teams-using-incoming-webhooks


!!! tip "MS Teams Workflow"   
    * **Power Automate** : Microsoft에서 제공하는 Workflow 서비스 
    * MS Teams 의 Copoliot 에게 질문하면 자세히 알려줌 
    * 문제점: OAuth가 필수 인듯하며, 사용하기가 복잡함  

<br/>

---

### Webhook Bot

<br/>


상위로 하면, oAuth 인증을 통해 외부에서 접근을 해야 하므로,     
매번 제한이 되므로, 별도의 Webhook Bot 이용하여 쉽게 curl을 사용하여 전달  

<br/>

* **MS Teams 팀 구성**     
MS Teams는 팀 내에 채널이 존재하는 구성이므로, 별도의 Channel을 생성하여 존재가 안되어짐   
```
Notify ->  MSteams 팀구성   
├─ GitHub        -> Shared Channel , (Webhook Bot )
├─ Jenkins
├─ Build-Test
├─ Release
└─ System
```

<br/>

!!! tip "MS Teams Channel"
    * MS Teams의 Channel 은 게시물만 존재하지 않으며, 별도의 각 기능이 존재


<br/>

---


