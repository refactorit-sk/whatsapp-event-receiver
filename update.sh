. ~/Tools/ace-12.0.8.0/server/bin/mqsiprofile

ibmint package --input-path ~/Repositories/whatsapp-event-receiver/WhatsappEventReceiver \
--output-bar-file ~/Repositories/whatsapp-event-receiver/WhatsappEventReceiver.bar \
--do-not-compile-java \
--overrides-file ~/Repositories/whatsapp-event-receiver/properties.override

sudo docker build --tag=ivansla/whatsapp-event-receiver:latest .
sudo docker push ivansla/whatsapp-event-receiver:latest
sudo docker container stop whatsapp-event-receiver
sudo docker container rm whatsapp-event-receiver
sudo docker run -dt --name whatsapp-event-receiver ivansla/whatsapp-event-receiver:latest
sudo docker network connect my-network whatsapp-event-receiver
sudo docker network inspect my-network
sudo docker exec -ti whatsapp-event-receiver bash