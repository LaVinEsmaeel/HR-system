FROM php:8.2-apache

# Install Java and necessary tools
RUN apt-get update && \
    apt-get install -y default-jdk && \
    apt-get clean

# Enable Apache mods
RUN a2enmod rewrite

# Copy your entire project to Apache web root
COPY . /var/www/html/

# If you have Java backend services, compile them
RUN mkdir -p /var/www/html/WEB-INF/classes
RUN javac -d /var/www/html/WEB-INF/classes $(find . -name "*.java") 2>/dev/null || true

EXPOSE 80
