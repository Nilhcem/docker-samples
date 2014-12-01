FROM java:8
MAINTAINER Nilhcem "nilhcem@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

ADD decompile_all.sh /bin/decompile_all.sh
ADD decompile.sh /bin/decompile.sh
RUN chmod +x /bin/decompile*

RUN apt update
RUN apt install -y zip

# Android SDK
RUN apt install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 zlib1g lib32z1
RUN wget -q http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz
RUN tar zxf android-sdk_r23.0.2-linux.tgz -C /opt/
RUN rm android-sdk_r23.0.2-linux.tgz
RUN ( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | android update sdk -u --all --filter platform-tools,build-tools-21.1.1

# Apktool
RUN mkdir /opt/apktool
RUN wget -q http://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.0.0rc3.jar --output-document=/opt/apktool/apktool.jar

# Dex2jar
RUN wget -q http://dex2jar.googlecode.com/files/dex2jar-0.0.9.15.zip
RUN unzip -qq dex2jar-0.0.9.15.zip -d /opt/
RUN rm dex2jar-0.0.9.15.zip

# Start decompile script
CMD ["/bin/decompile_all.sh"]
