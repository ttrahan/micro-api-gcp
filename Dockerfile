FROM aye0aye/micro-image:prod

# this folder must be created in the base images
ADD . /root/micro-api/

ENV API_PORT=80 DEBUG_LEVEL=error SHUD_LOG_TO_FILE=true

#now run set up
RUN /bin/bash /root/micro-api/setup.sh

ENTRYPOINT ["/root/micro-api/boot.sh"]
