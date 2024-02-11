FROM ivansla/rhel-ubi-ace:latest

# aceuser
USER root

# Copy the BAR files into /tmp and process them:
#
# - Each file is compiled to ensure faster server startup
# - The files are unpacked into the server work directory
# - Once all files are in place, the work directory is optimized to speed up server start
# - The contents are made world-writable to allow for random userids at runtime
#
# The results of the commands can be found in the /tmp/deploys file.
#
ARG BAR_FILE_PATH
ENV LICENSE=accept

COPY WhatsappEventReceiver.bar /tmp
COPY --chmod=777 --chown=1001:1001 server.conf.yaml /home/aceuser/ace-server/
COPY --chmod=777 --chown=1001:1001 *.p12 /home/aceuser/

RUN export LICENSE=accept \
    && . /opt/ibm/ace-12/server/bin/mqsiprofile \
    && set -x  \
    && for FILE in /tmp/*.bar; do \
       echo "$FILE" >> /tmp/deploys && \
       ibmint deploy --input-bar-file ${FILE} --output-work-directory /home/aceuser/ace-server/ 2>&1 | tee -a /tmp/deploys; done \
    && chmod -R ugo+rwx /home/aceuser/ \
    && chmod -R ugo+rwx /var/mqsi/

USER 1001

# Expose ports.  7600, 7800, 7843 for ACE;
EXPOSE 7600 7800 7843

# Set entrypoint to run the server
ENTRYPOINT ["bash", "-c", ". /opt/ibm/ace-12/server/bin/mqsiprofile && IntegrationServer --name whatsapp-event-receiver --work-dir /home/aceuser/ace-server"]
CMD ["/bin/bash"]