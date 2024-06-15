FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install 

COPY . .

RUN npm run build
## Burası /app/build diye bir klasör oluşturdu, soldaki build dosyamdan da anlayacağın üzere

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# yukarıya as builder dedik ya, git oradaki app/build klasörünü al usr/.. o kısıma kopyala 

#Böylece build edilen klasör artık çalışabiliyor.

