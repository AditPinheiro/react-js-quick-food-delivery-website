
FROM node:13.12.0-alpine


WORKDIR /react-js-quick-food-delivery-website


ENV PATH /react-js-quick-food-delivery-website/node_modules/.bin:$PATH


COPY package.json ./
RUN npm install react
RUN npm install react-scripts@3.4.1 -g --silent

COPY . ./

CMD ["npm", "start"]
