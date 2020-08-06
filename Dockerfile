FROM centos:7

RUN touch /etc/yum.repos.d/nginx.repo && \
    echo "[nginx]" >> /etc/yum.repos.d/nginx.repo && \
    echo "name=nginx repo" >> /etc/yum.repos.d/nginx.repo && \
    echo "baseurl=http://nginx.org/packages/centos/7/x86_64/" >> /etc/yum.repos.d/nginx.repo && \
    echo "gpgcheck=0" >> /etc/yum.repos.d/nginx.repo && \
    echo "enabled=1" >> /etc/yum.repos.d/nginx.repo

      
RUN yum clean all -y && \
  yum install -y nginx
  

RUN sed -i 's/^\s*listen\s.*/ listen 8080/' /etc/nginx/conf.d/default.conf && \
    sed -i 's/^\s*root\s.*/ root \/demo\/contents/' /etc/nginx/conf.d/default.conf
    

USER 1001
EXPOSE 8080
ENTRYPOINT ["nginx"]

