for DIR in ./lessons/*/*/*/; do
  if [ -f "$DIR/lesson-meta.json" ]; then
    echo "${DIR}lesson-meta.json exists."
  else
    echo "${DIR}lesson-meta.json does not exist."
    exit 1
  fi
done
