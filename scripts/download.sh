
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get install -y wget tar curl strace
curl -fsSL https://raw.githubusercontent.com/ren15/mold_ci/HEAD/install.sh | bash