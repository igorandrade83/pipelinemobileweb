FROM alpine:3.12.0 as maven_builder
WORKDIR /app
RUN apk add --no-cache --update-cache maven openjdk11 npm git && mkdir src
RUN git config --global url."https://".insteadOf git://
COPY pom.xml pom.xml
RUN  mvn dependency:resolve
ARG TIER
ARG CONTEXT_USE
ARG HAS_MOBILE
ADD . /app
# Sobre o valor TIER, veja https://docs.cronapp.io - Parâmetros para gerar .war
RUN mvn package -X -Dcronapp.profile=${TIER} -Dcronapp.useContext=${CONTEXT_USE} -Dcronapp.mobileapp=${HAS_MOBILE}

FROM tomcat:9.0.17-jre11
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=maven_builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war