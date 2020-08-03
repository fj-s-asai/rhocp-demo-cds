FROM centos:7
      
RUN yum clean all -y && \
  yum install -y nginx
  

RUN sed -i 's/^\s*listen\s.*/ listen 8080/' /etc/nginx/conf.d/default.conf && \
    sed -i 's/^\s*root\s.*/ root \/demo/rhocp-contents' /etc/nginx/conf.d/default.conf
    

USER 1001
EXPOSE 8080
ENTRYPOINT ["nginx"]

