# Use the official Ruby image
FROM ruby:2.7.2

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
CMD ["ruby", "poopypants.rb"]
