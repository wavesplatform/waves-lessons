for DIR in ./lessons/*/*/; do
  if [ -f "$DIR/topic-meta.json" ]; then
    echo "${DIR}topic-meta.json exists."
  else
    echo "${DIR}topic-meta.json does not exist."
    exit 1
  fi
done
