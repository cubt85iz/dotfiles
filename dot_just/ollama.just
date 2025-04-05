[group('AI')]
[group('Setup')]
generate-cdi:
  @sudo nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml

[group('AI')]
explain *args:
  @podman exec ollama ollama run llama3.2:3b "{{ args }}"

