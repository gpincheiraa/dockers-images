FROM ubuntu:14.04

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \
    apt-get update -qq && \
    echo 'Installing OS dependencies' && \
    apt-get install -qq -y --fix-missing sudo software-properties-common git libxext-dev libxrender-dev libxslt1.1 \
        libxtst-dev libgtk2.0-0 libcanberra-gtk-module unzip wget openjdk-7-jdk tomcat7 tomcat7-user maven subversion && \
    echo 'Cleaning up' && \
    apt-get clean -qq -y && \
    apt-get autoclean -qq -y && \
    apt-get autoremove -qq -y &&  \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN echo 'Creating user: DEV' && \
    mkdir -p /home/dev && \
    echo "dev:x:1000:1000:dev,,,:/home/dev:/bin/bash" >> /etc/passwd && \
    echo "dev:x:1000:" >> /etc/group && \
    sudo echo "dev ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev && \
    sudo chmod 0440 /etc/sudoers.d/dev && \
    sudo chown dev:dev -R /home/dev && \
    sudo chown root:root /usr/bin/sudo && \
    chmod 4755 /usr/bin/sudo


# ****************** TOMCAT *************************
RUN tomcat7-instance-create /home/dev/tomcat && \
    chown -R dev:dev /home/dev/tomcat

# Workaround for https://bugs.launchpad.net/ubuntu/+source/tomcat7/+bug/1232258
RUN ln -s /var/lib/tomcat7/common/ /usr/share/tomcat7/common && \
 ln -s /var/lib/tomcat7/server/ /usr/share/tomcat7/server && \
 ln -s /var/lib/tomcat7/shared/ /usr/share/tomcat7/shared

# Use IPv4 by default and UTF-8 encoding. These are almost universally useful.
ENV JAVA_OPTS -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8

# All your base...
ENV CATALINA_BASE /home/dev/tomcat
# **********************************************************


# ****************** INTELLIJ IDE  *************************
RUN mkdir -p /home/dev/.IdeaIC2016.2/config/options && \
    mkdir -p /home/dev/.IdeaIC2016.2/config/plugins

ADD ./run /usr/local/bin/intellij

RUN chmod +x /usr/local/bin/intellij && \
    chown dev:dev -R /home/dev/.IdeaIC2016.2

RUN echo 'Downloading IntelliJ IDEA' && \
    wget https://download.jetbrains.com/idea/ideaIC-2016.2.5.tar.gz -O /tmp/intellij.tar.gz -q && \
    echo 'Installing IntelliJ IDEA' && \
    mkdir -p /opt/intellij && \
    tar -xf /tmp/intellij.tar.gz --strip-components=1 -C /opt/intellij && \
    rm /tmp/intellij.tar.gz

# **********************************************************


# ****************** PERSISTED VOLUMES  *************************
# Add volumes for volatile directories that aren't usually shared with child images.
VOLUME ["/home/dev/tomcat/logs", "/home/dev/tomcat/temp", "/home/dev/tomcat/work", "home/dev/.m2"]

# **********************************************************

RUN sudo chown dev:dev -R /home/dev
USER dev
ENV HOME /home/dev
WORKDIR /home/dev/app

CMD /usr/local/bin/intellij