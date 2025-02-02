# Use OpenJDK 17 image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the Graphhopper files into the container
COPY . /app

# Ensure the graphhopper.sh script is executable
RUN chmod +x /app/graphhopper.sh

# Install any dependencies (optional if not already included)
RUN apt-get update && apt-get install -y wget

# Download OpenStreetMap data (optional if not already downloaded)
RUN wget https://download.geofabrik.de/asia/india-latest.osm.pbf

# Run Graphhopper web service
CMD ["./graphhopper.sh", "web"]
