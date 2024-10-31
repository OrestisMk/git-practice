# .github/actions/prose-lint/Dockerfile

FROM python:3.8

# Install proselint and write-good
RUN pip install proselint
RUN apt-get update && apt-get install -y npm && npm install -g write-good

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
