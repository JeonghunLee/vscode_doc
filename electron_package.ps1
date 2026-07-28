# site 폴더로 이동
Set-Location .\site

# Electron 실행 파일 복사
Copy-Item ..\main.js .\ -Force

# package.json 복사
Copy-Item ..\package.json .\ -Force

# logo 복사
Copy-Item imgs\logo.jpg .\assets\images\favicon.jpg -Force


#npm start
# package.json 기준으로 Electron 및 Builder 설치
#npm install

# exe 생성
npm run dist

Set-Location .. # 프로젝트 루트로 복귀
