FROM frolvlad/alpine-glibc:alpine-3.15_glibc-2.33

LABEL repository="https://github.com/smplrspace/hasura-action"
LABEL homepage="https://github.com/smplrspace/hasura-action"
LABEL maintainer="Thibaut Tiberghien <thibaut@smplrspace.com>"

LABEL com.github.actions.name="GitHub Action for Hasura"
LABEL com.github.actions.description="Wraps the Hasura CLI to enable common commands."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="gray-dark"

RUN apk add --no-cache curl bash libstdc++ jq
RUN curl -L https://raw.githubusercontent.com/hasura/graphql-engine/stable/cli/get.sh | bash

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
