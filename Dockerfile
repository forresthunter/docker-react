#This is th build phase to create the content we need for production
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
 #This is the run phase for Nginx
 #--from=0 says we want the results from /app/build after the build (0) phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html