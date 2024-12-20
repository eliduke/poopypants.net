# Use the official Ruby image
FROM ruby:3.3.5

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install

# Copy the application code into the container
COPY . .

# Expose the port the app will run on
EXPOSE 4567

# Command to run the application
CMD ["ruby", "poopypants.rb", "-p", "4567", "-o", "0.0.0.0"]
