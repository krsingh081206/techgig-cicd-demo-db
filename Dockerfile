# Use an official Maven runtime as a parent image
FROM maven:3.8.4-openjdk-11 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project file (pom.xml) into the container
COPY pom.xml .

# Copy your SQL scripts into the container (assuming they are in a "sql" folder)
COPY src/ ./src/

# Download and install Maven dependencies
RUN mvn dependency:go-offline

# Build the Maven project
RUN mvn clean install

#CMD mvn liquibase:update

# Define the default command to run your application (you can override it during container runtime)
#CMD ["java", "-jar", "app.jar"]

# Define an entrypoint script to run Liquibase with different commands
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
