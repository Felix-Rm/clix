_clix_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"

if [ -z "${_CLIX_GROUP_NAME:-}" ]; then
  echo "Error: _CLIX_GROUP_NAME is not set"
  exit 1
fi

for file in $(find "$_clix_root"/bits/"$_CLIX_GROUP_NAME" -name '*.sh'); do
  source "$file"
done