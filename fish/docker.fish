#dockerfunc
set -x DOCKER_REPO_PREFIX jess

function terraform --description 'terraform'
  docker run -it --rm \
    -v "$HOME:$HOME:ro" \
    -v (pwd)":/usr/src/repo" \
    -v /tmp:/tmp \
    --workdir /usr/src/repo \
    --log-driver none \
    -e GOOGLE_APPLICATION_CREDENTIALS \
    -e SSH_AUTH_SOCK \
    hashicorp/terraform "$argv"
end
#EOF
