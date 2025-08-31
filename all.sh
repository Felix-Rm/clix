_clix_root="$(cd -- "$(dirname -- "$0")" && pwd)"

for file in "$_clix_root"/bits/**/*.sh; do
  source "$file"
done