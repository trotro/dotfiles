#dockerfunc
# set -x DOCKER_REPO_PREFIX jess

# function terraform --description 'terraform'
#   docker run -it --rm \
#     -v "$HOME:$HOME:ro" \
#     -v (pwd)":/usr/src/repo" \
#     -v /tmp:/tmp \
#     --workdir /usr/src/repo \
#     --log-driver none \
#     -e GOOGLE_APPLICATION_CREDENTIALS \
#     -e SSH_AUTH_SOCK \
#     hashicorp/terraform "$argv"
# end

function adoc --description 'Asciidoctor using current folder'
    podman run --rm -v (pwd):/documents/ docker.io/asciidoctor/docker-asciidoctor asciidoctor $argv
end
function adoc2pdf --description 'Asciidoctor-pdf using current folder'
    podman run --rm -v (pwd):/documents/ docker.io/asciidoctor/docker-asciidoctor asciidoctor-pdf $argv
end
#EOF
