FROM nginx:alpine

ARG API_BASE_URL
ENV API_BASE_URL=$API_BASE_URL

COPY ./index.html /usr/share/nginx/html/index.html

# Replace {{API_BASE_URL}} in html file with the value stored in env variable API_BASE_URL
# (Note: Because URLs contain slashes (/) we use a colon (,) as delimiter.)
RUN sed -i 's,{{API_BASE_URL}},'"$API_BASE_URL"',g' /usr/share/nginx/html/index.html