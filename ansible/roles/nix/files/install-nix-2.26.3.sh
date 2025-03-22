#!/bin/sh

# This script installs the Nix package manager on your system by
# downloading a binary distribution and running its installer script
# (which in turn creates and populates /nix).

{ # Prevent execution if this script was only partially downloaded
oops() {
    echo "$0:" "$@" >&2
    exit 1
}

umask 0022

tmpDir="$(mktemp -d -t nix-binary-tarball-unpack.XXXXXXXXXX || \
          oops "Can't create temporary directory for downloading the Nix binary tarball")"
cleanup() {
    rm -rf "$tmpDir"
}
trap cleanup EXIT INT QUIT TERM

require_util() {
    command -v "$1" > /dev/null 2>&1 ||
        oops "you do not have '$1' installed, which I need to $2"
}

case "$(uname -s).$(uname -m)" in
    Linux.x86_64)
        hash=d378a057253fb98f05c3e7c431c1852cca6afae3376f5853a9fcb7ae423a05ad
        path=npwhk770y5qwqfyqmaja1hj2ijsqnafz/nix-2.26.3-x86_64-linux.tar.xz
        system=x86_64-linux
        ;;
    Linux.i?86)
        hash=10d11c885b3caeb0b5b73f44bb94a4a164e1ee592cbeba654b93f646026e8add
        path=826shm3nr4ra3iyyhdpqf7nw95k0j099/nix-2.26.3-i686-linux.tar.xz
        system=i686-linux
        ;;
    Linux.aarch64)
        hash=8e52a0ff91b14a3fd7e5bdf5abe263c732b8655ecc67d7730844bb90e2203416
        path=xrpg44sixq5y2g99qr80zykxxs4pn1pv/nix-2.26.3-aarch64-linux.tar.xz
        system=aarch64-linux
        ;;
    Linux.armv6l)
        hash=691c88b54d79b1c12cc0a2b4a6e87fd3ba730972c11008e6f9da26728392a731
        path=mi34p2khmivgx3zc2j1y7gdqw649acqc/nix-2.26.3-armv6l-linux.tar.xz
        system=armv6l-linux
        ;;
    Linux.armv7l)
        hash=e013b39432a833f3f5bf76fa415b6ad80e6cab23c3acea21c8047e851012c2f3
        path=i5q3kvzmfavm6k6l9wv1ja0rpwdqc4sm/nix-2.26.3-armv7l-linux.tar.xz
        system=armv7l-linux
        ;;
    Linux.riscv64)
        hash=925b1f47d5bc8b496c080f6b2ef6d994ac5535235ce12b8234b07b259fe8598a
        path=xlzvi048p539c8kgjbwf2wiq9axllc8w/nix-2.26.3-riscv64-linux.tar.xz
        system=riscv64-linux
        ;;
    Darwin.x86_64)
        hash=26152090e4cdd813162d2bfea7a4fa2d5d1c000c4556887727e5a093fc6cc6dd
        path=74fpvq9saxsignj38r319g0w1622lfg7/nix-2.26.3-x86_64-darwin.tar.xz
        system=x86_64-darwin
        ;;
    Darwin.arm64|Darwin.aarch64)
        hash=cf19c4cf1af36f3df471cb2571f03b830186b9772bdbf1948bc34336ef3e4dfb
        path=68zc6kq8y48li9qrb1h4zw1s2jib90qj/nix-2.26.3-aarch64-darwin.tar.xz
        system=aarch64-darwin
        ;;
    *) oops "sorry, there is no binary distribution of Nix for your platform";;
esac

# Use this command-line option to fetch the tarballs using nar-serve or Cachix
if [ "${1:-}" = "--tarball-url-prefix" ]; then
    if [ -z "${2:-}" ]; then
        oops "missing argument for --tarball-url-prefix"
    fi
    url=${2}/${path}
    shift 2
else
    url=https://releases.nixos.org/nix/nix-2.26.3/nix-2.26.3-$system.tar.xz
fi

tarball=$tmpDir/nix-2.26.3-$system.tar.xz

require_util tar "unpack the binary tarball"
if [ "$(uname -s)" != "Darwin" ]; then
    require_util xz "unpack the binary tarball"
fi

if command -v curl > /dev/null 2>&1; then
    fetch() { curl --fail -L "$1" -o "$2"; }
elif command -v wget > /dev/null 2>&1; then
    fetch() { wget "$1" -O "$2"; }
else
    oops "you don't have wget or curl installed, which I need to download the binary tarball"
fi

echo "downloading Nix 2.26.3 binary tarball for $system from '$url' to '$tmpDir'..."
fetch "$url" "$tarball" || oops "failed to download '$url'"

if command -v sha256sum > /dev/null 2>&1; then
    hash2="$(sha256sum -b "$tarball" | cut -c1-64)"
elif command -v shasum > /dev/null 2>&1; then
    hash2="$(shasum -a 256 -b "$tarball" | cut -c1-64)"
elif command -v openssl > /dev/null 2>&1; then
    hash2="$(openssl dgst -r -sha256 "$tarball" | cut -c1-64)"
else
    oops "cannot verify the SHA-256 hash of '$url'; you need one of 'shasum', 'sha256sum', or 'openssl'"
fi

if [ "$hash" != "$hash2" ]; then
    oops "SHA-256 hash mismatch in '$url'; expected $hash, got $hash2"
fi

unpack=$tmpDir/unpack
mkdir -p "$unpack"
tar -xJf "$tarball" -C "$unpack" || oops "failed to unpack '$url'"

script=$(echo "$unpack"/*/install)

[ -e "$script" ] || oops "installation script is missing from the binary tarball!"
export INVOKED_FROM_INSTALL_IN=1
"$script" "$@"

} # End of wrapping
