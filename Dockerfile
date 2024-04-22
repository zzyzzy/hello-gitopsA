# Nginx 공식 이미지 베이스 이미지 사용
FROM nginx:latest

# Nginx 설정 파일 복사
# COPY nginx.conf /etc/nginx/nginx.conf

# Nginx가 사용할 웹 콘텐츠 디렉토리
WORKDIR /usr/share/nginx/html

# 웹 콘텐츠 복사 (예시)
COPY nginx/index.html index.html

# Nginx 실행
CMD ["nginx", "-g", "daemon off;"]
