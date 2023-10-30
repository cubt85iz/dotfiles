#!/usr/bin/env python3

from jinja2 import Environment, FileSystemLoader
import yaml, argparse
import os.path

# Define arguments for script
parser = argparse.ArgumentParser()
parser.add_argument("source")
parser.add_argument("secrets")

# Parse arguments into variables
args = parser.parse_args()
source = args.source
secrets = args.secrets

# Determine output location
destination = os.path.join(os.environ["HOME"], ".config/containers/systemd", os.path.basename(source)[:-3])

# Load secrets from configuration file into dictionary.
secrets = yaml.safe_load(open(secrets, 'r'))

# Open source template
j2_environment = Environment(loader=FileSystemLoader(os.path.dirname(source)), trim_blocks=True, lstrip_blocks=True)
j2_template = j2_environment.get_template(os.path.basename(source))

# Render template
j2_rendered_template = j2_template.render(secrets)

# Write rendered template to destination
if (destination != None):
  destination_path = os.path.dirname(destination)
  if destination_path and not os.path.exists(destination_path):
    os.makedirs(destination_path)
  with open(destination, '+w') as file:
    file.write(j2_rendered_template)
