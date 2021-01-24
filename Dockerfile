#builder is specifying the phase  
FROM node:alpine as builder

WORKDIR '/app'

COPY  package.json .

RUN npm install

COPY . .

RUN ["npm" , "run",  "build"]

#second phase 
FROM nginx 
EXPOSE 80
#copy from earlier phase builder
COPY --from=builder /app/build /usr/share/nginx/html



