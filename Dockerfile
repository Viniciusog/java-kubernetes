#Diz qual é a imagem base. Nesse caso, java openjdk15 com linux alfine
FROM openjdk:15-alpine

#Está criando dentro do nosso container, essa pasta para colocar a nossa aplicação
RUN mkdir /usr/myapp

#Copia o nosso jar para dentro da pasta criada anteriormente
COPY target/java-kubernetes.jar /usr/myapp/app.jar
#Quando executar o container, ele irá cair direto nessa pasta, que contém o nosso jar
WORKDIR /usr/myapp

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "java --enable-preview $JAVA_OPTS -jar app.jar" ]
