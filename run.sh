#!/bin/sh

if [ ! -n "$DEPLOY" ]; then
  export WERCKER_HTTP_NOTIFY_TYPE="build"
else
  export WERCKER_HTTP_NOTIFY_TYPE="deploy"
fi

curl -i \
      -H "Accept: application/json" \
      -H "Content-Type:application/json" \
      -X POST --data '{"result":"'"$WERCKER_RESULT"'","type":"'"$WERCKER_HTTP_NOTIFY_TYPE"'","application_owner_name":"'"$WERCKER_APPLICATION_OWNER_NAME"'","application_name":"'"$WERCKER_APPLICATION_NAME"'","git_branch":"'"$WERCKER_GIT_BRANCH"'","started_by":"'"$WERCKER_STARTED_BY"'","build_url":"'"$WERCKER_BUILD_URL"'","commit":"'"$WERCKER_GIT_COMMIT"'"}' \
      $WERCKER_HTTP_NOTIFY_URL
