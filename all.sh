_clix_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]:-${(%):-%x}}")" && pwd)"

for file in $(find "$_clix_root"/bits -name '*.sh'); do
  source "$file"
done