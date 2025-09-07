FROM node:lts-buster
RUN git clone https://github.com/BilalTech05/BILAL-MD/root/BilalTech05
WORKDIR /BilalTech05
RUN npm install && npm install -g pm2 || yarn install --network-concurrency 1
COPY . .
EXPOSE 9090
CMD ["npm", "start"]
