FROM centos:7
RUN yum update -y && \
    yum install openssh-server -y && \
    yum install passwd -y

RUN useradd remote_user && \
    echo "admin" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh 

COPY ./remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown -R remote_user:remote_user /home/remote_user/.ssh && \
    chmod 600 /home/remote_user/.ssh/authorized_keys   

RUN /usr/sbin/sshd-keygen 
CMD /sbin/sshd -D

RUN yum install mysql -y && \
    yum install awscli -y
