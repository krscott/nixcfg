function is_def {
	type "$1" >/dev/null 2>&1
}

function link_config {
	src="$(realpath "$1")"
	dst="$2"
	echo "Linking $(basename "$src")"
	if [ -L "$dst" ] || [ -f "$dst" ]; then
		rm "$dst"
	elif [ -d "$dst" ]; then
		rm -rf "$dst"
	else
		mkdir -p "$(dirname "$dst")"
	fi
	ln -s "$src" "$dst"
}

function get_package {
	name="$1"
	url="$2"
	tag="${3:-}"
	packages_dir="${packages_dir:-packages}"

	echo "Getting package $name: $url $tag"

	mkdir -p "$packages_dir"
	cd "$packages_dir"

	if [ ! -d "$name" ]; then
		if [ ! -z "$tag" ]; then
			git -c advice.detachedHead=false clone -q --depth 1 --branch "$tag" "$url" "$name"
		else
			git clone -q --depth 1 "$url" "$name"
		fi
	else
		cd "$name"
		if [ ! -z "$tag" ]; then
			git -c advice.detachedHead=false fetch -q --depth 1 origin tag "$tag" --no-tags
			git -c advice.detachedHead=false checkout -q "$tag"
		else
			git pull -q --depth 1
		fi
	fi
}
