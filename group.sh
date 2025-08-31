_clix_root="$(cd -- "$(dirname -- "$0")" && pwd)"

if [ -z "${_CLIX_GROUP_NAME:-}" ]; then
  echo "Error: _CLIX_GROUP_NAME is not set"
  exit 1
fi

for file in "$_clix_root"/bits/"$_CLIX_GROUP_NAME"/*.sh; do
  source "$file"
done