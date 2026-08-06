# How To use VS Code 




## Setup Envs

```
python -m venv .venv
```

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
.\.venv\Scripts\Activate.ps1
```

```
(.venv) PS D:\Works\git\Info_jetson> pip install -r requirements.txt
```

## Check mkdcos 


```
(.venv) PS D:\Works\git\Info_jetson> pip list
Package                    Version
-------------------------- -----------
babel                      2.18.0
backrefs                   7.0
beautifulsoup4             4.15.0
certifi                    2026.6.17
charset-normalizer         3.4.7
click                      8.4.1
colorama                   0.4.6
EditorConfig               0.17.1
ghp-import                 2.1.0
idna                       3.18
Jinja2                     3.1.6
jsbeautifier               1.15.4
Markdown                   3.10.2
MarkupSafe                 3.0.3
mergedeep                  1.3.4
mkdocs                     1.6.1
mkdocs-get-deps            0.2.2
mkdocs-material            9.7.6
mkdocs-material-extensions 1.3.1
mkdocs-mermaid2-plugin     1.2.3
packaging                  26.2
paginate                   0.5.7
pathspec                   1.1.1
pip                        26.1.2
platformdirs               4.10.0
Pygments                   2.20.0
pymdown-extensions         10.21.3
python-dateutil            2.9.0.post0
PyYAML                     6.0.3
pyyaml_env_tag             1.1
requests                   2.34.2
setuptools                 82.0.1
six                        1.17.0
soupsieve                  2.8.4
typing_extensions          4.15.0
urllib3                    2.7.0
watchdog                   6.0.0
```

## Build mkdocs 


``` 
mkdocs serve
```

mermaid is not working 
```
mkdocs build 
```
...


## Electron 


* Setting   
electron_package.ps1
```
cp main.js site/
cp package.json site/
cd site 

npm install 
npm run dist  or npm start 
```

* node.js 
```
main.js
package.json
```


## pandoc

Step 1: Install pandoc in Window
```
winget install --id JohnMacFarlane.Pandoc -e
```
```
pandoc --version
```

Step 2: Setup refrece.docx or pptx in Window

```
pandoc -o reference.docx --print-default-data-file reference.docx
```
```
pandoc -o reference.pptx --print-default-data-file reference.pptx
```

docx/pptx 의 경우, zip으로 되어있으며, 이를 풀면 XML 기반으로 확인  
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





Step 3: Convert markdown to pptx 

```
pandoc .\docs\index.md `
  --slide-level=2 `
  --resource-path=".;.\docs" `
  -o .\output\index.pptx
```

Step 3: Convert markdown to docx 
```
pandoc `
  .\docs\index.md `
  --toc `
  --number-sections `
  --reference-doc=.\docx\reference.docx `
  --resource-path=".;.\docs" `
  -o .\output\index.docx
```

## mermaid 


Convert markdown to svg

```
npx -p @mermaid-js/mermaid-cli mmdc `
  -i .\docx\mmd\test.md `
  -o .\docx\imgs\test.svg `
  -b transparent
```