FROM maven AS build
WORKDIR /project
COPY . /project/
RUN mvn install:install-file -Dfile=./lib/opencv-3410.jar -DgroupId=org.opencv \
    -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar
RUN mvn package

FROM openjdk:8-jre-buster
RUN apt update
WORKDIR /project
COPY --from=build /project/lib/ /project/lib/
COPY --from=build /project/target/fatjar-0.0.1-SNAPSHOT.jar /project/
EXPOSE 8080
CMD [ "java", "-Djava.library.path=lib/ubuntuupperthan18/", "-jar", \
    "fatjar-0.0.1-SNAPSHOT.jar" ]
