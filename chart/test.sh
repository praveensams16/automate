(
cd build/apache 

docker build -t praveensam/apache:v$1 .
)

docker push praveensam/apache:v$1

helm upgrade "apache" --namespace "apache" ./apache --set image.tag=v$1

watch "kubectl get deployment,pods,svc -n apache ; echo ; echo ; curl -s $(kubectl -n apache describe svc apache  | perl -ane 'if(/(?<=Ingress\:)\s+([\w,\-,\.]+)/) {print $1."\n"}'); kubectl -n apache get pods | awk '{if(!/NAME/&&/Running/) {print $1}}'"
