# whatsapp-event-receiver

Webhooks reference: https://developers.facebook.com/docs/whatsapp/webhooks

Let's encrypt certificate expires every 3 months, take it from https://admin.websupport.sk/sk/hosting/ssl?id=4488852
Or use this to get free certificate: https://medium.com/@ivansla/how-to-get-publicly-accepted-ssl-certificate-for-free-e0de7d5abff

ibmint package --input-path ~/Repositories/psb-policy/PsbPolicyProject --output-bar-file ~/Repositories/medium/my-rhel-ubi/Deployed/PsbPolicyProject.bar --do-not-compile-java
ibmint deploy --input-bar-file ~/Repositories/medium/my-rhel-ubi/Deployed/PsbPolicyProject.bar --output-work-directory ~/Tools/MQ/test_server_work_dir/
mqsisetdbparms -w ~/ace-server/ -n mq::mqexplorer -u mqexplorer



ibmint package --input-path ~/Repositories/psb-policy/PsbPolicyProject --output-bar-file ~/Repositories/medium/skoda-stack/ace/PsbPolicyProject.bar --do-not-compile-java