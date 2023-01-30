FROM node:16

# Create app directory
WORKDIR ./

# Install app dependencies
COPY package*.json ./

RUN yarn install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "node", "app.js" ]