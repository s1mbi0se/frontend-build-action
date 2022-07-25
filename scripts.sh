echo "Build custom scripts"
yarn webpack 

# SOURCE_BEFORE_DIRECTORY="${1}"
PROJECT_NAME="project_scripts"
FASTCRUD_REPOSITORY_USERNAME="s1mbi0se"
FASTCRUD_REPOSITORY_NAME="fast-crud"
DEST_DIRECTORY="project_scripts"

# GIT_CMD_REPOSITORY="https://$FASTCRUD_REPOSITORY_USERNAME:$API_TOKEN_GITHUB@$GITHUB_SERVER/$FASTCRUD_REPOSITORY_USERNAME/$FASTCRUD_REPOSITORY_NAME.git"
TEMP_DIR=$(mktemp -d)
CLONE_DIR="fast-crud"

cd ..

echo "clone fast-crud"
git clone --single-branch --branch develop git@github.com:$FASTCRUD_REPOSITORY_USERNAME/$FASTCRUD_REPOSITORY_NAME.git $CLONE_DIR

mkdir $PROJECT_NAME
cp -r "dist" $PROJECT_NAME
cp -r "sql_migrations" $PROJECT_NAME
cp -r "deploy_scripts" $PROJECT_NAME

cp -r $PROJECT_NAME $FASTCRUD_REPOSITORY_NAME

#echo "delete used files"
rm -r $PROJECT_NAME
# rm -r $CLONE_DIR

