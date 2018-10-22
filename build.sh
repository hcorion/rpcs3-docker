static_version=1.0
branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
tag=$(git describe --tags 2>/dev/null)
version=""
echo $branch
echo $tag
if [ -n "$tag" ]; then
	 version=tag
elif [ $branch = "master" ] || [ -z "$branch" ]; then
	version=$static_version
else
	version=$branch
fi


echo "Building rpcs3-travis-trusty as version $version."
pushd trusty
docker build -t rpcs3/rpcs3-travis-trusty:$version .
popd
