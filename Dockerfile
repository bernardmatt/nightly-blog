# Stage 1: Build MkDocs site
FROM python:3.11-slim AS builder
WORKDIR /src
COPY . .
RUN pip install mkdocs
RUN mkdocs build -f mkdocs.yml

# Stage 2: Serve with Nginx
FROM nginx:alpine
COPY --from=builder /src/site /usr/share/nginx/html