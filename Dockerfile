FROM ruby:2.2.2

# update and upgrade apt
RUN apt-get update -qq  && apt-get upgrade -qqy 

# for virtual screen 
RUN apt-get install -qq -y --force-yes --no-install-recommends xvfb #lxde

# vnc + desktop (fluxbox) for visual debugging
RUN apt-get install -qq -y --force-yes --no-install-recommends fluxbox x11vnc

# for c / cpp compilers 
RUN apt-get install -qq -y --force-yes --no-install-recommends build-essential

# for nokogiri
RUN apt-get install -qq -y --force-yes --no-install-recommends libxml2-dev libxslt1-dev

# for a JS runtime
RUN apt-get install -qq -y --force-yes --no-install-recommends nodejs

# clean apt 
RUN apt-get clean

WORKDIR /root
# add init script 
ADD init.sh /root/init.sh
# add fluxbox settings
ADD fluxbox /root/.fluxbox
RUN chmod +x /root/init.sh

# run virtual screen (xvfb) and optinally start vnc
ENTRYPOINT ["/root/init.sh"]

