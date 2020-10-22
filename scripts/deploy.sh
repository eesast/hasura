echo "$HASURA_GRAPHQL_ADMIN_SECRET"
echo "$HASURA_GRAPHQL_JWT_SECRET"
yarn add hasura-cli # install hasura-cli if it has been cleaned
yarn hasura migrate apply --endpoint $HASURA_GRAPHQL_ENDPOINT
yarn hasura metadata apply --endpoint $HASURA_GRAPHQL_ENDPOINT