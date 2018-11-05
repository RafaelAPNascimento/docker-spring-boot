#ref: https://www.youtube.com/watch?v=FlSup_eelYE&t=1080s
# image where application will run on 
FROM openjdk:8

# add the jar built by the application into the container (from the root folder)
# see also the tag finalName in pom.xml
ADD target/docker-spring-boot.jar docker-spring-boot.jar

# expose this container on some port
EXPOSE 8085

# command that tells docker how to run the application (it's like a main method)
ENTRYPOINT ["java", "-jar", "docker-spring-boot.jar"]

# example:
#  command to run from root dir: docker build -f Dockerfile -t docker-spring-boot .
#  -t is the tag name for the image, this way the image can be applied to any machine in a portable way
#  the . (dot) argument means the presence of Dockerfile in the current working directory.
#  after build the image, you can run it:
#  docker run -p 8085:8085 docker-spring-boot
#  the 1st 8085 is the exposed port at the machine, the 2nd 8085 is the exposed port at the container
#  If the application is rebuild, you need to rebuild the image (you can stop the container at command line
#  by CTRL+C). then run again the initial build command

#commandos
#	docker build -f Dockerfile -t docker-spring-boot .		[builds an image as specified in this file: openjdk:8]
#	docker run -p 8085:8085 docker-spring-boot		[run on port 8085 the specified image]
