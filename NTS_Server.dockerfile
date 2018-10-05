FROM debian:latest
MAINTAINER Tristan DOMENGE-CHENAL

RUN apt update
RUN apt install -y build-essential net-tools procps curl
RUN dpkg --add-architecture i386
RUN apt update
RUN apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 -y
RUN curl https://d24mnm5myvorwj.cloudfront.net/documents/download/nts/v2.3/neotys_team_server_2_3_1_linux_x86.sh > nts_installer.sh
RUN echo -e 'adminPort$Long=8009\nhttpPort$Long=8080\nlicensePort$Long=7777\nshutdownPort$Long=8005\nsys.adminRights$Boolean=true\nsys.installationDir=./data/NTS2.3.1\nsys.languageId=en\nsys.programGroupDisabled$Boolean=true' > vfile
RUN sh nts_installer.sh -q -varfile vfile
CMD /etc/init.d/nts-service run
