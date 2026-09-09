## Pandoc

<br/>

Mkdocs 중 문서 중 Markdown으로 된 문서를 쉽게 DOCX / PPTX 혹은 다양한 포맷으로 변경가능한 Tool이며,   
아래의 설명과 같이 다양한 기능을 제공을 해준다.   

[https://pandoc.org/](https://pandoc.org/) 


> NOTE
> 
> Markdown을 쉽게 변경을 가능하지만, Mermaid 나 UML 미지원  
> Pandoc를 이용하여 문서를 만들고자 하면 각 Mermaid 나 UML는 우선 SVG or PNG 그림파일로 변경  
>

<br/>

### Mkdocs to Pandoc

<br/>

> NOTE
>
> 가능하면, ">" 기반으로 경고문을 작성 
>

<br/>

> NOTE
> 
>   A. !!! tips/success/note "" 대신 전부 > 변경  
>    
>    "<br/>" 
>    " --- "    : HTML 괜찮으나, --- 로 문서의 질이 떨어짐 
>


<br/>

## Install pandoc 

<br/>

현재 Window에서만 사용을 주로해서 아래와 같이 Window에서 쉽게 설치 

<br/>

### Windows

<br/>

* Install pandoc in Windows
```
winget install --id JohnMacFarlane.Pandoc -e
```

<br/>

* Check pandoc
```
pandoc --version
```

> NOTE
>
> Markdown to Docx/PPTx 변경"
>     쉽게 Docx 와 PPTx 변경  
>     DOCX/PPTX 은 XML 기반이므로 가능하지만, 뒤에 X가 빠지면 안됨 

<br/>

**아래 TEST 를 위해서 --- 추가함**   

<br/>

---

## Make Reference

<br/>


Reference docx 와 pptx 파일생성 방법이지만, **솔직히 Reference 파일은 필요 없을 듯하다.**   

<br/>

* **Reference docx/pptx file**  

<br/>

```
pandoc -o reference.docx --print-default-data-file reference.docx
```

<br/>

```
pandoc -o reference.pptx --print-default-data-file reference.pptx
```

<br/>

* Reference File
    * 상위 파일을 만든 후, 각 폰트를 변경하고 본인 스타일로 수정
    * docx 와 pptx 가능한 이유는 XML기반

<br/>

![](./imgs/tool_pandoc_docx_00.png)
![](./imgs/tool_pandoc_ppt_00.png)


<br/>

### 머리글/바닥글 

<br/>

![](./imgs/tool_pandoc_docx_01.png)



* **자동 페이지**   
삽입 → 페이지 번호 → 페이지 아래쪽/위쪽 → “X/Y 형식  
Page { PAGE } of { NUMPAGES }
{ PAGE } / { NUMPAGES }

![](./imgs/tool_pandoc_docx_04.png)  

<br/>

### Modify Reference 

<br/>

Reference 파일을 한번에 완성하기는 힘들면, 아래와 같이 반복 진행하며, 상위처럼 Reference 파일 만들기 보다       
**기존에 본인이 사용하는 것을 Reference 파일을 이용하는 게 더 빠름**   

<br/>

가능하다면, 기존파일을 아무거나 사용하고 싶은 것을 가져와서 Reference하는 게 더 좋음 

<br/>


* STEP.1 : Convert to DOCX 파일 생성 (reference 이용)
* STEP.2 : 상위 Output의 tool_pandoc.docx 파일을 수정  
    * Ctrl+Alt+Shift+S : 스타일 수정 나옴 (각 스타일 서식구조를 변경)   
    * 각 원하는 서식에서 우측버튼 -> 스타일 -> 원하는 스타일 선택 -> 스타일 적용 

<br/>

### Modify Style 

<br/>

**Pandoc에서 사용하는 스타일 서식을 본인 스타일의 서식으로 변경**   

<br/>

* docx 파일 스타일 수정    
    * 스타일에서 각 pandoc의 **스타일 이름** 찾기  
        * e.g. 제목2, 제목3, Compact, Source Code, Table  
    * **스타일 적용** 수정으로 모든 포맷 교정  

![](./imgs/pandoc_docx_00.png)
![](./imgs/pandoc_docx_03.png) 

* **스타일 수정 -> TOC 제목** 
    * 스타일 이름: TOC 제목   
    * 서식 : 한글 -> 모든언어 
![](./imgs/pandoc_docx_01.png)

* **스타일 수정->Source Code** 
    * 스타일 이름: Source Code   
    * 서식 : 한글 -> 모든언어 
![](./imgs/pandoc_docx_02.png)

<br>

### Modify Style-Font  

<br/>

**Pandoc에서 사용하는 스타일 서식을 본인 스타일의 서식으로 변경**

>  중요사항 
>
> 아래의 스타일에서 폰트가 겹치면 안됨 


* **스타일 수정->제목 2**    
아래와 같이 폰트가 겹치는 경우가 발생   
![](./imgs/pandoc_docx_11.png)  
    * **글꼴 -> 원하는 글꼴 설정** 
![](./imgs/pandoc_docx_12.png)  
    * **폰트 충돌 없음** 
![](./imgs/pandoc_docx_13.png)  

<br/>

* **TOC 문제**     
    * 제목 1 하이퍼링크   
    * 제목 2 하이퍼링크  
상위를 수정을 했다고 해서, TOC의 하이퍼링크도 개별로 적용해서 해야한다. 

<br/>

### Modify Matrix 

<br/>

* **테이블디자인 -> 표스타일**  
![](./imgs/pandoc_docx_04.png)  
![](./imgs/pandoc_docx_05.png)  

<br/>

아래에서 최종 표스타일 수정 

* **스타일 수정-Table-표전체**   
    * **스타일이름: Table** : 이 이름을 찾아서 매번 스타일 서식을 변경하는 것이 목적     
    * **스타일기준**: 외부에 이미 설정된 스타일을 가져오는 것으로 수정중이라면 변경하지 않는 것이 좋음       
    * 서식 : 한글 -> 모든언어       
![](./imgs/pandoc_docx_06.png)  
![](./imgs/tool_pandoc_docx_02.png)  
![](./imgs/tool_pandoc_docx_03.png)  

<br/>

* **스타일 수정-Table-머리글행**    
    * **스타일이름: Table** 
    * 서식 적용대상: 표전체 -> 머리글행  
    * 서식 : 한글 -> 모든언어       
![](./imgs/pandoc_docx_07.png)  


<br/>
<br/>

| TEST |  TEST |  TEST | 
| ---  | ----- |  ----| 
| TEST |  TEST |  TEST | 
| TEST |  TEST |  TEST | 
| TEST |  TEST |  TEST | 
| TEST |  TEST |  TEST | 


<br/>

### Modify TOC 

<br/>

* **목차-> 사용자지정목차**   
    * 우측 목차1 ~ 8 의 크기 및 폰트 수정   
    * 수준표시 와 표시방법 
![](./imgs/pandoc_docx_08.png)  

* **목차 1 -> 단락**    
단락을 선택하여 각 간격 조절  
![](./imgs/pandoc_docx_15.png)  

<br/>

* **TOC 제목**   
Table of Contents 수정 
![](./imgs/pandoc_docx_09.png)  

<br/>

* **하이퍼링크**   
각 항목은 각 제목의 하이퍼 링크로 되어있어, 각 제목의 폰트를 그대로 적용되어진다. 
**같은 하이퍼 링크지만, 각 제목 1,2에 따라 다 확인**  
    * 제목 1 -> 하이퍼 링크  
    * 제목 2 -> 하이퍼 링크 
![](./imgs/pandoc_docx_14.png)  

<br/>



<br/>

* **목차업데이트**    
각 폰트 변경을 재확인을 해야함. 즉 1개의 **제목 1** 스타일 수정을 했다고, 전체 제목 1의 스타일 변경되지 않는다. 
![](./imgs/pandoc_docx_10.png)  


<br/>

## Check DOCX/PPTX

<br/>

* **DOCX/PPTX 의 구성**  
zip으로 되어있으며, 이를 풀면 XML 기반으로 쉽게 확인가능   

```
tar -tf .\reference.docx | Select-Object -First 10
```

```
tar -tf .\reference.docx 
```

```
[Content_Types].xml
_rels/.rels
docProps/app.xml
docProps/core.xml
docProps/custom.xml
word/document.xml
word/fontTable.xml
word/footnotes.xml
word/comments.xml
word/numbering.xml
```

<br/>
<br/>

### Check XML 

<br/>

**XML기반으로 세부분석**  

* styles.xml 내용확인 
```
tar -xf .\reference.docx -O word/styles.xml
```

<br/>

* 압축풀기   
압축을 풀면 다양한 XML과 Directory가 나옴 
```
tar -xf .\reference.docx 
```

<br/>

---

## Pandoc Build 

### Convert to PPTX

<br/>

* Convert markdown to pptx    
간단히 변경가능하지만, 사용의미가 없음  
```
pandoc .\docs\index.md `
  --slide-level=2 `
  --resource-path=".;.\docs" `
  -o .\output\index.pptx
```

<br/>

* Convert markdown to pptx   
Reference 이용    
```
pandoc .\docs\index.md `
  --slide-level=2 `
  --reference-doc=.\docx\reference.pptx `
  --resource-path=".;.\docs" `
  -o .\output\index.pptx
```


<br/>






### Convert to DOCX

<br/>

* Convert markdown to docx 
```
pandoc `
  .\docs\index.md `
  --toc `
  --number-sections `
  --reference-doc=.\docx\reference.docx `
  --resource-path=".;.\docs" `
  -o .\output\index.docx
```

<br/>

* Convert markdown to docx 
```
pandoc `
  .\docs\tool_pandoc.md `
  --toc `
  --number-sections `
  --reference-doc=.\docx\tool_pandoc.docx `
  --resource-path=".;.\docs" `
  -o .\output\tool_pandoc.docx
```

<br/>


## Mermaid Build 

<br/>

Node.js가 설치되어있다면, npx가 존재  

[Go to Node.js](./node_mermaid.md#mermaid-build)

<br/>

* Pandoc    
**Pandoc is not support mermaid**    
Pandoc는 Mermaid가 미지원하므로, 이를 SVG를 변경 후 진행    

All Pandoc need Converting 
```
npx --help
```

* Check package.json     
주석을 사용하면 안됨  

<br/>

### Convert Mermaid to SVG

<br/>


* Convert Markdown(mmd) to svg

```
npx -p @mermaid-js/mermaid-cli mmdc `
  -i .\docx\mmd\test.md `
  -o .\docx\imgs\test.svg `
  -b transparent
```

```
npx -p @mermaid-js/mermaid-cli mmdc `
  -i .\docx\mmd\test_general.md `
  -o .\docx\imgs\test_general.svg `
  -b transparent
```

```
npx -p @mermaid-js/mermaid-cli mmdc `
  -i .\docx\mmd\test_handdrawn.md `
  -o .\docx\imgs\test_handdrawn.svg `
  -b transparent
```
<br/>

## Lua Filter 

<br/>

* Check Pandoc Version and Lua Filter Engine
```
pandoc --version
pandoc 3.10
Features: +server +lua
Scripting engine: Lua 5.4
User data directory: C:\Users\LeeJeongHun\AppData\Roaming\pandoc
Copyright (C) 2006-2025 John MacFarlane. Web:  https://pandoc.org
This is free software; see the source for copying conditions. There is no
warranty, not even for merchantability or fitness for a particular purpose.
```

<br/>

* **Markdown**    
아래와 같이 Lua Filter 와 **인식자/구분자** 정하고, 그에 맞게 Lua filter Script 작성  
꼭 **:::** 필요는 없으며 각 부분을 정하고 하면 됨 

<br/>

아니면, 인식자/구분자 없이 무조건적으로 넣는 것을 해도 될 듯하다. 

<br/>

가급적 **Markdown에서 사용하는 인식자/구분자 중복을 피하는 것** 이 좋은 것 같다.  

<br/>

> **DOCX**  
>
> **아래의 예제는 DOCX 기준이나 HTML 기준으로 작성할 수 있다.**     

<br/>

> **HTML**
>
> Lua Filter Script을 보면 div 기반으로 사용하므로, DOCX가 아니라면,   
> HTML 로 한다면, CSS까지 나중에 고려 해도 될 듯하다. 

<br/>

### Lua Filter Script-A

<br/>

* **TEST Lua Filter-1**

::: {.signature}
:::


<br/>

> 상위 구분자 와 Lua Filter and Metadata    
>
> 1. **lua/signature.yaml**     // Metafile 에서 각 데이타 정보 추출     
> 2. **lua/signature.lua**  // 상위 Metafile 정보 기반으로 적용      
>   
> **즉 yaml 정보파일 (Metafile은 YAML로 이용) 과 정보 image path 이용**    
> **yaml 내의 이미지 위치 PATH는 반드시 Project 기반** 이유는 Task에서 실행하기 때문에  

<br/>

* **docx/tool_pandoc_lua.docx**     
**pandoc result**   // pandoc 실행 결과 
![](./imgs/pandoc_docx_16.png)

<br/>

### Lua Filter Script-B

<br/>

* **TEST Lua Filter-2**

아래 소스 위치를 --resource-path 찾지 못하고, Project Root 에서 찾음 

::: {.information source=".gitignore" title="Git Ignore"}
:::

> 상위 구분자 와 information.lua    
>    
>   
>  간단히 lua filter만 이용하여 외부파일 읽기  
>  **.gitignore 파일의 위치 PATH는 반드시 Project 기반** 이유는 Task에서 실행하기 때문에  

<br/>

* **docx/tool_pandoc_lua.docx**    
**pandoc result**   // pandoc 실행 결과 
![](./imgs/pandoc_docx_17.png)

<br/>



### Lua Filter Script-C

<br/>

* **TEST Lua Filter-3**

::: {.test-result source="docx/lua/test_result.json"}
:::

<br/>

> 상위 구분자 와 test_result.lua       
>   
>  1. **test_result.json**     
>  2. **test_result.lua**    
>
>  Json 파일을 읽어서, lua filter로 처리하여, Table 생성     
>  **json 파일의 위치 PATH는 반드시 Project 기반** 이유는 Task에서 실행하기 때문에      
> 

<br/>

* **docx/tool_pandoc_lua.docx**      
**pandoc result**   // pandoc 실행 결과 (test_result.lua/test_result.json)      
![](./imgs/pandoc_docx_18.png)

<br/>

### Pandoc Args

<br/>

* **VS Code Task**   
Pandoc args에 아래와 같이 각 Lua filter 적용  
```
                ".\\docs\\tool_pandoc.md",
                "--toc",
                "--number-sections",
                "--metadata-file=.\\docx\\lua\\signature.yaml", //signature.lua meta data 
                "--lua-filter=.\\docx\\lua\\signature.lua",
                "--lua-filter=.\\docx\\lua\\information.lua",  
                "--lua-filter=.\\docx\\lua\\test_result.lua",                                
                "--reference-doc=.\\docx\\reference.docx",
                "--resource-path=.\\docs",
                "-o",``
                ".\\docx\\tool_pandoc.docx"
```


