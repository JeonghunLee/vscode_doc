# pandoc


## Setup pandoc

<br/>

* Install pandoc in Window
```
winget install --id JohnMacFarlane.Pandoc -e
```

* check pandoc
```
pandoc --version
```

!!! tip "Markdown to Docx/PPTx 변경"
    - 쉽게 Docx 와 PPTx 변경  
    - DOCX/PPTX 은 XML 기반이므로 가능하지만, 뒤에 X가 빠지면 안됨 
  

<br/>

---

## Make Reference

<br/>




* **Reference docx/pptx file**  
```
pandoc -o reference.docx --print-default-data-file reference.docx
```
```
pandoc -o reference.pptx --print-default-data-file reference.pptx
```
<br/>

!!! tip "Reference File"
    - 상위 파일을 만든 후, 각 폰트를 변경하고 본인 스타일로 수정   

<br/>

---

## Check DOCX/PPTX

<br/>

* **DOCX/PPTX 의 구성**  
zip으로 되어있으며, 이를 풀면 XML 기반으로 쉽게 확인가능   
```
tar -tf .\reference.docx | Select-Object -First 10
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

---

## Covert to DOCX

<br/>

* Convert markdown to pptx 

```
pandoc .\docs\index.md `
  --slide-level=2 `
  --resource-path=".;.\docs" `
  -o .\output\index.pptx
```

<br/>

---

## Covert to PPTX

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

---
