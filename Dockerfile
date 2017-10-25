# base oracle-jdk 1.8u111
FROM airdock/oracle-jdk:jdk-8u111
MAINTAINER liuj-s <liuj-s@glodon.com>

# Set the working directory to /app
WORKDIR /java_app

# Copy the current directory contents into the container at /app
ADD . /java_app

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
# ENV JAVA_OPTS="-server -Xms1024m -Xmx1024m -XX:MaxNewSize=512M -XX:+DisableExplicitGC -XX:+UseParNewGC -XX:+UseConcMarkSweepGC"
ENV JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=19094,server=y,suspend=n"

# Run app.py when the container launches
CMD java ${JPDA_OPTS} -jar docker-test.jar