The provided ansible scirpt can install microk8s on an unbuntu 22.04.Kindly update the ansible_microk8s/inventory with the ip of the machine under myvm . Use the below command 

cd ansible_microk8s
ansible-playbook -i inventory  microk8s_install.yml -e host=myvm


Problems encountered 


1) FAILED! => {"changed": true, "cmd": "tar -xzf /tmp/istio.tar.gz -C /tmp/\nmv /tmp/istio-1.16.1 /tmp/istio\n/tmp/istio/bin/istioctl install \n", "delta": "0:00:01.019767", "end": "2023-01-25 16:08:25.681259", "msg": "non-zero return code", "rc": 1, "start": "2023-01-25 16:08:24.661492", "stderr": "Error: Get \"http://localhost:8080/api?timeout=32s\": dial tcp 127.0.0.1:8080: connect: connection refused", "stderr_lines": ["Error: Get \"http://localhost:8080/api?timeout=32s\": dial tcp 127.0.0.1:8080: connect: connection refused"], "stdout": "", "stdout_lines": []} 


Solution was provided by make sure that microk8s kube config file was availble at .kube 


2) This will install the Istio 1.16.1 demo profile with ["Istio core" "Istiod" "Ingress gateways" "Egress gateways"] components into the cluster. Proceed? (y/N) ^

The anible scirpt was waiting for the y inupt and ended up with time out 

Solution ->  echo y | /tmp/istio/bin/istioctl install 



Blue-Green deployment on the above 

Use the following command to deploy . Make sure to take the .kube/config file in your local .kube 

# For deploying green 
./bgdeploy.sh green  

#For deploying blue 
./bgdeploy.sh blue 


To golive 

./golive.sh blue 

or 

./golive.sh green 



Use the golive command acordingly 


