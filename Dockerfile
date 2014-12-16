FROM centos:latest

MAINTAINER Andrew Zenk <andrew@andrewzenk.com>

ENV BUILDUSER kibanabuild
ENV USERHOME /home/${BUILDUSER}
ENV KIBANA_GIT ${USERHOME}/kibana

#Install some dependencies
RUN yum -y install fontconfig-devel openssl-devel java-openjdk git tar bzip2
RUN yum -y install gcc make

#Create build user
RUN useradd -m -d ${USERHOME} ${BUILDUSER}

ADD ./install_nvm.sh ${USERHOME}/install_nvm.sh
RUN chown ${BUILDUSER} ${USERHOME}/install_nvm.sh
RUN su -l -c ${USERHOME}/install_nvm.sh ${BUILDUSER}

ADD ./install_rbenv.sh ${USERHOME}/install_rbenv.sh
RUN chown ${BUILDUSER} ${USERHOME}/install_rbenv.sh
RUN su -l -c ${USERHOME}/install_rbenv.sh ${BUILDUSER}

ADD ./build_kibana.sh ${USERHOME}/build_kibana.sh
RUN chown ${BUILDUSER} ${USERHOME}/build_kibana.sh
RUN su -l -c ${USERHOME}/build_kibana.sh ${BUILDUSER}

EXPOSE 5601

