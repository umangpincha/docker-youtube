FROM node:alpine as teamalpha
WORKDIR /var/app
COPY package.json .
ENV CI=true
RUN npm install
COPY . .
CMD ["npm" , "run" , "build"]

FROM nginx 
EXPOSE 80
COPY --from=teamalpha /var/app/build /usr/share/nginx/html

