FROM centos:7
      
RUN yum clean all -y && \
  yum install -y git && \
  yum install -y nginx && \
  yum clean all -y

RUN mkdir /root/app
WORKDIR /root/app


USER 1001
EXPOSE 8080
ENTRYPOINT ["nginx"]

