FROM node:22.16.0-alpine@sha256:9f3ae04faa4d2188825803bf890792f33cc39033c9241fc6bb201149470436ca AS build

WORKDIR /app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm run lint

RUN npm run test

RUN npm run build
RUN npm run build-storybook

FROM nginx:1.28.0-alpine@sha256:aed99734248e851764f1f2146835ecad42b5f994081fa6631cc5d79240891ec9

COPY --from=build /app/dist /usr/share/nginx/html
COPY --from=build /app/storybook-static /usr/share/nginx/html/storybook

RUN sed -i '/location \/ {$/i \ \ \ \ absolute_redirect off;' /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
