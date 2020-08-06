FROM centos:7

RUN touch /etc/yum.repos.d/nginx.repo && \
    echo "[nginx]" >> /etc/yum.repos.d/nginx.repo && \
    echo "name=nginx repo" >> /etc/yum.repos.d/nginx.repo && \
    echo "baseurl=http://nginx.org/packages/centos/7/x86_64/" >> /etc/yum.repos.d/nginx.repo && \
    echo "gpgcheck=0" >> /etc/yum.repos.d/nginx.repo && \
    echo "enabled=1" >> /etc/yum.repos.d/nginx.repo

      
RUN yum clean all -y && \
  yum install -y nginx
  
    
RUN chgrp -R 0 /etc/nginx && chmod -R g+rwX /etc/nginx && \
    chgrp -R 0 /var/log/nginx && chmod -R g+rwX /var/log/nginx && \
    chgrp -R 0 /var/cache/nginx && chmod -R g+rwX /var/cache/nginx

USER 1001
EXPOSE 8080
ENTRYPOINT ["tail","-f","/dev/null"]

